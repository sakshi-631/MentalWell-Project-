

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // import 'package:mentalwellapp/view/SignUpPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';
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

// //   @override
// //   void initState() {
// //     super.initState();
// //     checkAutoLogin();
// //   }

// //   // Check if user already logged in
// //   Future<void> checkAutoLogin() async {
// //     await loginController.getSharedPrefData();
// //     if (loginController.isLoggedIn) {
// //       navigateToHome(loginController.accountType);
// //     }
// //   }

// //   // Navigate based on account type
// //   void navigateToHome(String? accountType) {
// //     if (accountType == 'Admin') {
// //       Navigator.pushReplacement(
// //           context, MaterialPageRoute(builder: (_) => const AdminHomePage(username: '',)));
// //     } else {
// //       Navigator.pushReplacement(
// //           context, MaterialPageRoute(builder: (_) => const UserHomePage(username: '',)));
// //     }
// //   }

// //   Future<void> handleLogin() async {
// //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// //       Snackbarscreen()
// //           .showCustomSnackBar(context, "Enter email & password", bgColor: Colors.red);
// //       return;
// //     }

// //     setState(() => isLoading = true);

// //     try {
// //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// //           email: emailController.text.trim(),
// //           password: passwordController.text.trim());

// //       // Get account type from Firestore
// //       final doc = await firebaseAuth.currentUser!.reload();
// //       // Ideally, fetch accountType from Firestore 'users' or 'admin' collection
// //       // For simplicity, using a placeholder here (update as per your Firestore)
// //       String accountType = 'User'; // Replace with actual fetch logic

// //       // Save login info in SharedPreferences
// //       await loginController.setSharedPrefData({
// //         'email': emailController.text.trim(),
// //         'password': passwordController.text.trim(),
// //         'loginFlag': true,
// //         'seenOnboarding': true,
// //         'accountType': accountType,
// //       });

// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Login successful", bgColor: Colors.green);

// //       navigateToHome(accountType);

// //     } on FirebaseAuthException catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //           context, e.message ?? "Login failed", bgColor: Colors.red);
// //     }

// //     setState(() => isLoading = false);
// //   }

// //   Future<void> handleForgotPassword() async {
// //     if (emailController.text.isEmpty) {
// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Enter your email first", bgColor: Colors.red);
// //       return;
// //     }
// //     try {
// //       await firebaseAuth.sendPasswordResetEmail(email: emailController.text.trim());
// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Password reset email sent", bgColor: Colors.green);
// //     } on FirebaseAuthException catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //           context, e.message ?? "Error", bgColor: Colors.red);
// //     }
// //   }

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
// //                   const Text("Welcome Back",
// //                       style: TextStyle(
// //                           fontSize: 34,
// //                           fontWeight: FontWeight.w700,
// //                           color: Colors.black87)),
// //                   const SizedBox(height: 20),
// //                   Container(
// //                     padding: const EdgeInsets.all(24),
// //                     decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.2),
// //                         borderRadius: BorderRadius.circular(20)),
// //                     child: Column(
// //                       children: [
// //                         TextField(
// //                           controller: emailController,
// //                           decoration: InputDecoration(
// //                             prefixIcon: const Icon(Icons.email, color: Color(0xFF9B5F4D)),
// //                             hintText: "Email",
// //                             filled: true,
// //                             fillColor: Colors.grey.shade100,
// //                             border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(24)),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         TextField(
// //                           controller: passwordController,
// //                           obscureText: true,
// //                           decoration: InputDecoration(
// //                             prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// //                             hintText: "Password",
// //                             filled: true,
// //                             fillColor: Colors.grey.shade100,
// //                             border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(24)),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         GestureDetector(
// //                           onTap: handleForgotPassword,
// //                           child: const Align(
// //                               alignment: Alignment.centerRight,
// //                               child: Text("Forgot Password?",
// //                                   style: TextStyle(
// //                                       color: Color(0xFF9B5F4D),
// //                                       fontWeight: FontWeight.w600))),
// //                         ),
// //                         const SizedBox(height: 24),
// //                         ElevatedButton(
// //                             onPressed: isLoading ? null : handleLogin,
// //                             style: ElevatedButton.styleFrom(
// //                                 backgroundColor: Color(0xFF9B5F4D),
// //                                 padding: const EdgeInsets.symmetric(vertical: 12),
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(50))),
// //                             child: isLoading
// //                                 ? const CircularProgressIndicator(
// //                                     color: Colors.white)
// //                                 : const Text("Log In",
// //                                     style: TextStyle(
// //                                         fontSize: 22, fontWeight: FontWeight.bold))),
// //                         const SizedBox(height: 16),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Text("Don't have an account? "),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 Navigator.pushReplacement(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (_) => const SignUpPage()));
// //                               },
// //                               child: const Text(
// //                                 "Sign Up",
// //                                 style: TextStyle(
// //                                     color: Color(0xFF9B5F4D),
// //                                     fontWeight: FontWeight.w700),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }


























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// import 'package:mentalwellapp/view/SignUpPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';

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

//   @override
//   void initState() {
//     super.initState();
//     checkAutoLogin();
//   }

//   // Check if user already logged in
//   Future<void> checkAutoLogin() async {
//     await loginController.getSharedPrefData();
//     if (loginController.isLoggedIn) {
//       navigateToHome(loginController.accountType);
//     }
//   }

//   // Navigate based on account type
//   void navigateToHome(String? accountType) {
//     if (accountType == 'Admin') {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => const AdminHomePage(username: '',)));
//     } else {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => const UserHomeWrapper(username: '',)));
//     }
//   }

//   Future<void> handleLogin() async {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       Snackbarscreen()
//           .showCustomSnackBar(context, "Enter email & password", bgColor: Colors.red);
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());

//       // Get account type from Firestore
//       // final doc = await firebaseAuth.currentUser!.reload(); // Removed unnecessary reload
//       // Ideally, fetch accountType from Firestore 'users' or 'admin' collection
//       // For simplicity, using a placeholder here (update as per your Firestore)
//       String accountType = 'User'; // Replace with actual fetch logic

//       // Save login info in SharedPreferences
//       await loginController.setSharedPrefData({
//         'email': emailController.text.trim(),
//         'password': passwordController.text.trim(),
//         'loginFlag': true,
//         'seenOnboarding': true,
//         'accountType': accountType,
//       });

//       Snackbarscreen().showCustomSnackBar(
//           context, "Login successful", bgColor: Colors.green);

//       navigateToHome(accountType);

//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//           context, e.message ?? "Login failed", bgColor: Colors.red);
//     }

//     setState(() => isLoading = false);
//   }

//   Future<void> handleForgotPassword() async {
//     if (emailController.text.isEmpty) {
//       Snackbarscreen().showCustomSnackBar(
//           context, "Enter your email first", bgColor: Colors.red);
//       return;
//     }
//     try {
//       await firebaseAuth.sendPasswordResetEmail(email: emailController.text.trim());
//       Snackbarscreen().showCustomSnackBar(
//           context, "Password reset email sent", bgColor: Colors.green);
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//           context, e.message ?? "Error", bgColor: Colors.red);
//     }
//   }

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
//                   const Text("Welcome Back",
//                       style: TextStyle(
//                           fontSize: 34,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black87)),
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                         // *** MODIFICATION: Increased opacity for better readability ***
//                         color: Colors.white.withOpacity(0.5), // Changed from 0.2 to 0.9
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.email, color: Color(0xFF9B5F4D)),
//                             hintText: "Email",
//                             filled: true,
//                             // Kept as light color for contrast
//                             fillColor: Colors.grey.shade100,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(24)),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextField(
//                           controller: passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
//                             hintText: "Password",
//                             filled: true,
//                             // Kept as light color for contrast
//                             fillColor: Colors.grey.shade100,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(24)),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         GestureDetector(
//                           onTap: handleForgotPassword,
//                           child: const Align(
//                               alignment: Alignment.centerRight,
//                               child: Text("Forgot Password?",
//                                   style: TextStyle(
//                                       color: Color(0xFF9B5F4D),
//                                       fontWeight: FontWeight.w600))),
//                         ),
//                         const SizedBox(height: 24),
//                         ElevatedButton(
//                             onPressed: isLoading ? null : handleLogin,
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF9B5F4D),
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(50))),
//                             child: isLoading
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white)
//                                 : const Text("    Log In    ",
//                                     style: TextStyle(
//                                         fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("Don't have an account? "),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => const SignUpPage()));
//                               },
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                     color: Color(0xFF9B5F4D),
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }











import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
import 'package:mentalwellapp/view/SignUpPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';
import 'package:mentalwellapp/controller/LoginController.dart';

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

  @override
  void initState() {
    super.initState();
    checkAutoLogin();
  }

  // Check if user already logged in
  Future<void> checkAutoLogin() async {
    await loginController.getSharedPrefData();
    if (loginController.isLoggedIn) {
      navigateToHome(loginController.accountType);
    }
  }

  // Navigate based on account type
  void navigateToHome(String? accountType) {
    if (accountType == 'Admin') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => const AdminHomePage(username: '')));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => const UserHomeWrapper(username: '')));
    }
  }

  // ✅ Updated handleLogin() with Firestore accountType detection
  Future<void> handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Snackbarscreen().showCustomSnackBar(
          context, "Enter email & password", bgColor: Colors.red);
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      final uid = userCred.user!.uid;
      String accountType = '';

      // 🔹 Check 'users' collection first
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        accountType = userDoc['accountType'] ?? 'User';
      } else {
        // 🔹 If not found, check 'admin' collection
        final adminDoc = await FirebaseFirestore.instance
            .collection('admin')
            .doc(uid)
            .get();
        if (adminDoc.exists) {
          accountType = adminDoc['accountType'] ?? 'Admin';
        } else {
          throw Exception("User not found in Firestore");
        }
      }

      // ✅ Save login info locally
      await loginController.setSharedPrefData({
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'loginFlag': true,
        'seenOnboarding': true,
        'accountType': accountType,
      });

      Snackbarscreen()
          .showCustomSnackBar(context, "Login successful", bgColor: Colors.green);

      navigateToHome(accountType);

    } on FirebaseAuthException catch (e) {
      Snackbarscreen().showCustomSnackBar(
          context, e.message ?? "Login failed", bgColor: Colors.red);
    } catch (e) {
      Snackbarscreen()
          .showCustomSnackBar(context, "Error: $e", bgColor: Colors.red);
    }

    setState(() => isLoading = false);
  }

  Future<void> handleForgotPassword() async {
    if (emailController.text.isEmpty) {
      Snackbarscreen().showCustomSnackBar(
          context, "Enter your email first", bgColor: Colors.red);
      return;
    }
    try {
      await firebaseAuth
          .sendPasswordResetEmail(email: emailController.text.trim());
      Snackbarscreen().showCustomSnackBar(
          context, "Password reset email sent", bgColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      Snackbarscreen()
          .showCustomSnackBar(context, e.message ?? "Error", bgColor: Colors.red);
    }
  }

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
                  const Text("Welcome Back",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87)),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.email, color: Color(0xFF9B5F4D)),
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: handleForgotPassword,
                          child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text("Forgot Password?",
                                  style: TextStyle(
                                      color: Color(0xFF9B5F4D),
                                      fontWeight: FontWeight.w600))),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                            onPressed: isLoading ? null : handleLogin,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9B5F4D),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("    Log In    ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
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
                                        builder: (_) => const SignUpPage()));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color(0xFF9B5F4D),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
