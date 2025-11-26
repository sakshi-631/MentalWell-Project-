import 'package:flutter/material.dart';
import 'exercise_page.dart';
import 'sleep_page.dart';
import 'nutrition_page.dart';
import 'relaxation_page.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  String? selectedMood;
  final TextEditingController notesController = TextEditingController();

  final List<String> moods = [
    "😊 Happy", "😔 Sad", "😡 Angry", "😰 Stressed", "😐 Neutral", "🤩 Excited", "🥱 Tired",
  ];

  final Map<String, String> moodInsights = {
    "😊 Happy": "Keep up the positivity! Spread your happiness around.",
    "🤩 Excited": "Channel your excitement into productive activities.",
    "😐 Neutral": "Reflect on your day and set small goals.",
    "🥱 Tired": "Rest and recharge. Sleep or a short break can help.",
    "😰 Stressed": "Try deep breathing, meditation, or a short walk to calm down.",
    "😔 Sad": "Talk to a friend or write in a journal to lift your mood.",
    "😡 Angry": "Pause and take deep breaths. Physical activity can help release tension.",
  };

  final List<Map<String, dynamic>> moodLogs = [];

  void saveMood() {
    if (selectedMood != null) {
      setState(() {
        moodLogs.insert(0, {
          "mood": selectedMood!,
          "notes": notesController.text,
          "date": DateTime.now(),
        });
        selectedMood = null;
        notesController.clear();
      });
    }
  }

  String getLatestMoodInsight() {
    if (moodLogs.isEmpty) return "Track your mood to receive insights!";
    return moodInsights[moodLogs.first["mood"]] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Tracker"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("How are you feeling today?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: moods.map((mood) => ChoiceChip(
                label: Text(mood),
                selected: selectedMood == mood,
                selectedColor: Colors.teal.shade200,
                onSelected: (selected) {
                  setState(() => selectedMood = selected ? mood : null);
                },
              )).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write something about your mood...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveMood,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Save Mood", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("💡 Mood Insight: ${getLatestMoodInsight()}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 20),
            const Text("Mood Improvement Tips", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _tipButton(context, "Exercises", Colors.orange, const ExercisePage()),
                _tipButton(context, "Sleep", Colors.blue, const SleepRelaxationPage()),
                _tipButton(context, "Nutrition", Colors.green, const NutritionPage()),
                _tipButton(context, "Relaxation", Colors.purple, const RelaxationPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipButton(BuildContext context, String title, Color color, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
