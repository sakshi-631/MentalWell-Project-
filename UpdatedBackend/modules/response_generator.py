"""
Response Generator - Module 5
Uses Groq (free LLM API) to generate natural, empathetic responses
guided by structured outputs from Modules 1-4.

Architecture:
  - Greetings / small-talk → warm conversational opener (no LLM needed)
  - CRITICAL / SEVERE risk → hardcoded safety response (never use LLM for crisis)
  - Everything else → Groq Llama generates natural text from our ML context
  - If Groq is unavailable → fallback to improved templates

Setup:
  pip install groq
  Set env variable: GROQ_API_KEY=your_key_here
  Get free key (no card): https://console.groq.com
"""

import os
import random
import re
from typing import Optional


# ── Groq client (lazy-loaded so the app still runs without it) ─────────────
_groq_client = None

def _get_groq_client():
    global _groq_client
    if _groq_client is not None:
        return _groq_client
    try:
        from groq import Groq
        api_key = os.environ.get("GROQ_API_KEY", "")
        
        if not api_key:
            return None
        _groq_client = Groq(api_key=api_key)
        return _groq_client
    except ImportError:
        return None
    except Exception:
        return None


# ── Small-talk / greeting detection ───────────────────────────────────────
_GREETINGS = {
    "hi", "hey", "hello", "hiya", "howdy", "sup", "yo",
    "good morning", "good afternoon", "good evening", "good night",
    "greetings", "hi there", "hey there", "hello there",
}

_THANKS = {
    "thanks", "thank you", "thank u", "thx", "ty",
    "thanks a lot", "thank you so much", "appreciate it",
}

_GOODBYE = {
    "bye", "goodbye", "see you", "see ya", "later", "take care",
    "cya", "good bye", "farewell",
}

def _classify_smalltalk(text: str) -> Optional[str]:
    """Return 'greeting' | 'thanks' | 'goodbye' | None."""
    t = text.strip().lower().rstrip("!.,?")
    if t in _GREETINGS or any(t.startswith(g) for g in _GREETINGS):
        return "greeting"
    if t in _THANKS:
        return "thanks"
    if t in _GOODBYE:
        return "goodbye"
    return None


# ── Crisis resources (hardcoded — never LLM-generated) ────────────────────
_CRISIS_RESOURCES = {
    "CRITICAL": (
        "🚨 I'm very concerned about you right now. Please reach out immediately:\n\n"
        "• **iCall (India):** 9152987821\n"
        "• **Vandrevala Foundation:** 1860-2662-345 (24/7)\n"
        "• **AASRA:** 9820466627\n"
        "• **International:** iSPIN (https://www.iasp.info/resources/Crisis_Centres/)\n"
        "• **Emergency Services:** 112\n\n"
        "You don't have to face this alone. Help is one call away, right now. "
        "💙 Your life has value and people care about you."
    ),
    "SEVERE": (
        "I'm genuinely worried about how you're feeling. What you're carrying sounds "
        "extremely heavy, and you deserve real support.\n\n"
        "Please consider reaching out today:\n"
        "• **iCall:** 9152987821\n"
        "• **Vandrevala Foundation:** 1860-2662-345\n"
        "• **AASRA:** 9820466627\n\n"
        "Reaching out for help is one of the bravest things a person can do. "
        "Please don't wait — you matter. 💙"
    ),
}

_CALMING_FOR_CRISIS = [
    "**Take a slow breath** — in for 4 counts, hold for 4, out for 4. Just once. You can do this.",
    "**Ground yourself:** Name 5 things you can see right now. Take your time.",
    "**You are safe right now, in this moment.** Focus on that.",
]


class ResponseGenerator:
    """
    Module 5: Generates natural, empathetic responses.

    Priority order:
      1. Small-talk (greetings, thanks, goodbye) → warm short reply
      2. CRITICAL/SEVERE risk → hardcoded safety response
      3. Groq LLM with structured ML context → natural empathetic response
      4. Fallback templates if Groq unavailable
    """

    MODEL = "llama-3.1-8b-instant"   # Free, fast, 14 400 req/day on Groq
    MAX_TOKENS = 220                  # Keep responses focused, not wall-of-text

    # ── System prompt (the "soul" of the chatbot) ─────────────────────────
    SYSTEM_PROMPT = """You are MentalWell, a warm and empathetic mental health support chatbot. \
Your role is to make people feel genuinely heard and gently guide them toward helpful coping strategies.

TONE RULES — follow these strictly:
- Sound like a caring human friend, not a robot or a doctor
- Never use bullet points or numbered lists in your response
- Never start with "I" — vary your sentence openings
- Maximum 3 sentences total. Be warm but brief.
- Do NOT repeat the emotion label back literally (e.g. don't say "I detect sadness")
- Do NOT mention that you are an AI or that you analyzed their message
- Weave in one specific coping activity naturally — don't just list it, suggest it conversationally
- End with an open, gentle invitation for them to share more if they want

WHAT YOU RECEIVE:
You will receive a JSON context block from our ML pipeline containing the user's message, \
detected emotion, sentiment intensity, risk level, and a recommended coping activity. \
Use all of this to craft your response — but never expose the raw data to the user."""

    # ── Fallback templates (used if Groq is down) ─────────────────────────
    _FALLBACK = {
        "sadness": [
            "That sounds really hard, and it makes sense you're feeling this way. "
            "When everything feels heavy, sometimes even a short walk outside can create "
            "a little breathing room. Would you like to tell me more about what's been going on?",

            "Whatever you're going through right now, you don't have to carry it alone. "
            "Journaling — even just a few lines — can help untangle feelings that are hard to say out loud. "
            "I'm here if you want to share more.",
        ],
        "anxiety": [
            "That kind of worry can feel completely overwhelming, I hear you. "
            "One thing that often helps is box breathing — breathe in for 4 counts, hold for 4, out for 4. "
            "What's been weighing on your mind most?",

            "Anxiety has a way of making everything feel urgent at once. "
            "Grounding yourself — noticing 5 things you can see right now — can gently pull you back to the present. "
            "Want to talk through what's been triggering this?",
        ],
        "anger": [
            "It sounds like something really got under your skin, and that's completely valid. "
            "Sometimes getting out of the space you're in — even briefly — helps the intensity settle. "
            "What happened?",

            "Feeling this strongly usually means something really matters to you. "
            "Physical release like a brisk walk can help process that energy. "
            "Want to tell me more about what's going on?",
        ],
        "fear": [
            "What you're describing sounds genuinely scary, and your feelings make complete sense. "
            "Try taking one slow breath right now — it can gently calm your nervous system. "
            "Can you tell me more about what's worrying you?",

            "Fear can make everything feel much bigger and more immediate than it is. "
            "Grounding techniques — focusing on what's real and present around you — can help. "
            "What's been on your mind?",
        ],
        "joy": [
            "That's genuinely wonderful to hear! "
            "Moments like these are worth holding onto — maybe jot down what made today good so you can revisit it. "
            "What's been the highlight?",

            "It's so good to hear you're in a good place right now. "
            "Sharing joy with someone you care about can make it even better. "
            "Tell me more about what's going well!",
        ],
        "love": [
            "That warmth you're feeling is really beautiful. "
            "Telling someone you appreciate them — even in a small way — can make it even more meaningful. "
            "What's bringing you this feeling?",
        ],
        "surprise": [
            "Sounds like something caught you completely off guard! "
            "Taking a moment to just sit with it — before reacting — can help you process. "
            "What happened?",
        ],
        "default": [
            "Thank you for sharing that with me. "
            "Whatever you're going through, taking a moment to breathe and be gentle with yourself matters. "
            "I'm here — tell me more about how you're feeling.",
        ],
    }

    _GREETING_REPLIES = [
        "Hey! Really glad you're here. How are you feeling today?",
        "Hello! This is a safe space — what's on your mind?",
        "Hi there! How are you doing? Feel free to share whatever's on your heart.",
        "Hey, good to see you here. How are you feeling right now?",
        "Hello! I'm here to listen. How's your day going?",
    ]

    _THANKS_REPLIES = [
        "Of course — that's what I'm here for. Is there anything else on your mind?",
        "Always happy to help. How are you feeling now?",
        "Glad that helped a little. How are you doing?",
    ]

    _GOODBYE_REPLIES = [
        "Take care of yourself. Remember, reaching out is always a sign of strength. 💙",
        "Goodbye for now. Be kind to yourself today. 💙",
        "Take care. You can always come back if you need to talk. 💙",
    ]

    # ──────────────────────────────────────────────────────────────────────
    def generate_response(
        self,
        user_text: str,
        emotion: str,
        emotion_confidence: float,
        sentiment: str,
        intensity: float,
        risk_level: str,
        crisis_indicators: list,
        relief_activities: dict,
        conversation_history: list = None,   # ← NEW: last N turns from pipeline
    ) -> str:

        history = conversation_history or []

        # ── 1. Small-talk fast path ────────────────────────────────────────
        # Only treat as small-talk if there's NO prior emotional conversation.
        # "what else can i do" after a sad message is NOT small-talk.
        smalltalk = _classify_smalltalk(user_text)
        has_prior_context = len(history) > 0
        if smalltalk == "greeting" and not has_prior_context:
            return random.choice(self._GREETING_REPLIES)
        if smalltalk == "thanks" and not has_prior_context:
            return random.choice(self._THANKS_REPLIES)
        if smalltalk == "goodbye":
            return random.choice(self._GOODBYE_REPLIES)

        # ── 2. Crisis — hardcoded, never LLM ──────────────────────────────
        if risk_level in ("CRITICAL", "SEVERE"):
            return self._crisis_response(risk_level)

        # ── 3. Try Groq ───────────────────────────────────────────────────
        groq_response = self._call_groq(
            user_text, emotion, emotion_confidence,
            sentiment, intensity, risk_level, relief_activities,
            history,
        )
        if groq_response:
            return groq_response

        # ── 4. Fallback templates ─────────────────────────────────────────
        return self._fallback_response(emotion, sentiment, intensity, risk_level)

    # ── Crisis response ────────────────────────────────────────────────────
    def _crisis_response(self, risk_level: str) -> str:
        base = _CRISIS_RESOURCES[risk_level]
        calming = random.choice(_CALMING_FOR_CRISIS)
        return f"{base}\n\nWhile you wait for support — {calming}"

    # ── Groq call ──────────────────────────────────────────────────────────
    def _call_groq(
        self,
        user_text: str,
        emotion: str,
        emotion_confidence: float,
        sentiment: str,
        intensity: float,
        risk_level: str,
        relief_activities: dict,
        history: list = None,
    ) -> Optional[str]:

        client = _get_groq_client()
        if client is None:
            return None

        # Build the activity hint (pick the first primary one if available)
        activity_hint = ""
        primary = relief_activities.get("primary_recommendation", [])
        if primary:
            act = primary[0]
            activity_hint = f"{act.get('activity', '')} — {act.get('description', '')}"

        # Intensity label (easier for the LLM than a raw float)
        if intensity >= 0.65:
            intensity_label = "high"
        elif intensity >= 0.40:
            intensity_label = "moderate"
        else:
            intensity_label = "mild"

        # ── Build messages: system + prior turns + current user message ──
        messages = [{"role": "system", "content": self.SYSTEM_PROMPT}]

        # Inject last 3 turns of real conversation so Groq has context.
        # Format: alternating user/assistant, exactly as Groq expects.
        recent = (history or [])[-3:]   # last 3 turns max (keeps tokens low)
        for turn in recent:
            messages.append({"role": "user",      "content": turn["user"]})
            messages.append({"role": "assistant",  "content": turn["bot"]})

        # Current turn — append ML context as a note before the actual message
        user_prompt = (
            f"[ML pipeline detected: emotion={emotion} ({round(emotion_confidence,2)}), "
            f"sentiment={sentiment}, intensity={intensity_label}, risk={risk_level}, "
            f"suggested activity: {activity_hint}]\n\n"
            f"User says: {user_text}"
        )
        messages.append({"role": "user", "content": user_prompt})

        try:
            completion = client.chat.completions.create(
                model=self.MODEL,
                messages=messages,
                max_tokens=self.MAX_TOKENS,
                temperature=0.75,
            )
            text = completion.choices[0].message.content.strip()
            # Sanity check — reject if too short or empty
            if text and len(text) > 20:
                return text
            return None
        except Exception as e:
            print(f"[ResponseGenerator] Groq API error: {e}")
            return None

    # ── Fallback ───────────────────────────────────────────────────────────
    def _fallback_response(
        self,
        emotion: str,
        sentiment: str,
        intensity: float,
        risk_level: str,
    ) -> str:
        emotion_lower = emotion.lower()

        # Map 'fear' → 'anxiety' for better template coverage
        if emotion_lower == "fear":
            emotion_lower = "anxiety"

        pool = self._FALLBACK.get(emotion_lower, self._FALLBACK["default"])
        base = random.choice(pool)

        # Append professional help nudge for HIGH risk
        if risk_level == "HIGH":
            base += (
                "\n\n💙 If these feelings stay heavy, talking to a counsellor can really help. "
                "iCall (9152987821) is a good place to start."
            )
        return base

    # ── Legacy batch interface (kept for compatibility) ────────────────────
    def batch_generate(self, contexts: list) -> list:
        return [self.generate_response(**ctx) for ctx in contexts]