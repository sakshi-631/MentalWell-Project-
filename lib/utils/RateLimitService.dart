import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class RateLimitService {
  static const String _prefix = 'rate_limit_';
  static const int _maxAttempts = 4; // Lock after 4 FAILED attempts
  static const int _lockoutDurationMinutes = 15; // Lock for 15 minutes

  /// Normalize email to lowercase for consistent comparison
  static String _normalizeEmail(String email) {
    return email.toLowerCase().trim();
  }

  /// Get the key for storing attempt data
  static String _getAttemptKey(String email) {
    return '${_prefix}attempts_${_normalizeEmail(email)}';
  }

  static String _getLockoutKey(String email) {
    return '${_prefix}lockout_${_normalizeEmail(email)}';
  }

  /// Check if email is currently locked
  static Future<bool> isLocked(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final normalizedEmail = _normalizeEmail(email);
    final lockoutKey = _getLockoutKey(normalizedEmail);

    final lockoutTime = prefs.getInt(lockoutKey);
    log("🔍 Checking lockout for: $normalizedEmail, lockoutTime: $lockoutTime");

    if (lockoutTime == null) {
      log("✅ No lockout found for: $normalizedEmail");
      return false;
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    final isStillLocked = now < lockoutTime;

    log("⏱️ Now: $now, LockoutTime: $lockoutTime, IsLocked: $isStillLocked");

    // If lockout expired, remove it
    if (!isStillLocked) {
      await prefs.remove(lockoutKey);
      await prefs.remove(_getAttemptKey(normalizedEmail));
      log("🔓 Rate limit lockout expired for: $normalizedEmail");
    }

    return isStillLocked;
  }

  /// Get remaining lockout time in minutes
  static Future<int> getRemainingLockoutMinutes(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final lockoutTime = prefs.getInt(_getLockoutKey(email));

    if (lockoutTime == null) return 0;

    final now = DateTime.now().millisecondsSinceEpoch;
    final remaining = ((lockoutTime - now) / (1000 * 60)).ceil();
    return remaining > 0 ? remaining : 0;
  }

  /// Record a failed login attempt
  static Future<int> recordFailedAttempt(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final normalizedEmail = _normalizeEmail(email);
    final key = _getAttemptKey(normalizedEmail);

    // Get current attempt count
    int attempts = prefs.getInt(key) ?? 0;
    attempts++;

    // Save updated attempt count
    await prefs.setInt(key, attempts);
    log(
      "⚠️ Failed login attempt $attempts/$_maxAttempts for: $normalizedEmail",
    );

    // Lock account AFTER max attempts reached
    if (attempts > _maxAttempts) {
      log("🔒 Locking account (attempts exceeded limit) for: $normalizedEmail");
      final lockoutTime = DateTime.now()
          .add(Duration(minutes: _lockoutDurationMinutes))
          .millisecondsSinceEpoch;
      await prefs.setInt(_getLockoutKey(normalizedEmail), lockoutTime);
      log("🔒 Account locked until: $lockoutTime for: $normalizedEmail");
    }

    return attempts;
  }

  /// Reset failed attempts for successful login
  static Future<void> resetAttempts(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final normalizedEmail = _normalizeEmail(email);
    await prefs.remove(_getAttemptKey(normalizedEmail));
    await prefs.remove(_getLockoutKey(normalizedEmail));
    log("✅ Rate limit reset for: $normalizedEmail");
  }

  /// Get current attempt count
  static Future<int> getCurrentAttempts(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final attempts = prefs.getInt(_getAttemptKey(email)) ?? 0;
    log("📊 Current attempts for ${_normalizeEmail(email)}: $attempts");
    return attempts;
  }

  /// Get max allowed attempts
  static int getMaxAttempts() => _maxAttempts;

  /// Get lockout duration in minutes
  static int getLockoutDurationMinutes() => _lockoutDurationMinutes;

  /// ⚠️ DEBUGGING: Clear all rate limit data
  static Future<void> clearAllRateLimitData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith(_prefix)) {
        await prefs.remove(key);
        log("🗑️ Removed: $key");
      }
    }
    log("🗑️ All rate limit data cleared!");
  }
}
