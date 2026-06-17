import numpy as np
import json
from typing import Dict, List, Tuple
import re


class RiskDetectionModel:
    """
    Advanced risk detection system for mental health monitoring.
    Combines keyword analysis, pattern matching, and severity scoring.
    """
    
    def __init__(self):
        # Crisis keywords with weighted severity
        self.crisis_keywords = {
            # CRITICAL (1.0) - Immediate intervention needed
            'suicide': 1.0, 'suicidal': 1.0, 'kill myself': 1.0,
            'end my life': 1.0, 'take my life': 1.0, 'die': 0.95,
            'death': 0.90, 'dying': 0.95, 'dead': 0.90,
            'kill': 0.85, 'hang myself': 1.0, 'overdose': 0.95,
            
            # SEVERE (0.80-0.95) - High priority attention
            'hopeless': 0.90, 'worthless': 0.88, 'useless': 0.85,
            'give up': 0.85, 'no point': 0.88, 'no hope': 0.90,
            'cannot take': 0.87, "can't take": 0.87, 'unbearable': 0.92,
            'hate myself': 0.90, 'hate my life': 0.88,
            'want to disappear': 0.85, 'better off dead': 0.95,
            'burden': 0.82, 'pointless': 0.80,
            
            # HIGH (0.65-0.80) - Requires monitoring
            'self harm': 0.78, 'self-harm': 0.78, 'cut myself': 0.80,
            'hurt myself': 0.78, 'harm myself': 0.78,
            'depressed': 0.70, 'depression': 0.70, 'desperate': 0.75,
            'panic': 0.72, 'anxiety attack': 0.75, 'breakdown': 0.77,
            'falling apart': 0.75, 'losing it': 0.70, 'can\'t cope': 0.75,
            'overwhelmed': 0.70, 'drowning': 0.73, 'suffocating': 0.73,
            
            # MODERATE (0.45-0.65) - Monitor closely
            'anxious': 0.60, 'worried': 0.55, 'stressed': 0.58,
            'afraid': 0.60, 'scared': 0.62, 'terrified': 0.68,
            'alone': 0.58, 'lonely': 0.62, 'isolated': 0.65,
            'exhausted': 0.55, 'tired of life': 0.70, 'numb': 0.60,
            'empty': 0.58, 'broken': 0.65, 'lost': 0.55,
        }
        
        # Behavioral patterns indicating risk
        self.risk_patterns = {
            'isolation': ['alone', 'nobody', 'no one', 'isolate', 'withdraw'],
            'helplessness': ['help me', 'save me', 'can\'t do this', 'impossible'],
            'final_thoughts': ['goodbye', 'farewell', 'last time', 'final'],
            'self_blame': ['my fault', 'i deserve', 'i\'m terrible', 'i\'m awful'],
            'future_negation': ['no future', 'no tomorrow', 'won\'t be here', 'last day']
        }
        
        # Protective factors (reduce risk)
        self.protective_factors = {
            'support': ['family', 'friends', 'therapist', 'counselor', 'help'],
            'coping': ['meditation', 'exercise', 'therapy', 'treatment'],
            'positive_future': ['tomorrow', 'next week', 'plans', 'hope', 'better']
        }
        
        # Risk level thresholds
        self.risk_thresholds = {
            'CRITICAL': 0.80,
            'SEVERE': 0.65,
            'HIGH': 0.50,
            'MODERATE': 0.35,
            'LOW': 0.20,
            'MINIMAL': 0.0
        }
        
    def detect_risk(self, text: str, emotion: str = None, 
                   sentiment: str = None, intensity: float = 0.5) -> dict:
        """
        Main risk detection function.
        
        Args:
            text: User input text
            emotion: Detected emotion from stage 1
            sentiment: Sentiment from stage 2 (positive/negative)
            intensity: Intensity score from stage 2 (0.0-1.0)
            
        Returns:
            Dictionary with comprehensive risk assessment
        """
        text_lower = text.lower()
        
        # 1. Keyword-based scoring
        keyword_score = self._calculate_keyword_score(text_lower)
        
        # 2. Pattern matching
        pattern_score, detected_patterns = self._detect_patterns(text_lower)
        
        # 3. Contextual analysis
        context_score = self._analyze_context(text_lower, emotion, sentiment)
        
        # 4. Protective factors
        protection_score = self._assess_protective_factors(text_lower)
        
        # 5. Combine with intensity from stage 2
        intensity_modifier = min(intensity * 1.2, 1.0)  # Boost intensity impact
        
        # Calculate final risk score
        base_risk = (
            keyword_score * 0.40 +      # Keywords are most important
            pattern_score * 0.25 +       # Patterns are secondary
            context_score * 0.20 +       # Context provides nuance
            intensity_modifier * 0.15    # Intensity from stage 2
        )
        
        # Apply protective factor reduction
        final_risk = max(0.0, base_risk - (protection_score * 0.15))
        final_risk = min(1.0, final_risk)
        
        # Determine risk level and urgency
        risk_level, urgency, action_required = self._categorize_risk(final_risk)
        
        # Crisis indicators
        crisis_indicators = self._identify_crisis_indicators(text_lower)
        
        return {
            'risk_score': round(final_risk, 3),
            'risk_level': risk_level,
            'urgency': urgency,
            'action_required': action_required,
            'crisis_indicators': crisis_indicators,
            'detected_patterns': detected_patterns,
            'protective_factors_present': protection_score > 0.1,
            'requires_immediate_intervention': final_risk >= 0.80,
            'requires_professional_support': final_risk >= 0.65,
            'component_scores': {
                'keyword_score': round(keyword_score, 3),
                'pattern_score': round(pattern_score, 3),
                'context_score': round(context_score, 3),
                'intensity_modifier': round(intensity_modifier, 3),
                'protection_score': round(protection_score, 3)
            }
        }
    def _calculate_keyword_score(self, text: str) -> float:
        """Calculate risk based on crisis keywords."""
        scores = []
        for keyword, weight in self.crisis_keywords.items():
            if keyword in text:
                scores.append(weight)
        
        if not scores:
            return 0.15  # Baseline minimal risk
        
        # Use max score with slight boost for multiple keywords
        max_score = max(scores)
        multiplier = 1.0 + min(len(scores) * 0.05, 0.25)  # Max 25% boost
        
        return min(max_score * multiplier, 1.0)
    
    def _detect_patterns(self, text: str) -> tuple[float, list[str]]:
        """Detect behavioral risk patterns."""
        detected = []
        pattern_weights = {
            'isolation': 0.65,
            'helplessness': 0.75,
            'final_thoughts': 0.90,
            'self_blame': 0.60,
            'future_negation': 0.85
        }
        
        scores = []
        for pattern_name, keywords in self.risk_patterns.items():
            if any(keyword in text for keyword in keywords):
                detected.append(pattern_name)
                scores.append(pattern_weights[pattern_name])
        
        if not scores:
            return 0.0, []
        
        # Average of detected patterns
        return np.mean(scores), detected
    
    def _analyze_context(self, text: str, emotion: str, sentiment: str) -> float:
        """Contextual risk analysis using emotion and sentiment."""
        context_score = 0.3  # Baseline
        
        # High-risk emotions
        high_risk_emotions = ['sadness', 'fear', 'anger']
        if emotion and emotion.lower() in high_risk_emotions:
            context_score += 0.25
        
        # Negative sentiment increases risk
        if sentiment and sentiment.lower() == 'negative':
            context_score += 0.20
        
        # Text length consideration (very short crisis messages)
        if len(text) < 30 and any(word in text for word in ['help', 'please', 'can\'t']):
            context_score += 0.15
        
        return min(context_score, 1.0)
    
    def _assess_protective_factors(self, text: str) -> float:
        """Identify protective factors that reduce risk."""
        protection_score = 0.0
        
        for category, keywords in self.protective_factors.items():
            if any(keyword in text for keyword in keywords):
                protection_score += 0.15
        
        return min(protection_score, 0.45)  # Max 45% risk reduction
    
    def _categorize_risk(self, risk_score: float) -> tuple[str, str, str]:
        """Map risk score to level, urgency, and required action."""
        if risk_score >= 0.80:
            return (
                'CRITICAL',
                'IMMEDIATE',
                'Emergency intervention required. Contact crisis services immediately.'
            )
        elif risk_score >= 0.65:
            return (
                'SEVERE',
                'URGENT',
                'Professional mental health support strongly recommended within 24 hours.'
            )
        elif risk_score >= 0.50:
            return (
                'HIGH',
                'PRIORITY',
                'Schedule professional consultation. Monitor closely.'
            )
        elif risk_score >= 0.35:
            return (
                'MODERATE',
                'MONITOR',
                'Encourage self-care and support resources. Check in regularly.'
            )
        elif risk_score >= 0.20:
            return (
                'LOW',
                'ROUTINE',
                'General support and encouragement appropriate.'
            )
        else:
            return (
                'MINIMAL',
                'NONE',
                'Standard supportive response appropriate.'
            )
    
    def _identify_crisis_indicators(self, text: str) -> list[str]:
        """Identify specific crisis indicators present in text."""
        indicators = []
        
        crisis_checks = {
            'suicidal_ideation': ['suicide', 'suicidal', 'kill myself', 'end my life'],
            'self_harm': ['cut myself', 'hurt myself', 'self harm'],
            'hopelessness': ['hopeless', 'no hope', 'no point', 'give up'],
            'severe_distress': ['unbearable', 'can\'t take', 'cannot take', 'overwhelming'],
            'isolation': ['alone', 'nobody cares', 'no one']
        }
        
        for indicator_name, keywords in crisis_checks.items():
            if any(keyword in text for keyword in keywords):
                indicators.append(indicator_name)
        
        return indicators
    
    def get_crisis_resources(self, risk_level: str) -> dict[str, list[str]]:
        """Get appropriate crisis resources based on risk level."""
        resources = {
            'CRITICAL': [
                '🚨 National Suicide Prevention Lifeline: 988 (US)',
                '🚨 Crisis Text Line: Text HOME to 741741',
                '🚨 International Association for Suicide Prevention: https://www.iasp.info/resources/Crisis_Centres/',
                '🚨 Emergency Services: 911 (US) or local emergency number'
            ],
            'SEVERE': [
                '📞 Mental Health Crisis Line: 1-800-273-8255',
                '💬 SAMHSA National Helpline: 1-800-662-4357',
                '🌐 Online therapy: BetterHelp, Talkspace',
                '🏥 Visit nearest emergency room if in immediate danger'
            ],
            'HIGH': [
                '🧠 Schedule appointment with mental health professional',
                '📱 Mental health apps: Calm, Headspace, Sanvello',
                '👥 Support groups: NAMI, Depression and Bipolar Support Alliance',
                '📚 Self-help resources: MentalHealth.gov'
            ],
            'MODERATE': [
                '🧘 Mindfulness and meditation resources',
                '💪 Exercise and wellness activities',
                '👨‍👩‍👧 Reach out to trusted friends/family',
                '📖 Mental health education resources'
            ],
            'LOW': [
                '😊 Self-care activities',
                '🎨 Creative outlets and hobbies',
                '🌳 Nature walks and outdoor activities',
                '📝 Journaling and reflection'
            ],
            'MINIMAL': [
                '✅ Continue current positive practices',
                '🎯 Goal setting and personal growth',
                '🤝 Community engagement',
                '📚 Personal development resources'
            ]
        }
        
        return {
            'resources': resources.get(risk_level, resources['MINIMAL']),
            'risk_level': risk_level
        }

