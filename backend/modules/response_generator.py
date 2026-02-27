import json
import random
from typing import Dict, List
import re
class ResponseGenerator:
    """
    Lightweight template-based response generator with ML-inspired logic.
    Designed for low-resource machines while maintaining empathy and effectiveness.
    """
    
    def __init__(self):
        # Empathetic acknowledgment templates by emotion
        self.emotion_acknowledgments = {
            'sadness': [
                "I hear that you're going through a difficult time",
                "It sounds like you're feeling really down right now",
                "I can sense that you're carrying a heavy burden",
                "I understand that things feel overwhelming for you",
                "It's clear you're experiencing deep sadness"
            ],
            'joy': [
                "I'm so glad to hear you're feeling happy!",
                "That's wonderful! It's great that you're experiencing joy",
                "How lovely to hear such positive news!",
                "I can feel your happiness, and that's beautiful",
                "It's wonderful that you're in such a good place"
            ],
            'anger': [
                "I can hear that you're feeling really frustrated right now",
                "It sounds like something has upset you significantly",
                "I understand you're dealing with some intense anger",
                "It's clear that something has made you really angry",
                "I hear the frustration in what you're sharing"
            ],
            'fear': [
                "I can sense that you're feeling anxious or afraid",
                "It sounds like you're going through something scary",
                "I understand that you're feeling worried right now",
                "It's clear you're experiencing fear about this situation",
                "I hear that you're feeling unsafe or uncertain"
            ],
            'love': [
                "How beautiful that you're experiencing such positive feelings!",
                "It's wonderful to hear about these warm emotions",
                "I can feel the care and affection in your words",
                "That's lovely - love is a beautiful emotion to experience",
                "How special that you're feeling connected and caring"
            ],
            'surprise': [
                "It sounds like something unexpected happened",
                "I can sense that you're processing something surprising",
                "It seems like you're dealing with something unforeseen",
                "I understand you're taking in this unexpected situation",
                "That must have caught you off guard"
            ]
        }
        
        # Validation phrases by intensity
        self.validation_phrases = {
            'high': [
                "Your feelings are completely valid, and it's important to acknowledge them",
                "What you're experiencing is real and significant",
                "It's absolutely okay to feel this way - your emotions matter",
                "These are strong feelings, and it's important we address them"
            ],
            'medium': [
                "It's completely normal to feel this way",
                "Your feelings are valid and understandable",
                "Many people experience similar emotions",
                "It's okay to feel what you're feeling"
            ],
            'low': [
                "I appreciate you sharing how you're feeling",
                "It's good that you're aware of your emotions",
                "Thank you for being open about this"
            ]
        }
        
        # Crisis response templates (hard-coded for safety)
        self.crisis_responses = {
            'CRITICAL': [
                "🚨 I'm deeply concerned about what you've shared. Your safety is the absolute priority right now.",
                "Please reach out for immediate help:\n",
                "• National Suicide Prevention Lifeline: 988\n",
                "• Crisis Text Line: Text HOME to 741741\n",
                "• Emergency Services: 911\n\n",
                "You don't have to face this alone. Professional help is available 24/7."
            ],
            'SEVERE': [
                "I'm very concerned about how you're feeling. What you're experiencing sounds extremely difficult.",
                "It's crucial that you connect with professional support soon:\n",
                "• Mental Health Crisis Line: 1-800-273-8255\n",
                "• SAMHSA Helpline: 1-800-662-4357\n\n",
                "Please don't wait - reaching out for help is a sign of strength."
            ]
        }
        
        # Transition phrases to activities
        self.activity_transitions = {
            'high_intensity': [
                "Right now, let's focus on some immediate steps that might help",
                "I'd like to suggest some activities that could provide relief",
                "Here are some things that might help you feel a bit better"
            ],
            'medium_intensity': [
                "I have some suggestions that might help you cope with these feelings",
                "Let's look at some activities that could support you right now",
                "Here are some strategies that others have found helpful"
            ],
            'low_intensity': [
                "Here are some ideas that might support your wellbeing",
                "You might find these activities helpful",
                "Consider trying some of these suggestions"
            ]
        }
        
        # Encouraging closings
        self.encouragement_phrases = {
            'crisis': [
                "You matter, and your life has value. Please reach out for help.",
                "You deserve support and care. Please don't face this alone."
            ],
            'high': [
                "Take things one moment at a time. You don't have to do everything at once.",
                "Be gentle with yourself. Healing isn't linear, and that's okay.",
                "You're taking an important step by acknowledging these feelings."
            ],
            'medium': [
                "Remember, it's okay to take breaks and care for yourself.",
                "You're doing the best you can, and that's enough.",
                "Small steps count. Every little bit of self-care matters."
            ],
            'low': [
                "Keep taking care of yourself - you're doing great!",
                "Continue being mindful of your emotional wellbeing.",
                "You're on the right track by staying aware of your feelings."
            ]
        }
        
        # Important disclaimers
        self.disclaimer = "\n\n💙 Remember: I'm an AI assistant designed to provide support and information. I'm not a replacement for professional mental health care. If you're in crisis or need ongoing support, please reach out to a licensed mental health professional."
        
    def generate_response(self, 
                         user_text: str,
                         emotion: str,
                         emotion_confidence: float,
                         sentiment: str,
                         intensity: float,
                         risk_level: str,
                         crisis_indicators: list[str],
                         relief_activities: dict) -> str:
        """
        Generate empathetic response based on all module outputs.
        
        Args:
            user_text: Original user input
            emotion: Detected emotion from Module 1
            emotion_confidence: Confidence score for emotion
            sentiment: Positive/negative from Module 2
            intensity: Intensity score (0-1) from Module 2
            risk_level: Risk level from Module 3
            crisis_indicators: List of crisis indicators from Module 3
            relief_activities: Recommended activities from Module 4
            
        Returns:
            Complete empathetic response string
        """
        
        # CRITICAL: Handle crisis situations first
        if risk_level in ['CRITICAL', 'SEVERE']:
            return self._generate_crisis_response(risk_level, crisis_indicators, relief_activities)
        
        # Build response components
        response_parts = []
        
        # 1. Empathetic acknowledgment
        acknowledgment = self._get_acknowledgment(emotion, emotion_confidence)
        response_parts.append(acknowledgment)
        
        # 2. Validation
        validation = self._get_validation(intensity, sentiment, emotion)
        if validation:
            response_parts.append(validation)
        
        # 3. Contextual response based on emotion and risk
        context = self._get_contextual_response(emotion, intensity, risk_level, sentiment)
        if context:
            response_parts.append(context)
        
        # 4. Activity recommendations
        activities = self._format_activities(relief_activities, intensity, risk_level)
        if activities:
            response_parts.append(activities)
        
        # 5. Encouragement
        encouragement = self._get_encouragement(risk_level, intensity)
        response_parts.append(encouragement)
        
        # 6. Add disclaimer for moderate+ risk or negative sentiment
        if risk_level in ['HIGH', 'MODERATE'] or (sentiment == 'negative' and intensity > 0.5):
            response_parts.append(self.disclaimer)
        
        # Combine all parts
        full_response = "\n\n".join(response_parts)
        
        return full_response
    
    def _generate_crisis_response(self, risk_level: str, crisis_indicators: list[str], 
                                  relief_activities: dict) -> str:
        """Generate immediate crisis response with safety resources."""
        
        parts = []
        
        # Critical opening
        parts.extend(self.crisis_responses[risk_level])
        
        # Immediate calming techniques if available
        if 'secondary_recommendations' in relief_activities:
            parts.append("\nWhile waiting for help, try these immediate calming techniques:")
            for activity in relief_activities['secondary_recommendations'][:2]:
                parts.append(f"• {activity.get('emoji', '')} {activity['activity']}: {activity['description']}")
        
        # Crisis resources
        if 'crisis_resources' in relief_activities:
            parts.append("\n📞 Additional Resources:")
            for resource in relief_activities['crisis_resources'][:3]:
                parts.append(f"  {resource}")
        
        # Final emphasis
        parts.append("\n\n💙 Your life matters. Please reach out now - you deserve support and help is available.")
        
        return "\n".join(parts)
    
    def _get_acknowledgment(self, emotion: str, confidence: float) -> str:
        """Get empathetic acknowledgment based on emotion."""
        
        emotion_lower = emotion.lower()
        
        # Select appropriate acknowledgment
        if emotion_lower in self.emotion_acknowledgments:
            acknowledgment = random.choice(self.emotion_acknowledgments[emotion_lower])
        else:
            acknowledgment = "I hear what you're sharing with me"
        
        # Add confidence qualifier if low
        if confidence < 0.7:
            acknowledgment += ", though I want to make sure I understand correctly"
        
        return acknowledgment + "."
    
    def _get_validation(self, intensity: float, sentiment: str, emotion: str) -> str:
        """Get validation phrase based on intensity."""
        
        # Determine intensity category
        if intensity >= 0.65:
            category = 'high'
        elif intensity >= 0.40:
            category = 'medium'
        else:
            category = 'low'
        
        # Skip validation for positive emotions with low intensity
        if sentiment == 'positive' and intensity < 0.5:
            return None
        
        return random.choice(self.validation_phrases[category])
    
    def _get_contextual_response(self, emotion: str, intensity: float, 
                                 risk_level: str, sentiment: str) -> str:
        """Generate contextual response based on emotional state."""
        
        emotion_lower = emotion.lower()
        
        # High-risk negative emotions
        if sentiment == 'negative' and intensity > 0.65:
            if emotion_lower == 'sadness':
                return "Depression and sadness can feel all-consuming, but there are ways to find relief. Let's focus on what might help you right now."
            elif emotion_lower == 'anger':
                return "Intense anger can be overwhelming. It's important to find healthy ways to express and process these feelings."
            elif emotion_lower == 'fear':
                return "Anxiety and fear can make everything feel threatening. Let's work on grounding you and helping you feel safer."
        
        # Medium intensity
        elif sentiment == 'negative' and intensity > 0.35:
            if emotion_lower == 'sadness':
                return "These feelings of sadness are difficult, but they will pass. Let's look at some ways to support you through this."
            elif emotion_lower == 'anger':
                return "It's healthy to acknowledge your anger. Let's channel it in constructive ways."
            elif emotion_lower == 'fear':
                return "Worry is natural, but we can work on managing it together."
        
        # Positive emotions
        elif sentiment == 'positive':
            if emotion_lower == 'joy':
                return "It's wonderful that you're experiencing this positive emotion! Let's think about ways to sustain and appreciate it."
            elif emotion_lower == 'love':
                return "Love and connection are powerful, healing emotions. It's beautiful that you're experiencing this."
        
        return None
    
    def _format_activities(self, relief_activities: dict, intensity: float, 
                          risk_level: str) -> str:
        """Format activity recommendations in a user-friendly way."""
        
        if not relief_activities or 'primary_recommendation' not in relief_activities:
            return None
        
        parts = []
        
        # Transition phrase
        if intensity >= 0.65:
            transition = random.choice(self.activity_transitions['high_intensity'])
        elif intensity >= 0.40:
            transition = random.choice(self.activity_transitions['medium_intensity'])
        else:
            transition = random.choice(self.activity_transitions['low_intensity'])
        
        parts.append(transition + ":\n")
        
        # Primary recommendations (top 3)
        primary = relief_activities['primary_recommendation'][:3]
        
        for i, activity in enumerate(primary, 1):
            emoji = activity.get('emoji', '•')
            name = activity['activity']
            desc = activity['description']
            duration = activity.get('duration', 'flexible time')
            
            parts.append(f"{i}. {emoji} **{name}**")
            parts.append(f"   {desc}")
            parts.append(f"   ⏱️ Duration: {duration}\n")
        
        # Add message from relief mapper if present
        if 'message' in relief_activities:
            parts.append(f"💭 {relief_activities['message']}")
        
        # Add tips if present
        if 'tips' in relief_activities and relief_activities['tips']:
            parts.append("\n📝 Tips:")
            for tip in relief_activities['tips'][:2]:
                parts.append(f"   • {tip}")
        
        return "\n".join(parts)
    
    def _get_encouragement(self, risk_level: str, intensity: float) -> str:
        """Get appropriate encouragement based on risk and intensity."""
        
        if risk_level in ['CRITICAL', 'SEVERE']:
            category = 'crisis'
        elif risk_level == 'HIGH' or intensity > 0.65:
            category = 'high'
        elif intensity > 0.35:
            category = 'medium'
        else:
            category = 'low'
        
        return random.choice(self.encouragement_phrases[category])
    
    def batch_generate(self, contexts: list[dict]) -> list[str]:
        """Generate responses for multiple contexts (for testing/evaluation)."""
        
        responses = []
        for context in contexts:
            response = self.generate_response(**context)
            responses.append(response)
        
        return responses


