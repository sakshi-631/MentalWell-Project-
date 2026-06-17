"""
Sentiment & Intensity Analysis Module
Extracted from sentimentNew_19Nov.ipynb
Optimized for production use
"""

import torch
import numpy as np
import re
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import warnings
warnings.filterwarnings('ignore')

# Intensity Lexicons
NEGATIVE_INTENSITY_MARKERS = {
    # CRITICAL (0.85-1.0)
    'suicide': 1.0, 'suicidal': 1.0, 'kill myself': 1.0, 'end my life': 0.98,
    'die': 0.95, 'death': 0.92, 'dying': 0.95, 'dead': 0.90,
    'hopeless': 0.95, 'no hope': 0.93, 'give up': 0.88,
    'worthless': 0.93, 'useless': 0.90, 'hate myself': 0.95,
    'unbearable': 0.95, 'cannot take': 0.93, "can't take": 0.93,
    
    # HIGH INTENSITY (0.70-0.85)
    'extremely': 0.83, 'severely': 0.80, 'terribly': 0.80,
    'horrible': 0.78, 'terrible': 0.78, 'awful': 0.78,
    'worst': 0.80, 'desperate': 0.82, 'overwhelmed': 0.80,
    'depressed': 0.75, 'anxious': 0.72, 'miserable': 0.78,
    
    # MEDIUM-HIGH (0.55-0.70)
    'very': 0.65, 'really': 0.62, 'quite': 0.58, 'so': 0.63,
    'stressed': 0.68, 'worried': 0.65, 'afraid': 0.68,
    'scared': 0.68, 'angry': 0.66, 'upset': 0.63, 'sad': 0.63,
    
    # MEDIUM (0.40-0.55)
    'somewhat': 0.48, 'fairly': 0.48, 'kind of': 0.45, 'a bit': 0.43,
    'tired': 0.48, 'down': 0.50, 'low': 0.48,
}

POSITIVE_INTENSITY_MARKERS = {
    # HIGH POSITIVE (0.65-0.80)
    'amazing': 0.75, 'wonderful': 0.72, 'fantastic': 0.75,
    'excellent': 0.72, 'incredible': 0.75, 'awesome': 0.70,
    'thrilled': 0.75, 'ecstatic': 0.78, 'overjoyed': 0.78,
    
    # MEDIUM POSITIVE (0.50-0.65)
    'great': 0.62, 'good': 0.55, 'happy': 0.60, 'excited': 0.63,
    'glad': 0.58, 'joyful': 0.62, 'lovely': 0.60, 'nice': 0.52,
}

NEGATION_WORDS = ['not', 'no', 'never', "don't", "didn't", "won't", 
                  "can't", "isn't", "wasn't", "shouldn't"]

class SentimentAnalyzer:
    """Optimized sentiment and intensity analyzer"""
    
    def __init__(self, model_name="cardiffnlp/twitter-roberta-base-sentiment-latest", device='cpu'):
        self.device = device
        self.model_name = model_name
        
        # Load model once
        self.tokenizer = AutoTokenizer.from_pretrained(model_name)
        self.model = AutoModelForSequenceClassification.from_pretrained(model_name)
        self.model.to(device)
        self.model.eval()
        
        # Label mapping
        self.label_mapping = {0: 'negative', 1: 'neutral', 2: 'positive'}
        
        print(f"✅ Sentiment Analyzer loaded on {device}")
    
    def predict_sentiment(self, text):
        """Predict sentiment with confidence"""
        if not text or len(text.strip()) == 0:
            return 'neutral', 0.0, {'negative': 0.33, 'neutral': 0.34, 'positive': 0.33}
        
        inputs = self.tokenizer(text, return_tensors="pt", truncation=True, 
                               max_length=512, padding=True).to(self.device)
        
        with torch.no_grad():
            outputs = self.model(**inputs)
        
        probs = torch.nn.functional.softmax(outputs.logits, dim=-1)[0]
        pred_idx = torch.argmax(probs).item()
        sentiment = self.label_mapping[pred_idx]
        confidence = probs[pred_idx].item()
        
        probs_dict = {
            'negative': probs[0].item(),
            'neutral': probs[1].item(),
            'positive': probs[2].item()
        }
        
        return sentiment, confidence, probs_dict
    
    def calculate_intensity(self, text, sentiment):
        """Calculate context-aware intensity score"""
        if not text:
            return 0.3
        
        text_lower = text.lower()
        words = text_lower.split()
        base_intensity = 0.35
        
        # Choose lexicon based on sentiment
        if sentiment == 'negative':
            lexicon = NEGATIVE_INTENSITY_MARKERS
        elif sentiment == 'positive':
            lexicon = POSITIVE_INTENSITY_MARKERS
        else:
            lexicon = {**NEGATIVE_INTENSITY_MARKERS, **POSITIVE_INTENSITY_MARKERS}
        
        # Extract intensity scores
        intensity_scores = []
        
        # Multi-word phrases
        multi_word = ['kill myself', 'end my life', 'no hope', "can't take", 'kind of', 'a bit']
        for phrase in multi_word:
            if phrase in text_lower and phrase in lexicon:
                intensity_scores.append(lexicon[phrase])
        
        # Individual words
        for word in words:
            if word in lexicon:
                intensity_scores.append(lexicon[word])
        
        if intensity_scores:
            base_intensity = np.mean(intensity_scores)
        
        # Negation handling
        negation_count = sum(1 for word in words if word in NEGATION_WORDS)
        if negation_count > 0:
            base_intensity *= (0.7 ** negation_count)
        
        # Punctuation analysis
        if sentiment == 'negative':
            base_intensity += min(text.count('!') * 0.08, 0.20)
            base_intensity += min(text.count('...') * 0.05, 0.15)
        else:
            base_intensity += min(text.count('!') * 0.04, 0.10)
        
        # ALL CAPS
        all_caps = [w for w in words if len(w) > 2 and w.isupper()]
        if all_caps:
            base_intensity += min(len(all_caps) * (0.10 if sentiment == 'negative' else 0.05), 0.25)
        
        # Apply bounds
        if sentiment == 'positive':
            intensity = np.clip(base_intensity, 0.0, 0.75)
        elif sentiment == 'negative':
            intensity = np.clip(base_intensity, 0.0, 1.0)
        else:
            intensity = np.clip(base_intensity, 0.0, 0.60)
        
        return round(intensity, 3)
    
    def analyze(self, text):
        """Complete analysis - main function to use"""
        sentiment, confidence, probs = self.predict_sentiment(text)
        intensity = self.calculate_intensity(text, sentiment)
        
        return {
            'sentiment': sentiment,
            'confidence': confidence,
            'intensity': intensity,
            'probabilities': probs
        }
    
    def batch_analyze(self, texts, batch_size=16):
        """Optimized batch processing"""
        results = []
        for i in range(0, len(texts), batch_size):
            batch = texts[i:i+batch_size]
            for text in batch:
                results.append(self.analyze(text))
        return results