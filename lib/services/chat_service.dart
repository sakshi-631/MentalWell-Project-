import 'dart:convert';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:http/http.dart' as http;

class ChatService {
  // ✅ Automatically picks the right URL based on platform
  static String get baseUrl {
    if (kIsWeb) {
      // Running in Chrome / browser → server is on same machine
      return 'http://localhost:8000';
    } else {
      // Running on Android Emulator → 10.0.2.2 maps to your PC
      // Running on Real Phone → change to your PC's WiFi IP e.g. http://192.168.1.5:8000
      return 'http://10.0.2.2:8000';
    }
  }

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl/chat'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'message': message,
              'session_id': 'flutter_user',
              'include_metadata': false,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? 'Sorry, I could not understand that.';
      } else {
        return '⚠️ Server error (${response.statusCode}). Please try again.';
      }
    } catch (e) {
      return '🔌 Cannot connect to server.\nMake sure the Python server is running on your PC.';
    }
  }
}