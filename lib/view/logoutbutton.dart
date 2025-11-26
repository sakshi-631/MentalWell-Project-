import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentalwellapp/controller/LoginController.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:flutter/material.dart';

Future<void> handleLogout(BuildContext context) async {
  final loginController = LoginController();

  // 🔹 Sign out from Firebase
  await FirebaseAuth.instance.signOut();

  // 🔹 Clear locally saved data
  await loginController.clearSharedPref(); // ✅ fixed name

  // 🔹 Navigate back to login page
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const LoginPage()),
    (route) => false,
  );
}
