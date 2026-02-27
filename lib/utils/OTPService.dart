import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:developer';
import 'dart:async';

class OTPService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseAuthPlatform _authPlatform =
      FirebaseAuthPlatform.instance;

  static String _verificationId = "";
  static String _webVerificationId = "";

  /// Get stored verification ID
  static String get verificationId =>
      kIsWeb ? _webVerificationId : _verificationId;

  /// Send OTP to phone number
  static Future<bool> sendOTP({
    required String phoneNumber,
    required Function(String message) onSuccess,
    required Function(String error) onError,
  }) async {
    try {
      log("📱 Attempting to send OTP to: $phoneNumber");

      if (kIsWeb) {
        // 🌐 Web Platform: Phone Sign-in
        try {
          ConfirmationResult confirmationResult = await _auth
              .signInWithPhoneNumber(
                phoneNumber,
                RecaptchaVerifier(
                  auth: _authPlatform,
                  container: 'recaptcha-container',
                  size: RecaptchaVerifierSize.compact,
                  theme: RecaptchaVerifierTheme.light,
                ),
              );

          _webVerificationId = confirmationResult.verificationId;
          log(
            "✅ Web OTP sent successfully. Verification ID: $_webVerificationId",
          );
          onSuccess("OTP sent to $phoneNumber");
          return true;
        } catch (e) {
          log("❌ Web OTP Error: $e");
          onError("Failed to send OTP: ${e.toString()}");
          return false;
        }
      } else {
        // 📱 Mobile Platform: Android/iOS
        Completer<bool> completer = Completer();

        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async {
            log("✅ Mobile auto-verification completed");
            completer.complete(true);
          },
          verificationFailed: (FirebaseAuthException e) {
            log("❌ Mobile verification failed: ${e.message}");
            onError(e.message ?? "Phone verification failed");
            if (!completer.isCompleted) completer.complete(false);
          },
          codeSent: (String verId, int? resendToken) {
            _verificationId = verId;
            log("✅ Mobile OTP sent. Verification ID: $_verificationId");
            onSuccess("OTP sent to $phoneNumber");
            if (!completer.isCompleted) completer.complete(true);
          },
          codeAutoRetrievalTimeout: (String verId) {
            _verificationId = verId;
            log("⏱️ Auto-retrieval timeout. Verification ID: $_verificationId");
          },
        );

        return await completer.future;
      }
    } catch (e) {
      log("❌ Unexpected error in sendOTP: $e");
      onError("Unexpected error: ${e.toString()}");
      return false;
    }
  }

  /// Verify OTP code
  static Future<UserCredential?> verifyOTP({
    required String otp,
    required Function(String message) onSuccess,
    required Function(String error) onError,
  }) async {
    try {
      log("🔐 Verifying OTP code...");

      if (kIsWeb) {
        // Web: Use stored confirmation result
        // Note: Web doesn't store ConfirmationResult, so we need a different approach
        // For web, we sign in directly with the phone number + OTP
        log("⚠️ Web OTP verification not directly supported with this method");
        onError("OTP verification not configured for web");
        return null;
      } else {
        // Mobile: Sign in with credential
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: otp,
        );

        UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );
        log("✅ OTP verified successfully!");
        onSuccess("Phone number verified successfully!");
        return userCredential;
      }
    } catch (e) {
      log("❌ OTP verification failed: $e");
      onError("Invalid OTP. Please try again.");
      return null;
    }
  }

  /// Clear verification state
  static void clearVerification() {
    _verificationId = "";
    _webVerificationId = "";
    log("🗑️ Verification state cleared");
  }
}
