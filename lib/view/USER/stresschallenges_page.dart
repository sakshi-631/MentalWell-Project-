import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StressManagementPage extends StatelessWidget {
  const StressManagementPage({super.key});

  // Example YouTube videos for stress reduction
  final String yogaVideo = "https://www.youtube.com/watch?v=ihO02wUzgkc"; 
  final String meditationVideo = "https://www.youtube.com/watch?v=ZToicYcHIOU"; 

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stress Management"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Identify Stress
            const Text("🧠 How to Identify if You Are Stressed", 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Recognizing stress early helps you manage it effectively. Common signs include:",
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Feeling anxious or nervous frequently"),
                Text("• Trouble sleeping or fatigue"),
                Text("• Irritability or mood swings"),
                Text("• Difficulty concentrating or making decisions"),
                Text("• Headaches, muscle tension, or stomach issues"),
              ],
            ),
            const SizedBox(height: 20),

            // Section 2: Common Stress Challenges
            const Text("⚡ Common Stress Challenges",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Stress can come from many aspects of life. Typical triggers include:",
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Work or academic pressure"),
                Text("• Relationship issues"),
                Text("• Financial concerns"),
                Text("• Health or lifestyle challenges"),
                Text("• Social expectations or family responsibilities"),
              ],
            ),
            const SizedBox(height: 20),

            // Section 3: How to Reduce Stress
            const Text("💡 How to Reduce Stress",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Follow these strategies to manage stress effectively:",
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Practice daily meditation or mindfulness"),
                Text("• Do regular physical activity or yoga"),
                Text("• Maintain a healthy diet and sleep routine"),
                Text("• Take short breaks during work or studies"),
                Text("• Connect with friends, family, or mentors"),
                Text("• Focus on problem-solving rather than overthinking"),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _launchURL(yogaVideo),
              icon: const Icon(Icons.play_arrow),
              label: const Text("Guided Yoga for Stress"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _launchURL(meditationVideo),
              icon: const Icon(Icons.play_arrow),
              label: const Text("Meditation for Calm Mind"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            // Section 4: Avoid Taking Stress
            const Text("🚫 Avoid Taking Unnecessary Stress",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Don’t dwell on things beyond your control"),
                Text("• Avoid comparing yourself with others"),
                Text("• Take breaks from negative news or social media"),
                Text("• Practice saying 'No' to unnecessary commitments"),
                Text("• Focus on positive affirmations and self-talk"),
              ],
            ),
            const SizedBox(height: 20),

            // Section 5: Motivation
            const Text("🌟 Motivation & Encouragement",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "“It’s not the load that breaks you down, it’s the way you carry it.”\n\n"
              "Start with small steps daily, focus on self-care, and remember, managing stress is a journey, not a sprint.",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
