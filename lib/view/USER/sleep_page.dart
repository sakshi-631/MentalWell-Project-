import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SleepRelaxationPage extends StatelessWidget {
  const SleepRelaxationPage({super.key});

  // Function to open YouTube links
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.ibb.co/RvQXGWN/night-sky.jpg"), // background
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6), // dark overlay
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "🌙 Sleep & Relaxation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Unwind your mind and drift into peaceful sleep",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Meditation Button
                  _buildButton(
                    text: "🧘 Guided Meditation",
                    color: Colors.deepPurple,
                    onTap: () => _openLink("https://www.youtube.com/watch?v=inpok4MKVLM"),
                  ),

                  const SizedBox(height: 16),

                  // Relaxation Music Button
                  _buildButton(
                    text: "🎵 Relaxation Music",
                    color: Colors.teal,
                    onTap: () => _openLink("https://www.youtube.com/watch?v=1ZYbU82GVz4"),
                  ),

                  const SizedBox(height: 16),

                  // Breathing Exercise Button
                  _buildButton(
                    text: "🌬 Breathing Exercise",
                    color: Colors.indigo,
                    onTap: () => _openLink("https://www.youtube.com/watch?v=nmFUDkj1Aq0"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable button widget
  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 6,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
