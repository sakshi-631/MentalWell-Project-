import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminActivityLogSection extends StatelessWidget {
  const AdminActivityLogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('activity_logs')
          .orderBy('timestamp', descending: true)
          .limit(10)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _ActivityLogCard(
            title: "Activity Log",
            child: const Text("Failed to load activity logs."),
          );
        }

        if (!snapshot.hasData) {
          return _ActivityLogCard(
            title: "Activity Log",
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final docs = snapshot.data!.docs;

        return _ActivityLogCard(
          title: "Activity Log",
          child: docs.isEmpty
              ? const Text("No activity logs yet.")
              : Column(
                  children: docs.map((doc) {
                    final data = doc.data();

                    final userName =
                        (data['userName'] ?? data['name'] ?? 'Unknown User')
                            .toString();
                    final action =
                        (data['action'] ?? data['type'] ?? 'activity')
                            .toString();
                    final details = (data['details'] ?? data['message'] ?? '')
                        .toString();

                    String timeText = '';
                    final ts = data['timestamp'];
                    if (ts is Timestamp) {
                      final dt = ts.toDate();
                      timeText =
                          "${dt.day.toString().padLeft(2, '0')}/"
                          "${dt.month.toString().padLeft(2, '0')}/"
                          "${dt.year} "
                          "${dt.hour.toString().padLeft(2, '0')}:"
                          "${dt.minute.toString().padLeft(2, '0')}";
                    }

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.indigo,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  action,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (details.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    details,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                                if (timeText.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    timeText,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}

class _ActivityLogCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _ActivityLogCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
