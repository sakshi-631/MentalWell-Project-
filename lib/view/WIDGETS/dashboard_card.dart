// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(width < 500 ? 10 : 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: width < 500 ? 30 : 40, color: Colors.blue),
            SizedBox(height: width < 500 ? 7 : 10),
            Text(
              value,
              style: TextStyle(
                  fontSize: width < 500 ? 15 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: width < 500 ? 3 : 6),
            Text(title, style: TextStyle(fontSize: width < 500 ? 10 : 14)),
          ],
        ),
      ),
    );
  }
}
