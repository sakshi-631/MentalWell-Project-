import 'package:flutter/material.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  final dummySOS = const [
    {"user": "Sakshi Sadgir", "type": "Medical", "time": "10:20 AM"},
    {"user": "John Doe", "type": "Personal Safety", "time": "11:15 AM"},
    {"user": "Jane Smith", "type": "Mental Health", "time": "12:00 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SOS & Emergency Requests",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Overview
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Monitor and respond to urgent SOS requests from users. Ensure timely assistance for medical, safety, and mental health emergencies.",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
          const SizedBox(height: 16),

          // SOS List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummySOS.length,
            itemBuilder: (context, index) {
              final sos = dummySOS[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.sos, color: Colors.red),
                  title: Text(sos['user']!),
                  subtitle: Text("${sos['type']} | Time: ${sos['time']}"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    child: const Text("Respond"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
