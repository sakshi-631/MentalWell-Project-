import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  String email = "";
  String password = "";
  bool isLoggedIn = false;
  bool seenOnboarding = false;
  String? accountType;
  String username = ""; // Added username field

  // Save login data
  Future<void> setSharedPrefData(Map<String, dynamic> obj) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', obj['email']);
    await prefs.setString('password', obj['password']);
    await prefs.setBool('isLoggedIn', obj['loginFlag']);
    await prefs.setBool('seenOnboarding', obj['seenOnboarding']);

    if (obj['accountType'] != null) {
      await prefs.setString('accountType', obj['accountType']);
    }

    if (obj['username'] != null) {
      await prefs.setString('username', obj['username']);
      username = obj['username']; // also update local field
    }
  }

  // Load login data
  Future<void> getSharedPrefData() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
    accountType = prefs.getString('accountType');
    username = prefs.getString('username') ?? ''; // load username
  }

  // Clear login data
  Future<void> clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('seenOnboarding', true);

    email = '';
    password = '';
    isLoggedIn = false;
    seenOnboarding = true;
    accountType = null;
    username = ''; // reset username
  }
}

// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController {
//   String email = "";
//   String password = "";
//   bool isLoggedIn = false;
//   bool seenOnboarding = false;
//   String? accountType;

//   // Save login data
//   Future<void> setSharedPrefData(Map<String, dynamic> obj) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('email', obj['email']);
//     await prefs.setString('password', obj['password']);
//     await prefs.setBool('isLoggedIn', obj['loginFlag']);
//     await prefs.setBool('seenOnboarding', obj['seenOnboarding']);
//     if (obj['accountType'] != null) {
//       await prefs.setString('accountType', obj['accountType']);
//     }
//   }

//   // Load login data
//   Future<void> getSharedPrefData() async {
//     final prefs = await SharedPreferences.getInstance();
//     email = prefs.getString('email') ?? '';
//     password = prefs.getString('password') ?? '';
//     isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
//     accountType = prefs.getString('accountType');
//   }

//   // Clear login data
//   Future<void> clearSharedPref() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     await prefs.setBool('seenOnboarding', true);

//     email = '';
//     password = '';
//     isLoggedIn = false;
//     seenOnboarding = true;
//     accountType = null;
//   }
// }
