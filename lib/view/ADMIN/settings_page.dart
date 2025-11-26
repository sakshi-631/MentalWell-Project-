import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Account Settings
          const Text("Account Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Update Profile"),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Change Password"),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),

          // App Settings
          const Text("App Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: SwitchListTile(
              title: const Text("Enable Notifications"),
              value: true,
              onChanged: (val) {},
            ),
          ),
          Card(
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              value: false,
              onChanged: (val) {},
            ),
          ),
          const SizedBox(height: 16),

          // Support
          const Text("Support",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help & FAQ"),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("Contact Support"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
