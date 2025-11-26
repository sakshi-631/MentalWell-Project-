
import 'package:flutter/material.dart';

class HealingPage extends StatefulWidget {
  const HealingPage({super.key});

  @override
  State<HealingPage> createState() => _HealingPageState();
}

class _HealingPageState extends State<HealingPage> {
  final TextEditingController gratitudeController = TextEditingController();
  final List<String> gratitudeList = [];

  final List<String> affirmations = [
    "I am calm and at peace 🌿",
    "Every day I grow stronger 💪",
    "I am grateful for this moment ✨",
    "I choose positivity today 🌈",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healing"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🧘 Meditation / Breathing Exercises",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildCard("5–10 min Guided Meditation (YouTube)", Icons.self_improvement),
            _buildCard("Breathing Exercise Video (YouTube)", Icons.air),

            const SizedBox(height: 20),
            const Text(
              "🎵 Music / Nature Sounds",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildCard("Relaxing Nature Playlist", Icons.music_note),
            _buildCard("Stress Relief Music", Icons.music_video),

            const SizedBox(height: 20),
            const Text(
              "💌 Daily Affirmations / Quotes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...affirmations.map((quote) => _buildCard(quote, Icons.favorite_border)),

            const SizedBox(height: 20),
            const Text(
              "📓 Gratitude Journal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: gratitudeController,
              decoration: InputDecoration(
                hintText: "Write 1-3 things you're grateful for today...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (gratitudeController.text.isNotEmpty) {
                  setState(() {
                    gratitudeList.add(gratitudeController.text);
                    gratitudeController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Add to Journal"),
            ),
            const SizedBox(height: 8),
            ...gratitudeList.map((entry) => ListTile(
                  leading: const Icon(Icons.star, color: Colors.orangeAccent),
                  title: Text(entry),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String text, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.orange.shade50,
      child: ListTile(
        leading: Icon(icon, color: Colors.orangeAccent),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Placeholder for YouTube/video/music integration
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Feature coming soon!")),
          );
        },
      ),
    );
  }
}
