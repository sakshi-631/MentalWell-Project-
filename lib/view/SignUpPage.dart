// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // import 'package:mentalwellapp/view/MobileVerificationPage.dart';
// // // // import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

// // // // class SignUpPage extends StatefulWidget {
// // // //   const SignUpPage({super.key});

// // // //   @override
// // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // }

// // // // class _SignUpPageState extends State<SignUpPage> {
// // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// // // //   final TextEditingController nameController = TextEditingController();
// // // //   final TextEditingController emailController = TextEditingController();
// // // //   final TextEditingController passwordController = TextEditingController();
// // // //   final TextEditingController mobileController = TextEditingController();
// // // //   final TextEditingController addressController = TextEditingController();

// // // //   DateTime? selectedDate;
// // // //   bool isTermsAccepted = false;
// // // //   bool isPasswordVisible = false;
// // // //   bool isLoading = false;
// // // //   PasswordStrength passwordStrength = PasswordStrength.veryWeak;

// // // //   // ================= TERMS & CONDITIONS =================
// // // //   Future<void> _showTermsDialog() async {
// // // //     bool dialogAccepted = false;

// // // //     await showDialog(
// // // //       context: context,
// // // //       barrierDismissible: false,
// // // //       builder: (_) {
// // // //         return StatefulBuilder(
// // // //           builder: (context, setDialogState) {
// // // //             return AlertDialog(
// // // //               title: const Text(
// // // //                 "Terms & Conditions",
// // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // //               ),
// // // //               content: SizedBox(
// // // //                 height: 260,
// // // //                 child: SingleChildScrollView(
// // // //                   child: const Text(
// // // //                     "Last Updated: January 2026\n\n"
// // // //                     "Welcome to MentalWell.\n\n"
// // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // //                     "3. Personal data is securely stored using Firebase.\n\n"
// // // //                     "4. Misuse, reverse engineering, or unauthorized access is prohibited.\n\n"
// // // //                     "5. MentalWell may remove harmful content without notice.\n\n"
// // // //                     "6. Services may change or discontinue at any time.\n\n"
// // // //                     "By clicking Accept, you agree to these terms.",
// // // //                     style: TextStyle(fontSize: 14),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               actions: [
// // // //                 Row(
// // // //                   children: [
// // // //                     Checkbox(
// // // //                       value: dialogAccepted,
// // // //                       onChanged: (val) {
// // // //                         setDialogState(() => dialogAccepted = val!);
// // // //                       },
// // // //                     ),
// // // //                     const Expanded(
// // // //                       child: Text("I agree to the Terms & Conditions"),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 Align(
// // // //                   alignment: Alignment.centerRight,
// // // //                   child: SizedBox(
// // // //                     width: 120,
// // // //                     child: ElevatedButton(
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.black,
// // // //                         foregroundColor: Colors.white,
// // // //                       ),
// // // //                       onPressed: dialogAccepted
// // // //                           ? () {
// // // //                               setState(() => isTermsAccepted = true);
// // // //                               Navigator.pop(context);
// // // //                             }
// // // //                           : null,
// // // //                       child: const Text("Accept"),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             );
// // // //           },
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   // ================= SIGN UP =================
// // // //   Future<void> handleSignUp() async {
// // // //     if (nameController.text.isEmpty ||
// // // //         emailController.text.isEmpty ||
// // // //         passwordController.text.isEmpty ||
// // // //         mobileController.text.isEmpty ||
// // // //         addressController.text.isEmpty ||
// // // //         selectedDate == null) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Please fill all fields",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //       return;
// // // //     }

// // // //     if (!isTermsAccepted) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Please accept Terms & Conditions",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //       return;
// // // //     }

// // // //     // 🔹 Password strength validation
// // // //     String password = passwordController.text.trim();
// // // //     final passwordRegex = RegExp(
// // // //       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
// // // //     );

// // // //     if (!passwordRegex.hasMatch(password)) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         "Password must be at least 6 characters, "
// // // //         "include uppercase, lowercase, number, and special symbol.",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //       return;
// // // //     }

// // // //     setState(() => isLoading = true);

// // // //     try {
// // // //       // 🔹 Create Firebase user
// // // //       UserCredential userCred = await firebaseAuth
// // // //           .createUserWithEmailAndPassword(
// // // //             email: emailController.text.trim(),
// // // //             password: password,
// // // //           );

// // // //       // 🔹 Prepare user data with mobile verification pending
// // // //       final user = AccountTypeModelFull(
// // // //         userId: userCred.user!.uid,
// // // //         name: nameController.text.trim(),
// // // //         email: emailController.text.trim(),
// // // //         mobile: mobileController.text.trim(),
// // // //         address: addressController.text.trim(),
// // // //         dob: selectedDate.toString(),
// // // //         profileImage: "",
// // // //         accountType: "User", // auto assign USER
// // // //         termsAccepted: true,
// // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // //         mobileVerified: false, // Will be set to true after OTP verification
// // // //         emailVerified: false,
// // // //       );

// // // //       // 🔹 Save terms acceptance and user data in Firestore
// // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);
// // // //       await SignupController().addData(
// // // //         "users",
// // // //         userCred.user!.uid,
// // // //         user.toMap(),
// // // //       );

// // // //       setState(() => isLoading = false);

// // // //       // 🔹 Navigate to OTP Verification Page
// // // //       if (mounted) {
// // // //         // 🔹 Clean mobile number
// // // //         String cleanMobile = mobileController.text.trim();
// // // //         cleanMobile = cleanMobile.replaceAll(RegExp(r'[^0-9]'), '');

// // // //         if (cleanMobile.startsWith('0')) {
// // // //           cleanMobile = cleanMobile.substring(1);
// // // //         }

// // // //         Snackbarscreen().showCustomSnackBar(
// // // //           context,
// // // //           "Account created! Now verify your mobile number with OTP.",
// // // //           bgColor: Colors.green,
// // // //         );

// // // //         Navigator.pushReplacement(
// // // //           context,
// // // //           MaterialPageRoute(
// // // //             builder: (_) => MobileVerificationPage(
// // // //               mobile: cleanMobile, // ✅ correct usage
// // // //             ),
// // // //           ),
// // // //         );
// // // //       }
// // // //       return;
// // // //     } on FirebaseAuthException catch (e) {
// // // //       Snackbarscreen().showCustomSnackBar(
// // // //         context,
// // // //         e.message ?? "Signup failed",
// // // //         bgColor: Colors.red,
// // // //       );
// // // //     }

// // // //     setState(() => isLoading = false);
// // // //   }

// // // //   // ================= UI =================
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Stack(
// // // //         children: [
// // // //           SizedBox.expand(
// // // //             child: Image.asset(
// // // //               "assets/signupbackground.png",
// // // //               fit: BoxFit.cover,
// // // //             ),
// // // //           ),
// // // //           Center(
// // // //             child: SingleChildScrollView(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // //               child: Column(
// // // //                 children: [
// // // //                   const SizedBox(height: 60),
// // // //                   const Text(
// // // //                     "Create Account",
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
// // // //                         _buildField(nameController, "Name", Icons.person),
// // // //                         _buildField(emailController, "Email", Icons.email),
// // // //                         _buildPasswordField(),
// // // //                         _buildPasswordTips(),
// // // //                         _buildField(
// // // //                           mobileController,
// // // //                           "Mobile",
// // // //                           Icons.phone,
// // // //                         ), // kept field
// // // //                         _buildField(addressController, "Address", Icons.home),
// // // //                         _buildDatePicker(),
// // // //                         Row(
// // // //                           children: [
// // // //                             Checkbox(value: isTermsAccepted, onChanged: null),
// // // //                             GestureDetector(
// // // //                               onTap: _showTermsDialog,
// // // //                               child: const Text(
// // // //                                 "View & Accept Terms & Conditions",
// // // //                                 style: TextStyle(
// // // //                                   color: Color(0xFF9B5F4D),
// // // //                                   fontWeight: FontWeight.w600,
// // // //                                   decoration: TextDecoration.underline,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                         const SizedBox(height: 20),
// // // //                         ElevatedButton(
// // // //                           onPressed: isLoading ? null : handleSignUp,
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
// // // //                                   "   Sign Up   ",
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
// // // //                             const Text("Already have an account? "),
// // // //                             GestureDetector(
// // // //                               onTap: () {
// // // //                                 Navigator.pushReplacement(
// // // //                                   context,
// // // //                                   MaterialPageRoute(
// // // //                                     builder: (_) => const LoginPage(),
// // // //                                   ),
// // // //                                 );
// // // //                               },
// // // //                               child: const Text(
// // // //                                 "Log In",
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

// // // //   Widget _buildField(TextEditingController ctrl, String hint, IconData icon) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.only(bottom: 14),
// // // //       child: TextField(
// // // //         controller: ctrl,
// // // //         decoration: InputDecoration(
// // // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // // //           hintText: hint,
// // // //           filled: true,
// // // //           fillColor: Colors.grey.shade100,
// // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildPasswordField() {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.only(bottom: 14),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           TextField(
// // // //             controller: passwordController,
// // // //             obscureText: !isPasswordVisible,
// // // //             onChanged: (value) {
// // // //               setState(() {
// // // //                 passwordStrength = PasswordStrengthChecker.checkPassword(value);
// // // //               });
// // // //             },
// // // //             decoration: InputDecoration(
// // // //               prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // // //               suffixIcon: IconButton(
// // // //                 icon: Icon(
// // // //                   isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// // // //                   color: const Color(0xFF9B5F4D),
// // // //                 ),
// // // //                 onPressed: () {
// // // //                   setState(() {
// // // //                     isPasswordVisible = !isPasswordVisible;
// // // //                   });
// // // //                 },
// // // //               ),
// // // //               hintText: "Password",
// // // //               filled: true,
// // // //               fillColor: Colors.grey.shade100,
// // // //               border: OutlineInputBorder(
// // // //                 borderRadius: BorderRadius.circular(24),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           if (passwordController.text.isNotEmpty)
// // // //             Padding(
// // // //               padding: const EdgeInsets.only(top: 8),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Row(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: ClipRRect(
// // // //                           borderRadius: BorderRadius.circular(4),
// // // //                           child: LinearProgressIndicator(
// // // //                             value: (passwordStrength.index + 1) / 5,
// // // //                             minHeight: 6,
// // // //                             backgroundColor: Colors.grey.shade300,
// // // //                             valueColor: AlwaysStoppedAnimation<Color>(
// // // //                               PasswordStrengthChecker.getStrengthColor(
// // // //                                 passwordStrength,
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(width: 8),
// // // //                       Text(
// // // //                         PasswordStrengthChecker.getStrengthText(
// // // //                           passwordStrength,
// // // //                         ),
// // // //                         style: TextStyle(
// // // //                           fontSize: 12,
// // // //                           fontWeight: FontWeight.w600,
// // // //                           color: PasswordStrengthChecker.getStrengthColor(
// // // //                             passwordStrength,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildPasswordTips() {
// // // //     return Container(
// // // //       padding: const EdgeInsets.all(14),
// // // //       margin: const EdgeInsets.only(bottom: 14),
// // // //       decoration: BoxDecoration(
// // // //         borderRadius: BorderRadius.circular(16),
// // // //         color: const Color(0xFFFFF8E1),
// // // //         border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: const Color(0xFFFFB74D).withOpacity(0.15),
// // // //             blurRadius: 8,
// // // //             offset: const Offset(0, 2),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Row(
// // // //             children: [
// // // //               const Text('💡', style: TextStyle(fontSize: 18)),
// // // //               const SizedBox(width: 8),
// // // //               Text(
// // // //                 'Tips for a Strong Password',
// // // //                 style: TextStyle(
// // // //                   fontSize: 13,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   color: const Color(0xFF9B5F4D),
// // // //                   letterSpacing: 0.3,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           const SizedBox(height: 10),
// // // //           ...[
// // // //             ('✓ At least 8 characters', Icons.text_fields),
// // // //             ('✓ Uppercase & lowercase letters', Icons.text_rotation_none),
// // // //             ('✓ Numbers (0–9)', Icons.numbers),
// // // //             ('✓ Symbols: @, #, \$, %, !, etc.', Icons.security),
// // // //           ].map(
// // // //             (item) => Padding(
// // // //               padding: const EdgeInsets.only(bottom: 7),
// // // //               child: Row(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Icon(item.$2, size: 16, color: const Color(0xFFFFB74D)),
// // // //                   const SizedBox(width: 10),
// // // //                   Expanded(
// // // //                     child: Text(
// // // //                       item.$1,
// // // //                       style: const TextStyle(
// // // //                         fontSize: 12,
// // // //                         color: Color(0xFF5D4037),
// // // //                         fontWeight: FontWeight.w500,
// // // //                         height: 1.4,
// // // //                       ),
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

// // // //   Widget _buildDatePicker() {
// // // //     return GestureDetector(
// // // //       onTap: () async {
// // // //         DateTime? date = await showDatePicker(
// // // //           context: context,
// // // //           initialDate: DateTime(2000),
// // // //           firstDate: DateTime(1960),
// // // //           lastDate: DateTime.now(),
// // // //         );
// // // //         if (date != null) setState(() => selectedDate = date);
// // // //       },
// // // //       child: Container(
// // // //         margin: const EdgeInsets.only(bottom: 14),
// // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // //         decoration: BoxDecoration(
// // // //           borderRadius: BorderRadius.circular(24),
// // // //           color: Colors.grey.shade100,
// // // //         ),
// // // //         child: Row(
// // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //           children: [
// // // //             Text(
// // // //               selectedDate == null
// // // //                   ? "Select Date of Birth"
// // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // //             ),
// // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // import 'package:mentalwellapp/view/MobileVerificationPage.dart';
// // // import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

// // // class SignUpPage extends StatefulWidget {
// // //   const SignUpPage({super.key});

// // //   @override
// // //   State<SignUpPage> createState() => _SignUpPageState();
// // // }

// // // class _SignUpPageState extends State<SignUpPage> {
// // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// // //   final TextEditingController nameController = TextEditingController();
// // //   final TextEditingController emailController = TextEditingController();
// // //   final TextEditingController passwordController = TextEditingController();
// // //   final TextEditingController mobileController = TextEditingController();
// // //   final TextEditingController addressController = TextEditingController();

// // //   DateTime? selectedDate;
// // //   bool isTermsAccepted = false;
// // //   bool isPasswordVisible = false;
// // //   bool isLoading = false;
// // //   PasswordStrength passwordStrength = PasswordStrength.veryWeak;

// // //   // ================= TERMS & CONDITIONS =================
// // //   Future<void> _showTermsDialog() async {
// // //     bool dialogAccepted = false;

// // //     await showDialog(
// // //       context: context,
// // //       barrierDismissible: false,
// // //       builder: (_) {
// // //         return StatefulBuilder(
// // //           builder: (context, setDialogState) {
// // //             return AlertDialog(
// // //               title: const Text(
// // //                 "Terms & Conditions",
// // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // //               ),
// // //               content: SizedBox(
// // //                 height: 260,
// // //                 child: SingleChildScrollView(
// // //                   child: const Text(
// // //                     "Last Updated: January 2026\n\n"
// // //                     "Welcome to MentalWell.\n\n"
// // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // //                     "3. Personal data is securely stored using Firebase.\n\n"
// // //                     "4. Misuse, reverse engineering, or unauthorized access is prohibited.\n\n"
// // //                     "5. MentalWell may remove harmful content without notice.\n\n"
// // //                     "6. Services may change or discontinue at any time.\n\n"
// // //                     "By clicking Accept, you agree to these terms.",
// // //                     style: TextStyle(fontSize: 14),
// // //                   ),
// // //                 ),
// // //               ),
// // //               actions: [
// // //                 Row(
// // //                   children: [
// // //                     Checkbox(
// // //                       value: dialogAccepted,
// // //                       onChanged: (val) {
// // //                         setDialogState(() => dialogAccepted = val!);
// // //                       },
// // //                     ),
// // //                     const Expanded(
// // //                       child: Text("I agree to the Terms & Conditions"),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 Align(
// // //                   alignment: Alignment.centerRight,
// // //                   child: SizedBox(
// // //                     width: 120,
// // //                     child: ElevatedButton(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.black,
// // //                         foregroundColor: Colors.white,
// // //                       ),
// // //                       onPressed: dialogAccepted
// // //                           ? () {
// // //                               setState(() => isTermsAccepted = true);
// // //                               Navigator.pop(context);
// // //                             }
// // //                           : null,
// // //                       child: const Text("Accept"),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             );
// // //           },
// // //         );
// // //       },
// // //     );
// // //   }

// // //   // ================= SIGN UP =================
// // //   Future<void> handleSignUp() async {
// // //     if (nameController.text.isEmpty ||
// // //         emailController.text.isEmpty ||
// // //         passwordController.text.isEmpty ||
// // //         mobileController.text.isEmpty ||
// // //         addressController.text.isEmpty ||
// // //         selectedDate == null) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Please fill all fields",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     if (!isTermsAccepted) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Please accept Terms & Conditions",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     // 🔹 Password strength validation
// // //     String password = passwordController.text.trim();
// // //     final passwordRegex = RegExp(
// // //       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
// // //     );

// // //     if (!passwordRegex.hasMatch(password)) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Password must be at least 6 characters, "
// // //         "include uppercase, lowercase, number, and special symbol.",
// // //         bgColor: Colors.red,
// // //       );
// // //       return;
// // //     }

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔹 Create Firebase user
// // //       UserCredential userCred = await firebaseAuth
// // //           .createUserWithEmailAndPassword(
// // //             email: emailController.text.trim(),
// // //             password: password,
// // //           );

// // //       // 🔹 Prepare user data with mobile verification pending
// // //       final user = AccountTypeModelFull(
// // //         userId: userCred.user!.uid,
// // //         name: nameController.text.trim(),
// // //         email: emailController.text.trim(),
// // //         mobile: mobileController.text.trim(),
// // //         address: addressController.text.trim(),
// // //         dob: selectedDate.toString(),
// // //         profileImage: "",
// // //         accountType: "User", // auto assign USER
// // //         termsAccepted: true,
// // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // //         mobileVerified: false, // Will be set to true after OTP verification
// // //       );

// // //       // 🔹 Save terms acceptance and user data in Firestore
// // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);
// // //       await SignupController().addData(
// // //         "users",
// // //         userCred.user!.uid,
// // //         user.toMap(),
// // //       );

// // //       setState(() => isLoading = false);

// // //       // 🔹 Navigate to OTP Verification Page
// // //       if (mounted) {
// // //         Snackbarscreen().showCustomSnackBar(
// // //           context,
// // //           "Account created! Now verify your mobile number with OTP.",
// // //           bgColor: Colors.green,
// // //         );

// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (_) =>
// // //                 MobileVerificationPage(mobile: mobileController.text.trim()),
// // //           ),
// // //         );
// // //       }
// // //       return;
// // //     } on FirebaseAuthException catch (e) {
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         e.message ?? "Signup failed",
// // //         bgColor: Colors.red,
// // //       );
// // //     }

// // //     setState(() => isLoading = false);
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           SizedBox.expand(
// // //             child: Image.asset(
// // //               "assets/signupbackground.png",
// // //               fit: BoxFit.cover,
// // //             ),
// // //           ),
// // //           Center(
// // //             child: SingleChildScrollView(
// // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // //               child: Column(
// // //                 children: [
// // //                   const SizedBox(height: 60),
// // //                   const Text(
// // //                     "Create Account",
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
// // //                         _buildField(nameController, "Name", Icons.person),
// // //                         _buildField(emailController, "Email", Icons.email),
// // //                         _buildPasswordField(),
// // //                         _buildPasswordTips(),
// // //                         _buildField(
// // //                           mobileController,
// // //                           "Mobile",
// // //                           Icons.phone,
// // //                         ), // kept field
// // //                         _buildField(addressController, "Address", Icons.home),
// // //                         _buildDatePicker(),
// // //                         Row(
// // //                           children: [
// // //                             Checkbox(value: isTermsAccepted, onChanged: null),
// // //                             GestureDetector(
// // //                               onTap: _showTermsDialog,
// // //                               child: const Text(
// // //                                 "View & Accept Terms & Conditions",
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF9B5F4D),
// // //                                   fontWeight: FontWeight.w600,
// // //                                   decoration: TextDecoration.underline,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                         const SizedBox(height: 20),
// // //                         ElevatedButton(
// // //                           onPressed: isLoading ? null : handleSignUp,
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
// // //                                   "   Sign Up   ",
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
// // //                             const Text("Already have an account? "),
// // //                             GestureDetector(
// // //                               onTap: () {
// // //                                 Navigator.pushReplacement(
// // //                                   context,
// // //                                   MaterialPageRoute(
// // //                                     builder: (_) => const LoginPage(),
// // //                                   ),
// // //                                 );
// // //                               },
// // //                               child: const Text(
// // //                                 "Log In",
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

// // //   Widget _buildField(TextEditingController ctrl, String hint, IconData icon) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 14),
// // //       child: TextField(
// // //         controller: ctrl,
// // //         decoration: InputDecoration(
// // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // //           hintText: hint,
// // //           filled: true,
// // //           fillColor: Colors.grey.shade100,
// // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildPasswordField() {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 14),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           TextField(
// // //             controller: passwordController,
// // //             obscureText: !isPasswordVisible,
// // //             onChanged: (value) {
// // //               setState(() {
// // //                 passwordStrength = PasswordStrengthChecker.checkPassword(value);
// // //               });
// // //             },
// // //             decoration: InputDecoration(
// // //               prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // //               suffixIcon: IconButton(
// // //                 icon: Icon(
// // //                   isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// // //                   color: const Color(0xFF9B5F4D),
// // //                 ),
// // //                 onPressed: () {
// // //                   setState(() {
// // //                     isPasswordVisible = !isPasswordVisible;
// // //                   });
// // //                 },
// // //               ),
// // //               hintText: "Password",
// // //               filled: true,
// // //               fillColor: Colors.grey.shade100,
// // //               border: OutlineInputBorder(
// // //                 borderRadius: BorderRadius.circular(24),
// // //               ),
// // //             ),
// // //           ),
// // //           if (passwordController.text.isNotEmpty)
// // //             Padding(
// // //               padding: const EdgeInsets.only(top: 8),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Row(
// // //                     children: [
// // //                       Expanded(
// // //                         child: ClipRRect(
// // //                           borderRadius: BorderRadius.circular(4),
// // //                           child: LinearProgressIndicator(
// // //                             value: (passwordStrength.index + 1) / 5,
// // //                             minHeight: 6,
// // //                             backgroundColor: Colors.grey.shade300,
// // //                             valueColor: AlwaysStoppedAnimation<Color>(
// // //                               PasswordStrengthChecker.getStrengthColor(
// // //                                 passwordStrength,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 8),
// // //                       Text(
// // //                         PasswordStrengthChecker.getStrengthText(
// // //                           passwordStrength,
// // //                         ),
// // //                         style: TextStyle(
// // //                           fontSize: 12,
// // //                           fontWeight: FontWeight.w600,
// // //                           color: PasswordStrengthChecker.getStrengthColor(
// // //                             passwordStrength,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildPasswordTips() {
// // //     return Container(
// // //       padding: const EdgeInsets.all(14),
// // //       margin: const EdgeInsets.only(bottom: 14),
// // //       decoration: BoxDecoration(
// // //         borderRadius: BorderRadius.circular(16),
// // //         color: const Color(0xFFFFF8E1),
// // //         border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: const Color(0xFFFFB74D).withOpacity(0.15),
// // //             blurRadius: 8,
// // //             offset: const Offset(0, 2),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Row(
// // //             children: [
// // //               const Text('💡', style: TextStyle(fontSize: 18)),
// // //               const SizedBox(width: 8),
// // //               Text(
// // //                 'Tips for a Strong Password',
// // //                 style: TextStyle(
// // //                   fontSize: 13,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: const Color(0xFF9B5F4D),
// // //                   letterSpacing: 0.3,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           const SizedBox(height: 10),
// // //           ...[
// // //             ('✓ At least 8 characters', Icons.text_fields),
// // //             ('✓ Uppercase & lowercase letters', Icons.text_rotation_none),
// // //             ('✓ Numbers (0–9)', Icons.numbers),
// // //             ('✓ Symbols: @, #, \$, %, !, etc.', Icons.security),
// // //           ].map(
// // //             (item) => Padding(
// // //               padding: const EdgeInsets.only(bottom: 7),
// // //               child: Row(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Icon(item.$2, size: 16, color: const Color(0xFFFFB74D)),
// // //                   const SizedBox(width: 10),
// // //                   Expanded(
// // //                     child: Text(
// // //                       item.$1,
// // //                       style: const TextStyle(
// // //                         fontSize: 12,
// // //                         color: Color(0xFF5D4037),
// // //                         fontWeight: FontWeight.w500,
// // //                         height: 1.4,
// // //                       ),
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

// // //   Widget _buildDatePicker() {
// // //     return GestureDetector(
// // //       onTap: () async {
// // //         DateTime? date = await showDatePicker(
// // //           context: context,
// // //           initialDate: DateTime(2000),
// // //           firstDate: DateTime(1960),
// // //           lastDate: DateTime.now(),
// // //         );
// // //         if (date != null) setState(() => selectedDate = date);
// // //       },
// // //       child: Container(
// // //         margin: const EdgeInsets.only(bottom: 14),
// // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // //         decoration: BoxDecoration(
// // //           borderRadius: BorderRadius.circular(24),
// // //           color: Colors.grey.shade100,
// // //         ),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             Text(
// // //               selectedDate == null
// // //                   ? "Select Date of Birth"
// // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // //             ),
// // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/SignUpController.dart';
// // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // import 'package:mentalwellapp/view/EmailVerificationPage.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // import 'package:mentalwellapp/view/MobileVerificationPage.dart';
// // import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

// // class SignUpPage extends StatefulWidget {
// //   const SignUpPage({super.key});

// //   @override
// //   State<SignUpPage> createState() => _SignUpPageState();
// // }

// // class _SignUpPageState extends State<SignUpPage> {
// //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController mobileController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();

// //   DateTime? selectedDate;
// //   bool isTermsAccepted = false;
// //   bool isPasswordVisible = false;
// //   bool isLoading = false;
// //   PasswordStrength passwordStrength = PasswordStrength.veryWeak;

// //   // ================= TERMS & CONDITIONS =================
// //   Future<void> _showTermsDialog() async {
// //     bool dialogAccepted = false;

// //     await showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (_) {
// //         return StatefulBuilder(
// //           builder: (context, setDialogState) {
// //             return AlertDialog(
// //               title: const Text(
// //                 "Terms & Conditions",
// //                 style: TextStyle(fontWeight: FontWeight.bold),
// //               ),
// //               content: SizedBox(
// //                 height: 260,
// //                 child: SingleChildScrollView(
// //                   child: const Text(
// //                     "Last Updated: January 2026\n\n"
// //                     "Welcome to MentalWell.\n\n"
// //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// //                     "3. Personal data is securely stored using Firebase.\n\n"
// //                     "4. Misuse, reverse engineering, or unauthorized access is prohibited.\n\n"
// //                     "5. MentalWell may remove harmful content without notice.\n\n"
// //                     "6. Services may change or discontinue at any time.\n\n"
// //                     "By clicking Accept, you agree to these terms.",
// //                     style: TextStyle(fontSize: 14),
// //                   ),
// //                 ),
// //               ),
// //               actions: [
// //                 Row(
// //                   children: [
// //                     Checkbox(
// //                       value: dialogAccepted,
// //                       onChanged: (val) {
// //                         setDialogState(() => dialogAccepted = val!);
// //                       },
// //                     ),
// //                     const Expanded(
// //                       child: Text("I agree to the Terms & Conditions"),
// //                     ),
// //                   ],
// //                 ),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: SizedBox(
// //                     width: 120,
// //                     child: ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.black,
// //                         foregroundColor: Colors.white,
// //                       ),
// //                       onPressed: dialogAccepted
// //                           ? () {
// //                               setState(() => isTermsAccepted = true);
// //                               Navigator.pop(context);
// //                             }
// //                           : null,
// //                       child: const Text("Accept"),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   // ================= SIGN UP =================
// //   Future<void> handleSignUp() async {
// //     if (nameController.text.isEmpty ||
// //         emailController.text.isEmpty ||
// //         passwordController.text.isEmpty ||
// //         mobileController.text.isEmpty ||
// //         addressController.text.isEmpty ||
// //         selectedDate == null) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Please fill all fields",
// //         bgColor: Colors.red,
// //       );
// //       return;
// //     }

// //     if (!isTermsAccepted) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Please accept Terms & Conditions",
// //         bgColor: Colors.red,
// //       );
// //       return;
// //     }

// //     setState(() => isLoading = true);

// //     try {
// //       UserCredential userCred = await firebaseAuth
// //           .createUserWithEmailAndPassword(
// //             email: emailController.text.trim(),
// //             password: passwordController.text.trim(),
// //           );

// //       User user = userCred.user!;

// //       // ✅ Send verification email
// //       await user.sendEmailVerification();

// //       // ❌ DON'T SIGN OUT

// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "📩 Verification email sent!",
// //         bgColor: Colors.green,
// //       );

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (_) => EmailVerificationPage(
// //             name: nameController.text.trim(),
// //             email: emailController.text.trim(),
// //             mobile: mobileController.text.trim(),
// //             address: addressController.text.trim(),
// //             dob: selectedDate!,
// //             termsAccepted: true,
// //           ),
// //         ),
// //       );
// //     } catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Signup failed",
// //         bgColor: Colors.red,
// //       );
// //     }

// //     setState(() => isLoading = false);
// //   }

// //   // ================= UI =================
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           SizedBox.expand(
// //             child: Image.asset(
// //               "assets/signupbackground.png",
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Center(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.symmetric(horizontal: 26),
// //               child: Column(
// //                 children: [
// //                   const SizedBox(height: 60),
// //                   const Text(
// //                     "Create Account",
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
// //                         _buildField(nameController, "Name", Icons.person),
// //                         _buildField(emailController, "Email", Icons.email),
// //                         _buildPasswordField(),
// //                         _buildPasswordTips(),
// //                         _buildField(
// //                           mobileController,
// //                           "Mobile",
// //                           Icons.phone,
// //                         ), // kept field
// //                         _buildField(addressController, "Address", Icons.home),
// //                         _buildDatePicker(),
// //                         Row(
// //                           children: [
// //                             Checkbox(value: isTermsAccepted, onChanged: null),
// //                             GestureDetector(
// //                               onTap: _showTermsDialog,
// //                               child: const Text(
// //                                 "View & Accept Terms & Conditions",
// //                                 style: TextStyle(
// //                                   color: Color(0xFF9B5F4D),
// //                                   fontWeight: FontWeight.w600,
// //                                   decoration: TextDecoration.underline,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),
// //                         ElevatedButton(
// //                           onPressed: isLoading ? null : handleSignUp,
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
// //                                   "   Sign Up   ",
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
// //                             const Text("Already have an account? "),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 User? currentUser =
// //                                     FirebaseAuth.instance.currentUser;

// //                                 if (currentUser != null &&
// //                                     currentUser.emailVerified) {
// //                                   // ✅ Already verified user → go to home
// //                                   Navigator.pushReplacement(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                       builder: (_) => const LoginPage(),
// //                                     ),
// //                                   );
// //                                 } else {
// //                                   Snackbarscreen().showCustomSnackBar(
// //                                     context,
// //                                     "Please verify your email first",
// //                                     bgColor: Colors.orange,
// //                                   );
// //                                 }
// //                               },
// //                               child: const Text(
// //                                 "Log In",
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

// //   Widget _buildField(TextEditingController ctrl, String hint, IconData icon) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 14),
// //       child: TextField(
// //         controller: ctrl,
// //         decoration: InputDecoration(
// //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// //           hintText: hint,
// //           filled: true,
// //           fillColor: Colors.grey.shade100,
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildPasswordField() {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 14),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           TextField(
// //             controller: passwordController,
// //             obscureText: !isPasswordVisible,
// //             onChanged: (value) {
// //               setState(() {
// //                 passwordStrength = PasswordStrengthChecker.checkPassword(value);
// //               });
// //             },
// //             decoration: InputDecoration(
// //               prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// //               suffixIcon: IconButton(
// //                 icon: Icon(
// //                   isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// //                   color: const Color(0xFF9B5F4D),
// //                 ),
// //                 onPressed: () {
// //                   setState(() {
// //                     isPasswordVisible = !isPasswordVisible;
// //                   });
// //                 },
// //               ),
// //               hintText: "Password",
// //               filled: true,
// //               fillColor: Colors.grey.shade100,
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(24),
// //               ),
// //             ),
// //           ),
// //           if (passwordController.text.isNotEmpty)
// //             Padding(
// //               padding: const EdgeInsets.only(top: 8),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(4),
// //                           child: LinearProgressIndicator(
// //                             value: (passwordStrength.index + 1) / 5,
// //                             minHeight: 6,
// //                             backgroundColor: Colors.grey.shade300,
// //                             valueColor: AlwaysStoppedAnimation<Color>(
// //                               PasswordStrengthChecker.getStrengthColor(
// //                                 passwordStrength,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 8),
// //                       Text(
// //                         PasswordStrengthChecker.getStrengthText(
// //                           passwordStrength,
// //                         ),
// //                         style: TextStyle(
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w600,
// //                           color: PasswordStrengthChecker.getStrengthColor(
// //                             passwordStrength,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPasswordTips() {
// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       margin: const EdgeInsets.only(bottom: 14),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(16),
// //         color: const Color(0xFFFFF8E1),
// //         border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
// //         boxShadow: [
// //           BoxShadow(
// //             color: const Color(0xFFFFB74D).withOpacity(0.15),
// //             blurRadius: 8,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               const Text('💡', style: TextStyle(fontSize: 18)),
// //               const SizedBox(width: 8),
// //               Text(
// //                 'Tips for a Strong Password',
// //                 style: TextStyle(
// //                   fontSize: 13,
// //                   fontWeight: FontWeight.bold,
// //                   color: const Color(0xFF9B5F4D),
// //                   letterSpacing: 0.3,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           ...[
// //             ('✓ At least 8 characters', Icons.text_fields),
// //             ('✓ Uppercase & lowercase letters', Icons.text_rotation_none),
// //             ('✓ Numbers (0–9)', Icons.numbers),
// //             ('✓ Symbols: @, #, \$, %, !, etc.', Icons.security),
// //           ].map(
// //             (item) => Padding(
// //               padding: const EdgeInsets.only(bottom: 7),
// //               child: Row(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Icon(item.$2, size: 16, color: const Color(0xFFFFB74D)),
// //                   const SizedBox(width: 10),
// //                   Expanded(
// //                     child: Text(
// //                       item.$1,
// //                       style: const TextStyle(
// //                         fontSize: 12,
// //                         color: Color(0xFF5D4037),
// //                         fontWeight: FontWeight.w500,
// //                         height: 1.4,
// //                       ),
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

// //   Widget _buildDatePicker() {
// //     return GestureDetector(
// //       onTap: () async {
// //         DateTime? date = await showDatePicker(
// //           context: context,
// //           initialDate: DateTime(2000),
// //           firstDate: DateTime(1960),
// //           lastDate: DateTime.now(),
// //         );
// //         if (date != null) setState(() => selectedDate = date);
// //       },
// //       child: Container(
// //         margin: const EdgeInsets.only(bottom: 14),
// //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(24),
// //           color: Colors.grey.shade100,
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(
// //               selectedDate == null
// //                   ? "Select Date of Birth"
// //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// //             ),
// //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/EmailVerificationPage.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:mentalwellapp/view/MobileVerificationPage.dart';
// import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();

//   DateTime? selectedDate;
//   bool isTermsAccepted = false;
//   bool isPasswordVisible = false;
//   bool isLoading = false;
//   PasswordStrength passwordStrength = PasswordStrength.veryWeak;

//   // ================= TERMS & CONDITIONS =================
//   Future<void> _showTermsDialog() async {
//     bool dialogAccepted = false;

//     await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setDialogState) {
//             return AlertDialog(
//               title: const Text(
//                 "Terms & Conditions",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               content: SizedBox(
//                 height: 260,
//                 child: SingleChildScrollView(
//                   child: const Text(
//                     "Last Updated: January 2026\n\n"
//                     "Welcome to MentalWell.\n\n"
//                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
//                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
//                     "3. Personal data is securely stored using Firebase.\n\n"
//                     "4. Misuse, reverse engineering, or unauthorized access is prohibited.\n\n"
//                     "5. MentalWell may remove harmful content without notice.\n\n"
//                     "6. Services may change or discontinue at any time.\n\n"
//                     "By clicking Accept, you agree to these terms.",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//               actions: [
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: dialogAccepted,
//                       onChanged: (val) {
//                         setDialogState(() => dialogAccepted = val!);
//                       },
//                     ),
//                     const Expanded(
//                       child: Text("I agree to the Terms & Conditions"),
//                     ),
//                   ],
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: SizedBox(
//                     width: 120,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                       ),
//                       onPressed: dialogAccepted
//                           ? () {
//                               setState(() => isTermsAccepted = true);
//                               Navigator.pop(context);
//                             }
//                           : null,
//                       child: const Text("Accept"),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   // ================= SIGN UP =================
//   Future<void> handleSignUp() async {
//     if (nameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         mobileController.text.isEmpty ||
//         addressController.text.isEmpty ||
//         selectedDate == null) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Please fill all fields",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     if (!isTermsAccepted) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Please accept Terms & Conditions",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       UserCredential userCred = await firebaseAuth
//           .createUserWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: passwordController.text.trim(),
//           );

//       User user = userCred.user!;
//       await user.sendEmailVerification();

//       final model = AccountTypeModelFull(
//         userId: user.uid,
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         mobile: mobileController.text.trim(),
//         address: addressController.text.trim(),
//         dob: selectedDate!.toIso8601String(),
//         profileImage: "",
//         accountType: "User",
//         termsAccepted: true,
//         termsAcceptedAt: DateTime.now().toIso8601String(),
//         mobileVerified: false,
//         termsVersion: "January 2026",
//       );

//       await SignupController().saveFullUserProfile(model);
//       await SignupController().saveTermsAcceptance(user.uid);

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "📩 Verification email sent!",
//         bgColor: Colors.green,
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => EmailVerificationPage(
//             name: nameController.text.trim(),
//             email: emailController.text.trim(),
//             mobile: mobileController.text.trim(),
//             address: addressController.text.trim(),
//             dob: selectedDate!,
//             termsAccepted: true,
//           ),
//         ),
//       );
//     } catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Signup failed",
//         bgColor: Colors.red,
//       );
//     }

//     setState(() => isLoading = false);
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox.expand(
//             child: Image.asset(
//               "assets/signupbackground.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 26),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 60),
//                   const Text(
//                     "Create Account",
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
//                         _buildField(nameController, "Name", Icons.person),
//                         _buildField(emailController, "Email", Icons.email),
//                         _buildPasswordField(),
//                         _buildPasswordTips(),
//                         _buildField(
//                           mobileController,
//                           "Mobile",
//                           Icons.phone,
//                         ), // kept field
//                         _buildField(addressController, "Address", Icons.home),
//                         _buildDatePicker(),
//                         Row(
//                           children: [
//                             Checkbox(value: isTermsAccepted, onChanged: null),
//                             GestureDetector(
//                               onTap: _showTermsDialog,
//                               child: const Text(
//                                 "View & Accept Terms & Conditions",
//                                 style: TextStyle(
//                                   color: Color(0xFF9B5F4D),
//                                   fontWeight: FontWeight.w600,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: isLoading ? null : handleSignUp,
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
//                                   "   Sign Up   ",
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
//                             const Text("Already have an account? "),
//                             GestureDetector(
//                               onTap: () {
//                                 User? currentUser =
//                                     FirebaseAuth.instance.currentUser;

//                                 if (currentUser != null &&
//                                     currentUser.emailVerified) {
//                                   // ✅ Already verified user → go to home
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) => const LoginPage(),
//                                     ),
//                                   );
//                                 } else {
//                                   Snackbarscreen().showCustomSnackBar(
//                                     context,
//                                     "Please verify your email first",
//                                     bgColor: Colors.orange,
//                                   );
//                                 }
//                               },
//                               child: const Text(
//                                 "Log In",
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

//   Widget _buildField(TextEditingController ctrl, String hint, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: TextField(
//         controller: ctrl,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
//           hintText: hint,
//           filled: true,
//           fillColor: Colors.grey.shade100,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
//         ),
//       ),
//     );
//   }

//   Widget _buildPasswordField() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             controller: passwordController,
//             obscureText: !isPasswordVisible,
//             onChanged: (value) {
//               setState(() {
//                 passwordStrength = PasswordStrengthChecker.checkPassword(value);
//               });
//             },
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                   color: const Color(0xFF9B5F4D),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isPasswordVisible = !isPasswordVisible;
//                   });
//                 },
//               ),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.grey.shade100,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(24),
//               ),
//             ),
//           ),
//           if (passwordController.text.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(4),
//                           child: LinearProgressIndicator(
//                             value: (passwordStrength.index + 1) / 5,
//                             minHeight: 6,
//                             backgroundColor: Colors.grey.shade300,
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                               PasswordStrengthChecker.getStrengthColor(
//                                 passwordStrength,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         PasswordStrengthChecker.getStrengthText(
//                           passwordStrength,
//                         ),
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: PasswordStrengthChecker.getStrengthColor(
//                             passwordStrength,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPasswordTips() {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       margin: const EdgeInsets.only(bottom: 14),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: const Color(0xFFFFF8E1),
//         border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFFFB74D).withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Text('💡', style: TextStyle(fontSize: 18)),
//               const SizedBox(width: 8),
//               Text(
//                 'Tips for a Strong Password',
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF9B5F4D),
//                   letterSpacing: 0.3,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           ...[
//             ('✓ At least 8 characters', Icons.text_fields),
//             ('✓ Uppercase & lowercase letters', Icons.text_rotation_none),
//             ('✓ Numbers (0–9)', Icons.numbers),
//             ('✓ Symbols: @, #, \$, %, !, etc.', Icons.security),
//           ].map(
//             (item) => Padding(
//               padding: const EdgeInsets.only(bottom: 7),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Icon(item.$2, size: 16, color: const Color(0xFFFFB74D)),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       item.$1,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Color(0xFF5D4037),
//                         fontWeight: FontWeight.w500,
//                         height: 1.4,
//                       ),
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

//   Widget _buildDatePicker() {
//     return GestureDetector(
//       onTap: () async {
//         DateTime? date = await showDatePicker(
//           context: context,
//           initialDate: DateTime(2000),
//           firstDate: DateTime(1960),
//           lastDate: DateTime.now(),
//         );
//         if (date != null) setState(() => selectedDate = date);
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 14),
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           color: Colors.grey.shade100,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               selectedDate == null
//                   ? "Select Date of Birth"
//                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
//             ),
//             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/controller/SignUpController.dart';
import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
import 'package:mentalwellapp/view/EmailVerificationPage.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SignupController signupController = SignupController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  DateTime? selectedDate;
  bool isTermsAccepted = false;
  bool isPasswordVisible = false;
  bool isLoading = false;
  PasswordStrength passwordStrength = PasswordStrength.veryWeak;

  Future<void> _showTermsDialog() async {
    bool dialogAccepted = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text(
                "Terms & Conditions",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: 260,
                child: SingleChildScrollView(
                  child: const Text(
                    "Last Updated: January 2026\n\n"
                    "Welcome to MentalWell.\n\n"
                    "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
                    "2. Users are responsible for the accuracy of the information they provide.\n\n"
                    "3. Personal data is securely stored using Firebase.\n\n"
                    "4. Misuse, reverse engineering, or unauthorized access is prohibited.\n\n"
                    "5. MentalWell may remove harmful content without notice.\n\n"
                    "6. Services may change or discontinue at any time.\n\n"
                    "By clicking Accept, you agree to these terms.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              actions: [
                Row(
                  children: [
                    Checkbox(
                      value: dialogAccepted,
                      onChanged: (val) {
                        setDialogState(() => dialogAccepted = val ?? false);
                      },
                    ),
                    const Expanded(
                      child: Text("I agree to the Terms & Conditions"),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: dialogAccepted
                          ? () {
                              setState(() => isTermsAccepted = true);
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text("Accept"),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> handleSignUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        mobileController.text.isEmpty ||
        addressController.text.isEmpty ||
        selectedDate == null) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Please fill all fields",
        bgColor: Colors.red,
      );
      return;
    }

    if (!isTermsAccepted) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Please accept Terms & Conditions",
        bgColor: Colors.red,
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final userCred = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCred.user!;
      await user.sendEmailVerification();

      final model = AccountTypeModelFull(
        userId: user.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address: addressController.text.trim(),
        dob: selectedDate!.toIso8601String(),
        profileImage: "",
        accountType: "User",
        termsAccepted: true,
        termsAcceptedAt: null,
        createdAt: null,
        lastSeenAt: null,
        mobileVerified: false,
        termsVersion: "January 2026",
      );

      await signupController.saveFullUserProfile(model);

      await signupController.firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set({
            "userId": user.uid,
            "name": nameController.text.trim(),
            "email": emailController.text.trim(),
            "mobile": mobileController.text.trim(),
            "address": addressController.text.trim(),
            "dob": selectedDate!.toIso8601String(),
            "profileImage": "",
            "accountType": "User",
            "termsAccepted": true,
            "termsAcceptedAt": FieldValue.serverTimestamp(),
            "createdAt": FieldValue.serverTimestamp(),
            "lastSeenAt": FieldValue.serverTimestamp(),
            "mobileVerified": false,
            "termsVersion": "January 2026",
          }, SetOptions(merge: true));

      await signupController.saveTermsAcceptance(user.uid);

      Snackbarscreen().showCustomSnackBar(
        context,
        "📩 Verification email sent!",
        bgColor: Colors.green,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EmailVerificationPage(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            mobile: mobileController.text.trim(),
            address: addressController.text.trim(),
            dob: selectedDate!,
            termsAccepted: true,
          ),
        ),
      );
    } catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Signup failed",
        bgColor: Colors.red,
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/signupbackground.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "Create Account",
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
                        _buildField(nameController, "Name", Icons.person),
                        _buildField(emailController, "Email", Icons.email),
                        _buildPasswordField(),
                        _buildPasswordTips(),
                        _buildField(mobileController, "Mobile", Icons.phone),
                        _buildField(addressController, "Address", Icons.home),
                        _buildDatePicker(),
                        Row(
                          children: [
                            Checkbox(value: isTermsAccepted, onChanged: null),
                            GestureDetector(
                              onTap: _showTermsDialog,
                              child: const Text(
                                "View & Accept Terms & Conditions",
                                style: TextStyle(
                                  color: Color(0xFF9B5F4D),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: isLoading ? null : handleSignUp,
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
                                  "   Sign Up   ",
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
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                User? currentUser =
                                    FirebaseAuth.instance.currentUser;

                                if (currentUser != null &&
                                    currentUser.emailVerified) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginPage(),
                                    ),
                                  );
                                } else {
                                  Snackbarscreen().showCustomSnackBar(
                                    context,
                                    "Please verify your email first",
                                    bgColor: Colors.orange,
                                  );
                                }
                              },
                              child: const Text(
                                "Log In",
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

  Widget _buildField(TextEditingController ctrl, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: passwordController,
            obscureText: !isPasswordVisible,
            onChanged: (value) {
              setState(() {
                passwordStrength = PasswordStrengthChecker.checkPassword(value);
              });
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
          if (passwordController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (passwordStrength.index + 1) / 5,
                        minHeight: 6,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          PasswordStrengthChecker.getStrengthColor(
                            passwordStrength,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    PasswordStrengthChecker.getStrengthText(passwordStrength),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: PasswordStrengthChecker.getStrengthColor(
                        passwordStrength,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPasswordTips() {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFFF8E1),
        border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('💡', style: TextStyle(fontSize: 18)),
              SizedBox(width: 8),
              Text(
                'Tips for a Strong Password',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9B5F4D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...[
            ('✓ At least 8 characters', Icons.text_fields),
            ('✓ Uppercase & lowercase letters', Icons.text_rotation_none),
            ('✓ Numbers (0–9)', Icons.numbers),
            ('✓ Symbols: @, #, \$, %, !, etc.', Icons.security),
          ].map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(item.$2, size: 16, color: const Color(0xFFFFB74D)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.$1,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5D4037),
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
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

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1960),
          lastDate: DateTime.now(),
        );
        if (date != null) setState(() => selectedDate = date);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? "Select Date of Birth"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
            const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
          ],
        ),
      ),
    );
  }
}
