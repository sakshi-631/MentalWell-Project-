

import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ExpansionTile(
                      leading: Icon(Icons.info, color: Colors.teal),
                      title: Text("How to use the app?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "You can explore features like Motivation, ChatBot, Self-Care exercises, and Mood Tracking."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.psychology, color: Colors.teal),
                      title: Text("What if I feel low?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "Try meditation, breathing exercises, journaling, or talk to CalmBot. "
                              "If you feel worse, reach out to a trusted contact or professional help."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.chat, color: Colors.teal),
                      title: Text("How to talk to CalmBot?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "Go to 'Talk to Me' on the Dashboard and start chatting with CalmBot. "
                              "It will respond instantly with supportive messages."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.favorite, color: Colors.teal),
                      title: Text("How to practice Self-Care?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "You can try guided meditation, listen to calming music, or write in your daily journal "
                              "using the Self-Care section."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.lock, color: Colors.teal),
                      title: Text("Is my data safe?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "Yes, your data is private and secure. We never share your personal information "
                              "without your consent."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.person, color: Colors.teal),
                      title: Text("How can I update my profile?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "Go to the Profile page from the Dashboard. You can update your name, picture, and preferences."),
                        ),
                      ],
                    ),
                    const ExpansionTile(
                      leading: Icon(Icons.health_and_safety, color: Colors.teal),
                      title: Text("Emergency Help"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                              "If you are in crisis, please call your local helpline immediately. "
                              "This app is for support, not a replacement for professional help."),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text("Contact Us"),
                      subtitle: Text("support@mentalwell.com"),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text("Helpline Number"),
                      subtitle: Text("+91 98765 43210"),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        "© 2025 MentalWell • All Rights Reserved",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
