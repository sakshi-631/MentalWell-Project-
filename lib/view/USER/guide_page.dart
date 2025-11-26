
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  final List<Map<String, String>> faqs = const [
    {"q": "How to use Emergency Button?", "a": "Tap it whenever you feel unsafe or stressed to get immediate help."},
    {"q": "How to track mood and progress?", "a": "Use the Floating Mood Button and Self-Care/Exercise pages to log your daily mood and activities."},
    {"q": "How to follow the wellness plan?", "a": "Combine Self-Care, Exercise, and Healing activities daily for best results."},
  ];

  final List<Map<String, String>> resources = const [
    {"name": "WHO Mental Health", "link": "https://www.who.int/mental_health"},
    {"name": "NIMH USA", "link": "https://www.nimh.nih.gov"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guide"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📖 How-To Guides",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildGuideCard("Using the Emergency Button"),
            _buildGuideCard("Tracking Mood and Progress"),
            _buildGuideCard("Following Weekly Wellness Plans"),

            const SizedBox(height: 20),
            const Text(
              "🗓️ Weekly Wellness Plan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildGuideCard("Monday: Meditation + Self-Care"),
            _buildGuideCard("Tuesday: Exercise + Gratitude Journal"),
            _buildGuideCard("Wednesday: Mindfulness + Relaxing Music"),
            _buildGuideCard("Thursday: Self-Care + Mood Tracking"),
            _buildGuideCard("Friday: Yoga + Affirmations"),
            _buildGuideCard("Weekend: Mix activities & review progress"),

            const SizedBox(height: 20),
            const Text(
              "❓ FAQs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...faqs.map((faq) => ExpansionTile(
                  title: Text(faq["q"]!),
                  children: [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq["a"]!),
                  )],
                )),

            const SizedBox(height: 20),
            const Text(
              "🔗 External Resources",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...resources.map((res) => ListTile(
                  leading: const Icon(Icons.link, color: Colors.blue),
                  title: Text(res["name"]!),
                  onTap: () async {
                    final uri = Uri.parse(res["link"]!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard(String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue.shade50,
      child: ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Placeholder for future detail page
        },
      ),
    );
  }
}
