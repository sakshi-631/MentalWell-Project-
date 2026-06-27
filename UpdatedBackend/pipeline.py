"""
MentalHealth Chatbot - Optimized Production Pipeline
Integrates all 5 modules with performance optimization
"""

import torch
import time
from typing import Dict, List
from modules import (
    EmotionDetector,
    SentimentAnalyzer,
    RiskDetectionModel,
    ReliefMapper,
    ResponseGenerator
)

class MentalHealthChatbot:
    """
    Complete mental health chatbot pipeline
    Optimized for accuracy and performance
    """
    
    def __init__(self, device='cpu', verbose=True):
        self.device = device
        self.verbose = verbose
        
        if verbose:
            print("\n" + "="*70)
            print("ðŸš€ Initializing MentalHealth Chatbot Pipeline")
            print("="*70)
        
        # Module 1: Emotion Detection
        if verbose:
            print("\nðŸ“¦ Loading Module 1: Emotion Detection...")
        # self.emotion_detector = EmotionDetector(
        #     model_path='./mentalwell_emotion_model_final',
        #     device=device
        # )
        self.emotion_detector = EmotionDetector(
            model_path='models/mentalwell_emotion_model_final',
            device=device
        )
        
        # Module 2: Sentiment & Intensity Analysis
        if verbose:
            print("\nðŸ“¦ Loading Module 2: Sentiment & Intensity Analysis...")
        self.sentiment_analyzer = SentimentAnalyzer(device=device)
        
        # Module 3: Risk Detection (rule-based, lightweight)
        if verbose:
            print("\nðŸ“¦ Loading Module 3: Risk Detection...")
        self.risk_detector = RiskDetectionModel()
        if verbose:
            print("âœ… Risk Detection loaded")
        
        # Module 4: Relief Activity Mapper (rule-based)
        if verbose:
            print("\nðŸ“¦ Loading Module 4: Relief Activity Mapper...")
        self.relief_mapper = ReliefMapper()
        if verbose:
            print("âœ… Relief Mapper loaded")
        
        # Module 5: Response Generator (template-based)
        if verbose:
            print("\nðŸ“¦ Loading Module 5: Response Generator...")
        self.response_generator = ResponseGenerator()
        if verbose:
            print("âœ… Response Generator loaded")
        
        # Conversation state
        self.conversation_history = []
        
        if verbose:
            print("\n" + "="*70)
            print("âœ¨ MentalHealth Chatbot Ready!")
            print("="*70 + "\n")
    
    def process(self, user_text: str, include_metadata=True) -> Dict:
        """
        Main pipeline: Process user input through all 5 modules
        
        Args:
            user_text: User's input message
            include_metadata: Whether to include detailed metadata
            
        Returns:
            Dictionary with response and metadata
        """
        
        if not user_text or len(user_text.strip()) == 0:
            return {
                'response': "I'm here to listen. Please share what's on your mind.",
                'metadata': {'error': 'Empty input'}
            }
        
        start_time = time.time()
        
        if self.verbose:
            print(f"\n{'='*70}")
            print(f"Processing: '{user_text[:60]}...'")
            print(f"{'='*70}\n")
        
        # STEP 1: Emotion Detection
        emotion, emotion_conf, emotion_probs = self.emotion_detector.predict(user_text)
        if self.verbose:
            print(f"âœ“ Module 1: Emotion = {emotion} ({emotion_conf:.1%})")
        
        # STEP 2: Sentiment & Intensity Analysis
        sentiment_data = self.sentiment_analyzer.analyze(user_text)
        if self.verbose:
            print(f"âœ“ Module 2: Sentiment = {sentiment_data['sentiment']}, "
                  f"Intensity = {sentiment_data['intensity']:.3f}")
        
        # STEP 3: Risk Detection
        risk_data = self.risk_detector.detect_risk(
            text=user_text,
            emotion=emotion,
            sentiment=sentiment_data['sentiment'],
            intensity=sentiment_data['intensity']
        )
        if self.verbose:
            print(f"âœ“ Module 3: Risk = {risk_data['risk_level']} "
                  f"(score: {risk_data['risk_score']:.3f})")
        
        # STEP 4: Relief Activity Mapping
        relief_data = self.relief_mapper.map_relief_activities(
            emotion=emotion,
            intensity=sentiment_data['intensity'],
            risk_level=risk_data['risk_level'],
            sentiment=sentiment_data['sentiment']
        )
        if self.verbose:
            num_activities = len(relief_data.get('primary_recommendation', []))
            print(f"âœ“ Module 4: Mapped {num_activities} relief activities")
        
        # STEP 5: Response Generation
        response = self.response_generator.generate_response(
            user_text=user_text,
            emotion=emotion,
            emotion_confidence=emotion_conf,
            sentiment=sentiment_data['sentiment'],
            intensity=sentiment_data['intensity'],
            risk_level=risk_data['risk_level'],
            crisis_indicators=risk_data.get('crisis_indicators', []),
            relief_activities=relief_data,
            conversation_history=self.conversation_history[-3:],  # last 3 turns
        )
        if self.verbose:
            print(f"âœ“ Module 5: Response generated")
        
        processing_time = time.time() - start_time
        
        # Save to history so next turn has context (always, not just via chat())
        self.conversation_history.append({
            'user': user_text,
            'bot': response,
            'timestamp': time.time()
        })
        
        if self.verbose:
            print(f"\nâš¡ Processing time: {processing_time:.2f}s")
            print(f"{'='*70}\n")
        
        # Prepare result
        result = {
            'response': response,
            'processing_time': round(processing_time, 3)
        }
        
        if include_metadata:
            result['metadata'] = {
                'emotion': emotion,
                'emotion_confidence': round(emotion_conf, 3),
                'emotion_probabilities': {k: round(v, 3) for k, v in emotion_probs.items()},
                'sentiment': sentiment_data['sentiment'],
                'sentiment_confidence': sentiment_data['confidence'],
                'intensity': sentiment_data['intensity'],
                'risk_level': risk_data['risk_level'],
                'risk_score': risk_data['risk_score'],
                'requires_immediate_intervention': risk_data['requires_immediate_intervention'],
                'crisis_indicators': risk_data.get('crisis_indicators', []),
                'urgency': relief_data.get('urgency', 'NONE')
            }
        
        return result
    
    def chat(self, user_text: str, save_history=True) -> str:
        """
        Simple chat interface
        Returns only the response string
        """
        result = self.process(user_text, include_metadata=False)
        return result['response']
    
    def batch_process(self, texts: List[str], batch_size=8) -> List[Dict]:
        """
        Process multiple texts efficiently
        Useful for evaluation or batch analysis
        """
        results = []
        total = len(texts)
        
        print(f"\nðŸ“Š Batch processing {total} texts...")
        
        for i in range(0, total, batch_size):
            batch = texts[i:i+batch_size]
            
            for text in batch:
                result = self.process(text, include_metadata=True)
                results.append(result)
            
            processed = min(i + batch_size, total)
            print(f"   âœ“ Processed {processed}/{total}")
        
        print("âœ… Batch processing complete!\n")
        return results
    
    def get_conversation_summary(self) -> Dict:
        """Get statistics about the conversation"""
        if not self.conversation_history:
            return {'message': 'No conversation history'}
        
        return {
            'total_messages': len(self.conversation_history),
            'duration_minutes': (self.conversation_history[-1]['timestamp'] - 
                               self.conversation_history[0]['timestamp']) / 60,
            'messages': self.conversation_history
        }
    
    def clear_history(self):
        """Clear conversation history"""
        self.conversation_history = []
        print("âœ… Conversation history cleared")
    
    def set_verbose(self, verbose: bool):
        """Enable/disable verbose output"""
        self.verbose = verbose


# ============================================================================
# QUICK TEST FUNCTION
# ============================================================================

def quick_test():
    """Quick test of the pipeline"""
    print("\n" + "="*70)
    print("ðŸ§ª QUICK PIPELINE TEST")
    print("="*70)
    
    # Initialize
    chatbot = MentalHealthChatbot(verbose=True)
    
    # Test cases
    test_cases = [
        "I'm feeling really anxious about my presentation tomorrow",
        "I can't take this anymore, everything is hopeless",
        "Had an amazing day with my family!",
    ]
    
    for i, text in enumerate(test_cases, 1):
        print(f"\n{'='*70}")
        print(f"TEST CASE {i}/{len(test_cases)}")
        print(f"{'='*70}")
        
        result = chatbot.process(text)
        
        print("\n" + "â”€"*70)
        print("RESPONSE:")
        print("â”€"*70)
        print(result['response'][:300] + "...\n")
        
        if result.get('metadata'):
            meta = result['metadata']
            print(f"ðŸ“Š Emotion: {meta['emotion']} ({meta['emotion_confidence']:.1%})")
            print(f"ðŸ“Š Risk: {meta['risk_level']} (score: {meta['risk_score']:.3f})")
            print(f"âš¡ Time: {result['processing_time']:.2f}s")


# ============================================================================
# INTERACTIVE CHAT
# ============================================================================

def interactive_chat():
    """Start interactive chat session"""
    print("\n" + "="*70)
    print("ðŸ¤– MentalHealth Chatbot - Interactive Mode")
    print("="*70)
    print("Type 'quit' to exit, 'history' to see conversation\n")
    
    chatbot = MentalHealthChatbot(verbose=False)
    
    while True:
        user_input = input("You: ").strip()
        
        if not user_input:
            continue
        
        if user_input.lower() in ['quit', 'exit', 'bye']:
            print("\nðŸ’™ Take care! Remember, help is always available.")
            summary = chatbot.get_conversation_summary()
            if summary.get('total_messages', 0) > 0:
                print(f"\nðŸ“Š Session summary: {summary['total_messages']} messages, "
                      f"{summary['duration_minutes']:.1f} minutes")
            break
        
        if user_input.lower() == 'history':
            summary = chatbot.get_conversation_summary()
            print(f"\nðŸ“Š Conversation history: {summary['total_messages']} messages")
            continue
        
        # Get response
        response = chatbot.chat(user_input)
        print(f"\nBot: {response}\n")


# ============================================================================
# MAIN ENTRY POINT
# ============================================================================

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1 and sys.argv[1] == 'test':
        quick_test()
    elif len(sys.argv) > 1 and sys.argv[1] == 'chat':
        interactive_chat()
    else:
        print("\nUsage:")
        print("  python pipeline.py test  - Run quick test")
        print("  python pipeline.py chat  - Start interactive chat")
        print("\nOr import in your code:")
        print("  from pipeline import MentalHealthChatbot")
        print("  chatbot = MentalHealthChatbot()")
        print("  response = chatbot.chat('your message')")