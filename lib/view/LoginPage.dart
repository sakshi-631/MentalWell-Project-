import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
import 'package:mentalwellapp/view/SignUpPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';
import 'package:mentalwellapp/controller/LoginController.dart';
import 'package:mentalwellapp/utils/RateLimitService.dart';
import '../model/AccountTypeModelFull.dart'; // Import your model

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final LoginController loginController = LoginController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    checkAutoLogin();
  }

  Future<void> checkAutoLogin() async {
    await loginController.getSharedPrefData();
    if (loginController.isLoggedIn) {
      navigateToHome(loginController.accountType, loginController.username);
    }
  }

  void navigateToHome(String? accountType, [String? username]) {
    if (accountType == 'Admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AdminHomePage(username: username ?? ''),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
      );
    }
  }

  // ================= LOGIN =================
  Future<void> handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Enter email & password",
        bgColor: Colors.red,
      );
      return;
    }

    final email = emailController.text.trim().toLowerCase();

    // 🔒 Check if account is locked due to rate limiting
    bool isLocked = await RateLimitService.isLocked(email);
    if (isLocked) {
      int remainingMinutes = await RateLimitService.getRemainingLockoutMinutes(
        email,
      );
      Snackbarscreen().showCustomSnackBar(
        context,
        "🔒 Account locked! Too many failed login attempts.\nTry again in $remainingMinutes minute(s).",
        bgColor: Colors.red,
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      // 🔹 Firebase login
      UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      User user = userCred.user!;
      String accountType = 'User';
      String username = '';

      // 🔹 Check 'users' collection
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        if (!user.emailVerified) {
          await firebaseAuth.signOut();
          Snackbarscreen().showCustomSnackBar(
            context,
            "Please verify your email before logging in.",
            bgColor: Colors.red,
          );
          setState(() => isLoading = false);
          return;
        }

        // Read accountType and name
        accountType = userDoc['accountType'] ?? 'User';
        username = userDoc['name'] ?? '';

        // ✅ Reset rate limit on successful login
        await RateLimitService.resetAttempts(email);

        // Save login state
        await loginController.setSharedPrefData({
          'email': email,
          'password': passwordController.text.trim(),
          'loginFlag': true,
          'seenOnboarding': true,
          'accountType': accountType,
          'username': username,
        });

        Snackbarscreen().showCustomSnackBar(
          context,
          "✅ $accountType login successful",
          bgColor: Colors.green,
        );

        // Navigate based on accountType
        if (accountType == 'Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => AdminHomePage(username: username),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
          );
        }
      } else {
        throw Exception("User not found in Firestore");
      }
    } on FirebaseAuthException catch (e) {
      // 📊 Record failed attempt
      int attempts = await RateLimitService.recordFailedAttempt(email);
      int maxAttempts = RateLimitService.getMaxAttempts();
      int remaining = maxAttempts - attempts;

      String errorMessage = e.message ?? "Login failed";

      // Determine if account is now locked
      bool nowLocked = attempts > maxAttempts;

      if (nowLocked) {
        errorMessage =
            "❌ Account locked! You've exceeded the maximum login attempts.\nPlease try again in 15 minutes.";
      } else {
        errorMessage =
            "❌ Invalid credentials\n⚠️ Attempts remaining: $remaining/$maxAttempts\n(Account will lock after $maxAttempts failed attempts)";
      }

      Snackbarscreen().showCustomSnackBar(
        context,
        errorMessage,
        bgColor: Colors.red,
      );
    } catch (e) {
      // 📊 Record failed attempt for unknown errors
      await RateLimitService.recordFailedAttempt(email);
      int attempts = await RateLimitService.getCurrentAttempts(email);
      int maxAttempts = RateLimitService.getMaxAttempts();
      int remaining = maxAttempts - attempts;

      Snackbarscreen().showCustomSnackBar(
        context,
        "❌ Error: $e\n⚠️ Attempts remaining: $remaining",
        bgColor: Colors.red,
      );
    }

    setState(() => isLoading = false);
  }

  // ================= FORGOT PASSWORD =================
  Future<void> handleForgotPasswordDialog() async {
    TextEditingController forgotEmailController = TextEditingController(
      text: emailController.text.trim(),
    );

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Reset Password"),
          content: TextField(
            controller: forgotEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Enter your email"),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (forgotEmailController.text.isEmpty) {
                  Snackbarscreen().showCustomSnackBar(
                    context,
                    "Please enter your email",
                    bgColor: Colors.red,
                  );
                  return;
                }

                try {
                  await firebaseAuth.sendPasswordResetEmail(
                    email: forgotEmailController.text.trim(),
                  );
                  Snackbarscreen().showCustomSnackBar(
                    context,
                    "Password reset email sent",
                    bgColor: Colors.green,
                  );
                  Navigator.pop(context);
                } on FirebaseAuthException catch (e) {
                  Snackbarscreen().showCustomSnackBar(
                    context,
                    e.message ?? "Error sending reset email",
                    bgColor: Colors.red,
                  );
                }
              },
              child: const Text("Send"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF9B5F4D),
                            ),
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF9B5F4D),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF9B5F4D),
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: handleForgotPasswordDialog,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF9B5F4D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: isLoading ? null : handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B5F4D),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "    Log In    ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFF9B5F4D),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// import 'package:mentalwellapp/view/SignUpPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import '../model/AccountTypeModelFull.dart'; // Import your model

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final LoginController loginController = LoginController();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   bool isLoading = false;
//   bool isPasswordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     checkAutoLogin();
//   }

//   Future<void> checkAutoLogin() async {
//     await loginController.getSharedPrefData();
//     if (loginController.isLoggedIn) {
//       navigateToHome(loginController.accountType, loginController.username);
//     }
//   }

//   void navigateToHome(String? accountType, [String? username]) {
//     if (accountType == 'Admin') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => AdminHomePage(username: username ?? ''),
//         ),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
//       );
//     }
//   }

//   // ================= LOGIN =================
//   Future<void> handleLogin() async {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Enter email & password",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       // 🔹 Firebase login
//       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       User user = userCred.user!;
//       String accountType = 'User';
//       String username = '';

//       // 🔹 Check 'users' collection
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userDoc.exists) {
//         if (!user.emailVerified) {
//           await firebaseAuth.signOut();
//           Snackbarscreen().showCustomSnackBar(
//             context,
//             "Please verify your email before logging in.",
//             bgColor: Colors.red,
//           );
//           setState(() => isLoading = false);
//           return;
//         }

//         // Read accountType and name
//         accountType = userDoc['accountType'] ?? 'User';
//         username = userDoc['name'] ?? '';

//         // Save login state
//         await loginController.setSharedPrefData({
//           'email': emailController.text.trim(),
//           'password': passwordController.text.trim(),
//           'loginFlag': true,
//           'seenOnboarding': true,
//           'accountType': accountType,
//           'username': username,
//         });

//         Snackbarscreen().showCustomSnackBar(
//           context,
//           "${accountType} login successful",
//           bgColor: Colors.green,
//         );

//         // Navigate based on accountType
//         if (accountType == 'Admin') {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (_) => AdminHomePage(username: username),
//             ),
//           );
//         } else {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
//           );
//         }
//       } else {
//         throw Exception("User not found in Firestore");
//       }
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         e.message ?? "Login failed",
//         bgColor: Colors.red,
//       );
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Error: $e",
//         bgColor: Colors.red,
//       );
//     }

//     setState(() => isLoading = false);
//   }

//   // ================= FORGOT PASSWORD =================
//   Future<void> handleForgotPasswordDialog() async {
//     TextEditingController forgotEmailController = TextEditingController(
//       text: emailController.text.trim(),
//     );

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Reset Password"),
//           content: TextField(
//             controller: forgotEmailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(hintText: "Enter your email"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 if (forgotEmailController.text.isEmpty) {
//                   Snackbarscreen().showCustomSnackBar(
//                     context,
//                     "Please enter your email",
//                     bgColor: Colors.red,
//                   );
//                   return;
//                 }

//                 try {
//                   await firebaseAuth.sendPasswordResetEmail(
//                     email: forgotEmailController.text.trim(),
//                   );
//                   Snackbarscreen().showCustomSnackBar(
//                     context,
//                     "Password reset email sent",
//                     bgColor: Colors.green,
//                   );
//                   Navigator.pop(context);
//                 } on FirebaseAuthException catch (e) {
//                   Snackbarscreen().showCustomSnackBar(
//                     context,
//                     e.message ?? "Error sending reset email",
//                     bgColor: Colors.red,
//                   );
//                 }
//               },
//               child: const Text("Send"),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox.expand(
//             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 26),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 60),
//                   const Text(
//                     "Welcome Back",
//                     style: TextStyle(
//                       fontSize: 34,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.email,
//                               color: Color(0xFF9B5F4D),
//                             ),
//                             hintText: "Email",
//                             filled: true,
//                             fillColor: Colors.grey.shade100,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(24),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextField(
//                           controller: passwordController,
//                           obscureText: !isPasswordVisible,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.lock,
//                               color: Color(0xFF9B5F4D),
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: const Color(0xFF9B5F4D),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   isPasswordVisible = !isPasswordVisible;
//                                 });
//                               },
//                             ),
//                             hintText: "Password",
//                             filled: true,
//                             fillColor: Colors.grey.shade100,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(24),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         GestureDetector(
//                           onTap: handleForgotPasswordDialog,
//                           child: const Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 color: Color(0xFF9B5F4D),
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         ElevatedButton(
//                           onPressed: isLoading ? null : handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF9B5F4D),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                           ),
//                           child: isLoading
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : const Text(
//                                   "    Log In    ",
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("Don't have an account? "),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => const SignUpPage(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                   color: Color(0xFF9B5F4D),
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // import 'package:mentalwellapp/view/SignUpPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// //   final LoginController loginController = LoginController();

// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();

// //   bool isLoading = false;
// //   bool isPasswordVisible = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     checkAutoLogin();
// //   }

// //   Future<void> checkAutoLogin() async {
// //     await loginController.getSharedPrefData();
// //     if (loginController.isLoggedIn) {
// //       navigateToHome(loginController.accountType);
// //     }
// //   }

// //   void navigateToHome(String? accountType) {
// //     if (accountType == 'Admin') {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// //       );
// //     } else {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// //       );
// //     }
// //   }

// //   // ================= LOGIN =================
// //   Future<void> handleLogin() async {
// //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Enter email & password",
// //         bgColor: Colors.red,
// //       );
// //       return;
// //     }

// //     setState(() => isLoading = true);

// //     try {
// //       // 🔹 Firebase login
// //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// //         email: emailController.text.trim(),
// //         password: passwordController.text.trim(),
// //       );

// //       User user = userCred.user!;
// //       String accountType = 'User';

// //       // 🔹 Check 'users' collection for accountType
// //       final userDoc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(user.uid)
// //           .get();

// //       if (userDoc.exists) {
// //         // Normal user login: check email verification
// //         if (!user.emailVerified) {
// //           await firebaseAuth.signOut();
// //           Snackbarscreen().showCustomSnackBar(
// //             context,
// //             "Please verify your email before logging in.",
// //             bgColor: Colors.red,
// //           );
// //           setState(() => isLoading = false);
// //           return;
// //         }

// //         // Get accountType from Firestore
// //         accountType = userDoc['accountType'] ?? 'User';

// //         // Save login state
// //         await loginController.setSharedPrefData({
// //           'email': emailController.text.trim(),
// //           'password': passwordController.text.trim(),
// //           'loginFlag': true,
// //           'seenOnboarding': true,
// //           'accountType': accountType,
// //         });

// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           "${accountType} login successful",
// //           bgColor: Colors.green,
// //         );

// //         // Navigate based on accountType
// //         navigateToHome(accountType);
// //       } else {
// //         throw Exception("User not found in Firestore");
// //       }
// //     } on FirebaseAuthException catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         e.message ?? "Login failed",
// //         bgColor: Colors.red,
// //       );
// //     } catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Error: $e",
// //         bgColor: Colors.red,
// //       );
// //     }

// //     setState(() => isLoading = false);
// //   }

// //   // ================= FORGOT PASSWORD =================
// //   Future<void> handleForgotPasswordDialog() async {
// //     TextEditingController forgotEmailController = TextEditingController(
// //       text: emailController.text.trim(),
// //     );

// //     await showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text("Reset Password"),
// //           content: TextField(
// //             controller: forgotEmailController,
// //             keyboardType: TextInputType.emailAddress,
// //             decoration: const InputDecoration(hintText: "Enter your email"),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () async {
// //                 if (forgotEmailController.text.isEmpty) {
// //                   Snackbarscreen().showCustomSnackBar(
// //                     context,
// //                     "Please enter your email",
// //                     bgColor: Colors.red,
// //                   );
// //                   return;
// //                 }

// //                 try {
// //                   await firebaseAuth.sendPasswordResetEmail(
// //                     email: forgotEmailController.text.trim(),
// //                   );
// //                   Snackbarscreen().showCustomSnackBar(
// //                     context,
// //                     "Password reset email sent",
// //                     bgColor: Colors.green,
// //                   );
// //                   Navigator.pop(context);
// //                 } on FirebaseAuthException catch (e) {
// //                   Snackbarscreen().showCustomSnackBar(
// //                     context,
// //                     e.message ?? "Error sending reset email",
// //                     bgColor: Colors.red,
// //                   );
// //                 }
// //               },
// //               child: const Text("Send"),
// //             ),
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text("Cancel"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   // ================= UI =================
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           SizedBox.expand(
// //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// //           ),
// //           Center(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.symmetric(horizontal: 26),
// //               child: Column(
// //                 children: [
// //                   const SizedBox(height: 60),
// //                   const Text(
// //                     "Welcome Back",
// //                     style: TextStyle(
// //                       fontSize: 34,
// //                       fontWeight: FontWeight.w700,
// //                       color: Colors.black87,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Container(
// //                     padding: const EdgeInsets.all(24),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white.withOpacity(0.5),
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     child: Column(
// //                       children: [
// //                         TextField(
// //                           controller: emailController,
// //                           decoration: InputDecoration(
// //                             prefixIcon: const Icon(
// //                               Icons.email,
// //                               color: Color(0xFF9B5F4D),
// //                             ),
// //                             hintText: "Email",
// //                             filled: true,
// //                             fillColor: Colors.grey.shade100,
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(24),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         TextField(
// //                           controller: passwordController,
// //                           obscureText: !isPasswordVisible,
// //                           decoration: InputDecoration(
// //                             prefixIcon: const Icon(
// //                               Icons.lock,
// //                               color: Color(0xFF9B5F4D),
// //                             ),
// //                             suffixIcon: IconButton(
// //                               icon: Icon(
// //                                 isPasswordVisible
// //                                     ? Icons.visibility
// //                                     : Icons.visibility_off,
// //                                 color: const Color(0xFF9B5F4D),
// //                               ),
// //                               onPressed: () {
// //                                 setState(() {
// //                                   isPasswordVisible = !isPasswordVisible;
// //                                 });
// //                               },
// //                             ),
// //                             hintText: "Password",
// //                             filled: true,
// //                             fillColor: Colors.grey.shade100,
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(24),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         GestureDetector(
// //                           onTap: handleForgotPasswordDialog,
// //                           child: const Align(
// //                             alignment: Alignment.centerRight,
// //                             child: Text(
// //                               "Forgot Password?",
// //                               style: TextStyle(
// //                                 color: Color(0xFF9B5F4D),
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 24),
// //                         ElevatedButton(
// //                           onPressed: isLoading ? null : handleLogin,
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: const Color(0xFF9B5F4D),
// //                             padding: const EdgeInsets.symmetric(vertical: 12),
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(50),
// //                             ),
// //                           ),
// //                           child: isLoading
// //                               ? const CircularProgressIndicator(
// //                                   color: Colors.white,
// //                                 )
// //                               : const Text(
// //                                   "    Log In    ",
// //                                   style: TextStyle(
// //                                     fontSize: 22,
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Text("Don't have an account? "),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 Navigator.pushReplacement(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                     builder: (_) => const SignUpPage(),
// //                                   ),
// //                                 );
// //                               },
// //                               child: const Text(
// //                                 "Sign Up",
// //                                 style: TextStyle(
// //                                   color: Color(0xFF9B5F4D),
// //                                   fontWeight: FontWeight.w700,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }






// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // //   final LoginController loginController = LoginController();

// // //   TextEditingController emailController = TextEditingController();
// // //   TextEditingController passwordController = TextEditingController();

// // //   bool isLoading = false;
// // //   bool isPasswordVisible = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     checkAutoLogin();
// // //   }

// // //   Future<void> checkAutoLogin() async {
// // //     await loginController.getSharedPrefData();
// // //     if (loginController.isLoggedIn) {
// // //       navigateToHome(loginController.accountType);
// // //     }
// // //   }

// // //   void navigateToHome(String? accountType) {
// // //     if (accountType == 'Admin') {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// // //       );
// // //     } else {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // //       );
// // //     }
// // //   }

// // //   // ================= LOGIN =================
// // //   Future<void> handleLogin() async {
// // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter email & password",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔹 1. Firebase login
// // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // //         email: emailController.text.trim(),
// // //         password: passwordController.text.trim(),
// // //       );

// // //       User user = userCred.user!;

// // //       // 🔒 2. EMAIL VERIFICATION CHECK
// // //       if (!user.emailVerified) {
// // //         await firebaseAuth.signOut();

// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Please verify your email before logging in.",
// // //           bgColor: Colors.red,
// // //         );

// // //         setState(() => isLoading = false);
// // //         return;
// // //       }

// // //       // 🔹 3. Fetch user document
// // //       final userDoc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .get();

// // //       // 🔹 Admin fallback (unchanged)
// // //       if (!userDoc.exists) {
// // //         final adminDoc = await FirebaseFirestore.instance
// // //             .collection('admin')
// // //             .doc(user.uid)
// // //             .get();

// // //         if (adminDoc.exists) {
// // //           await loginController.setSharedPrefData({
// // //             'email': emailController.text.trim(),
// // //             'password': passwordController.text.trim(),
// // //             'loginFlag': true,
// // //             'seenOnboarding': true,
// // //             'accountType': 'Admin',
// // //           });

// // //           navigateToHome('Admin');
// // //           return;
// // //         } else {
// // //           throw Exception("User not found in Firestore");
// // //         }
// // //       }

// // //       String accountType = userDoc['accountType'] ?? 'User';

// // //       // 🔹 Save login state
// // //       await loginController.setSharedPrefData({
// // //         'email': emailController.text.trim(),
// // //         'password': passwordController.text.trim(),
// // //         'loginFlag': true,
// // //         'seenOnboarding': true,
// // //         'accountType': accountType,
// // //       });

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Login successful",
// // //         bgColor: Colors.green,
// // //       );

// // //       // 🔀 Navigate to home
// // //       navigateToHome(accountType);
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Login failed",
// // //         bgColor: Colors.red,
// // //       );
// // //     } catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Error: $e",
// // //         bgColor: Colors.red,
// // //       );
// // //     }

// // //     setState(() => isLoading = false);
// // //   }

// // //   // ================= FORGOT PASSWORD =================
// // //   Future<void> handleForgotPasswordDialog() async {
// // //     TextEditingController forgotEmailController = TextEditingController(
// // //       text: emailController.text.trim(),
// // //     );

// // //     await showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: const Text("Reset Password"),
// // //           content: TextField(
// // //             controller: forgotEmailController,
// // //             keyboardType: TextInputType.emailAddress,
// // //             decoration: const InputDecoration(hintText: "Enter your email"),
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () async {
// // //                 if (forgotEmailController.text.isEmpty) {
// // //                   Snackbarscreen().showCustomSnackBar(
// // //                     context,
// // //                     "Please enter your email",
// // //                     bgColor: Colors.red,
// // //                   );
// // //                   return;
// // //                 }

// // //                 try {
// // //                   await firebaseAuth.sendPasswordResetEmail(
// // //                     email: forgotEmailController.text.trim(),
// // //                   );
// // //                   Snackbarscreen().showCustomSnackBar(
// // //                     context,
// // //                     "Password reset email sent",
// // //                     bgColor: Colors.green,
// // //                   );
// // //                   Navigator.pop(context);
// // //                 } on FirebaseAuthException catch (e) {
// // //                   Snackbarscreen().showCustomSnackBar(
// // //                     context,
// // //                     e.message ?? "Error sending reset email",
// // //                     bgColor: Colors.red,
// // //                   );
// // //                 }
// // //               },
// // //               child: const Text("Send"),
// // //             ),
// // //             TextButton(
// // //               onPressed: () => Navigator.pop(context),
// // //               child: const Text("Cancel"),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           SizedBox.expand(
// // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // //           ),
// // //           Center(
// // //             child: SingleChildScrollView(
// // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // //               child: Column(
// // //                 children: [
// // //                   const SizedBox(height: 60),
// // //                   const Text(
// // //                     "Welcome Back",
// // //                     style: TextStyle(
// // //                       fontSize: 34,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Colors.black87,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Container(
// // //                     padding: const EdgeInsets.all(24),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white.withOpacity(0.5),
// // //                       borderRadius: BorderRadius.circular(20),
// // //                     ),
// // //                     child: Column(
// // //                       children: [
// // //                         TextField(
// // //                           controller: emailController,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.email,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             hintText: "Email",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         TextField(
// // //                           controller: passwordController,
// // //                           obscureText: !isPasswordVisible,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.lock,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             suffixIcon: IconButton(
// // //                               icon: Icon(
// // //                                 isPasswordVisible
// // //                                     ? Icons.visibility
// // //                                     : Icons.visibility_off,
// // //                                 color: const Color(0xFF9B5F4D),
// // //                               ),
// // //                               onPressed: () {
// // //                                 setState(() {
// // //                                   isPasswordVisible = !isPasswordVisible;
// // //                                 });
// // //                               },
// // //                             ),
// // //                             hintText: "Password",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         GestureDetector(
// // //                           onTap: handleForgotPasswordDialog,
// // //                           child: const Align(
// // //                             alignment: Alignment.centerRight,
// // //                             child: Text(
// // //                               "Forgot Password?",
// // //                               style: TextStyle(
// // //                                 color: Color(0xFF9B5F4D),
// // //                                 fontWeight: FontWeight.w600,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 24),
// // //                         ElevatedButton(
// // //                           onPressed: isLoading ? null : handleLogin,
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: const Color(0xFF9B5F4D),
// // //                             padding: const EdgeInsets.symmetric(vertical: 12),
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(50),
// // //                             ),
// // //                           ),
// // //                           child: isLoading
// // //                               ? const CircularProgressIndicator(
// // //                                   color: Colors.white,
// // //                                 )
// // //                               : const Text(
// // //                                   "    Log In    ",
// // //                                   style: TextStyle(
// // //                                     fontSize: 22,
// // //                                     fontWeight: FontWeight.bold,
// // //                                     color: Colors.white,
// // //                                   ),
// // //                                 ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             const Text("Don't have an account? "),
// // //                             GestureDetector(
// // //                               onTap: () {
// // //                                 Navigator.pushReplacement(
// // //                                   context,
// // //                                   MaterialPageRoute(
// // //                                     builder: (_) => const SignUpPage(),
// // //                                   ),
// // //                                 );
// // //                               },
// // //                               child: const Text(
// // //                                 "Sign Up",
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF9B5F4D),
// // //                                   fontWeight: FontWeight.w700,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }







// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // //   final LoginController loginController = LoginController();

// // //   TextEditingController emailController = TextEditingController();
// // //   TextEditingController passwordController = TextEditingController();

// // //   bool isLoading = false;
// // //   bool isPasswordVisible = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     checkAutoLogin();
// // //   }

// // //   Future<void> checkAutoLogin() async {
// // //     await loginController.getSharedPrefData();
// // //     if (loginController.isLoggedIn) {
// // //       navigateToHome(loginController.accountType);
// // //     }
// // //   }

// // //   void navigateToHome(String? accountType) {
// // //     if (accountType == 'Admin') {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// // //       );
// // //     } else {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // //       );
// // //     }
// // //   }

// // //   // ================= LOGIN =================
// // //   Future<void> handleLogin() async {
// // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter email & password",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔹 1. Firebase login
// // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // //         email: emailController.text.trim(),
// // //         password: passwordController.text.trim(),
// // //       );

// // //       User user = userCred.user!;

// // //       // 🔒 2. EMAIL VERIFICATION CHECK
// // //       if (!user.emailVerified) {
// // //         await firebaseAuth.signOut();

// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Please verify your email before logging in.",
// // //           bgColor: Colors.red,
// // //         );

// // //         setState(() => isLoading = false);
// // //         return;
// // //       }

// // //       // 🔹 3. Fetch user document
// // //       final userDoc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .get();

// // //       // 🔹 Admin fallback (unchanged)
// // //       if (!userDoc.exists) {
// // //         final adminDoc = await FirebaseFirestore.instance
// // //             .collection('admin')
// // //             .doc(user.uid)
// // //             .get();

// // //         if (adminDoc.exists) {
// // //           await loginController.setSharedPrefData({
// // //             'email': emailController.text.trim(),
// // //             'password': passwordController.text.trim(),
// // //             'loginFlag': true,
// // //             'seenOnboarding': true,
// // //             'accountType': 'Admin',
// // //           });

// // //           navigateToHome('Admin');
// // //           return;
// // //         } else {
// // //           throw Exception("User not found in Firestore");
// // //         }
// // //       }

// // //       String accountType = userDoc['accountType'] ?? 'User';

// // //       // 🔹 Save login state
// // //       await loginController.setSharedPrefData({
// // //         'email': emailController.text.trim(),
// // //         'password': passwordController.text.trim(),
// // //         'loginFlag': true,
// // //         'seenOnboarding': true,
// // //         'accountType': accountType,
// // //       });

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Login successful",
// // //         bgColor: Colors.green,
// // //       );

// // //       // 🔀 Navigate to home
// // //       navigateToHome(accountType);
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Login failed",
// // //         bgColor: Colors.red,
// // //       );
// // //     } catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Error: $e",
// // //         bgColor: Colors.red,
// // //       );
// // //     }

// // //     setState(() => isLoading = false);
// // //   }

// // //   // ================= FORGOT PASSWORD =================
// // //   Future<void> handleForgotPassword() async {
// // //     if (emailController.text.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter your email first",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }
// // //     try {
// // //       await firebaseAuth.sendPasswordResetEmail(
// // //         email: emailController.text.trim(),
// // //       );
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Password reset email sent",
// // //         bgColor: Colors.green,
// // //       );
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Error",
// // //         bgColor: Colors.red,
// // //       );
// // //     }
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           SizedBox.expand(
// // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // //           ),
// // //           Center(
// // //             child: SingleChildScrollView(
// // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // //               child: Column(
// // //                 children: [
// // //                   const SizedBox(height: 60),
// // //                   const Text(
// // //                     "Welcome Back",
// // //                     style: TextStyle(
// // //                       fontSize: 34,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Colors.black87,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Container(
// // //                     padding: const EdgeInsets.all(24),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white.withOpacity(0.5),
// // //                       borderRadius: BorderRadius.circular(20),
// // //                     ),
// // //                     child: Column(
// // //                       children: [
// // //                         TextField(
// // //                           controller: emailController,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.email,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             hintText: "Email",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         TextField(
// // //                           controller: passwordController,
// // //                           obscureText: !isPasswordVisible,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.lock,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             suffixIcon: IconButton(
// // //                               icon: Icon(
// // //                                 isPasswordVisible
// // //                                     ? Icons.visibility
// // //                                     : Icons.visibility_off,
// // //                                 color: const Color(0xFF9B5F4D),
// // //                               ),
// // //                               onPressed: () {
// // //                                 setState(() {
// // //                                   isPasswordVisible = !isPasswordVisible;
// // //                                 });
// // //                               },
// // //                             ),
// // //                             hintText: "Password",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         GestureDetector(
// // //                           onTap: handleForgotPassword,
// // //                           child: const Align(
// // //                             alignment: Alignment.centerRight,
// // //                             child: Text(
// // //                               "Forgot Password?",
// // //                               style: TextStyle(
// // //                                 color: Color(0xFF9B5F4D),
// // //                                 fontWeight: FontWeight.w600,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 24),
// // //                         ElevatedButton(
// // //                           onPressed: isLoading ? null : handleLogin,
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: const Color(0xFF9B5F4D),
// // //                             padding: const EdgeInsets.symmetric(vertical: 12),
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(50),
// // //                             ),
// // //                           ),
// // //                           child: isLoading
// // //                               ? const CircularProgressIndicator(
// // //                                   color: Colors.white,
// // //                                 )
// // //                               : const Text(
// // //                                   "    Log In    ",
// // //                                   style: TextStyle(
// // //                                     fontSize: 22,
// // //                                     fontWeight: FontWeight.bold,
// // //                                     color: Colors.white,
// // //                                   ),
// // //                                 ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             const Text("Don't have an account? "),
// // //                             GestureDetector(
// // //                               onTap: () {
// // //                                 Navigator.pushReplacement(
// // //                                   context,
// // //                                   MaterialPageRoute(
// // //                                     builder: (_) => const SignUpPage(),
// // //                                   ),
// // //                                 );
// // //                               },
// // //                               child: const Text(
// // //                                 "Sign Up",
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF9B5F4D),
// // //                                   fontWeight: FontWeight.w700,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }









// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // import 'package:mentalwellapp/view/MobileVerificationPage.dart';
// // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // 👉 ADD YOUR MOBILE OTP PAGE IMPORT LATER
// // // // import 'package:mentalwellapp/view/MobileVerificationPage.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // //   final LoginController loginController = LoginController();

// // //   TextEditingController emailController = TextEditingController();
// // //   TextEditingController passwordController = TextEditingController();

// // //   bool isLoading = false;
// // //   bool isPasswordVisible = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     checkAutoLogin();
// // //   }

// // //   Future<void> checkAutoLogin() async {
// // //     await loginController.getSharedPrefData();
// // //     if (loginController.isLoggedIn) {
// // //       navigateToHome(loginController.accountType);
// // //     }
// // //   }

// // //   void navigateToHome(String? accountType) {
// // //     if (accountType == 'Admin') {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// // //       );
// // //     } else {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // //       );
// // //     }
// // //   }

// // //   // ================= LOGIN =================
// // //   Future<void> handleLogin() async {
// // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter email & password",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔹 1. Firebase login
// // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // //         email: emailController.text.trim(),
// // //         password: passwordController.text.trim(),
// // //       );

// // //       User user = userCred.user!;

// // //       // 🔒 2. EMAIL VERIFICATION CHECK (NEW)
// // //       if (!user.emailVerified) {
// // //         await firebaseAuth.signOut();

// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Please verify your email before logging in.",
// // //           bgColor: Colors.red,
// // //         );

// // //         setState(() => isLoading = false);
// // //         return;
// // //       }

// // //       // 🔹 3. Fetch user document
// // //       final userDoc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .get();

// // //       // 🔹 Admin fallback (unchanged)
// // //       if (!userDoc.exists) {
// // //         final adminDoc = await FirebaseFirestore.instance
// // //             .collection('admin')
// // //             .doc(user.uid)
// // //             .get();

// // //         if (adminDoc.exists) {
// // //           await loginController.setSharedPrefData({
// // //             'email': emailController.text.trim(),
// // //             'password': passwordController.text.trim(),
// // //             'loginFlag': true,
// // //             'seenOnboarding': true,
// // //             'accountType': 'Admin',
// // //           });

// // //           navigateToHome('Admin');
// // //           return;
// // //         } else {
// // //           throw Exception("User not found in Firestore");
// // //         }
// // //       }

// // //       // 📱 4. MOBILE VERIFICATION CHECK (NEW)
// // //       bool mobileVerified = userDoc['mobileVerified'] ?? false;
// // //       String accountType = userDoc['accountType'] ?? 'User';

// // //       // 🔹 Save login state
// // //       await loginController.setSharedPrefData({
// // //         'email': emailController.text.trim(),
// // //         'password': passwordController.text.trim(),
// // //         'loginFlag': true,
// // //         'seenOnboarding': true,
// // //         'accountType': accountType,
// // //       });

// // //       // 🔀 5. NAVIGATION BASED ON MOBILE VERIFICATION
// // //       if (!mobileVerified) {
// // //         // 👉 Replace this with your OTP page later
// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Please verify your mobile number",
// // //           bgColor: Colors.orange,
// // //         );

// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (_) => MobileVerificationPage(mobile: userDoc['mobile']),
// // //           ),
// // //         );
// // //       } else {
// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Login successful",
// // //           bgColor: Colors.green,
// // //         );
// // //         navigateToHome(accountType);
// // //       }
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Login failed",
// // //         bgColor: Colors.red,
// // //       );
// // //     } catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Error: $e",
// // //         bgColor: Colors.red,
// // //       );
// // //     }

// // //     setState(() => isLoading = false);
// // //   }

// // //   // ================= FORGOT PASSWORD =================
// // //   Future<void> handleForgotPassword() async {
// // //     if (emailController.text.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter your email first",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }
// // //     try {
// // //       await firebaseAuth.sendPasswordResetEmail(
// // //         email: emailController.text.trim(),
// // //       );
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Password reset email sent",
// // //         bgColor: Colors.green,
// // //       );
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Error",
// // //         bgColor: Colors.red,
// // //       );
// // //     }
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           SizedBox.expand(
// // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // //           ),
// // //           Center(
// // //             child: SingleChildScrollView(
// // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // //               child: Column(
// // //                 children: [
// // //                   const SizedBox(height: 60),
// // //                   const Text(
// // //                     "Welcome Back",
// // //                     style: TextStyle(
// // //                       fontSize: 34,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Colors.black87,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Container(
// // //                     padding: const EdgeInsets.all(24),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white.withOpacity(0.5),
// // //                       borderRadius: BorderRadius.circular(20),
// // //                     ),
// // //                     child: Column(
// // //                       children: [
// // //                         TextField(
// // //                           controller: emailController,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.email,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             hintText: "Email",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         TextField(
// // //                           controller: passwordController,
// // //                           obscureText: !isPasswordVisible,
// // //                           decoration: InputDecoration(
// // //                             prefixIcon: const Icon(
// // //                               Icons.lock,
// // //                               color: Color(0xFF9B5F4D),
// // //                             ),
// // //                             suffixIcon: IconButton(
// // //                               icon: Icon(
// // //                                 isPasswordVisible
// // //                                     ? Icons.visibility
// // //                                     : Icons.visibility_off,
// // //                                 color: const Color(0xFF9B5F4D),
// // //                               ),
// // //                               onPressed: () {
// // //                                 setState(() {
// // //                                   isPasswordVisible = !isPasswordVisible;
// // //                                 });
// // //                               },
// // //                             ),
// // //                             hintText: "Password",
// // //                             filled: true,
// // //                             fillColor: Colors.grey.shade100,
// // //                             border: OutlineInputBorder(
// // //                               borderRadius: BorderRadius.circular(24),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         GestureDetector(
// // //                           onTap: handleForgotPassword,
// // //                           child: const Align(
// // //                             alignment: Alignment.centerRight,
// // //                             child: Text(
// // //                               "Forgot Password?",
// // //                               style: TextStyle(
// // //                                 color: Color(0xFF9B5F4D),
// // //                                 fontWeight: FontWeight.w600,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 24),
// // //                         ElevatedButton(
// // //                           onPressed: isLoading ? null : handleLogin,
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: const Color(0xFF9B5F4D),
// // //                             padding: const EdgeInsets.symmetric(vertical: 12),
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(50),
// // //                             ),
// // //                           ),
// // //                           child: isLoading
// // //                               ? const CircularProgressIndicator(
// // //                                   color: Colors.white,
// // //                                 )
// // //                               : const Text(
// // //                                   "    Log In    ",
// // //                                   style: TextStyle(
// // //                                     fontSize: 22,
// // //                                     fontWeight: FontWeight.bold,
// // //                                     color: Colors.white,
// // //                                   ),
// // //                                 ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             const Text("Don't have an account? "),
// // //                             GestureDetector(
// // //                               onTap: () {
// // //                                 Navigator.pushReplacement(
// // //                                   context,
// // //                                   MaterialPageRoute(
// // //                                     builder: (_) => const SignUpPage(),
// // //                                   ),
// // //                                 );
// // //                               },
// // //                               child: const Text(
// // //                                 "Sign Up",
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF9B5F4D),
// // //                                   fontWeight: FontWeight.w700,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }









// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // class LoginPage extends StatefulWidget {
// // // //   const LoginPage({super.key});

// // // //   @override
// // // //   State<LoginPage> createState() => _LoginPageState();
// // // // }

// // // // class _LoginPageState extends State<LoginPage> {
// // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // //   final LoginController loginController = LoginController();

// // // //   TextEditingController emailController = TextEditingController();
// // // //   TextEditingController passwordController = TextEditingController();

// // // //   bool isLoading = false;
// // // //   bool isPasswordVisible = false; // ✅ ADDED

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     checkAutoLogin();
// // // //   }

// // // //   Future<void> checkAutoLogin() async {
// // // //     await loginController.getSharedPrefData();
// // // //     if (loginController.isLoggedIn) {
// // // //       navigateToHome(loginController.accountType);
// // // //     }
// // // //   }

// // // //   void navigateToHome(String? accountType) {
// // // //     if (accountType == 'Admin') {
// // // //       Navigator.pushReplacement(
// // // //         context,
// // // //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// // // //       );
// // // //     } else {
// // // //       Navigator.pushReplacement(
// // // //         context,
// // // //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // // //       );
// // // //     }
// // // //   }

// // // //   Future<void> handleLogin() async {
// // // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Enter email & password",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //       return;
// // // //     }

// // // //     setState(() => isLoading = true);

// // // //     try {
// // // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // // //         email: emailController.text.trim(),
// // // //         password: passwordController.text.trim(),
// // // //       );

// // // //       final uid = userCred.user!.uid;
// // // //       String accountType = '';

// // // //       final userDoc = await FirebaseFirestore.instance
// // // //           .collection('users')
// // // //           .doc(uid)
// // // //           .get();

// // // //       if (userDoc.exists) {
// // // //         accountType = userDoc['accountType'] ?? 'User';
// // // //       } else {
// // // //         final adminDoc = await FirebaseFirestore.instance
// // // //             .collection('admin')
// // // //             .doc(uid)
// // // //             .get();
// // // //         if (adminDoc.exists) {
// // // //           accountType = adminDoc['accountType'] ?? 'Admin';
// // // //         } else {
// // // //           throw Exception("User not found in Firestore");
// // // //         }
// // // //       }

// // // //       await loginController.setSharedPrefData({
// // // //         'email': emailController.text.trim(),
// // // //         'password': passwordController.text.trim(),
// // // //         'loginFlag': true,
// // // //         'seenOnboarding': true,
// // // //         'accountType': accountType,
// // // //       });

// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Login successful",
// // // //         bgColor: Colors.green,
// // // //       );

// // // //       navigateToHome(accountType);
// // // //     } on FirebaseAuthException catch (e) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         e.message ?? "Login failed",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //     } catch (e) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Error: $e",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //     }

// // // //     setState(() => isLoading = false);
// // // //   }

// // // //   Future<void> handleForgotPassword() async {
// // // //     if (emailController.text.isEmpty) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Enter your email first",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //       return;
// // // //     }
// // // //     try {
// // // //       await firebaseAuth.sendPasswordResetEmail(
// // // //         email: emailController.text.trim(),
// // // //       );
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Password reset email sent",
// // // //         bgColor: Colors.green,
// // // //       );
// // // //     } on FirebaseAuthException catch (e) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         e.message ?? "Error",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Stack(
// // // //         children: [
// // // //           SizedBox.expand(
// // // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // // //           ),
// // // //           Center(
// // // //             child: SingleChildScrollView(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // //               child: Column(
// // // //                 children: [
// // // //                   const SizedBox(height: 60),
// // // //                   const Text(
// // // //                     "Welcome Back",
// // // //                     style: TextStyle(
// // // //                       fontSize: 34,
// // // //                       fontWeight: FontWeight.w700,
// // // //                       color: Colors.black87,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 20),
// // // //                   Container(
// // // //                     padding: const EdgeInsets.all(24),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.white.withOpacity(0.5),
// // // //                       borderRadius: BorderRadius.circular(20),
// // // //                     ),
// // // //                     child: Column(
// // // //                       children: [
// // // //                         TextField(
// // // //                           controller: emailController,
// // // //                           decoration: InputDecoration(
// // // //                             prefixIcon: const Icon(
// // // //                               Icons.email,
// // // //                               color: Color(0xFF9B5F4D),
// // // //                             ),
// // // //                             hintText: "Email",
// // // //                             filled: true,
// // // //                             fillColor: Colors.grey.shade100,
// // // //                             border: OutlineInputBorder(
// // // //                               borderRadius: BorderRadius.circular(24),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 16),
// // // //                         TextField(
// // // //                           controller: passwordController,
// // // //                           obscureText: !isPasswordVisible, // ✅ UPDATED
// // // //                           decoration: InputDecoration(
// // // //                             prefixIcon: const Icon(
// // // //                               Icons.lock,
// // // //                               color: Color(0xFF9B5F4D),
// // // //                             ),
// // // //                             suffixIcon: IconButton(
// // // //                               // ✅ ADDED
// // // //                               icon: Icon(
// // // //                                 isPasswordVisible
// // // //                                     ? Icons.visibility
// // // //                                     : Icons.visibility_off,
// // // //                                 color: Color(0xFF9B5F4D),
// // // //                               ),
// // // //                               onPressed: () {
// // // //                                 setState(() {
// // // //                                   isPasswordVisible = !isPasswordVisible;
// // // //                                 });
// // // //                               },
// // // //                             ),
// // // //                             hintText: "Password",
// // // //                             filled: true,
// // // //                             fillColor: Colors.grey.shade100,
// // // //                             border: OutlineInputBorder(
// // // //                               borderRadius: BorderRadius.circular(24),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 16),
// // // //                         GestureDetector(
// // // //                           onTap: handleForgotPassword,
// // // //                           child: const Align(
// // // //                             alignment: Alignment.centerRight,
// // // //                             child: Text(
// // // //                               "Forgot Password?",
// // // //                               style: TextStyle(
// // // //                                 color: Color(0xFF9B5F4D),
// // // //                                 fontWeight: FontWeight.w600,
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 24),
// // // //                         ElevatedButton(
// // // //                           onPressed: isLoading ? null : handleLogin,
// // // //                           style: ElevatedButton.styleFrom(
// // // //                             backgroundColor: const Color(0xFF9B5F4D),
// // // //                             padding: const EdgeInsets.symmetric(vertical: 12),
// // // //                             shape: RoundedRectangleBorder(
// // // //                               borderRadius: BorderRadius.circular(50),
// // // //                             ),
// // // //                           ),
// // // //                           child: isLoading
// // // //                               ? const CircularProgressIndicator(
// // // //                                   color: Colors.white,
// // // //                                 )
// // // //                               : const Text(
// // // //                                   "    Log In    ",
// // // //                                   style: TextStyle(
// // // //                                     fontSize: 22,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                     color: Colors.white,
// // // //                                   ),
// // // //                                 ),
// // // //                         ),
// // // //                         const SizedBox(height: 16),
// // // //                         Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                           children: [
// // // //                             const Text("Don't have an account? "),
// // // //                             GestureDetector(
// // // //                               onTap: () {
// // // //                                 Navigator.pushReplacement(
// // // //                                   context,
// // // //                                   MaterialPageRoute(
// // // //                                     builder: (_) => const SignUpPage(),
// // // //                                   ),
// // // //                                 );
// // // //                               },
// // // //                               child: const Text(
// // // //                                 "Sign Up",
// // // //                                 style: TextStyle(
// // // //                                   color: Color(0xFF9B5F4D),
// // // //                                   fontWeight: FontWeight.w700,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }





// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // class LoginPage extends StatefulWidget {
// // // // //   const LoginPage({super.key});

// // // // //   @override
// // // // //   State<LoginPage> createState() => _LoginPageState();
// // // // // }

// // // // // class _LoginPageState extends State<LoginPage> {
// // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // //   final LoginController loginController = LoginController();

// // // // //   TextEditingController emailController = TextEditingController();
// // // // //   TextEditingController passwordController = TextEditingController();

// // // // //   bool isLoading = false;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     checkAutoLogin();
// // // // //   }

// // // // //   // Check if user already logged in
// // // // //   Future<void> checkAutoLogin() async {
// // // // //     await loginController.getSharedPrefData();
// // // // //     if (loginController.isLoggedIn) {
// // // // //       navigateToHome(loginController.accountType);
// // // // //     }
// // // // //   }

// // // // //   // Navigate based on account type
// // // // //   void navigateToHome(String? accountType) {
// // // // //     if (accountType == 'Admin') {
// // // // //       Navigator.pushReplacement(
// // // // //         context,
// // // // //         MaterialPageRoute(builder: (_) => const AdminHomePage(username: '')),
// // // // //       );
// // // // //     } else {
// // // // //       Navigator.pushReplacement(
// // // // //         context,
// // // // //         MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // // // //       );
// // // // //     }
// // // // //   }

// // // // //   // ✅ Updated handleLogin() with Firestore accountType detection
// // // // //   Future<void> handleLogin() async {
// // // // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Enter email & password",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     setState(() => isLoading = true);

// // // // //     try {
// // // // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // // // //         email: emailController.text.trim(),
// // // // //         password: passwordController.text.trim(),
// // // // //       );

// // // // //       final uid = userCred.user!.uid;
// // // // //       String accountType = '';

// // // // //       // 🔹 Check 'users' collection first
// // // // //       final userDoc = await FirebaseFirestore.instance
// // // // //           .collection('users')
// // // // //           .doc(uid)
// // // // //           .get();

// // // // //       if (userDoc.exists) {
// // // // //         accountType = userDoc['accountType'] ?? 'User';
// // // // //       } else {
// // // // //         // 🔹 If not found, check 'admin' collection
// // // // //         final adminDoc = await FirebaseFirestore.instance
// // // // //             .collection('admin')
// // // // //             .doc(uid)
// // // // //             .get();
// // // // //         if (adminDoc.exists) {
// // // // //           accountType = adminDoc['accountType'] ?? 'Admin';
// // // // //         } else {
// // // // //           throw Exception("User not found in Firestore");
// // // // //         }
// // // // //       }

// // // // //       // ✅ Save login info locally
// // // // //       await loginController.setSharedPrefData({
// // // // //         'email': emailController.text.trim(),
// // // // //         'password': passwordController.text.trim(),
// // // // //         'loginFlag': true,
// // // // //         'seenOnboarding': true,
// // // // //         'accountType': accountType,
// // // // //       });

// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Login successful",
// // // // //         bgColor: Colors.green,
// // // // //       );

// // // // //       navigateToHome(accountType);
// // // // //     } on FirebaseAuthException catch (e) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         e.message ?? "Login failed",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //     } catch (e) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Error: $e",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //     }

// // // // //     setState(() => isLoading = false);
// // // // //   }

// // // // //   Future<void> handleForgotPassword() async {
// // // // //     if (emailController.text.isEmpty) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Enter your email first",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //       return;
// // // // //     }
// // // // //     try {
// // // // //       await firebaseAuth.sendPasswordResetEmail(
// // // // //         email: emailController.text.trim(),
// // // // //       );
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Password reset email sent",
// // // // //         bgColor: Colors.green,
// // // // //       );
// // // // //     } on FirebaseAuthException catch (e) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         e.message ?? "Error",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Stack(
// // // // //         children: [
// // // // //           SizedBox.expand(
// // // // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // // // //           ),
// // // // //           Center(
// // // // //             child: SingleChildScrollView(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // //               child: Column(
// // // // //                 children: [
// // // // //                   const SizedBox(height: 60),
// // // // //                   const Text(
// // // // //                     "Welcome Back",
// // // // //                     style: TextStyle(
// // // // //                       fontSize: 34,
// // // // //                       fontWeight: FontWeight.w700,
// // // // //                       color: Colors.black87,
// // // // //                     ),
// // // // //                   ),
// // // // //                   const SizedBox(height: 20),
// // // // //                   Container(
// // // // //                     padding: const EdgeInsets.all(24),
// // // // //                     decoration: BoxDecoration(
// // // // //                       color: Colors.white.withOpacity(0.5),
// // // // //                       borderRadius: BorderRadius.circular(20),
// // // // //                     ),
// // // // //                     child: Column(
// // // // //                       children: [
// // // // //                         TextField(
// // // // //                           controller: emailController,
// // // // //                           decoration: InputDecoration(
// // // // //                             prefixIcon: const Icon(
// // // // //                               Icons.email,
// // // // //                               color: Color(0xFF9B5F4D),
// // // // //                             ),
// // // // //                             hintText: "Email",
// // // // //                             filled: true,
// // // // //                             fillColor: Colors.grey.shade100,
// // // // //                             border: OutlineInputBorder(
// // // // //                               borderRadius: BorderRadius.circular(24),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 16),
// // // // //                         TextField(
// // // // //                           controller: passwordController,
// // // // //                           obscureText: true,
// // // // //                           decoration: InputDecoration(
// // // // //                             prefixIcon: const Icon(
// // // // //                               Icons.lock,
// // // // //                               color: Color(0xFF9B5F4D),
// // // // //                             ),
// // // // //                             hintText: "Password",
// // // // //                             filled: true,
// // // // //                             fillColor: Colors.grey.shade100,
// // // // //                             border: OutlineInputBorder(
// // // // //                               borderRadius: BorderRadius.circular(24),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 16),
// // // // //                         GestureDetector(
// // // // //                           onTap: handleForgotPassword,
// // // // //                           child: const Align(
// // // // //                             alignment: Alignment.centerRight,
// // // // //                             child: Text(
// // // // //                               "Forgot Password?",
// // // // //                               style: TextStyle(
// // // // //                                 color: Color(0xFF9B5F4D),
// // // // //                                 fontWeight: FontWeight.w600,
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 24),
// // // // //                         ElevatedButton(
// // // // //                           onPressed: isLoading ? null : handleLogin,
// // // // //                           style: ElevatedButton.styleFrom(
// // // // //                             backgroundColor: const Color(0xFF9B5F4D),
// // // // //                             padding: const EdgeInsets.symmetric(vertical: 12),
// // // // //                             shape: RoundedRectangleBorder(
// // // // //                               borderRadius: BorderRadius.circular(50),
// // // // //                             ),
// // // // //                           ),
// // // // //                           child: isLoading
// // // // //                               ? const CircularProgressIndicator(
// // // // //                                   color: Colors.white,
// // // // //                                 )
// // // // //                               : const Text(
// // // // //                                   "    Log In    ",
// // // // //                                   style: TextStyle(
// // // // //                                     fontSize: 22,
// // // // //                                     fontWeight: FontWeight.bold,
// // // // //                                     color: Colors.white,
// // // // //                                   ),
// // // // //                                 ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 16),
// // // // //                         Row(
// // // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // // //                           children: [
// // // // //                             const Text("Don't have an account? "),
// // // // //                             GestureDetector(
// // // // //                               onTap: () {
// // // // //                                 Navigator.pushReplacement(
// // // // //                                   context,
// // // // //                                   MaterialPageRoute(
// // // // //                                     builder: (_) => const SignUpPage(),
// // // // //                                   ),
// // // // //                                 );
// // // // //                               },
// // // // //                               child: const Text(
// // // // //                                 "Sign Up",
// // // // //                                 style: TextStyle(
// // // // //                                   color: Color(0xFF9B5F4D),
// // // // //                                   fontWeight: FontWeight.w700,
// // // // //                                 ),
// // // // //                               ),
// // // // //                             ),
// // // // //                           ],
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }






















// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // // // // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // // // class LoginPage extends StatefulWidget {
// // // // // // //   const LoginPage({super.key});

// // // // // // //   @override
// // // // // // //   State<LoginPage> createState() => _LoginPageState();
// // // // // // // }

// // // // // // // class _LoginPageState extends State<LoginPage> {
// // // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // // //   final LoginController loginController = LoginController();

// // // // // // //   TextEditingController emailController = TextEditingController();
// // // // // // //   TextEditingController passwordController = TextEditingController();

// // // // // // //   bool isLoading = false;

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     checkAutoLogin();
// // // // // // //   }

// // // // // // //   // Check if user already logged in
// // // // // // //   Future<void> checkAutoLogin() async {
// // // // // // //     await loginController.getSharedPrefData();
// // // // // // //     if (loginController.isLoggedIn) {
// // // // // // //       navigateToHome(loginController.accountType);
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // Navigate based on account type
// // // // // // //   void navigateToHome(String? accountType) {
// // // // // // //     if (accountType == 'Admin') {
// // // // // // //       Navigator.pushReplacement(
// // // // // // //           context, MaterialPageRoute(builder: (_) => const AdminHomePage(username: '',)));
// // // // // // //     } else {
// // // // // // //       Navigator.pushReplacement(
// // // // // // //           context, MaterialPageRoute(builder: (_) => const UserHomePage(username: '',)));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> handleLogin() async {
// // // // // // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // // // // // //       Snackbarscreen()
// // // // // // //           .showCustomSnackBar(context, "Enter email & password", bgColor: Colors.red);
// // // // // // //       return;
// // // // // // //     }

// // // // // // //     setState(() => isLoading = true);

// // // // // // //     try {
// // // // // // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // // // // // //           email: emailController.text.trim(),
// // // // // // //           password: passwordController.text.trim());

// // // // // // //       // Get account type from Firestore
// // // // // // //       final doc = await firebaseAuth.currentUser!.reload();
// // // // // // //       // Ideally, fetch accountType from Firestore 'users' or 'admin' collection
// // // // // // //       // For simplicity, using a placeholder here (update as per your Firestore)
// // // // // // //       String accountType = 'User'; // Replace with actual fetch logic

// // // // // // //       // Save login info in SharedPreferences
// // // // // // //       await loginController.setSharedPrefData({
// // // // // // //         'email': emailController.text.trim(),
// // // // // // //         'password': passwordController.text.trim(),
// // // // // // //         'loginFlag': true,
// // // // // // //         'seenOnboarding': true,
// // // // // // //         'accountType': accountType,
// // // // // // //       });

// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //           context, "Login successful", bgColor: Colors.green);

// // // // // // //       navigateToHome(accountType);

// // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //           context, e.message ?? "Login failed", bgColor: Colors.red);
// // // // // // //     }

// // // // // // //     setState(() => isLoading = false);
// // // // // // //   }

// // // // // // //   Future<void> handleForgotPassword() async {
// // // // // // //     if (emailController.text.isEmpty) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //           context, "Enter your email first", bgColor: Colors.red);
// // // // // // //       return;
// // // // // // //     }
// // // // // // //     try {
// // // // // // //       await firebaseAuth.sendPasswordResetEmail(email: emailController.text.trim());
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //           context, "Password reset email sent", bgColor: Colors.green);
// // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //           context, e.message ?? "Error", bgColor: Colors.red);
// // // // // // //     }
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       body: Stack(
// // // // // // //         children: [
// // // // // // //           SizedBox.expand(
// // // // // // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // // // // // //           ),
// // // // // // //           Center(
// // // // // // //             child: SingleChildScrollView(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // // //               child: Column(
// // // // // // //                 children: [
// // // // // // //                   const SizedBox(height: 60),
// // // // // // //                   const Text("Welcome Back",
// // // // // // //                       style: TextStyle(
// // // // // // //                           fontSize: 34,
// // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // //                           color: Colors.black87)),
// // // // // // //                   const SizedBox(height: 20),
// // // // // // //                   Container(
// // // // // // //                     padding: const EdgeInsets.all(24),
// // // // // // //                     decoration: BoxDecoration(
// // // // // // //                         color: Colors.white.withOpacity(0.2),
// // // // // // //                         borderRadius: BorderRadius.circular(20)),
// // // // // // //                     child: Column(
// // // // // // //                       children: [
// // // // // // //                         TextField(
// // // // // // //                           controller: emailController,
// // // // // // //                           decoration: InputDecoration(
// // // // // // //                             prefixIcon: const Icon(Icons.email, color: Color(0xFF9B5F4D)),
// // // // // // //                             hintText: "Email",
// // // // // // //                             filled: true,
// // // // // // //                             fillColor: Colors.grey.shade100,
// // // // // // //                             border: OutlineInputBorder(
// // // // // // //                                 borderRadius: BorderRadius.circular(24)),
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         const SizedBox(height: 16),
// // // // // // //                         TextField(
// // // // // // //                           controller: passwordController,
// // // // // // //                           obscureText: true,
// // // // // // //                           decoration: InputDecoration(
// // // // // // //                             prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // // // // // //                             hintText: "Password",
// // // // // // //                             filled: true,
// // // // // // //                             fillColor: Colors.grey.shade100,
// // // // // // //                             border: OutlineInputBorder(
// // // // // // //                                 borderRadius: BorderRadius.circular(24)),
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         const SizedBox(height: 16),
// // // // // // //                         GestureDetector(
// // // // // // //                           onTap: handleForgotPassword,
// // // // // // //                           child: const Align(
// // // // // // //                               alignment: Alignment.centerRight,
// // // // // // //                               child: Text("Forgot Password?",
// // // // // // //                                   style: TextStyle(
// // // // // // //                                       color: Color(0xFF9B5F4D),
// // // // // // //                                       fontWeight: FontWeight.w600))),
// // // // // // //                         ),
// // // // // // //                         const SizedBox(height: 24),
// // // // // // //                         ElevatedButton(
// // // // // // //                             onPressed: isLoading ? null : handleLogin,
// // // // // // //                             style: ElevatedButton.styleFrom(
// // // // // // //                                 backgroundColor: Color(0xFF9B5F4D),
// // // // // // //                                 padding: const EdgeInsets.symmetric(vertical: 12),
// // // // // // //                                 shape: RoundedRectangleBorder(
// // // // // // //                                     borderRadius: BorderRadius.circular(50))),
// // // // // // //                             child: isLoading
// // // // // // //                                 ? const CircularProgressIndicator(
// // // // // // //                                     color: Colors.white)
// // // // // // //                                 : const Text("Log In",
// // // // // // //                                     style: TextStyle(
// // // // // // //                                         fontSize: 22, fontWeight: FontWeight.bold))),
// // // // // // //                         const SizedBox(height: 16),
// // // // // // //                         Row(
// // // // // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                           children: [
// // // // // // //                             const Text("Don't have an account? "),
// // // // // // //                             GestureDetector(
// // // // // // //                               onTap: () {
// // // // // // //                                 Navigator.pushReplacement(
// // // // // // //                                     context,
// // // // // // //                                     MaterialPageRoute(
// // // // // // //                                         builder: (_) => const SignUpPage()));
// // // // // // //                               },
// // // // // // //                               child: const Text(
// // // // // // //                                 "Sign Up",
// // // // // // //                                 style: TextStyle(
// // // // // // //                                     color: Color(0xFF9B5F4D),
// // // // // // //                                     fontWeight: FontWeight.w700),
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                           ],
// // // // // // //                         ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                   )
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           )
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // // // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // // class LoginPage extends StatefulWidget {
// // // // // //   const LoginPage({super.key});

// // // // // //   @override
// // // // // //   State<LoginPage> createState() => _LoginPageState();
// // // // // // }

// // // // // // class _LoginPageState extends State<LoginPage> {
// // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // //   final LoginController loginController = LoginController();

// // // // // //   TextEditingController emailController = TextEditingController();
// // // // // //   TextEditingController passwordController = TextEditingController();

// // // // // //   bool isLoading = false;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     checkAutoLogin();
// // // // // //   }

// // // // // //   // Check if user already logged in
// // // // // //   Future<void> checkAutoLogin() async {
// // // // // //     await loginController.getSharedPrefData();
// // // // // //     if (loginController.isLoggedIn) {
// // // // // //       navigateToHome(loginController.accountType);
// // // // // //     }
// // // // // //   }

// // // // // //   // Navigate based on account type
// // // // // //   void navigateToHome(String? accountType) {
// // // // // //     if (accountType == 'Admin') {
// // // // // //       Navigator.pushReplacement(
// // // // // //           context, MaterialPageRoute(builder: (_) => const AdminHomePage(username: '',)));
// // // // // //     } else {
// // // // // //       Navigator.pushReplacement(
// // // // // //           context, MaterialPageRoute(builder: (_) => const UserHomeWrapper(username: '',)));
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> handleLogin() async {
// // // // // //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// // // // // //       Snackbarscreen()
// // // // // //           .showCustomSnackBar(context, "Enter email & password", bgColor: Colors.red);
// // // // // //       return;
// // // // // //     }

// // // // // //     setState(() => isLoading = true);

// // // // // //     try {
// // // // // //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// // // // // //           email: emailController.text.trim(),
// // // // // //           password: passwordController.text.trim());

// // // // // //       // Get account type from Firestore
// // // // // //       // final doc = await firebaseAuth.currentUser!.reload(); // Removed unnecessary reload
// // // // // //       // Ideally, fetch accountType from Firestore 'users' or 'admin' collection
// // // // // //       // For simplicity, using a placeholder here (update as per your Firestore)
// // // // // //       String accountType = 'User'; // Replace with actual fetch logic

// // // // // //       // Save login info in SharedPreferences
// // // // // //       await loginController.setSharedPrefData({
// // // // // //         'email': emailController.text.trim(),
// // // // // //         'password': passwordController.text.trim(),
// // // // // //         'loginFlag': true,
// // // // // //         'seenOnboarding': true,
// // // // // //         'accountType': accountType,
// // // // // //       });

// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //           context, "Login successful", bgColor: Colors.green);

// // // // // //       navigateToHome(accountType);

// // // // // //     } on FirebaseAuthException catch (e) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //           context, e.message ?? "Login failed", bgColor: Colors.red);
// // // // // //     }

// // // // // //     setState(() => isLoading = false);
// // // // // //   }

// // // // // //   Future<void> handleForgotPassword() async {
// // // // // //     if (emailController.text.isEmpty) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //           context, "Enter your email first", bgColor: Colors.red);
// // // // // //       return;
// // // // // //     }
// // // // // //     try {
// // // // // //       await firebaseAuth.sendPasswordResetEmail(email: emailController.text.trim());
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //           context, "Password reset email sent", bgColor: Colors.green);
// // // // // //     } on FirebaseAuthException catch (e) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //           context, e.message ?? "Error", bgColor: Colors.red);
// // // // // //     }
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: Stack(
// // // // // //         children: [
// // // // // //           SizedBox.expand(
// // // // // //             child: Image.asset("assets/loginbackground.png", fit: BoxFit.cover),
// // // // // //           ),
// // // // // //           Center(
// // // // // //             child: SingleChildScrollView(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // //               child: Column(
// // // // // //                 children: [
// // // // // //                   const SizedBox(height: 60),
// // // // // //                   const Text("Welcome Back",
// // // // // //                       style: TextStyle(
// // // // // //                           fontSize: 34,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                           color: Colors.black87)),
// // // // // //                   const SizedBox(height: 20),
// // // // // //                   Container(
// // // // // //                     padding: const EdgeInsets.all(24),
// // // // // //                     decoration: BoxDecoration(
// // // // // //                         // *** MODIFICATION: Increased opacity for better readability ***
// // // // // //                         color: Colors.white.withOpacity(0.5), // Changed from 0.2 to 0.9
// // // // // //                         borderRadius: BorderRadius.circular(20)),
// // // // // //                     child: Column(
// // // // // //                       children: [
// // // // // //                         TextField(
// // // // // //                           controller: emailController,
// // // // // //                           decoration: InputDecoration(
// // // // // //                             prefixIcon: const Icon(Icons.email, color: Color(0xFF9B5F4D)),
// // // // // //                             hintText: "Email",
// // // // // //                             filled: true,
// // // // // //                             // Kept as light color for contrast
// // // // // //                             fillColor: Colors.grey.shade100,
// // // // // //                             border: OutlineInputBorder(
// // // // // //                                 borderRadius: BorderRadius.circular(24)),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 16),
// // // // // //                         TextField(
// // // // // //                           controller: passwordController,
// // // // // //                           obscureText: true,
// // // // // //                           decoration: InputDecoration(
// // // // // //                             prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // // // // //                             hintText: "Password",
// // // // // //                             filled: true,
// // // // // //                             // Kept as light color for contrast
// // // // // //                             fillColor: Colors.grey.shade100,
// // // // // //                             border: OutlineInputBorder(
// // // // // //                                 borderRadius: BorderRadius.circular(24)),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 16),
// // // // // //                         GestureDetector(
// // // // // //                           onTap: handleForgotPassword,
// // // // // //                           child: const Align(
// // // // // //                               alignment: Alignment.centerRight,
// // // // // //                               child: Text("Forgot Password?",
// // // // // //                                   style: TextStyle(
// // // // // //                                       color: Color(0xFF9B5F4D),
// // // // // //                                       fontWeight: FontWeight.w600))),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 24),
// // // // // //                         ElevatedButton(
// // // // // //                             onPressed: isLoading ? null : handleLogin,
// // // // // //                             style: ElevatedButton.styleFrom(
// // // // // //                                 backgroundColor: Color(0xFF9B5F4D),
// // // // // //                                 padding: const EdgeInsets.symmetric(vertical: 12),
// // // // // //                                 shape: RoundedRectangleBorder(
// // // // // //                                     borderRadius: BorderRadius.circular(50))),
// // // // // //                             child: isLoading
// // // // // //                                 ? const CircularProgressIndicator(
// // // // // //                                     color: Colors.white)
// // // // // //                                 : const Text("    Log In    ",
// // // // // //                                     style: TextStyle(
// // // // // //                                         fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))),
// // // // // //                         const SizedBox(height: 16),
// // // // // //                         Row(
// // // // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                           children: [
// // // // // //                             const Text("Don't have an account? "),
// // // // // //                             GestureDetector(
// // // // // //                               onTap: () {
// // // // // //                                 Navigator.pushReplacement(
// // // // // //                                     context,
// // // // // //                                     MaterialPageRoute(
// // // // // //                                         builder: (_) => const SignUpPage()));
// // // // // //                               },
// // // // // //                               child: const Text(
// // // // // //                                 "Sign Up",
// // // // // //                                 style: TextStyle(
// // // // // //                                     color: Color(0xFF9B5F4D),
// // // // // //                                     fontWeight: FontWeight.w700),
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   )
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           )
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
