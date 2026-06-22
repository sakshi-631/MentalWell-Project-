import os
from huggingface_hub import hf_hub_download, snapshot_download

HF_REPO = "Sammm3/mentalwell-emotion-model"
LOCAL_PATH = "models/mentalwell_emotion_model_final"

def download_models():
    if os.path.exists(LOCAL_PATH):
        print("Emotion model already exists locally. Skipping download.")
        return
    
    print(f"Downloading emotion model from {HF_REPO}...")
    os.makedirs(LOCAL_PATH, exist_ok=True)
    snapshot_download(
        repo_id=HF_REPO,
        local_dir=LOCAL_PATH,
        repo_type="model"
    )
    print(f" Model downloaded to {LOCAL_PATH}")

if __name__ == "__main__":
    download_models()
    print("\n All models ready! You can now run server.py")