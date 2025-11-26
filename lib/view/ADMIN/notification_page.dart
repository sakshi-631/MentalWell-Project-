import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final dummyNotifications = const [
    {"title": "New User Registered", "time": "2 hours ago"},
    {"title": "SOS Alert Received", "time": "3 hours ago"},
    {"title": "Content Flagged for Review", "time": "5 hours ago"},
    {"title": "Reminder: Weekly Report", "time": "1 day ago"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Notifications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyNotifications.length,
            itemBuilder: (context, index) {
              final note = dummyNotifications[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.blue),
                  title: Text(note['title']!),
                  subtitle: Text(note['time']!),
                  onTap: () {
                    // Optionally open detailed notification
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
