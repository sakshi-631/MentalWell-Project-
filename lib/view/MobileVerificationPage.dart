import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';

class MobileVerificationPage extends StatefulWidget {
  final String mobile;

  const MobileVerificationPage({super.key, required this.mobile});

  @override
  State<MobileVerificationPage> createState() => _MobileVerificationPageState();
}

class _MobileVerificationPageState extends State<MobileVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Web-specific: RecaptchaVerifier
  RecaptchaVerifier? webRecaptchaVerifier;

  // Web auth platform instance
  FirebaseAuthPlatform get _authPlatform => FirebaseAuthPlatform.instance;

  final TextEditingController otpController = TextEditingController();

  String verificationId = "";
  bool isLoading = false;
  bool otpSent = false;

  // ================= SEND OTP =================
  Future<void> sendOTP() async {
    setState(() => isLoading = true);

    try {
      if (kIsWeb) {
        // 🔹 Web platform: initialize reCAPTCHA
        webRecaptchaVerifier = RecaptchaVerifier(
          auth: _authPlatform, // ✅ must be FirebaseAuthPlatform
          container: 'recaptcha-container', // must match index.html
          size: RecaptchaVerifierSize.compact,
          theme: RecaptchaVerifierTheme.light,
        );

        // Send OTP for web
        ConfirmationResult confirmationResult = await _auth
            .signInWithPhoneNumber(
              '+91${widget.mobile}',
              webRecaptchaVerifier!,
            );

        verificationId = confirmationResult.verificationId;
        otpSent = true;
        setState(() => isLoading = false);

        Snackbarscreen().showCustomSnackBar(
          context,
          "OTP sent to your mobile number",
          bgColor: Colors.green,
        );
      } else {
        // 🔹 Mobile platform: Android/iOS
        await _auth.verifyPhoneNumber(
          phoneNumber: '+91${widget.mobile}',
          timeout: const Duration(seconds: 60),

          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            await _onVerificationSuccess();
          },

          verificationFailed: (FirebaseAuthException e) {
            Snackbarscreen().showCustomSnackBar(
              context,
              e.message ?? "OTP verification failed",
              bgColor: Colors.red,
            );
            setState(() => isLoading = false);
          },

          codeSent: (String verId, int? resendToken) {
            verificationId = verId;
            otpSent = true;
            setState(() => isLoading = false);

            Snackbarscreen().showCustomSnackBar(
              context,
              "OTP sent to your mobile number",
              bgColor: Colors.green,
            );
          },

          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
        );
      }
    } catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Error sending OTP: $e",
        bgColor: Colors.red,
      );
      setState(() => isLoading = false);
    }
  }

  // ================= VERIFY OTP =================
  Future<void> verifyOTP() async {
    if (otpController.text.length < 6) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Enter valid OTP",
        bgColor: Colors.red,
      );
      return;
    }

    try {
      setState(() => isLoading = true);

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      await _auth.signInWithCredential(credential);
      await _onVerificationSuccess();
    } catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Invalid OTP",
        bgColor: Colors.red,
      );
      setState(() => isLoading = false);
    }
  }

  // ================= SUCCESS =================
  Future<void> _onVerificationSuccess() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "mobileVerified": true,
    });

    Snackbarscreen().showCustomSnackBar(
      context,
      "Mobile number verified successfully",
      bgColor: Colors.green,
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
      (_) => false,
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
                  const SizedBox(height: 80),
                  const Text(
                    "Verify Mobile",
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
                        Text(
                          "OTP will be sent to\n+91 ${widget.mobile}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),

                        if (otpSent)
                          TextField(
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xFF9B5F4D),
                              ),
                              hintText: "Enter OTP",
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),

                        const SizedBox(height: 24),

                        ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : otpSent
                              ? verifyOTP
                              : sendOTP,
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
                              : Text(
                                  otpSent ? "Verify OTP" : "Send OTP",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 12),
                        if (kIsWeb)
                          const Text(
                            "For Web, ensure reCAPTCHA box appears above.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (kIsWeb) const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

// import 'package:mentalwellapp/view/USER/UserHomePage.dart';

// class MobileVerificationPage extends StatefulWidget {
//   final String mobile;

//   const MobileVerificationPage({super.key, required this.mobile});

//   @override
//   State<MobileVerificationPage> createState() => _MobileVerificationPageState();
// }

// class _MobileVerificationPageState extends State<MobileVerificationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Web-specific auth platform for RecaptchaVerifier
//   final FirebaseAuthPlatform _authPlatform = FirebaseAuthPlatform.instance;

//   final TextEditingController otpController = TextEditingController();

//   String verificationId = "";
//   bool isLoading = false;
//   bool otpSent = false;

//   RecaptchaVerifier? webRecaptchaVerifier;

//   // ================= SEND OTP =================
//   Future<void> sendOTP() async {
//     setState(() => isLoading = true);

//     try {
//       if (kIsWeb) {
//         // 🔹 Web platform: initialize reCAPTCHA
//         webRecaptchaVerifier = RecaptchaVerifier(
//           auth: _authPlatform,
//           container: 'recaptcha-container', // matches index.html
//           size: RecaptchaVerifierSize.compact,
//           theme: RecaptchaVerifierTheme.light,
//         );

//         // Send OTP for web
//         await _auth
//             .signInWithPhoneNumber('+91${widget.mobile}', webRecaptchaVerifier!)
//             .then((confirmationResult) {
//               verificationId = confirmationResult.verificationId;
//               otpSent = true;
//               setState(() => isLoading = false);

//               Snackbarscreen().showCustomSnackBar(
//                 context,
//                 "OTP sent to your mobile number",
//                 bgColor: Colors.green,
//               );
//             });
//       } else {
//         // 🔹 Mobile platform: Android/iOS
//         await _auth.verifyPhoneNumber(
//           phoneNumber: '+91${widget.mobile}',
//           timeout: const Duration(seconds: 60),

//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await _auth.signInWithCredential(credential);
//             await _onVerificationSuccess();
//           },

//           verificationFailed: (FirebaseAuthException e) {
//             Snackbarscreen().showCustomSnackBar(
//               context,
//               e.message ?? "OTP verification failed",
//               bgColor: Colors.red,
//             );
//             setState(() => isLoading = false);
//           },

//           codeSent: (String verId, int? resendToken) {
//             verificationId = verId;
//             otpSent = true;
//             setState(() => isLoading = false);

//             Snackbarscreen().showCustomSnackBar(
//               context,
//               "OTP sent to your mobile number",
//               bgColor: Colors.green,
//             );
//           },

//           codeAutoRetrievalTimeout: (String verId) {
//             verificationId = verId;
//           },
//         );
//       }
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Error sending OTP: $e",
//         bgColor: Colors.red,
//       );
//       setState(() => isLoading = false);
//     }
//   }

//   // ================= VERIFY OTP =================
//   Future<void> verifyOTP() async {
//     if (otpController.text.length < 6) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Enter valid OTP",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     try {
//       setState(() => isLoading = true);

//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: otpController.text.trim(),
//       );

//       await _auth.signInWithCredential(credential);
//       await _onVerificationSuccess();
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Invalid OTP",
//         bgColor: Colors.red,
//       );
//       setState(() => isLoading = false);
//     }
//   }

//   // ================= SUCCESS =================
//   Future<void> _onVerificationSuccess() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;

//     await FirebaseFirestore.instance.collection("users").doc(uid).update({
//       "mobileVerified": true,
//     });

//     Snackbarscreen().showCustomSnackBar(
//       context,
//       "Mobile number verified successfully",
//       bgColor: Colors.green,
//     );

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
//       (_) => false,
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
//                   const SizedBox(height: 80),
//                   const Text(
//                     "Verify Mobile",
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
//                         Text(
//                           "OTP will be sent to\n+91 ${widget.mobile}",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 20),

//                         if (otpSent)
//                           TextField(
//                             controller: otpController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(
//                                 Icons.lock,
//                                 color: Color(0xFF9B5F4D),
//                               ),
//                               hintText: "Enter OTP",
//                               filled: true,
//                               fillColor: Colors.grey.shade100,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(24),
//                               ),
//                             ),
//                           ),

//                         const SizedBox(height: 24),

//                         ElevatedButton(
//                           onPressed: isLoading
//                               ? null
//                               : otpSent
//                               ? verifyOTP
//                               : sendOTP,
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
//                               : Text(
//                                   otpSent ? "Verify OTP" : "Send OTP",
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ),
//                         const SizedBox(height: 12),
//                         if (kIsWeb)
//                           const Text(
//                             "For Web, ensure reCAPTCHA box appears above.",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.black54,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   if (kIsWeb) const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';

// class MobileVerificationPage extends StatefulWidget {
//   final String mobile;

//   const MobileVerificationPage({super.key, required this.mobile});

//   @override
//   State<MobileVerificationPage> createState() => _MobileVerificationPageState();
// }

// class _MobileVerificationPageState extends State<MobileVerificationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController otpController = TextEditingController();

//   bool isLoading = false;
//   bool otpSent = false;
//   String verificationId = "";
//   RecaptchaVerifier? webRecaptchaVerifier;

//   @override
//   void initState() {
//     super.initState();
//   }

//   // ================= SEND OTP =================
//   Future<void> sendOTP() async {
//     setState(() => isLoading = true);

//     try {
//       if (kIsWeb) {
//         // 🔹 Web platform: initialize reCAPTCHA
//         webRecaptchaVerifier = RecaptchaVerifier(
//           container: 'recaptcha-container', // matches index.html
//           size: RecaptchaVerifierSize.compact,
//           theme: RecaptchaVerifierTheme.light,
//         );

//         // send OTP
//         ConfirmationResult confirmationResult = await _auth
//             .signInWithPhoneNumber(
//               '+91${widget.mobile}',
//               webRecaptchaVerifier!,
//             );

//         verificationId = confirmationResult.verificationId;
//         otpSent = true;
//         setState(() => isLoading = false);

//         Snackbarscreen().showCustomSnackBar(
//           context,
//           "OTP sent to your mobile number",
//           bgColor: Colors.green,
//         );
//       } else {
//         // 🔹 Mobile platform
//         await _auth.verifyPhoneNumber(
//           phoneNumber: '+91${widget.mobile}',
//           timeout: const Duration(seconds: 60),
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await _auth.signInWithCredential(credential);
//             await _onVerificationSuccess();
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             Snackbarscreen().showCustomSnackBar(
//               context,
//               e.message ?? "OTP verification failed",
//               bgColor: Colors.red,
//             );
//             setState(() => isLoading = false);
//           },
//           codeSent: (String verId, int? resendToken) {
//             verificationId = verId;
//             otpSent = true;
//             setState(() => isLoading = false);

//             Snackbarscreen().showCustomSnackBar(
//               context,
//               "OTP sent to your mobile number",
//               bgColor: Colors.green,
//             );
//           },
//           codeAutoRetrievalTimeout: (String verId) {
//             verificationId = verId;
//           },
//         );
//       }
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Error sending OTP: $e",
//         bgColor: Colors.red,
//       );
//       setState(() => isLoading = false);
//     }
//   }

//   // ================= VERIFY OTP =================
//   Future<void> verifyOTP() async {
//     if (otpController.text.length < 6) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Enter valid OTP",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     try {
//       setState(() => isLoading = true);

//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: otpController.text.trim(),
//       );

//       await _auth.signInWithCredential(credential);
//       await _onVerificationSuccess();
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Invalid OTP",
//         bgColor: Colors.red,
//       );
//       setState(() => isLoading = false);
//     }
//   }

//   // ================= SUCCESS =================
//   Future<void> _onVerificationSuccess() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;

//     await FirebaseFirestore.instance.collection("users").doc(uid).update({
//       "mobileVerified": true,
//     });

//     Snackbarscreen().showCustomSnackBar(
//       context,
//       "Mobile number verified successfully",
//       bgColor: Colors.green,
//     );

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
//       (_) => false,
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
//                   const SizedBox(height: 80),
//                   const Text(
//                     "Verify Mobile",
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
//                         Text(
//                           "OTP will be sent to\n+91 ${widget.mobile}",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 20),

//                         if (otpSent)
//                           TextField(
//                             controller: otpController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(
//                                 Icons.lock,
//                                 color: Color(0xFF9B5F4D),
//                               ),
//                               hintText: "Enter OTP",
//                               filled: true,
//                               fillColor: Colors.grey.shade100,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(24),
//                               ),
//                             ),
//                           ),

//                         const SizedBox(height: 24),

//                         ElevatedButton(
//                           onPressed: isLoading
//                               ? null
//                               : otpSent
//                               ? verifyOTP
//                               : sendOTP,
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
//                               : Text(
//                                   otpSent ? "Verify OTP" : "Send OTP",
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ),
//                         const SizedBox(height: 20),
//                         if (kIsWeb)
//                           const Text(
//                             "reCAPTCHA box will appear below (Web only)",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                         const SizedBox(height: 10),
//                         if (kIsWeb)
//                           Container(
//                             // This is where the reCAPTCHA will render
//                             id: 'recaptcha-container' as dynamic,
//                             width: 300,
//                             height: 100,
//                           ),
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

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';

// // class MobileVerificationPage extends StatefulWidget {
// //   final String mobile;

// //   const MobileVerificationPage({super.key, required this.mobile});

// //   @override
// //   State<MobileVerificationPage> createState() => _MobileVerificationPageState();
// // }

// // class _MobileVerificationPageState extends State<MobileVerificationPage> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   final TextEditingController otpController = TextEditingController();

// //   String verificationId = "";
// //   bool isLoading = false;
// //   bool otpSent = false;

// //   // ================= SEND OTP =================
// //   Future<void> sendOTP() async {
// //     setState(() => isLoading = true);

// //     await _auth.verifyPhoneNumber(
// //       phoneNumber: "+91${widget.mobile}",
// //       timeout: const Duration(seconds: 60),

// //       verificationCompleted: (PhoneAuthCredential credential) async {
// //         await _auth.signInWithCredential(credential);
// //         await _onVerificationSuccess();
// //       },

// //       verificationFailed: (FirebaseAuthException e) {
// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           e.message ?? "OTP verification failed",
// //           bgColor: Colors.red,
// //         );
// //         setState(() => isLoading = false);
// //       },

// //       codeSent: (String verId, int? resendToken) {
// //         verificationId = verId;
// //         otpSent = true;
// //         setState(() => isLoading = false);

// //         Snackbarscreen().showCustomSnackBar(
// //           context,
// //           "OTP sent to your mobile number",
// //           bgColor: Colors.green,
// //         );
// //       },

// //       codeAutoRetrievalTimeout: (String verId) {
// //         verificationId = verId;
// //       },
// //     );
// //   }

// //   // ================= VERIFY OTP =================
// //   Future<void> verifyOTP() async {
// //     if (otpController.text.length < 6) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Enter valid OTP",
// //         bgColor: Colors.red,
// //       );
// //       return;
// //     }

// //     try {
// //       setState(() => isLoading = true);

// //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
// //         verificationId: verificationId,
// //         smsCode: otpController.text.trim(),
// //       );

// //       await _auth.signInWithCredential(credential);
// //       await _onVerificationSuccess();
// //     } catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Invalid OTP",
// //         bgColor: Colors.red,
// //       );
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   // ================= SUCCESS =================
// //   Future<void> _onVerificationSuccess() async {
// //     String uid = FirebaseAuth.instance.currentUser!.uid;

// //     await FirebaseFirestore.instance.collection("users").doc(uid).update({
// //       "mobileVerified": true,
// //     });

// //     Snackbarscreen().showCustomSnackBar(
// //       context,
// //       "Mobile number verified successfully",
// //       bgColor: Colors.green,
// //     );

// //     Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(builder: (_) => const UserHomeWrapper()),
// //       (_) => false,
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
// //                   const SizedBox(height: 80),
// //                   const Text(
// //                     "Verify Mobile",
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
// //                         Text(
// //                           "OTP will be sent to\n+91 ${widget.mobile}",
// //                           textAlign: TextAlign.center,
// //                           style: const TextStyle(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w600,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 20),

// //                         if (otpSent)
// //                           TextField(
// //                             controller: otpController,
// //                             keyboardType: TextInputType.number,
// //                             decoration: InputDecoration(
// //                               prefixIcon: const Icon(
// //                                 Icons.lock,
// //                                 color: Color(0xFF9B5F4D),
// //                               ),
// //                               hintText: "Enter OTP",
// //                               filled: true,
// //                               fillColor: Colors.grey.shade100,
// //                               border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(24),
// //                               ),
// //                             ),
// //                           ),

// //                         const SizedBox(height: 24),

// //                         ElevatedButton(
// //                           onPressed: isLoading
// //                               ? null
// //                               : otpSent
// //                               ? verifyOTP
// //                               : sendOTP,
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
// //                               : Text(
// //                                   otpSent ? "Verify OTP" : "Send OTP",
// //                                   style: const TextStyle(
// //                                     fontSize: 20,
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
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
