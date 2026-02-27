// // // import 'dart:async';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';

// // // class EmailVerificationPage extends StatefulWidget {
// // //   final String name;
// // //   final String email;
// // //   final String mobile;
// // //   final String address;
// // //   final DateTime dob;
// // //   final bool termsAccepted;

// // //   const EmailVerificationPage({
// // //     super.key,
// // //     required this.name,
// // //     required this.email,
// // //     required this.mobile,
// // //     required this.address,
// // //     required this.dob,
// // //     required this.termsAccepted,
// // //   });

// // //   @override
// // //   State<EmailVerificationPage> createState() => _EmailVerificationPageState();
// // // }

// // // class _EmailVerificationPageState extends State<EmailVerificationPage> {
// // //   final FirebaseAuth _auth = FirebaseAuth.instance;

// // //   bool isEmailVerified = false;
// // //   bool isLoading = false;
// // //   bool canResend = false;
// // //   bool isSaved = false; // 🔥 prevent duplicate save

// // //   Timer? timer;

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     User? user = _auth.currentUser;
// // //     isEmailVerified = user?.emailVerified ?? false;

// // //     // 🔁 Auto check every 3 seconds
// // //     if (!isEmailVerified) {
// // //       timer = Timer.periodic(
// // //         const Duration(seconds: 3),
// // //         (_) => checkEmailVerifiedAndSave(),
// // //       );
// // //     }

// // //     // ⏳ Enable resend after 10 sec
// // //     Future.delayed(const Duration(seconds: 10), () {
// // //       if (mounted) setState(() => canResend = true);
// // //     });
// // //   }

// // //   // ================= MAIN FUNCTION =================
// // //   Future<void> checkEmailVerifiedAndSave() async {
// // //     if (isSaved) return; // 🔥 prevent duplicate calls

// // //     setState(() => isLoading = true);

// // //     await _auth.currentUser?.reload();
// // //     User? user = _auth.currentUser;

// // //     if (user == null) return;

// // //     if (user != null && user.emailVerified) {
// // //       timer?.cancel();

// // //       final newUser = AccountTypeModelFull(
// // //         userId: user.uid,
// // //         name: widget.name,
// // //         email: widget.email,
// // //         mobile: widget.mobile,
// // //         address: widget.address,
// // //         dob: widget.dob.toString(),
// // //         profileImage: "",
// // //         accountType: "User",
// // //         termsAccepted: widget.termsAccepted, // ✅ FIXED
// // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // //         mobileVerified: false,
// // //         termsVersion: "v1.0",
// // //       );

// // //       try {
// // //         // ✅ Save main user
// // //         await SignupController().addData("users", user.uid, newUser.toMap());

// // //         // ✅ Save consent log
// // //         await SignupController().saveTermsAcceptance(user.uid);

// // //         // ✅ Save lightweight user_content
// // //         await SignupController().addData("user_content", user.uid, {
// // //           "userId": user.uid,
// // //           "name": widget.name,
// // //           "email": widget.email,
// // //           "createdAt": DateTime.now().toIso8601String(),
// // //         });

// // //         isSaved = true;

// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "✅ Email Verified & Data Saved!",
// // //           bgColor: Colors.green,
// // //         );

// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => const LoginPage()),
// // //         );
// // //       } catch (e) {
// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Error saving user data",
// // //           bgColor: Colors.red,
// // //         );
// // //       }
// // //     }

// // //     if (mounted) setState(() => isLoading = false);
// // //   }

// // //   // ================= RESEND =================
// // //   Future<void> resendEmail() async {
// // //     try {
// // //       await _auth.currentUser?.sendEmailVerification();

// // //       setState(() => canResend = false);

// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "📩 Verification email resent",
// // //         bgColor: Colors.green,
// // //       );

// // //       Future.delayed(const Duration(seconds: 10), () {
// // //         if (mounted) setState(() => canResend = true);
// // //       });
// // //     } catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Error sending email",
// // //         bgColor: Colors.red,
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     timer?.cancel();
// // //     super.dispose();
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: Center(
// // //         child: Padding(
// // //           padding: const EdgeInsets.symmetric(horizontal: 26),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               const Icon(Icons.email, size: 80, color: Color(0xFF9B5F4D)),
// // //               const SizedBox(height: 20),

// // //               const Text(
// // //                 "Verify Your Email",
// // //                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// // //               ),

// // //               const SizedBox(height: 12),

// // //               const Text(
// // //                 "We've sent a verification link to your email.\nPlease verify your account.",
// // //                 textAlign: TextAlign.center,
// // //                 style: TextStyle(fontSize: 14, color: Colors.grey),
// // //               ),

// // //               const SizedBox(height: 30),

// // //               // 🔘 Manual check button
// // //               ElevatedButton(
// // //                 onPressed: isLoading ? null : checkEmailVerifiedAndSave,
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: const Color(0xFF9B5F4D),
// // //                   padding: const EdgeInsets.symmetric(
// // //                     vertical: 12,
// // //                     horizontal: 30,
// // //                   ),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(50),
// // //                   ),
// // //                 ),
// // //                 child: isLoading
// // //                     ? const CircularProgressIndicator(color: Colors.white)
// // //                     : const Text(
// // //                         "I Verified",
// // //                         style: TextStyle(fontSize: 18, color: Colors.white),
// // //                       ),
// // //               ),

// // //               const SizedBox(height: 16),

// // //               // 🔁 Resend button
// // //               TextButton(
// // //                 onPressed: canResend ? resendEmail : null,
// // //                 child: Text(
// // //                   canResend
// // //                       ? "Resend Email"
// // //                       : "Resend available in few seconds...",
// // //                   style: TextStyle(
// // //                     color: canResend ? const Color(0xFF9B5F4D) : Colors.grey,
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //                 ),
// // //               ),

// // //               const SizedBox(height: 20),

// // //               const Text(
// // //                 "⚠️ Check spam folder if email not received.",
// // //                 style: TextStyle(fontSize: 12, color: Colors.grey),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:async';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/SignUpController.dart';
// // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';

// // class EmailVerificationPage extends StatefulWidget {
// //   final String name;
// //   final String email;
// //   final String mobile;
// //   final String address;
// //   final DateTime dob;
// //   final bool termsAccepted;

// //   const EmailVerificationPage({
// //     super.key,
// //     required this.name,
// //     required this.email,
// //     required this.mobile,
// //     required this.address,
// //     required this.dob,
// //     required this.termsAccepted,
// //   });

// //   @override
// //   State<EmailVerificationPage> createState() => _EmailVerificationPageState();
// // }

// // class _EmailVerificationPageState extends State<EmailVerificationPage> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   bool isLoading = false;
// //   bool canResend = false;
// //   bool isSaved = false;

// //   Timer? verifyTimer;
// //   Timer? countdownTimer;

// //   // ⏱ 15 minutes countdown (adjust if needed)
// //   int remainingSeconds = 15 * 60;
// //   bool isLinkExpired = false;

// //   @override
// //   void initState() {
// //     super.initState();

// //     startCountdown();

// //     // 🔁 Auto check every 3 seconds
// //     verifyTimer = Timer.periodic(
// //       const Duration(seconds: 3),
// //       (_) => checkEmailVerifiedAndSave(),
// //     );

// //     // ⏳ Enable resend after 10 sec
// //     Future.delayed(const Duration(seconds: 10), () {
// //       if (mounted) setState(() => canResend = true);
// //     });
// //   }

// //   // ================= COUNTDOWN =================
// //   void startCountdown() {
// //     remainingSeconds = 15 * 60;
// //     isLinkExpired = false;

// //     countdownTimer?.cancel();

// //     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       if (remainingSeconds <= 0) {
// //         timer.cancel();
// //         setState(() => isLinkExpired = true);
// //       } else {
// //         setState(() => remainingSeconds--);
// //       }
// //     });
// //   }

// //   String formatTime(int seconds) {
// //     int min = seconds ~/ 60;
// //     int sec = seconds % 60;
// //     return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
// //   }

// //   // ================= VERIFY =================
// //   Future<void> checkEmailVerifiedAndSave() async {
// //     if (isSaved) return;

// //     setState(() => isLoading = true);

// //     await _auth.currentUser?.reload();
// //     User? user = _auth.currentUser;

// //     if (user == null) return;

// //     if (user.emailVerified) {
// //       verifyTimer?.cancel();
// //       countdownTimer?.cancel();

// //       final newUser = AccountTypeModelFull(
// //         userId: user.uid,
// //         name: widget.name,
// //         email: widget.email,
// //         mobile: widget.mobile,
// //         address: widget.address,
// //         dob: widget.dob.toString(),
// //         profileImage: "",
// //         accountType: "User",
// //         termsAccepted: widget.termsAccepted,
// //         termsAcceptedAt: DateTime.now().toIso8601String(),
// //         mobileVerified: false,
// //         termsVersion: "v1.0",
// //       );

// //       try {
// //         await SignupController().addData("users", user.uid, newUser.toMap());
// //         await SignupController().saveTermsAcceptance(user.uid);

// //         await SignupController().addData("user_content", user.uid, {
// //           "userId": user.uid,
// //           "name": widget.name,
// //           "email": widget.email,
// //           "createdAt": DateTime.now().toIso8601String(),
// //         });

// //         isSaved = true;

// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           "✅ Email Verified & Data Saved!",
// //           bgColor: Colors.green,
// //         );

// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (_) => const LoginPage()),
// //         );
// //       } catch (e) {
// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           "Error saving user data",
// //           bgColor: Colors.red,
// //         );
// //       }
// //     }

// //     if (mounted) setState(() => isLoading = false);
// //   }

// //   // ================= RESEND =================
// //   Future<void> resendEmail() async {
// //     try {
// //       await _auth.currentUser?.reload();
// //       await _auth.currentUser?.sendEmailVerification();

// //       setState(() {
// //         canResend = false;
// //       });

// //       startCountdown(); // 🔁 restart timer

// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "📩 New verification link sent",
// //         bgColor: Colors.green,
// //       );

// //       Future.delayed(const Duration(seconds: 10), () {
// //         if (mounted) setState(() => canResend = true);
// //       });
// //     } catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Error sending email",
// //         bgColor: Colors.red,
// //       );
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     verifyTimer?.cancel();
// //     countdownTimer?.cancel();
// //     super.dispose();
// //   }

// //   // ================= UI =================
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 26),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Icon(Icons.email, size: 80, color: Color(0xFF9B5F4D)),
// //               const SizedBox(height: 20),

// //               const Text(
// //                 "Verify Your Email",
// //                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// //               ),

// //               const SizedBox(height: 12),

// //               const Text(
// //                 "A verification link has been sent to your email.\nPlease verify within the time below.",
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(fontSize: 14, color: Colors.grey),
// //               ),

// //               const SizedBox(height: 20),

// //               // ⏱ TIMER DISPLAY
// //               Text(
// //                 isLinkExpired
// //                     ? "⚠️ Link expired"
// //                     : "Link expires in: ${formatTime(remainingSeconds)}",
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                   color: isLinkExpired ? Colors.red : Colors.green,
// //                 ),
// //               ),

// //               const SizedBox(height: 30),

// //               ElevatedButton(
// //                 onPressed: isLoading ? null : checkEmailVerifiedAndSave,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFF9B5F4D),
// //                 ),
// //                 child: isLoading
// //                     ? const CircularProgressIndicator(color: Colors.white)
// //                     : const Text("I Verified"),
// //               ),

// //               const SizedBox(height: 16),

// //               TextButton(
// //                 onPressed: canResend ? resendEmail : null,
// //                 child: Text(
// //                   canResend ? "Resend Email" : "Resend available soon...",
// //                 ),
// //               ),

// //               const SizedBox(height: 20),

// //               const Text(
// //                 "⚠️ Check spam folder if email not received.",
// //                 style: TextStyle(fontSize: 12, color: Colors.grey),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';

// class EmailVerificationPage extends StatefulWidget {
//   final String name;
//   final String email;
//   final String mobile;
//   final String address;
//   final DateTime dob;
//   final bool termsAccepted;

//   const EmailVerificationPage({
//     super.key,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.address,
//     required this.dob,
//     required this.termsAccepted,
//   });

//   @override
//   State<EmailVerificationPage> createState() => _EmailVerificationPageState();
// }

// class _EmailVerificationPageState extends State<EmailVerificationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   bool isLoading = false;
//   bool canResend = false;
//   bool isSaved = false;

//   Timer? timer;

//   // ⏳ Email expiry tracking
//   DateTime? emailSentTime;
//   Duration expiryDuration = const Duration(hours: 1);
//   Duration remainingTime = const Duration(hours: 1);

//   @override
//   void initState() {
//     super.initState();

//     emailSentTime = DateTime.now();

//     // Timer for countdown
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       updateRemainingTime();
//     });

//     // Enable resend after 10 sec
//     Future.delayed(const Duration(seconds: 10), () {
//       if (mounted) setState(() => canResend = true);
//     });
//   }

//   void updateRemainingTime() {
//     if (emailSentTime == null) return;

//     final diff = DateTime.now().difference(emailSentTime!);
//     final remaining = expiryDuration - diff;

//     if (remaining.isNegative) {
//       setState(() {
//         remainingTime = Duration.zero;
//       });
//     } else {
//       setState(() {
//         remainingTime = remaining;
//       });
//     }
//   }

//   String formatTime(Duration d) {
//     int minutes = d.inMinutes.remainder(60);
//     int seconds = d.inSeconds.remainder(60);
//     return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
//   }

//   // ================= VERIFY & SAVE =================
//   Future<void> checkEmailVerifiedAndSave() async {
//     if (isSaved) return;

//     setState(() => isLoading = true);

//     await _auth.currentUser?.reload();
//     User? user = _auth.currentUser;

//     if (user == null) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Session expired. Please login again.",
//         bgColor: Colors.red,
//       );
//       setState(() => isLoading = false);
//       return;
//     }

//     if (!user.emailVerified) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "❌ Email not verified yet",
//         bgColor: Colors.orange,
//       );
//       setState(() => isLoading = false);
//       return;
//     }

//     final newUser = AccountTypeModelFull(
//       userId: user.uid,
//       name: widget.name,
//       email: widget.email,
//       mobile: widget.mobile,
//       address: widget.address,
//       dob: widget.dob.toString(),
//       profileImage: "",
//       accountType: "User",
//       termsAccepted: widget.termsAccepted,
//       termsAcceptedAt: DateTime.now().toIso8601String(),
//       mobileVerified: false,
//       termsVersion: "v1.0",
//     );

//     try {
//       await SignupController().addData("users", user.uid, newUser.toMap());

//       await SignupController().saveTermsAcceptance(user.uid);

//       await SignupController().addData("user_content", user.uid, {
//         "userId": user.uid,
//         "name": widget.name,
//         "email": widget.email,
//         "createdAt": DateTime.now().toIso8601String(),
//       });

//       isSaved = true;

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "✅ Email Verified & Data Saved!",
//         bgColor: Colors.green,
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Error saving user data",
//         bgColor: Colors.red,
//       );
//     }

//     setState(() => isLoading = false);
//   }

//   // ================= RESEND =================
//   Future<void> resendEmail() async {
//     try {
//       await _auth.currentUser?.sendEmailVerification();

//       emailSentTime = DateTime.now(); // reset timer

//       setState(() {
//         canResend = false;
//         remainingTime = expiryDuration;
//       });

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "📩 New verification email sent",
//         bgColor: Colors.green,
//       );

//       Future.delayed(const Duration(seconds: 10), () {
//         if (mounted) setState(() => canResend = true);
//       });
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Error sending email",
//         bgColor: Colors.red,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 26),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.email, size: 80, color: Color(0xFF9B5F4D)),
//               const SizedBox(height: 20),

//               const Text(
//                 "Verify Your Email",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 12),

//               const Text(
//                 "We've sent a verification link to your email.\nPlease verify your account.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),

//               const SizedBox(height: 20),

//               // ⏳ TIMER DISPLAY
//               Text(
//                 remainingTime.inSeconds > 0
//                     ? "⏳ Link expires in: ${formatTime(remainingTime)}"
//                     : "❌ Link expired. Please resend email.",
//                 style: TextStyle(
//                   color: remainingTime.inSeconds > 0
//                       ? Colors.orange
//                       : Colors.red,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // 🔘 I VERIFIED BUTTON (STATIC)
//               ElevatedButton(
//                 onPressed: isLoading ? null : checkEmailVerifiedAndSave,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF9B5F4D),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 30,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(
//                         "I Verified",
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//               ),

//               const SizedBox(height: 16),

//               // 🔁 RESEND BUTTON
//               TextButton(
//                 onPressed: canResend ? resendEmail : null,
//                 child: Text(
//                   canResend
//                       ? "Resend Email"
//                       : "Resend available in few seconds...",
//                   style: TextStyle(
//                     color: canResend ? const Color(0xFF9B5F4D) : Colors.grey,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text(
//                 "⚠️ Note:\n"
//                 "• Verification links usually expire in about 1 hour.\n"
//                 "• If you request a new email, ONLY the latest link will work.\n"
//                 "• Older links become invalid automatically.\n"
//                 "• Check spam folder if email not received.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/controller/SignUpController.dart';
import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';

class EmailVerificationPage extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final String address;
  final DateTime dob;
  final bool termsAccepted;

  const EmailVerificationPage({
    super.key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.dob,
    required this.termsAccepted,
  });

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool canResend = false;
  bool isSaved = false;

  Timer? timer;

  // ⏳ Email expiry tracking
  DateTime? emailSentTime;
  Duration expiryDuration = const Duration(hours: 1);
  Duration remainingTime = const Duration(hours: 1);

  @override
  void initState() {
    super.initState();

    emailSentTime = DateTime.now();

    // Timer for countdown
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      updateRemainingTime();
    });

    // Enable resend after 10 sec
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) setState(() => canResend = true);
    });
  }

  void updateRemainingTime() {
    if (emailSentTime == null) return;

    final diff = DateTime.now().difference(emailSentTime!);
    final remaining = expiryDuration - diff;

    if (remaining.isNegative) {
      setState(() {
        remainingTime = Duration.zero;
      });
    } else {
      setState(() {
        remainingTime = remaining;
      });
    }
  }

  String formatTime(Duration d) {
    int minutes = d.inMinutes.remainder(60);
    int seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  // ================= VERIFY & SAVE =================
  Future<void> checkEmailVerifiedAndSave() async {
    if (isSaved) return;

    setState(() => isLoading = true);

    await _auth.currentUser?.reload();
    User? user = _auth.currentUser;

    if (user == null) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Session expired. Please login again.",
        bgColor: Colors.red,
      );
      setState(() => isLoading = false);
      return;
    }

    if (!user.emailVerified) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "❌ Email not verified yet",
        bgColor: Colors.orange,
      );
      setState(() => isLoading = false);
      return;
    }

    final newUser = {
      "userId": user.uid,
      "name": widget.name,
      "email": widget.email,
      "mobile": widget.mobile,
      "address": widget.address,
      "dob": widget.dob.toIso8601String(),
      "profileImage": "",
      "accountType": "User",
      "termsAccepted": widget.termsAccepted,
      "termsAcceptedAt": FieldValue.serverTimestamp(),
      "createdAt": FieldValue.serverTimestamp(),
      "lastSeenAt": FieldValue.serverTimestamp(),
      "mobileVerified": false,
      "termsVersion": "v1.0",
    };

    try {
      await SignupController().addData("users", user.uid, newUser);
      await SignupController().saveTermsAcceptance(user.uid);
      await SignupController().addData("user_content", user.uid, {
        "userId": user.uid,
        "name": widget.name,
        "email": widget.email,
        "createdAt": FieldValue.serverTimestamp(),
      });

      isSaved = true;

      Snackbarscreen().showCustomSnackBar(
        context,
        "✅ Email Verified & Data Saved!",
        bgColor: Colors.green,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Error saving user data",
        bgColor: Colors.red,
      );
    }

    setState(() => isLoading = false);
  }

  // ================= RESEND =================
  Future<void> resendEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();

      emailSentTime = DateTime.now(); // reset timer

      setState(() {
        canResend = false;
        remainingTime = expiryDuration;
      });

      Snackbarscreen().showCustomSnackBar(
        context,
        "📩 New verification email sent",
        bgColor: Colors.green,
      );

      Future.delayed(const Duration(seconds: 10), () {
        if (mounted) setState(() => canResend = true);
      });
    } catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Error sending email",
        bgColor: Colors.red,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email, size: 80, color: Color(0xFF9B5F4D)),
              const SizedBox(height: 20),

              const Text(
                "Verify Your Email",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                "We've sent a verification link to your email.\nPlease verify your account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // ⏳ TIMER DISPLAY
              Text(
                remainingTime.inSeconds > 0
                    ? "⏳ Link expires in: ${formatTime(remainingTime)}"
                    : "❌ Link expired. Please resend email.",
                style: TextStyle(
                  color: remainingTime.inSeconds > 0
                      ? Colors.orange
                      : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              // 🔘 I VERIFIED BUTTON (STATIC)
              ElevatedButton(
                onPressed: isLoading ? null : checkEmailVerifiedAndSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B5F4D),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "I Verified",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),

              const SizedBox(height: 16),

              // 🔁 RESEND BUTTON
              TextButton(
                onPressed: canResend ? resendEmail : null,
                child: Text(
                  canResend
                      ? "Resend Email"
                      : "Resend available in few seconds...",
                  style: TextStyle(
                    color: canResend ? const Color(0xFF9B5F4D) : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "⚠️ Note:\n"
                "• Verification links usually expire in about 1 hour.\n"
                "• If you request a new email, ONLY the latest link will work.\n"
                "• Older links become invalid automatically.\n"
                "• Check spam folder if email not received.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
