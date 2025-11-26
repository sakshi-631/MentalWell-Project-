
import 'package:flutter/material.dart';

class SelfCarePage extends StatefulWidget {
  const SelfCarePage({super.key});

  @override
  State<SelfCarePage> createState() => _SelfCarePageState();
}

class _SelfCarePageState extends State<SelfCarePage> {
  // Checklist items
  final List<Map<String, dynamic>> selfCareTasks = [
    {"task": "Drink water / Hydration", "done": false},
    {"task": "Journaling", "done": false},
    {"task": "Meditation / Mindfulness", "done": false},
    {"task": "Reading / Wind-down", "done": false},
    {"task": "Warm bath / Relaxation", "done": false},
    {"task": "Listen to music / Therapy", "done": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Self-Care"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🌅 Morning Routine Tips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTipCard("Hydrate: Drink a glass of water"),
            _buildTipCard("Journaling: Write your thoughts or gratitude"),
            _buildTipCard("Meditation: 5-10 min mindfulness session"),

            const SizedBox(height: 20),
            const Text(
              "🌙 Evening Wind-down",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTipCard("Read a book or article you enjoy"),
            _buildTipCard("Take a warm bath to relax"),
            _buildTipCard("Listen to calming music or therapy tracks"),

            const SizedBox(height: 20),
            const Text(
              "✅ Self-Care Checklist",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: selfCareTasks.length,
              itemBuilder: (context, index) {
                final task = selfCareTasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: CheckboxListTile(
                    title: Text(task["task"]),
                    value: task["done"],
                    onChanged: (val) {
                      setState(() {
                        selfCareTasks[index]["done"] = val;
                      });
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for notifications/reminder feature
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Reminder set! (placeholder)")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Set Daily Reminders"),
              ),
            ),

            const SizedBox(height: 20),
            // Placeholder for Mood Tracker Integration
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            "Mood Tracker integration placeholder")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Track Mood with Self-Care"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.pink.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
