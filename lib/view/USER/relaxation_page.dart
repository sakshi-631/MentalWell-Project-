
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RelaxationPage extends StatelessWidget {
  const RelaxationPage({super.key});

  final String youtubeLink = "https://www.youtube.com/watch?v=ZToicYcHIOU"; // Example: Guided meditation

  void _launchURL() async {
    if (!await launchUrl(Uri.parse(youtubeLink))) throw 'Could not launch $youtubeLink';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relaxation & Mindfulness"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("🧘 Relaxation Techniques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
                "Relaxation exercises help reduce stress, calm your mind, and improve emotional wellbeing. Practicing daily can boost mental clarity and overall happiness."),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _launchURL,
              icon: const Icon(Icons.play_arrow),
              label: const Text("Watch Guided Meditation"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Recommended Relaxation Practices:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Deep Breathing - 5 to 10 min"),
                Text("• Progressive Muscle Relaxation"),
                Text("• Mindfulness Meditation"),
                Text("• Listening to Calm Music or Nature Sounds"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Benefits of Relaxation:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Reduces stress and anxiety"),
                Text("• Improves focus and concentration"),
                Text("• Enhances mood and emotional balance"),
                Text("• Promotes better sleep"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Tips for Effective Relaxation:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("• Create a quiet and comfortable environment."),
                Text("• Practice at the same time daily for consistency."),
                Text("• Focus on your breathing and body sensations."),
                Text("• Avoid distractions like phone or TV."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
