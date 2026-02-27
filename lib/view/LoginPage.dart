// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // // import 'package:mentalwellapp/view/SignUpPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // import 'package:mentalwellapp/view/MobileVerificationPage.dart';

// // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // import 'package:mentalwellapp/utils/RateLimitService.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // //   final LoginController loginController = LoginController();

// // //   final TextEditingController emailController = TextEditingController();
// // //   final TextEditingController passwordController = TextEditingController();

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
// // //       navigateToHome(loginController.accountType, loginController.username);
// // //     }
// // //   }

// // //   void navigateToHome(String? accountType, [String? username]) {
// // //     if (accountType == 'Admin') {
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(
// // //           builder: (_) => AdminHomePage(username: username ?? ''),
// // //         ),
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
// // //     final email = emailController.text.trim().toLowerCase();
// // //     final password = passwordController.text.trim();

// // //     if (email.isEmpty || password.isEmpty) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Enter email & password",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     bool isLocked = await RateLimitService.isLocked(email);
// // //     if (isLocked) {
// // //       int remainingMinutes = await RateLimitService.getRemainingLockoutMinutes(
// // //         email,
// // //       );

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "🔒 Account locked! Try again in $remainingMinutes min",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔐 Firebase login
// // //       final userCred = await firebaseAuth.signInWithEmailAndPassword(
// // //         email: email,
// // //         password: password,
// // //       );

// // //       final user = userCred.user;
// // //       if (user == null) throw Exception("Login failed");

// // //       // 📄 Firestore fetch
// // //       final userDoc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .get();

// // //       if (!userDoc.exists) {
// // //         throw Exception("User not found in Firestore");
// // //       }

// // //       await user.reload();

// // //       final currentUser = firebaseAuth.currentUser;
// // //       if (currentUser == null) {
// // //         throw Exception("Session expired");
// // //       }

// // //       bool emailVerified = currentUser.emailVerified;
// // //       bool mobileVerified = userDoc['mobileVerified'] ?? false;

// // //       // 📧 EMAIL CHECK
// // //       if (!emailVerified) {
// // //         await firebaseAuth.signOut();
// // //         setState(() => isLoading = false);

// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "📧 Please verify your email first",
// // //           bgColor: Colors.orange,
// // //         );
// // //         return;
// // //       }

// // //       // 📱 MOBILE CHECK
// // //       if (!mobileVerified) {
// // //         setState(() => isLoading = false);

// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (_) => MobileVerificationPage(mobile: userDoc['mobile']),
// // //           ),
// // //         );
// // //         return;
// // //       }

// // //       // ✅ SAFE DATA
// // //       final String accountType = userDoc['accountType'] ?? 'User';
// // //       final String username = userDoc['name'] ?? '';

// // //       await RateLimitService.resetAttempts(email);

// // //       await loginController.setSharedPrefData({
// // //         'email': email,
// // //         'password': password,
// // //         'loginFlag': true,
// // //         'seenOnboarding': true,
// // //         'accountType': accountType,
// // //         'username': username,
// // //       });

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "✅ $accountType login successful",
// // //         bgColor: Colors.green,
// // //       );

// // //       if (accountType == 'Admin') {
// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => AdminHomePage(username: username)),
// // //         );
// // //       } else {
// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// // //         );
// // //       }
// // //     } on FirebaseAuthException catch (e) {
// // //       int attempts = await RateLimitService.recordFailedAttempt(email);
// // //       int maxAttempts = RateLimitService.getMaxAttempts();
// // //       int remaining = maxAttempts - attempts;

// // //       bool locked = attempts >= maxAttempts;

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         locked
// // //             ? "❌ Account locked for 15 mins"
// // //             : "❌ Invalid login\nAttempts left: $remaining",
// // //         bgColor: Colors.red,
// // //       );
// // //     } catch (e) {
// // //       await RateLimitService.recordFailedAttempt(email);

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "❌ Error: $e",
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
// // //                 } catch (e) {
// // //                   Snackbarscreen().showCustomSnackBar(
// // //                     context,
// // //                     "Error: $e",
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
// // //                             prefixIcon: const Icon(Icons.email),
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
// // //                             prefixIcon: const Icon(Icons.lock),
// // //                             suffixIcon: IconButton(
// // //                               icon: Icon(
// // //                                 isPasswordVisible
// // //                                     ? Icons.visibility
// // //                                     : Icons.visibility_off,
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
// // //                                   "Log In",
// // //                                   style: TextStyle(
// // //                                     fontSize: 20,
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
// // //                                   fontWeight: FontWeight.bold,
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

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// // import 'package:mentalwellapp/view/SignUpPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';
// // import 'package:mentalwellapp/utils/RateLimitService.dart';
// // import '../model/AccountTypeModelFull.dart'; // Import your model

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
// //       navigateToHome(loginController.accountType, loginController.username);
// //     }
// //   }

// //   void navigateToHome(String? accountType, [String? username]) {
// //     if (accountType == 'Admin') {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (_) => AdminHomePage(username: username ?? ''),
// //         ),
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

// //     final email = emailController.text.trim().toLowerCase();

// //     // 🔒 Check if account is locked due to rate limiting
// //     bool isLocked = await RateLimitService.isLocked(email);
// //     if (isLocked) {
// //       int remainingMinutes = await RateLimitService.getRemainingLockoutMinutes(
// //         email,
// //       );
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "🔒 Account locked! Too many failed login attempts.\nTry again in $remainingMinutes minute(s).",
// //         bgColor: Colors.red,
// //       );
// //       return;
// //     }

// //     setState(() => isLoading = true);

// //     try {
// //       // 🔹 Firebase login
// //       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
// //         email: email,
// //         password: passwordController.text.trim(),
// //       );

// //       User user = userCred.user!;
// //       String accountType = 'User';
// //       String username = '';

// //       // 🔹 Check 'users' collection
// //       final userDoc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(user.uid)
// //           .get();

// //       if (userDoc.exists) {
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

// //         // Read accountType and name
// //         accountType = userDoc['accountType'] ?? 'User';
// //         username = userDoc['name'] ?? '';

// //         // ✅ Reset rate limit on successful login
// //         await RateLimitService.resetAttempts(email);

// //         // Save login state
// //         await loginController.setSharedPrefData({
// //           'email': email,
// //           'password': passwordController.text.trim(),
// //           'loginFlag': true,
// //           'seenOnboarding': true,
// //           'accountType': accountType,
// //           'username': username,
// //         });

// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           "✅ $accountType login successful",
// //           bgColor: Colors.green,
// //         );

// //         // Navigate based on accountType
// //         if (accountType == 'Admin') {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //               builder: (_) => AdminHomePage(username: username),
// //             ),
// //           );
// //         } else {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// //           );
// //         }
// //       } else {
// //         throw Exception("User not found in Firestore");
// //       }
// //     } on FirebaseAuthException catch (e) {
// //       // 📊 Record failed attempt
// //       int attempts = await RateLimitService.recordFailedAttempt(email);
// //       int maxAttempts = RateLimitService.getMaxAttempts();
// //       int remaining = maxAttempts - attempts;

// //       String errorMessage = e.message ?? "Login failed";

// //       // Determine if account is now locked
// //       bool nowLocked = attempts > maxAttempts;

// //       if (nowLocked) {
// //         errorMessage =
// //             "❌ Account locked! You've exceeded the maximum login attempts.\nPlease try again in 15 minutes.";
// //       } else {
// //         errorMessage =
// //             "❌ Invalid credentials\n⚠️ Attempts remaining: $remaining/$maxAttempts\n(Account will lock after $maxAttempts failed attempts)";
// //       }

// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         errorMessage,
// //         bgColor: Colors.red,
// //       );
// //     } catch (e) {
// //       // 📊 Record failed attempt for unknown errors
// //       await RateLimitService.recordFailedAttempt(email);
// //       int attempts = await RateLimitService.getCurrentAttempts(email);
// //       int maxAttempts = RateLimitService.getMaxAttempts();
// //       int remaining = maxAttempts - attempts;

// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "❌ Error: $e\n⚠️ Attempts remaining: $remaining",
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
// import 'package:mentalwellapp/view/SignUpPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import 'package:mentalwellapp/utils/RateLimitService.dart';
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

//     final email = emailController.text.trim().toLowerCase();

//     bool isLocked = await RateLimitService.isLocked(email);
//     if (isLocked) {
//       int remainingMinutes = await RateLimitService.getRemainingLockoutMinutes(
//         email,
//       );
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "🔒 Account locked! Try again in $remainingMinutes minute(s).",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: passwordController.text.trim(),
//       );

//       User user = userCred.user!;
//       String accountType = 'User';
//       String username = '';

//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userDoc.exists) {
//         // ❌ REMOVED emailVerified check

//         accountType = userDoc['accountType'] ?? 'User';
//         username = userDoc['name'] ?? '';

//         await RateLimitService.resetAttempts(email);

//         await loginController.setSharedPrefData({
//           'email': email,
//           'password': passwordController.text.trim(),
//           'loginFlag': true,
//           'seenOnboarding': true,
//           'accountType': accountType,
//           'username': username,
//         });

//         Snackbarscreen().showCustomSnackBar(
//           context,
//           "✅ $accountType login successful",
//           bgColor: Colors.green,
//         );

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
//       int attempts = await RateLimitService.recordFailedAttempt(email);
//       int maxAttempts = RateLimitService.getMaxAttempts();
//       int remaining = maxAttempts - attempts;

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "❌ Invalid credentials\n⚠️ Attempts remaining: $remaining/$maxAttempts",
//         bgColor: Colors.red,
//       );
//     } catch (e) {
//       await RateLimitService.recordFailedAttempt(email);

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "❌ Error: $e",
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/controller/ActivityController.dart';
import 'package:mentalwellapp/view/ADMIN/AdminHomePage.dart';
import 'package:mentalwellapp/view/SignUpPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';
import 'package:mentalwellapp/controller/LoginController.dart';
import 'package:mentalwellapp/utils/RateLimitService.dart';
import '../model/AccountTypeModelFull.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final LoginController loginController = LoginController();
  final ActivityController activityController = ActivityController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    checkAutoLogin();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> checkAutoLogin() async {
    await loginController.getSharedPrefData();
    if (!mounted) return;

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

    bool isLocked = await RateLimitService.isLocked(email);
    if (isLocked) {
      int remainingMinutes = await RateLimitService.getRemainingLockoutMinutes(
        email,
      );
      Snackbarscreen().showCustomSnackBar(
        context,
        "🔒 Account locked! Try again in $remainingMinutes minute(s).",
        bgColor: Colors.red,
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      User user = userCred.user!;
      String accountType = 'User';
      String username = '';

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        accountType = userDoc['accountType'] ?? 'User';
        username = userDoc['name'] ?? '';

        await RateLimitService.resetAttempts(email);

        await loginController.setSharedPrefData({
          'email': email,
          'password': passwordController.text.trim(),
          'loginFlag': true,
          'seenOnboarding': true,
          'accountType': accountType,
          'username': username,
        });

        await activityController.logActivity(
          userId: user.uid,
          userName: username,
          action: "login",
        );

        if (!mounted) return;

        Snackbarscreen().showCustomSnackBar(
          context,
          "✅ $accountType login successful",
          bgColor: Colors.green,
        );

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
      int attempts = await RateLimitService.recordFailedAttempt(email);
      int maxAttempts = RateLimitService.getMaxAttempts();
      int remaining = maxAttempts - attempts;

      if (!mounted) return;

      Snackbarscreen().showCustomSnackBar(
        context,
        "❌ Invalid credentials\n⚠️ Attempts remaining: $remaining/$maxAttempts",
        bgColor: Colors.red,
      );
    } catch (e) {
      await RateLimitService.recordFailedAttempt(email);

      if (!mounted) return;

      Snackbarscreen().showCustomSnackBar(
        context,
        "❌ Error: $e",
        bgColor: Colors.red,
      );
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

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

                  if (!context.mounted) return;

                  Snackbarscreen().showCustomSnackBar(
                    context,
                    "Password reset email sent",
                    bgColor: Colors.green,
                  );
                  Navigator.pop(context);
                } on FirebaseAuthException catch (e) {
                  if (!context.mounted) return;

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
