"""
Emotion Detection Module
Wrapper for trained DistilBERT model from M1_emotionDetection.ipynb
"""

import torch
import json
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import warnings
warnings.filterwarnings('ignore')

class EmotionDetector:
    """Optimized emotion detection with trained model"""
    
    # def __init__(self, model_path='./mentalwell_emotion_model_final', device='cpu'):
    def __init__(self, model_path='models/mentalwell_emotion_model_final', device='cpu'):
        self.device = device
        self.model_path = model_path
        
        # Load tokenizer and model
        # Load tokenizer and model
        self.tokenizer = AutoTokenizer.from_pretrained(model_path, local_files_only=True)
        self.model = AutoModelForSequenceClassification.from_pretrained(model_path, local_files_only=True)
        # self.tokenizer = AutoTokenizer.from_pretrained(model_path)
        # self.model = AutoModelForSequenceClassification.from_pretrained(model_path)
        self.model.to(device)
        self.model.eval()
        
        # Load emotion mappings
        with open(f'{model_path}/emotion_mapping.json', 'r') as f:
            emotion_data = json.load(f)
        self.id2emotion = {int(k): v for k, v in emotion_data['id2emotion'].items()}
        self.emotion2id = {v: int(k) for k, v in emotion_data['id2emotion'].items()}
        
        print(f"✅ Emotion Detector loaded on {device}")
        print(f"   Emotions: {list(self.emotion2id.keys())}")
    
    def predict(self, text):
        """
        Predict emotion from text
        Returns: (emotion, confidence, all_probabilities)
        """
        if not text or len(text.strip()) == 0:
            return 'neutral', 0.0, {}
        
        # Tokenize
        inputs = self.tokenizer(
            text, 
            return_tensors="pt", 
            truncation=True, 
            max_length=128,
            padding=True
        ).to(self.device)
        
        # Predict
        with torch.no_grad():
            outputs = self.model(**inputs)
        
        # Get probabilities
        probs = torch.nn.functional.softmax(outputs.logits, dim=-1)[0]
        
        # Get prediction
        emotion_id = torch.argmax(probs).item()
        emotion = self.id2emotion[emotion_id]
        confidence = probs[emotion_id].item()
        
        # All probabilities
        all_probs = {self.id2emotion[i]: probs[i].item() for i in range(len(probs))}
        
        return emotion, confidence, all_probs
    
    def batch_predict(self, texts, batch_size=16):
        """Optimized batch prediction"""
        results = []
        
        for i in range(0, len(texts), batch_size):
            batch = texts[i:i+batch_size]
            
            # Tokenize batch
            inputs = self.tokenizer(
                batch,
                return_tensors="pt",
                truncation=True,
                max_length=128,
                padding=True
            ).to(self.device)
            
            # Batch inference
            with torch.no_grad():
                outputs = self.model(**inputs)
            
            probs = torch.nn.functional.softmax(outputs.logits, dim=-1)
            
            # Extract results
            for j in range(len(batch)):
                emotion_id = torch.argmax(probs[j]).item()
                emotion = self.id2emotion[emotion_id]
                confidence = probs[j][emotion_id].item()
                all_probs = {self.id2emotion[k]: probs[j][k].item() for k in range(len(probs[j]))}
                
                results.append({
                    'text': batch[j],
                    'emotion': emotion,
                    'confidence': confidence,
                    'probabilities': all_probs
                })
        
        return results
    
    def get_top_emotions(self, text, top_k=3):
        """Get top K emotion predictions"""
        _, _, all_probs = self.predict(text)
        sorted_emotions = sorted(all_probs.items(), key=lambda x: x[1], reverse=True)
        return sorted_emotions[:top_k]