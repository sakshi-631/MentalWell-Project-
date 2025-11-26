import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.directions_run, color: Colors.green, size: 32),
              title: const Text("Morning Jogging 🏃"),
              subtitle: const Text("Boost your energy and mood."),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.blue, size: 32),
              title: const Text("Strength Training 💪"),
              subtitle: const Text("Build confidence and stamina."),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.self_improvement, color: Colors.orange, size: 32),
              title: const Text("Yoga & Meditation 🧘"),
              subtitle: const Text("Relax your body and mind."),
            ),
          ),
        ],
      ),
    );
  }
}

