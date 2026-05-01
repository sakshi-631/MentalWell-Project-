# 🧠 MentalWell – AI-Based Mental Health Assistant

MentalWell is a privacy-preserving AI-powered mental health assistant designed to support users dealing with stress, anxiety, and emotional distress through intelligent and empathetic interactions.

---

## 📌 Project Overview

MentalWell is built using a **multi-stage AI pipeline** that enables real-time mental health support through:

- Emotion detection
- Sentiment analysis
- Risk assessment (crisis detection)
- Personalized wellness recommendations
- Safe, template-based empathetic responses

The system is designed with a **privacy-first architecture**, ensuring secure handling of sensitive user data.

---

## ⚙️ Tech Stack

- **Frontend:** Flutter (Dart)  
- **Backend:** Python (AI/ML pipeline + APIs)  
- **Database & Auth:** Firebase (Authentication, Firestore/Realtime DB)  
- **AI Models:** DistilBERT, RoBERTa  
- **Architecture:** Hybrid ML + Rule-Based System  

---

## 🧠 Core Features

- Emotion detection using DistilBERT (94.35% accuracy)  
- Sentiment analysis using RoBERTa (~99% accuracy)  
- Rule-based risk detection for crisis identification  
- Personalized mental wellness activity suggestions  
- Template-based empathetic response generation  
- Real-time chatbot interaction  
- Cross-platform mobile application support  

---

## 🔐 Privacy & Security

- AES-256 encryption for secure data storage  
- Multi-Factor Authentication (MFA)  
- Role-Based Access Control (RBAC)  
- OWASP-compliant security practices  
- No unauthorized data sharing  

---

## 🚀 How to Run

### 1️⃣ Clone the Repository
bash
git clone https://github.com/your-username/mentalwell.git
cd mentalwell

2️⃣ Install Flutter Dependencies
flutter pub get

3️⃣ Setup Firebase
Create a Firebase project
Add google-services.json (Android) / GoogleService-Info.plist (iOS)
Enable Authentication and Firestore Database

4️⃣ Run the Application
flutter run
