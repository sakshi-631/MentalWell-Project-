import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  final dummyUsers = const [
    {"name": "Sakshi Sadgir", "email": "sakshisadgir.skn.it@gmail.com", "status": "Active"},
    {"name": "John Doe", "email": "john@example.com", "status": "Inactive"},
    {"name": "Jane Smith", "email": "jane@example.com", "status": "Active"},
    {"name": "Mike Johnson", "email": "mike@example.com", "status": "Active"},
    {"name": "Emily Clark", "email": "emily@example.com", "status": "Inactive"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("User Management",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search users...",
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              fillColor: Colors.blue[50],
              filled: true,
            ),
          ),
          const SizedBox(height: 16),

          // Users List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyUsers.length,
            itemBuilder: (context, index) {
              final user = dummyUsers[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user['name']![0]),
                    backgroundColor: Colors.blue[100],
                  ),
                  title: Text(user['name']!),
                  subtitle: Text(user['email']!),
                  trailing: Text(user['status']!,
                      style: TextStyle(
                          color: user['status'] == 'Active'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    // Optionally open user profile or edit
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
