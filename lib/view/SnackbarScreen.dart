import 'package:flutter/material.dart';

class Snackbarscreen {
  void showCustomSnackBar(BuildContext context, String message,
      {Color bgColor = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: bgColor,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
