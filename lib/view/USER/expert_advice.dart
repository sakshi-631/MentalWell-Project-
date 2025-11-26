
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // for opening external links

class ExpertAdvicePage extends StatelessWidget {
  const ExpertAdvicePage({super.key});

  // Sample YouTube links
  final List<Map<String, String>> videoAdvice = const [
    {
      "title": "Mindfulness Meditation for Beginners",
      "url": "https://www.youtube.com/watch?v=inpok4MKVLM"
    },
    {
      "title": "Stress Management Tips by Therapist",
      "url": "https://www.youtube.com/watch?v=hnpQrMqDoqE"
    },
  ];

  // Sample Q&A
  final List<Map<String, String>> qaList = const [
    {
      "question": "How can I manage anxiety before sleep?",
      "answer":
          "Practice deep breathing, meditation, or write down your thoughts in a journal before sleeping."
    },
    {
      "question": "What to do when work stress is overwhelming?",
      "answer":
          "Take short breaks, prioritize tasks, and talk to a friend or counselor to relieve pressure."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expert Advice"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "💡 Mental Health Tips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTipCard("5 Ways to Manage Stress at Work"),
            _buildTipCard("Daily Mindfulness Practices"),
            _buildTipCard("Handling Anxiety Before Sleep"),
            const SizedBox(height: 20),
            const Text(
              "🎥 Video Advice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...videoAdvice.map((video) => _buildVideoCard(video["title"]!, video["url"]!)),
            const SizedBox(height: 20),
            const Text(
              "❓ Q&A",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...qaList.map((qa) => _buildQACard(qa["question"]!, qa["answer"]!)),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  const url = 'https://www.mentalhealth.gov/get-help'; // Example link
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Could not open link")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Feeling stressed? Contact a professional",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildVideoCard(String title, String url) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.play_circle_fill, color: Colors.redAccent),
        title: Text(title),
        trailing: const Icon(Icons.open_in_new),
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
      ),
    );
  }

  Widget _buildQACard(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.deepPurple.shade50,
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
