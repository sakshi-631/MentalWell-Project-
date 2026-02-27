# server.py
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from pipeline import MentalHealthChatbot
import uvicorn

app = FastAPI(title="MentalHealth Chatbot API", version="1.0.0")

# ✅ CORS — allows Flutter Web (Chrome), Android, and any origin
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],          # Allow all origins
    allow_credentials=False,      # Must be False when allow_origins=["*"]
    allow_methods=["*"],          # Allow all HTTP methods
    allow_headers=["*"],          # Allow all headers
)

# Load pipeline ONCE at startup
print("\n🚀 Starting MentalHealth Chatbot Server...")
chatbot = MentalHealthChatbot(verbose=False)
print("✅ Server ready!\n")


# ---------- Request / Response Models ----------

class ChatRequest(BaseModel):
    message: str
    session_id: str = "default"       # For future multi-user support
    include_metadata: bool = False

class ChatResponse(BaseModel):
    response: str
    session_id: str
    metadata: dict = {}


# ---------- Endpoints ----------

@app.get("/health")
def health():
    return {"status": "ok", "model": "MentalHealth Chatbot v1"}


@app.post("/chat", response_model=ChatResponse)
def chat(req: ChatRequest):
    if not req.message or len(req.message.strip()) == 0:
        raise HTTPException(status_code=400, detail="Message cannot be empty")

    if req.include_metadata:
        result = chatbot.process(req.message, include_metadata=True)
        return ChatResponse(
            response=result["response"],
            session_id=req.session_id,
            metadata=result.get("metadata", {})
        )
    else:
        response_text = chatbot.chat(req.message)
        return ChatResponse(
            response=response_text,
            session_id=req.session_id
        )


@app.delete("/history")
def clear_history():
    chatbot.clear_history()
    return {"status": "Conversation history cleared"}


# ---------- Run ----------

if __name__ == "__main__":
    uvicorn.run("server:app", host="0.0.0.0", port=8000, reload=False)