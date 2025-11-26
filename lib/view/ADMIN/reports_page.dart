import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Reports & Analytics",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // User Activity Analytics
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                  "📊 User Activity Chart Placeholder\nTrack daily, weekly, and monthly engagement trends"),
            ),
          ),
          const SizedBox(height: 16),

          // Content Analytics
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                  "📈 Content Engagement Chart Placeholder\nMonitor most popular content and user interaction"),
            ),
          ),
          const SizedBox(height: 16),

          // Summary Cards
          Row(
            children: [
              Expanded(
                child: _AnalyticsCard(
                    title: "Total Users", value: "1200", color: Colors.blue),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _AnalyticsCard(
                    title: "Active Users Today",
                    value: "350",
                    color: Colors.green),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _AnalyticsCard(
                    title: "Total SOS Requests", value: "5", color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _AnalyticsCard(
      {required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(value,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
