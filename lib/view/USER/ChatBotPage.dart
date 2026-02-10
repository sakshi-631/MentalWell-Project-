import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/WIDGETS/background.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatBot"),
        // Default back button will appear automatically
      ),
      body: const Background(
        child: Center(child: Text("🤖 Hi! How can I help you?")),
      ),
    );
  }
}
