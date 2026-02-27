import 'package:flutter/material.dart';

enum PasswordStrength { veryWeak, weak, moderate, strong, veryStrong }

class PasswordStrengthChecker {
  static PasswordStrength checkPassword(String password) {
    int score = 0;

    // Check length (minimum 8 characters)
    if (password.length >= 8) {
      score++;
    }

    // Check for digits
    if (RegExp(r'\d').hasMatch(password)) {
      score++;
    }

    // Check for uppercase letters
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score++;
    }

    // Check for lowercase letters
    if (RegExp(r'[a-z]').hasMatch(password)) {
      score++;
    }

    // Check for special characters
    if (RegExp(r'[@$!%*?&#]').hasMatch(password)) {
      score++;
    }

    // Determine strength level
    if (score == 0) {
      return PasswordStrength.veryWeak;
    } else if (score <= 2) {
      return PasswordStrength.weak;
    } else if (score == 3) {
      return PasswordStrength.moderate;
    } else if (score == 4) {
      return PasswordStrength.strong;
    } else {
      return PasswordStrength.veryStrong;
    }
  }

  static String getStrengthText(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.veryWeak:
        return 'Very Weak';
      case PasswordStrength.weak:
        return 'Weak';
      case PasswordStrength.moderate:
        return 'Moderate';
      case PasswordStrength.strong:
        return 'Strong';
      case PasswordStrength.veryStrong:
        return 'Very Strong';
    }
  }

  static Color getStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.veryWeak:
        return const Color(0xFFd32f2f); // Red
      case PasswordStrength.weak:
        return const Color(0xFFff9800); // Orange
      case PasswordStrength.moderate:
        return const Color(0xFFffc107); // Amber
      case PasswordStrength.strong:
        return const Color(0xFF4caf50); // Green
      case PasswordStrength.veryStrong:
        return const Color(0xFF2e7d32); // Dark Green
    }
  }

  static List<String> getStrengthTips() {
    return [
      '• Use at least 8 characters',
      '• Include UPPERCASE and lowercase letters',
      '• Add numbers (0–9)',
      '• Use symbols like @, #, \$, %, !, etc.',
    ];
  }
}
