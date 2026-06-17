import json
import random


class ReliefMapper:
    """
    Intelligent relief activity recommendation system.
    Provides personalized coping strategies based on emotional state and risk level.
    """
    
    def __init__(self):
        # Relief activities mapped by emotion and intensity
        self.relief_activities = {
            'sadness': {
                'high': [
                    {
                        'activity': 'Reach out to someone you trust',
                        'description': 'Call or message a friend, family member, or counselor',
                        'duration': '15-30 minutes',
                        'type': 'social_support',
                        'emoji': '🤝'
                    },
                    {
                        'activity': 'Guided meditation for sadness',
                        'description': 'Use apps like Calm or Headspace for sadness-focused meditation',
                        'duration': '10-20 minutes',
                        'type': 'mindfulness',
                        'emoji': '🧘'
                    },
                    {
                        'activity': 'Gentle movement or walk',
                        'description': 'Take a slow walk outdoors, focusing on your surroundings',
                        'duration': '15-30 minutes',
                        'type': 'physical',
                        'emoji': '🚶'
                    },
                    {
                        'activity': 'Express through journaling',
                        'description': 'Write freely about your feelings without judgment',
                        'duration': '10-15 minutes',
                        'type': 'creative',
                        'emoji': '📝'
                    }
                ],
                'medium': [
                    {
                        'activity': 'Watch uplifting content',
                        'description': 'Choose a feel-good movie, comedy special, or inspiring videos',
                        'duration': '30-60 minutes',
                        'type': 'distraction',
                        'emoji': '📺'
                    },
                    {
                        'activity': 'Self-compassion exercise',
                        'description': 'Practice loving-kindness meditation or write yourself a compassionate letter',
                        'duration': '15-20 minutes',
                        'type': 'mindfulness',
                        'emoji': '💝'
                    },
                    {
                        'activity': 'Creative expression',
                        'description': 'Draw, paint, play music, or engage in any creative outlet',
                        'duration': '30-45 minutes',
                        'type': 'creative',
                        'emoji': '🎨'
                    }
                ],
                'low': [
                    {
                        'activity': 'Gratitude practice',
                        'description': 'List 5 things you\'re grateful for today',
                        'duration': '5-10 minutes',
                        'type': 'cognitive',
                        'emoji': '🙏'
                    },
                    {
                        'activity': 'Connect with nature',
                        'description': 'Spend time outdoors, observe plants, listen to birds',
                        'duration': '20-30 minutes',
                        'type': 'environmental',
                        'emoji': '🌿'
                    }
                ]
            },
            'anxiety': {
                'high': [
                    {
                        'activity': 'Box breathing technique',
                        'description': 'Breathe in for 4, hold for 4, out for 4, hold for 4. Repeat 5 times',
                        'duration': '5-10 minutes',
                        'type': 'breathing',
                        'emoji': '🌬️'
                    },
                    {
                        'activity': 'Progressive muscle relaxation',
                        'description': 'Tense and release each muscle group from toes to head',
                        'duration': '15-20 minutes',
                        'type': 'physical',
                        'emoji': '💪'
                    },
                    {
                        'activity': 'Grounding 5-4-3-2-1 technique',
                        'description': '5 things you see, 4 you can touch, 3 you hear, 2 you smell, 1 you taste',
                        'duration': '5-10 minutes',
                        'type': 'grounding',
                        'emoji': '🌍'
                    },
                    {
                        'activity': 'Safe space visualization',
                        'description': 'Close eyes and visualize a calm, safe place in detail',
                        'duration': '10-15 minutes',
                        'type': 'mindfulness',
                        'emoji': '🏝️'
                    }
                ],
                'medium': [
                    {
                        'activity': 'Gentle yoga or stretching',
                        'description': 'Try calming yoga poses like child\'s pose or legs up the wall',
                        'duration': '15-30 minutes',
                        'type': 'physical',
                        'emoji': '🧘'
                    },
                    {
                        'activity': 'Worry time scheduling',
                        'description': 'Set aside 15 minutes to worry, then redirect thoughts afterward',
                        'duration': '15 minutes',
                        'type': 'cognitive',
                        'emoji': '⏰'
                    },
                    {
                        'activity': 'Calming music or sounds',
                        'description': 'Listen to nature sounds, binaural beats, or calming music',
                        'duration': '20-30 minutes',
                        'type': 'sensory',
                        'emoji': '🎵'
                    }
                ],
                'low': [
                    {
                        'activity': 'Mindful tea/coffee ritual',
                        'description': 'Slowly prepare and mindfully enjoy a warm beverage',
                        'duration': '10-15 minutes',
                        'type': 'mindfulness',
                        'emoji': '☕'
                    },
                    {
                        'activity': 'Light exercise',
                        'description': 'Go for a bike ride, swim, or any enjoyable movement',
                        'duration': '20-30 minutes',
                        'type': 'physical',
                        'emoji': '🚴'
                    }
                ]
            },
            'anger': {
                'high': [
                    {
                        'activity': 'Physical release',
                        'description': 'Punch a pillow, do intense cardio, or try boxing',
                        'duration': '15-30 minutes',
                        'type': 'physical',
                        'emoji': '🥊'
                    },
                    {
                        'activity': 'Cooling breath technique',
                        'description': 'Breathe in through mouth (tongue curled), out through nose',
                        'duration': '5-10 minutes',
                        'type': 'breathing',
                        'emoji': '❄️'
                    },
                    {
                        'activity': 'Anger journaling',
                        'description': 'Write out your anger uncensored, then tear up the paper',
                        'duration': '10-20 minutes',
                        'type': 'creative',
                        'emoji': '📄'
                    },
                    {
                        'activity': 'Take a timeout',
                        'description': 'Remove yourself from the situation, count to 100',
                        'duration': '10-15 minutes',
                        'type': 'behavioral',
                        'emoji': '⏸️'
                    }
                ],
                'medium': [
                    {
                        'activity': 'Communicate assertively',
                        'description': 'Use "I feel" statements to express your needs calmly',
                        'duration': '15-30 minutes',
                        'type': 'communication',
                        'emoji': '💬'
                    },
                    {
                        'activity': 'Problem-solving session',
                        'description': 'Identify the issue and brainstorm constructive solutions',
                        'duration': '20-30 minutes',
                        'type': 'cognitive',
                        'emoji': '🧩'
                    }
                ],
                'low': [
                    {
                        'activity': 'Humor break',
                        'description': 'Watch comedy or funny videos to shift your mood',
                        'duration': '15-20 minutes',
                        'type': 'distraction',
                        'emoji': '😄'
                    }
                ]
            },
            'fear': {
                'high': [
                    {
                        'activity': '4-7-8 breathing',
                        'description': 'Breathe in 4 counts, hold 7, exhale 8. Repeat 4 times',
                        'duration': '5-10 minutes',
                        'type': 'breathing',
                        'emoji': '🌬️'
                    },
                    {
                        'activity': 'Reality check exercise',
                        'description': 'Challenge fearful thoughts: Is this realistic? What\'s the evidence?',
                        'duration': '10-15 minutes',
                        'type': 'cognitive',
                        'emoji': '🔍'
                    },
                    {
                        'activity': 'Safe person contact',
                        'description': 'Call or be near someone who makes you feel secure',
                        'duration': '15-30 minutes',
                        'type': 'social_support',
                        'emoji': '🤗'
                    }
                ],
                'medium': [
                    {
                        'activity': 'Exposure in small steps',
                        'description': 'Face the fear gradually in tiny, manageable increments',
                        'duration': '10-20 minutes',
                        'type': 'behavioral',
                        'emoji': '🪜'
                    },
                    {
                        'activity': 'Positive affirmations',
                        'description': 'Repeat: "I am safe", "I can handle this", "This will pass"',
                        'duration': '5-10 minutes',
                        'type': 'cognitive',
                        'emoji': '💪'
                    }
                ],
                'low': [
                    {
                        'activity': 'Comfort activity',
                        'description': 'Engage in a familiar, soothing routine that brings comfort',
                        'duration': '20-30 minutes',
                        'type': 'self_care',
                        'emoji': '🛋️'
                    }
                ]
            },
            'joy': {
                'all': [
                    {
                        'activity': 'Share your joy',
                        'description': 'Tell someone about what makes you happy',
                        'duration': '10-20 minutes',
                        'type': 'social_support',
                        'emoji': '🎉'
                    },
                    {
                        'activity': 'Gratitude amplification',
                        'description': 'Write down what you\'re grateful for right now',
                        'duration': '5-10 minutes',
                        'type': 'cognitive',
                        'emoji': '✨'
                    },
                    {
                        'activity': 'Capture the moment',
                        'description': 'Take photos, journal, or create art about this positive feeling',
                        'duration': '15-30 minutes',
                        'type': 'creative',
                        'emoji': '📸'
                    }
                ]
            },
            'love': {
                'all': [
                    {
                        'activity': 'Express appreciation',
                        'description': 'Tell someone you care about why they matter to you',
                        'duration': '10-20 minutes',
                        'type': 'social_support',
                        'emoji': '💕'
                    },
                    {
                        'activity': 'Self-love practice',
                        'description': 'Do something kind for yourself today',
                        'duration': '20-30 minutes',
                        'type': 'self_care',
                        'emoji': '🌸'
                    }
                ]
            },
            'surprise': {
                'all': [
                    {
                        'activity': 'Ground yourself',
                        'description': 'Take a moment to process and understand what just happened',
                        'duration': '5-10 minutes',
                        'type': 'mindfulness',
                        'emoji': '🤔'
                    },
                    {
                        'activity': 'Share the experience',
                        'description': 'Talk to someone about the surprising event',
                        'duration': '15-20 minutes',
                        'type': 'social_support',
                        'emoji': '🗣️'
                    }
                ]
            }
        }
        
        # Emergency activities for critical risk levels
        self.emergency_activities = [
            {
                'activity': '🚨 Contact emergency services',
                'description': 'Call 988 (Suicide & Crisis Lifeline) or 911 immediately',
                'type': 'emergency',
                'immediate': True
            },
            {
                'activity': '🤝 Reach out NOW',
                'description': 'Call a trusted friend, family member, or crisis counselor immediately',
                'type': 'emergency',
                'immediate': True
            },
            {
                'activity': '🏥 Go to emergency room',
                'description': 'Visit the nearest emergency room or urgent care',
                'type': 'emergency',
                'immediate': True
            }
        ]
        
    def map_relief_activities(self, emotion: str, intensity: float, 
                            risk_level: str, sentiment: str = None) -> dict:
        """
        Map appropriate relief activities based on emotional state.
        
        Args:
            emotion: Detected emotion (sadness, joy, anger, fear, love, surprise)
            intensity: Intensity score (0.0-1.0)
            risk_level: Risk level from risk detection module
            sentiment: Sentiment (positive/negative)
            
        Returns:
            Dictionary with personalized relief activities
        """
        # Emergency handling
        if risk_level in ['CRITICAL', 'SEVERE']:
            return {
                'primary_recommendation': self.emergency_activities,
                'secondary_recommendations': self._get_calming_activities(),
                'urgency': 'IMMEDIATE',
                'message': '⚠️ Your safety is the priority. Please reach out for help immediately.',
                'crisis_resources': self._get_crisis_resources()
            }
        
        # Map emotion to activity category
        emotion_lower = emotion.lower()
        
        # Handle anxiety (often expressed as fear)
        if emotion_lower == 'fear' or (sentiment == 'negative' and intensity > 0.6):
            emotion_category = 'anxiety'
        elif emotion_lower in ['sadness', 'anger', 'fear', 'joy', 'love', 'surprise']:
            emotion_category = emotion_lower
        else:
            emotion_category = 'sadness'  # Default
        
        # Determine intensity category
        if intensity >= 0.65:
            intensity_cat = 'high'
        elif intensity >= 0.40:
            intensity_cat = 'medium'
        else:
            intensity_cat = 'low'
        
        # Get activities
        activities = self.relief_activities.get(emotion_category, {})
        
        # Select appropriate activities
        if 'all' in activities:
            selected = activities['all']
        else:
            selected = activities.get(intensity_cat, activities.get('medium', []))
        
        # Add variety by shuffling
        selected = selected.copy()
        random.shuffle(selected)
        
        # Get complementary activities
        complementary = self._get_complementary_activities(emotion_category, intensity_cat)
        
        return {
            'primary_recommendation': selected[:3] if len(selected) >= 3 else selected,
            'additional_options': selected[3:] if len(selected) > 3 else complementary,
            'urgency': self._map_urgency(risk_level),
            'message': self._generate_encouragement(emotion_category, risk_level),
            'estimated_total_time': '15-45 minutes',
            'tips': self._get_activity_tips(emotion_category)
        }
    
    def _get_calming_activities(self) -> list[dict]:
        """Get immediate calming activities for crisis situations."""
        return [
            {
                'activity': 'Deep breathing',
                'description': 'Breathe slowly: in for 4, hold for 4, out for 6',
                'duration': '2-5 minutes',
                'type': 'breathing',
                'emoji': '🌬️'
            },
            {
                'activity': 'Cold water on face',
                'description': 'Splash cold water or hold ice to activate calming response',
                'duration': '1-2 minutes',
                'type': 'physical',
                'emoji': '💧'
            },
            {
                'activity': 'Ground yourself',
                'description': 'Name 5 things you can see, 4 you can touch, 3 you can hear',
                'duration': '3-5 minutes',
                'type': 'grounding',
                'emoji': '🌍'
            }
        ]
    
    def _get_crisis_resources(self) -> list[str]:
        """Get crisis hotline resources."""
        return [
            '🆘 National Suicide Prevention Lifeline: 988',
            '💬 Crisis Text Line: Text HOME to 741741',
            '🌐 Online chat: suicidepreventionlifeline.org/chat',
            '📞 SAMHSA Helpline: 1-800-662-4357'
        ]
    
    def _get_complementary_activities(self, emotion: str, intensity: str) -> list[dict]:
        """Get complementary activities from different categories."""
        complementary = [
            {
                'activity': 'Hydrate and nourish',
                'description': 'Drink water and have a healthy snack',
                'duration': '5-10 minutes',
                'type': 'self_care',
                'emoji': '💧'
            },
            {
                'activity': 'Connect with pet',
                'description': 'Spend time with a pet or watch animal videos',
                'duration': '10-20 minutes',
                'type': 'connection',
                'emoji': '🐕'
            },
            {
                'activity': 'Sensory comfort',
                'description': 'Use aromatherapy, soft blanket, or calming scents',
                'duration': '10-15 minutes',
                'type': 'sensory',
                'emoji': '🕯️'
            }
        ]
        return complementary
    
    def _map_urgency(self, risk_level: str) -> str:
        """Map risk level to activity urgency."""
        urgency_map = {
            'CRITICAL': 'IMMEDIATE',
            'SEVERE': 'URGENT',
            'HIGH': 'SOON',
            'MODERATE': 'WHEN ABLE',
            'LOW': 'OPTIONAL',
            'MINIMAL': 'OPTIONAL'
        }
        return urgency_map.get(risk_level, 'WHEN ABLE')
    
    def _generate_encouragement(self, emotion: str, risk_level: str) -> str:
        """Generate contextual encouragement message."""
        messages = {
            'sadness': "You're not alone in this. These activities can help lift your mood gradually.",
            'anxiety': "These techniques can help calm your nervous system. Take it one breath at a time.",
            'anger': "It's okay to feel angry. Let's channel this energy in healthy ways.",
            'fear': "Your feelings are valid. These activities can help you feel safer and more grounded.",
            'joy': "Wonderful! Let's amplify and preserve this positive feeling.",
            'love': "Beautiful emotion! These activities can help you express and appreciate it.",
            'surprise': "Take a moment to process. These activities can help you adjust."
        }
        
        base_message = messages.get(emotion, "Let's work through this together.")
        
        if risk_level in ['CRITICAL', 'SEVERE']:
            return f"⚠️ {base_message} Your safety matters most - please reach out for support."
        
        return base_message
    
    def _get_activity_tips(self, emotion: str) -> list[str]:
        """Get helpful tips for activities."""
        tips = {
            'sadness': [
                "Start small - even 5 minutes helps",
                "Be gentle with yourself",
                "It's okay if you can't do everything"
            ],
            'anxiety': [
                "Focus on what you can control",
                "Progress, not perfection",
                "Your breath is always with you"
            ],
            'anger': [
                "Physical release is healthy",
                "Wait before responding to triggers",
                "Channel energy constructively"
            ],
            'fear': [
                "Safety first, always",
                "Small steps count",
                "You've gotten through hard things before"
            ]
        }
        return tips.get(emotion, ["Take it one step at a time", "Be kind to yourself"])
