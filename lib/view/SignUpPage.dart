import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/controller/SignUpController.dart';
import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/MobileVerificationPage.dart';
import 'package:mentalwellapp/utils/PasswordStrengthChecker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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

  // ================= TERMS & CONDITIONS =================
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
                        setDialogState(() => dialogAccepted = val!);
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

  // ================= SIGN UP =================
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

    // 🔹 Password strength validation
    String password = passwordController.text.trim();
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
    );

    if (!passwordRegex.hasMatch(password)) {
      Snackbarscreen().showCustomSnackBar(
        context,
        "Password must be at least 6 characters, "
        "include uppercase, lowercase, number, and special symbol.",
        bgColor: Colors.red,
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      // 🔹 Create Firebase user
      UserCredential userCred = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: password,
          );

      // 🔹 Prepare user data with mobile verification pending
      final user = AccountTypeModelFull(
        userId: userCred.user!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address: addressController.text.trim(),
        dob: selectedDate.toString(),
        profileImage: "",
        accountType: "User", // auto assign USER
        termsAccepted: true,
        termsAcceptedAt: DateTime.now().toIso8601String(),
        mobileVerified: false, // Will be set to true after OTP verification
      );

      // 🔹 Save terms acceptance and user data in Firestore
      await SignupController().saveTermsAcceptance(userCred.user!.uid);
      await SignupController().addData(
        "users",
        userCred.user!.uid,
        user.toMap(),
      );

      setState(() => isLoading = false);

      // 🔹 Navigate to OTP Verification Page
      if (mounted) {
        Snackbarscreen().showCustomSnackBar(
          context,
          "Account created! Now verify your mobile number with OTP.",
          bgColor: Colors.green,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                MobileVerificationPage(mobile: mobileController.text.trim()),
          ),
        );
      }
      return;
    } on FirebaseAuthException catch (e) {
      Snackbarscreen().showCustomSnackBar(
        context,
        e.message ?? "Signup failed",
        bgColor: Colors.red,
      );
    }

    setState(() => isLoading = false);
  }

  // ================= UI =================
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
                        _buildField(
                          mobileController,
                          "Mobile",
                          Icons.phone,
                        ), // kept field
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        PasswordStrengthChecker.getStrengthText(
                          passwordStrength,
                        ),
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
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB74D).withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💡', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                'Tips for a Strong Password',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF9B5F4D),
                  letterSpacing: 0.3,
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










// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';

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

//   String passwordStrength = '';
//   Color passwordStrengthColor = Colors.transparent;

//   @override
//   void initState() {
//     super.initState();
//     passwordController.addListener(_checkPasswordStrength);
//   }

//   @override
//   void dispose() {
//     passwordController.removeListener(_checkPasswordStrength);
//     super.dispose();
//   }

//   void _checkPasswordStrength() {
//     String password = passwordController.text;
//     int score = 0;

//     if (password.length >= 8) score++;
//     if (RegExp(r'\d').hasMatch(password)) score++;
//     if (RegExp(r'[A-Z]').hasMatch(password)) score++;
//     if (RegExp(r'[a-z]').hasMatch(password)) score++;
//     if (RegExp(r'[@$!%*?&#]').hasMatch(password)) score++;

//     setState(() {
//       if (score == 0) {
//         passwordStrength = '';
//         passwordStrengthColor = Colors.transparent;
//       } else if (score <= 2) {
//         passwordStrength = 'Weak';
//         passwordStrengthColor = Colors.orange;
//       } else if (score == 3) {
//         passwordStrength = 'Moderate';
//         passwordStrengthColor = Colors.yellow.shade700;
//       } else if (score == 4) {
//         passwordStrength = 'Strong';
//         passwordStrengthColor = Colors.green;
//       } else {
//         passwordStrength = 'Very Strong';
//         passwordStrengthColor = Colors.green.shade800;
//       }
//     });
//   }

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

//     // 🔹 Password strength validation
//     String password = passwordController.text.trim();
//     final passwordRegex = RegExp(
//       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
//     );

//     if (!passwordRegex.hasMatch(password)) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Password must be at least 6 characters, "
//         "include uppercase, lowercase, number, and special symbol.",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       // 🔹 Create Firebase user
//       UserCredential userCred = await firebaseAuth
//           .createUserWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: password,
//           );

//       // 🔹 Send email verification
//       await userCred.user!.sendEmailVerification();

//       // 🔹 Prepare user data (mobile is stored, no OTP check)
//       final user = AccountTypeModelFull(
//         userId: userCred.user!.uid,
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         mobile: mobileController.text.trim(),
//         address: addressController.text.trim(),
//         dob: selectedDate.toString(),
//         profileImage: "",
//         accountType: "User", // auto assign USER
//         termsAccepted: true,
//         termsAcceptedAt: DateTime.now().toIso8601String(),
//         mobileVerified: true,
//       );

//       // 🔹 Save terms acceptance and user data in Firestore
//       await SignupController().saveTermsAcceptance(userCred.user!.uid);
//       await SignupController().addData(
//         "users",
//         userCred.user!.uid,
//         user.toMap(),
//       );

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Account created. Verify your email before logging in.",
//         bgColor: Colors.green,
//       );

//       // 🔹 Navigate to Login Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         e.message ?? "Signup failed",
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
//                         const SizedBox(height: 4),
//                         const Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "💡 Tips for a Strong Password:\n"
//                             "• Use at least 8 characters\n"
//                             "• Include UPPERCASE and lowercase letters\n"
//                             "• Add numbers (0–9)\n"
//                             "• Use symbols like @, #, , %, etc.",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
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
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => const LoginPage(),
//                                   ),
//                                 );
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
//           if (passwordStrength.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Text(
//                 'Password Strength: $passwordStrength',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: passwordStrengthColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
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









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';

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

//     // 🔹 Password strength validation
//     String password = passwordController.text.trim();
//     final passwordRegex = RegExp(
//       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
//     );

//     if (!passwordRegex.hasMatch(password)) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Password must be at least 6 characters, "
//         "include uppercase, lowercase, number, and special symbol.",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       // 🔹 Create Firebase user
//       UserCredential userCred = await firebaseAuth
//           .createUserWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: password,
//           );

//       // 🔹 Send email verification
//       await userCred.user!.sendEmailVerification();

//       // 🔹 Prepare user data (mobile is stored, no OTP check)
//       final user = AccountTypeModelFull(
//         userId: userCred.user!.uid,
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         mobile: mobileController.text.trim(),
//         address: addressController.text.trim(),
//         dob: selectedDate.toString(),
//         profileImage: "",
//         accountType: "User", // auto assign USER
//         termsAccepted: true,
//         termsAcceptedAt: DateTime.now().toIso8601String(),
//         mobileVerified: true,
//       );

//       // 🔹 Save terms acceptance and user data in Firestore
//       await SignupController().saveTermsAcceptance(userCred.user!.uid);
//       await SignupController().addData(
//         "users",
//         userCred.user!.uid,
//         user.toMap(),
//       );

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Account created. Verify your email before logging in.",
//         bgColor: Colors.green,
//       );

//       // 🔹 Navigate to Login Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         e.message ?? "Signup failed",
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
//                         const SizedBox(height: 4),
//                         const Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Password must be 6+ chars, include uppercase, lowercase, number & special symbol",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
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
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => const LoginPage(),
//                                   ),
//                                 );
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
//       child: TextField(
//         controller: passwordController,
//         obscureText: !isPasswordVisible,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
//           suffixIcon: IconButton(
//             icon: Icon(
//               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//               color: const Color(0xFF9B5F4D),
//             ),
//             onPressed: () {
//               setState(() {
//                 isPasswordVisible = !isPasswordVisible;
//               });
//             },
//           ),
//           hintText: "Password",
//           filled: true,
//           fillColor: Colors.grey.shade100,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
//         ),
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









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';

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
//       // 🔹 Create Firebase user
//       UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // 🔹 Send email verification
//       await userCred.user!.sendEmailVerification();

//       // 🔹 Prepare user data (mobile is stored, no OTP check)
//       final user = AccountTypeModelFull(
//         userId: userCred.user!.uid,
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         mobile: mobileController.text.trim(),
//         address: addressController.text.trim(),
//         dob: selectedDate.toString(),
//         profileImage: "",
//         accountType: "User", // auto assign USER
//         termsAccepted: true,
//         termsAcceptedAt: DateTime.now().toIso8601String(), mobileVerified: true,
//       );

//       // 🔹 Save terms acceptance and user data in Firestore
//       await SignupController().saveTermsAcceptance(userCred.user!.uid);
//       await SignupController().addData("users", userCred.user!.uid, user.toMap());

//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Account created. Verify your email before logging in.",
//         bgColor: Colors.green,
//       );

//       // 🔹 Navigate to Login Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         e.message ?? "Signup failed",
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
//                         _buildField(mobileController, "Mobile", Icons.phone), // kept field
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
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(builder: (_) => const LoginPage()),
//                                 );
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
//       child: TextField(
//         controller: passwordController,
//         obscureText: !isPasswordVisible,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
//           suffixIcon: IconButton(
//             icon: Icon(
//               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//               color: const Color(0xFF9B5F4D),
//             ),
//             onPressed: () {
//               setState(() {
//                 isPasswordVisible = !isPasswordVisible;
//               });
//             },
//           ),
//           hintText: "Password",
//           filled: true,
//           fillColor: Colors.grey.shade100,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
//         ),
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


// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';

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

// // // //     setState(() => isLoading = true);

// // // //     try {
// // // //       UserCredential userCred = await firebaseAuth
// // // //           .createUserWithEmailAndPassword(
// // // //             email: emailController.text.trim(),
// // // //             password: passwordController.text.trim(),
// // // //           );

// // // //       final user = AccountTypeModelFull(
// // // //         userId: userCred.user!.uid,
// // // //         name: nameController.text.trim(),
// // // //         email: emailController.text.trim(),
// // // //         mobile: mobileController.text.trim(),
// // // //         address: addressController.text.trim(),
// // // //         dob: selectedDate.toString(),
// // // //         profileImage: "",
// // // //         termsAccepted: true,
// // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // //       );

// // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // //       // ✅ Auto assign account type as USER
// // // //       final userWithType = AccountTypeModelFull(
// // // //         userId: user.userId,
// // // //         name: user.name,
// // // //         email: user.email,
// // // //         mobile: user.mobile,
// // // //         address: user.address,
// // // //         dob: user.dob,
// // // //         profileImage: user.profileImage,
// // // //         accountType: "User", // ✅ AUTO ASSIGNED
// // // //         termsAccepted: user.termsAccepted,
// // // //         termsAcceptedAt: user.termsAcceptedAt,
// // // //       );

// // // //       // ✅ Save user directly to Firestore (users collection)
// // // //       await SignupController().addData(
// // // //         "users",
// // // //         userCred.user!.uid,
// // // //         userWithType.toMap(),
// // // //       );

// // // //       // ✅ Go to Login page
// // // //       Navigator.pushReplacement(
// // // //         context,
// // // //         MaterialPageRoute(builder: (_) => const LoginPage()),
// // // //       );
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
// // // //                         _buildField(mobileController, "Mobile", Icons.phone),
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
// // // //       child: TextField(
// // // //         controller: passwordController,
// // // //         obscureText: !isPasswordVisible,
// // // //         decoration: InputDecoration(
// // // //           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // // //           suffixIcon: IconButton(
// // // //             icon: Icon(
// // // //               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// // // //               color: const Color(0xFF9B5F4D),
// // // //             ),
// // // //             onPressed: () {
// // // //               setState(() {
// // // //                 isPasswordVisible = !isPasswordVisible;
// // // //               });
// // // //             },
// // // //           ),
// // // //           hintText: "Password",
// // // //           filled: true,
// // // //           fillColor: Colors.grey.shade100,
// // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // //         ),
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







// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/SignUpController.dart';
// // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';

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
// //                     "1. This app provides mental wellness support only.\n\n"
// //                     "2. Users are responsible for the accuracy of their data.\n\n"
// //                     "3. Personal data is securely stored using Firebase.\n\n"
// //                     "4. Unauthorized access is prohibited.\n\n"
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
// //       // 🔐 Create user
// //       UserCredential userCred = await firebaseAuth
// //           .createUserWithEmailAndPassword(
// //             email: emailController.text.trim(),
// //             password: passwordController.text.trim(),
// //           );

// //       // 📧 SEND EMAIL VERIFICATION LINK (NEW)
// //       await userCred.user!.sendEmailVerification();

// //       final userWithType = AccountTypeModelFull(
// //         userId: userCred.user!.uid,
// //         name: nameController.text.trim(),
// //         email: emailController.text.trim(),
// //         mobile: mobileController.text.trim(),
// //         address: addressController.text.trim(),
// //         dob: selectedDate.toString(),
// //         profileImage: "",
// //         accountType: "User", // AUTO ASSIGNED
// //         termsAccepted: true,
// //         termsAcceptedAt: DateTime.now().toIso8601String(),
// //         mobileVerified: false, // 🔐 REQUIRED FOR OTP FLOW
// //       );

// //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// //       // 💾 Save user to Firestore
// //       await SignupController().addData(
// //         "users",
// //         userCred.user!.uid,
// //         userWithType.toMap(),
// //       );

// //       // ✅ SUCCESS MESSAGE
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         "Verification link sent to your email. Please verify before login.",
// //         bgColor: Colors.green,
// //       );

// //       // ➡️ Go to Login (DO NOT LOG IN USER)
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (_) => const LoginPage()),
// //       );
// //     } on FirebaseAuthException catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //         context,
// //         e.message ?? "Signup failed",
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
// //                         _buildField(mobileController, "Mobile", Icons.phone),
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
// //                         // ================= Already have account section =================
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Text("Already have an account? "),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 Navigator.pushReplacement(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                     builder: (_) => const LoginPage(),
// //                                   ),
// //                                 );
// //                               },
// //                               child: const Text(
// //                                 "Login",
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
// //       child: TextField(
// //         controller: passwordController,
// //         obscureText: !isPasswordVisible,
// //         decoration: InputDecoration(
// //           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// //           suffixIcon: IconButton(
// //             icon: Icon(
// //               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// //               color: const Color(0xFF9B5F4D),
// //             ),
// //             onPressed: () {
// //               setState(() {
// //                 isPasswordVisible = !isPasswordVisible;
// //               });
// //             },
// //           ),
// //           hintText: "Password",
// //           filled: true,
// //           fillColor: Colors.grey.shade100,
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// //         ),
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









// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // import 'package:mentalwellapp/view/SnackbarScreen.dart';

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
// // //                     "1. This app provides mental wellness support only.\n\n"
// // //                     "2. Users are responsible for the accuracy of their data.\n\n"
// // //                     "3. Personal data is securely stored using Firebase.\n\n"
// // //                     "4. Unauthorized access is prohibited.\n\n"
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

// // //     setState(() => isLoading = true);

// // //     try {
// // //       // 🔐 Create user
// // //       UserCredential userCred = await firebaseAuth
// // //           .createUserWithEmailAndPassword(
// // //             email: emailController.text.trim(),
// // //             password: passwordController.text.trim(),
// // //           );

// // //       // 📧 SEND EMAIL VERIFICATION LINK (NEW)
// // //       await userCred.user!.sendEmailVerification();

// // //       final userWithType = AccountTypeModelFull(
// // //         userId: userCred.user!.uid,
// // //         name: nameController.text.trim(),
// // //         email: emailController.text.trim(),
// // //         mobile: mobileController.text.trim(),
// // //         address: addressController.text.trim(),
// // //         dob: selectedDate.toString(),
// // //         profileImage: "",
// // //         accountType: "User", // AUTO ASSIGNED
// // //         termsAccepted: true,
// // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // //         mobileVerified: false, // 🔐 REQUIRED FOR OTP FLOW
// // //       );

// // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // //       // 💾 Save user to Firestore
// // //       await SignupController().addData(
// // //         "users",
// // //         userCred.user!.uid,
// // //         userWithType.toMap(),
// // //       );

// // //       // ✅ SUCCESS MESSAGE
// // //       Snackbarscreen().showCustomSnackBar(
// // //         context,
// // //         "Verification link sent to your email. Please verify before login.",
// // //         bgColor: Colors.green,
// // //       );

// // //       // ➡️ Go to Login (DO NOT LOG IN USER)
// // //       Navigator.pushReplacement(
// // //         context,
// // //         MaterialPageRoute(builder: (_) => const LoginPage()),
// // //       );
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
// // //                         _buildField(mobileController, "Mobile", Icons.phone),
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
// // //       child: TextField(
// // //         controller: passwordController,
// // //         obscureText: !isPasswordVisible,
// // //         decoration: InputDecoration(
// // //           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // //           suffixIcon: IconButton(
// // //             icon: Icon(
// // //               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// // //               color: const Color(0xFF9B5F4D),
// // //             ),
// // //             onPressed: () {
// // //               setState(() {
// // //                 isPasswordVisible = !isPasswordVisible;
// // //               });
// // //             },
// // //           ),
// // //           hintText: "Password",
// // //           filled: true,
// // //           fillColor: Colors.grey.shade100,
// // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // //         ),
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








// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';

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

// // // //     setState(() => isLoading = true);

// // // //     try {
// // // //       UserCredential userCred = await firebaseAuth
// // // //           .createUserWithEmailAndPassword(
// // // //             email: emailController.text.trim(),
// // // //             password: passwordController.text.trim(),
// // // //           );

// // // //       final user = AccountTypeModelFull(
// // // //         userId: userCred.user!.uid,
// // // //         name: nameController.text.trim(),
// // // //         email: emailController.text.trim(),
// // // //         mobile: mobileController.text.trim(),
// // // //         address: addressController.text.trim(),
// // // //         dob: selectedDate.toString(),
// // // //         profileImage: "",
// // // //         termsAccepted: true,
// // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // //       );

// // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // //       // ✅ Auto assign account type as USER
// // // //       final userWithType = AccountTypeModelFull(
// // // //         userId: user.userId,
// // // //         name: user.name,
// // // //         email: user.email,
// // // //         mobile: user.mobile,
// // // //         address: user.address,
// // // //         dob: user.dob,
// // // //         profileImage: user.profileImage,
// // // //         accountType: "User", // ✅ AUTO ASSIGNED
// // // //         termsAccepted: user.termsAccepted,
// // // //         termsAcceptedAt: user.termsAcceptedAt,
// // // //       );

// // // //       // ✅ Save user directly to Firestore (users collection)
// // // //       await SignupController().addData(
// // // //         "users",
// // // //         userCred.user!.uid,
// // // //         userWithType.toMap(),
// // // //       );

// // // //       // ✅ Go to Login page
// // // //       Navigator.pushReplacement(
// // // //         context,
// // // //         MaterialPageRoute(builder: (_) => const LoginPage()),
// // // //       );
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
// // // //                         _buildField(mobileController, "Mobile", Icons.phone),
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
// // // //       child: TextField(
// // // //         controller: passwordController,
// // // //         obscureText: !isPasswordVisible,
// // // //         decoration: InputDecoration(
// // // //           prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B5F4D)),
// // // //           suffixIcon: IconButton(
// // // //             icon: Icon(
// // // //               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
// // // //               color: const Color(0xFF9B5F4D),
// // // //             ),
// // // //             onPressed: () {
// // // //               setState(() {
// // // //                 isPasswordVisible = !isPasswordVisible;
// // // //               });
// // // //             },
// // // //           ),
// // // //           hintText: "Password",
// // // //           filled: true,
// // // //           fillColor: Colors.grey.shade100,
// // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // //         ),
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






// // // // // import 'dart:ui';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // class SignUpPage extends StatefulWidget {
// // // // //   const SignUpPage({super.key});

// // // // //   @override
// // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // }

// // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// // // // //   final TextEditingController nameController = TextEditingController();
// // // // //   final TextEditingController emailController = TextEditingController();
// // // // //   final TextEditingController passwordController = TextEditingController();
// // // // //   final TextEditingController mobileController = TextEditingController();
// // // // //   final TextEditingController addressController = TextEditingController();

// // // // //   DateTime? selectedDate;
// // // // //   bool isTermsAccepted = false;

// // // // //   // ================= TERMS DIALOG =================
// // // // //   Future<void> _showTermsDialog() async {
// // // // //     bool dialogAccepted = false;

// // // // //     await showDialog(
// // // // //       context: context,
// // // // //       barrierDismissible: false,
// // // // //       builder: (_) {
// // // // //         return StatefulBuilder(
// // // // //           builder: (context, setDialogState) {
// // // // //             return AlertDialog(
// // // // //               title: const Text(
// // // // //                 "Terms & Conditions",
// // // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // // //               ),
// // // // //               content: SizedBox(
// // // // //                 height: 260,
// // // // //                 child: SingleChildScrollView(
// // // // //                   child: const Text(
// // // // //                     "Last Updated: January 2026\n\n"
// // // // //                     "Welcome to MentalWell.\n\n"
// // // // //                     "By using this application, you agree to the following terms:\n\n"
// // // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // // //                     "3. Personal data such as name and email is securely stored using Firebase.\n\n"
// // // // //                     "4. You agree not to misuse, reverse engineer, or attempt unauthorized access to the system.\n\n"
// // // // //                     "5. MentalWell is not responsible for user-generated content but may remove harmful content.\n\n"
// // // // //                     "6. Services may change or be discontinued without prior notice.\n\n"
// // // // //                     "By clicking Accept, you confirm that you have read and agreed to these terms.",
// // // // //                     style: TextStyle(fontSize: 14),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               actions: [
// // // // //                 Row(
// // // // //                   children: [
// // // // //                     Checkbox(
// // // // //                       value: dialogAccepted,
// // // // //                       onChanged: (val) {
// // // // //                         setDialogState(() => dialogAccepted = val!);
// // // // //                       },
// // // // //                     ),
// // // // //                     const Expanded(
// // // // //                       child: Text("I agree to the Terms & Conditions"),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //                 Align(
// // // // //                   alignment: Alignment.centerRight,
// // // // //                   child: SizedBox(
// // // // //                     width: 140,
// // // // //                     height: 42,
// // // // //                     child: ElevatedButton(
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: Colors.black87,
// // // // //                         foregroundColor: Colors.white,
// // // // //                       ),
// // // // //                       onPressed: dialogAccepted
// // // // //                           ? () {
// // // // //                               setState(() => isTermsAccepted = true);
// // // // //                               Navigator.pop(context);
// // // // //                             }
// // // // //                           : null,
// // // // //                       child: const Text("Accept"),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             );
// // // // //           },
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }

// // // // //   // ================= SIGN UP =================
// // // // //   Future<void> handleSignUp() async {
// // // // //     if (nameController.text.isEmpty ||
// // // // //         emailController.text.isEmpty ||
// // // // //         passwordController.text.isEmpty ||
// // // // //         mobileController.text.isEmpty ||
// // // // //         addressController.text.isEmpty ||
// // // // //         selectedDate == null) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Please fill all required fields",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     if (!isTermsAccepted) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         "Please accept Terms & Conditions",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     try {
// // // // //       UserCredential userCred = await firebaseAuth
// // // // //           .createUserWithEmailAndPassword(
// // // // //             email: emailController.text.trim(),
// // // // //             password: passwordController.text.trim(),
// // // // //           );

// // // // //       final user = AccountTypeModelFull(
// // // // //         userId: userCred.user!.uid,
// // // // //         name: nameController.text.trim(),
// // // // //         email: emailController.text.trim(),
// // // // //         mobile: mobileController.text.trim(),
// // // // //         address: addressController.text.trim(),
// // // // //         dob: selectedDate.toString(),
// // // // //         profileImage: "", // ✅ image removed
// // // // //         termsAccepted: true,
// // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // //       );

// // // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // // //       Navigator.pushReplacement(
// // // // //         context,
// // // // //         MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)),
// // // // //       );
// // // // //     } on FirebaseAuthException catch (e) {
// // // // //       Snackbarscreen().showCustomSnackBar(
// // // // //         context,
// // // // //         e.message ?? "Signup failed",
// // // // //         bgColor: Colors.red,
// // // // //       );
// // // // //     }
// // // // //   }

// // // // //   // ================= UI =================
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Stack(
// // // // //         children: [
// // // // //           SizedBox.expand(
// // // // //             child: Image.asset(
// // // // //               "assets/signupbackground.png",
// // // // //               fit: BoxFit.cover,
// // // // //             ),
// // // // //           ),
// // // // //           Center(
// // // // //             child: SingleChildScrollView(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // //               child: Column(
// // // // //                 children: [
// // // // //                   const SizedBox(height: 40),
// // // // //                   const Text(
// // // // //                     "MentalWell",
// // // // //                     style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
// // // // //                   ),
// // // // //                   const SizedBox(height: 20),
// // // // //                   ClipRRect(
// // // // //                     borderRadius: BorderRadius.circular(20),
// // // // //                     child: BackdropFilter(
// // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // //                       child: Container(
// // // // //                         padding: const EdgeInsets.all(24),
// // // // //                         decoration: BoxDecoration(
// // // // //                           color: Colors.white.withOpacity(0.2),
// // // // //                           borderRadius: BorderRadius.circular(20),
// // // // //                         ),
// // // // //                         child: Column(
// // // // //                           children: [
// // // // //                             _buildTextField(
// // // // //                               nameController,
// // // // //                               "Username",
// // // // //                               Icons.person,
// // // // //                             ),
// // // // //                             _buildTextField(
// // // // //                               emailController,
// // // // //                               "Email",
// // // // //                               Icons.email,
// // // // //                             ),
// // // // //                             _buildTextField(
// // // // //                               passwordController,
// // // // //                               "Password",
// // // // //                               Icons.lock,
// // // // //                               obscure: true,
// // // // //                             ),
// // // // //                             _buildTextField(
// // // // //                               mobileController,
// // // // //                               "Mobile",
// // // // //                               Icons.phone,
// // // // //                             ),
// // // // //                             _buildTextField(
// // // // //                               addressController,
// // // // //                               "Address",
// // // // //                               Icons.home,
// // // // //                             ),
// // // // //                             const SizedBox(height: 12),
// // // // //                             _buildDatePicker(),
// // // // //                             Row(
// // // // //                               children: [
// // // // //                                 Checkbox(
// // // // //                                   value: isTermsAccepted,
// // // // //                                   onChanged: null,
// // // // //                                 ),
// // // // //                                 GestureDetector(
// // // // //                                   onTap: _showTermsDialog,
// // // // //                                   child: const Text(
// // // // //                                     "View & Accept Terms & Conditions",
// // // // //                                     style: TextStyle(
// // // // //                                       color: Colors.blue,
// // // // //                                       decoration: TextDecoration.underline,
// // // // //                                     ),
// // // // //                                   ),
// // // // //                                 ),
// // // // //                               ],
// // // // //                             ),
// // // // //                             const SizedBox(height: 10),
// // // // //                             ElevatedButton(
// // // // //                               style: ElevatedButton.styleFrom(
// // // // //                                 backgroundColor: const Color(0xFF9B5F4D),
// // // // //                                 padding: const EdgeInsets.symmetric(
// // // // //                                   vertical: 12,
// // // // //                                   horizontal: 40,
// // // // //                                 ),
// // // // //                                 shape: RoundedRectangleBorder(
// // // // //                                   borderRadius: BorderRadius.circular(50),
// // // // //                                 ),
// // // // //                               ),
// // // // //                               onPressed: handleSignUp,
// // // // //                               child: const Text(
// // // // //                                 "Sign Up",
// // // // //                                 style: TextStyle(
// // // // //                                   fontSize: 20,
// // // // //                                   fontWeight: FontWeight.bold,
// // // // //                                   color: Colors.white,
// // // // //                                 ),
// // // // //                               ),
// // // // //                             ),
// // // // //                             const SizedBox(height: 16),
// // // // //                             Row(
// // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // //                               children: [
// // // // //                                 const Text("Already have an account? "),
// // // // //                                 GestureDetector(
// // // // //                                   onTap: () {
// // // // //                                     Navigator.pushReplacement(
// // // // //                                       context,
// // // // //                                       MaterialPageRoute(
// // // // //                                         builder: (_) => const LoginPage(),
// // // // //                                       ),
// // // // //                                     );
// // // // //                                   },
// // // // //                                   child: const Text(
// // // // //                                     "Log In",
// // // // //                                     style: TextStyle(
// // // // //                                       color: Color(0xFF9B5F4D),
// // // // //                                       fontWeight: FontWeight.bold,
// // // // //                                     ),
// // // // //                                   ),
// // // // //                                 ),
// // // // //                               ],
// // // // //                             ),
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
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

// // // // //   Widget _buildTextField(
// // // // //     TextEditingController ctrl,
// // // // //     String hint,
// // // // //     IconData icon, {
// // // // //     bool obscure = false,
// // // // //   }) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.only(bottom: 12),
// // // // //       child: TextField(
// // // // //         controller: ctrl,
// // // // //         obscureText: obscure,
// // // // //         decoration: InputDecoration(
// // // // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // // // //           hintText: hint,
// // // // //           filled: true,
// // // // //           fillColor: Colors.grey.shade100,
// // // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildDatePicker() {
// // // // //     return GestureDetector(
// // // // //       onTap: () async {
// // // // //         DateTime? date = await showDatePicker(
// // // // //           context: context,
// // // // //           initialDate: DateTime(2000),
// // // // //           firstDate: DateTime(1960),
// // // // //           lastDate: DateTime.now(),
// // // // //         );
// // // // //         if (date != null) setState(() => selectedDate = date);
// // // // //       },
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // //         decoration: BoxDecoration(
// // // // //           borderRadius: BorderRadius.circular(24),
// // // // //           color: Colors.grey.shade100,
// // // // //         ),
// // // // //         child: Row(
// // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //           children: [
// // // // //             Text(
// // // // //               selectedDate == null
// // // // //                   ? "Select Date of Birth"
// // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // //             ),
// // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }







// // // // // // import 'dart:ui';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';

// // // // // // class SignUpPage extends StatefulWidget {
// // // // // //   const SignUpPage({super.key});

// // // // // //   @override
// // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // }

// // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// // // // // //   final TextEditingController nameController = TextEditingController();
// // // // // //   final TextEditingController emailController = TextEditingController();
// // // // // //   final TextEditingController passwordController = TextEditingController();
// // // // // //   final TextEditingController mobileController = TextEditingController();
// // // // // //   final TextEditingController addressController = TextEditingController();

// // // // // //   DateTime? selectedDate;

// // // // // //   // 🔹 Terms & Conditions
// // // // // //   bool isTermsAccepted = false;

// // // // // //   // ================= TERMS DIALOG =================
// // // // // //   Future<void> _showTermsDialog() async {
// // // // // //     bool dialogAccepted = false;

// // // // // //     await showDialog(
// // // // // //       context: context,
// // // // // //       barrierDismissible: false,
// // // // // //       builder: (_) {
// // // // // //         return StatefulBuilder(
// // // // // //           builder: (context, setDialogState) {
// // // // // //             return AlertDialog(
// // // // // //               title: const Text(
// // // // // //                 "Terms & Conditions",
// // // // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // // // //               ),
// // // // // //               content: SizedBox(
// // // // // //                 height: 260,
// // // // // //                 child: SingleChildScrollView(
// // // // // //                   child: const Text(
// // // // // //                     "Last Updated: January 2026\n\n"
// // // // // //                     "Welcome to MentalWell.\n\n"
// // // // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // // // //                     "3. Personal data is securely stored using Firebase.\n\n"
// // // // // //                     "4. Unauthorized access or misuse of the system is prohibited.\n\n"
// // // // // //                     "5. MentalWell may remove harmful content.\n\n"
// // // // // //                     "By clicking Accept, you confirm that you agree to these terms.",
// // // // // //                     style: TextStyle(fontSize: 14),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               actions: [
// // // // // //                 Row(
// // // // // //                   children: [
// // // // // //                     Checkbox(
// // // // // //                       value: dialogAccepted,
// // // // // //                       onChanged: (val) {
// // // // // //                         setDialogState(() => dialogAccepted = val!);
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     const Expanded(
// // // // // //                       child: Text("I agree to the Terms & Conditions"),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 Align(
// // // // // //                   alignment: Alignment.centerRight,
// // // // // //                   child: ElevatedButton(
// // // // // //                     onPressed: dialogAccepted
// // // // // //                         ? () {
// // // // // //                             setState(() => isTermsAccepted = true);
// // // // // //                             Navigator.pop(context);
// // // // // //                           }
// // // // // //                         : null,
// // // // // //                     child: const Text("Accept"),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             );
// // // // // //           },
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }

// // // // // //   // ================= SIGN UP =================
// // // // // //   Future<void> handleSignUp() async {
// // // // // //     if (nameController.text.isEmpty ||
// // // // // //         emailController.text.isEmpty ||
// // // // // //         passwordController.text.isEmpty ||
// // // // // //         mobileController.text.isEmpty ||
// // // // // //         addressController.text.isEmpty ||
// // // // // //         selectedDate == null) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please fill all required fields",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     if (!isTermsAccepted) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please accept Terms & Conditions",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     try {
// // // // // //       UserCredential userCred = await firebaseAuth
// // // // // //           .createUserWithEmailAndPassword(
// // // // // //             email: emailController.text.trim(),
// // // // // //             password: passwordController.text.trim(),
// // // // // //           );

// // // // // //       final user = AccountTypeModelFull(
// // // // // //         userId: userCred.user!.uid,
// // // // // //         name: nameController.text.trim(),
// // // // // //         email: emailController.text.trim(),
// // // // // //         mobile: mobileController.text.trim(),
// // // // // //         address: addressController.text.trim(),
// // // // // //         dob: selectedDate!.toIso8601String(),
// // // // // //         profileImage: "",
// // // // // //         termsAccepted: true,
// // // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // // //         accountType: "User",
// // // // // //       );

// // // // // //       await SignupController().addData("users", user.userId, user.toMap());

// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Signup successful 🎉",
// // // // // //         bgColor: Colors.green,
// // // // // //       );

// // // // // //       Navigator.pushReplacementNamed(context, '/login');
// // // // // //     } on FirebaseAuthException catch (e) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         e.message ?? "Signup failed",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //     }
// // // // // //   }

// // // // // //   // ================= UI =================
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: Stack(
// // // // // //         children: [
// // // // // //           SizedBox.expand(
// // // // // //             child: Image.asset(
// // // // // //               "assets/signupbackground.png",
// // // // // //               fit: BoxFit.cover,
// // // // // //             ),
// // // // // //           ),
// // // // // //           Container(color: Colors.white.withOpacity(0.35)),
// // // // // //           Center(
// // // // // //             child: SingleChildScrollView(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
// // // // // //               child: Column(
// // // // // //                 children: [
// // // // // //                   const Text(
// // // // // //                     "MentalWell",
// // // // // //                     style: TextStyle(
// // // // // //                       fontSize: 38,
// // // // // //                       fontWeight: FontWeight.w800,
// // // // // //                       color: Colors.black87,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 20),
// // // // // //                   ClipRRect(
// // // // // //                     borderRadius: BorderRadius.circular(25),
// // // // // //                     child: BackdropFilter(
// // // // // //                       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// // // // // //                       child: Container(
// // // // // //                         padding: const EdgeInsets.all(24),
// // // // // //                         decoration: BoxDecoration(
// // // // // //                           color: Colors.white.withOpacity(0.3),
// // // // // //                           borderRadius: BorderRadius.circular(25),
// // // // // //                           border: Border.all(color: Colors.white54),
// // // // // //                         ),
// // // // // //                         child: Column(
// // // // // //                           children: [
// // // // // //                             _buildTextField(
// // // // // //                               nameController,
// // // // // //                               "Full Name",
// // // // // //                               Icons.person,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             _buildTextField(
// // // // // //                               emailController,
// // // // // //                               "Email",
// // // // // //                               Icons.email,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             _buildTextField(
// // // // // //                               passwordController,
// // // // // //                               "Password",
// // // // // //                               Icons.lock,
// // // // // //                               obscure: true,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             _buildTextField(
// // // // // //                               mobileController,
// // // // // //                               "Mobile",
// // // // // //                               Icons.phone,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             _buildTextField(
// // // // // //                               addressController,
// // // // // //                               "Address",
// // // // // //                               Icons.home,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             _buildDatePicker(),
// // // // // //                             const SizedBox(height: 10),

// // // // // //                             // 🔹 TERMS ROW
// // // // // //                             Row(
// // // // // //                               children: [
// // // // // //                                 Checkbox(
// // // // // //                                   value: isTermsAccepted,
// // // // // //                                   onChanged: null,
// // // // // //                                 ),
// // // // // //                                 GestureDetector(
// // // // // //                                   onTap: _showTermsDialog,
// // // // // //                                   child: const Text(
// // // // // //                                     "View & Accept Terms & Conditions",
// // // // // //                                     style: TextStyle(
// // // // // //                                       color: Colors.blue,
// // // // // //                                       decoration: TextDecoration.underline,
// // // // // //                                     ),
// // // // // //                                   ),
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),

// // // // // //                             const SizedBox(height: 20),
// // // // // //                             ElevatedButton(
// // // // // //                               onPressed: handleSignUp,
// // // // // //                               child: const Text("Sign Up"),
// // // // // //                             ),
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildTextField(
// // // // // //     TextEditingController ctrl,
// // // // // //     String hint,
// // // // // //     IconData icon, {
// // // // // //     bool obscure = false,
// // // // // //   }) {
// // // // // //     return TextField(
// // // // // //       controller: ctrl,
// // // // // //       obscureText: obscure,
// // // // // //       decoration: InputDecoration(
// // // // // //         prefixIcon: Icon(icon),
// // // // // //         hintText: hint,
// // // // // //         filled: true,
// // // // // //         border: OutlineInputBorder(
// // // // // //           borderRadius: BorderRadius.circular(26),
// // // // // //           borderSide: BorderSide.none,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ✅ SAFE DATE PICKER
// // // // // //   Widget _buildDatePicker() {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () async {
// // // // // //         DateTime? date = await showDatePicker(
// // // // // //           context: context,
// // // // // //           initialDate: DateTime(2000),
// // // // // //           firstDate: DateTime(1960),
// // // // // //           lastDate: DateTime.now(),
// // // // // //         );

// // // // // //         if (!mounted) return;

// // // // // //         if (date != null) {
// // // // // //           setState(() => selectedDate = date);
// // // // // //         }
// // // // // //       },
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // //         decoration: BoxDecoration(
// // // // // //           borderRadius: BorderRadius.circular(26),
// // // // // //           color: Colors.white.withOpacity(0.55),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               selectedDate == null
// // // // // //                   ? "Select Date of Birth"
// // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // //             ),
// // // // // //             const Icon(Icons.calendar_today),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }




// // // // // // import 'dart:convert';
// // // // // // import 'dart:ui';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // class SignUpPage extends StatefulWidget {
// // // // // //   const SignUpPage({super.key});

// // // // // //   @override
// // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // }

// // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// // // // // //   final TextEditingController nameController = TextEditingController();
// // // // // //   final TextEditingController emailController = TextEditingController();
// // // // // //   final TextEditingController passwordController = TextEditingController();
// // // // // //   final TextEditingController mobileController = TextEditingController();
// // // // // //   final TextEditingController addressController = TextEditingController();

// // // // // //   String? profileImageBase64;
// // // // // //   final ImagePicker picker = ImagePicker();
// // // // // //   DateTime? selectedDate;

// // // // // //   bool isTermsAccepted = false;

// // // // // //   // ================= IMAGE PICK (Web + Mobile SAFE) =================
// // // // // //   Future<void> _pickImage() async {
// // // // // //     try {
// // // // // //       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // //       if (pickedFile != null) {
// // // // // //         // 🔹 Read image as bytes (works on web)
// // // // // //         final bytes = await pickedFile.readAsBytes();
// // // // // //         setState(() {
// // // // // //           profileImageBase64 = base64Encode(bytes);
// // // // // //         });
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print("Image pick error: $e");
// // // // // //     }
// // // // // //   }

// // // // // //   // ================= TERMS DIALOG =================
// // // // // //   Future<void> _showTermsDialog() async {
// // // // // //     bool dialogAccepted = false;

// // // // // //     await showDialog(
// // // // // //       context: context,
// // // // // //       barrierDismissible: false,
// // // // // //       builder: (_) {
// // // // // //         return StatefulBuilder(
// // // // // //           builder: (context, setDialogState) {
// // // // // //             return AlertDialog(
// // // // // //               title: const Text(
// // // // // //                 "Terms & Conditions",
// // // // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // // // //               ),
// // // // // //               content: SizedBox(
// // // // // //                 height: 260,
// // // // // //                 child: SingleChildScrollView(
// // // // // //                   child: const Text(
// // // // // //                     "Last Updated: January 2026\n\n"
// // // // // //                     "Welcome to MentalWell.\n\n"
// // // // // //                     "By using this application, you agree to the following terms:\n\n"
// // // // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // // // //                     "3. Personal data such as name, email, and profile image is securely stored using Firebase.\n\n"
// // // // // //                     "4. You agree not to misuse, reverse engineer, or attempt unauthorized access to the system.\n\n"
// // // // // //                     "5. MentalWell is not responsible for user-generated content but may remove harmful content.\n\n"
// // // // // //                     "6. Services may change or be discontinued without prior notice.\n\n"
// // // // // //                     "By clicking Accept, you confirm that you have read and agreed to these terms.",
// // // // // //                     style: TextStyle(fontSize: 14),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               actions: [
// // // // // //                 Row(
// // // // // //                   children: [
// // // // // //                     Checkbox(
// // // // // //                       value: dialogAccepted,
// // // // // //                       onChanged: (val) {
// // // // // //                         setDialogState(() => dialogAccepted = val!);
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     const Expanded(
// // // // // //                       child: Text("I agree to the Terms & Conditions"),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 Align(
// // // // // //                   alignment: Alignment.centerRight,
// // // // // //                   child: SizedBox(
// // // // // //                     width: 140,
// // // // // //                     height: 42,
// // // // // //                     child: ElevatedButton(
// // // // // //                       style: ElevatedButton.styleFrom(
// // // // // //                         backgroundColor: Colors.black87,
// // // // // //                         foregroundColor: Colors.white,
// // // // // //                       ),
// // // // // //                       onPressed: dialogAccepted
// // // // // //                           ? () {
// // // // // //                               setState(() => isTermsAccepted = true);
// // // // // //                               Navigator.pop(context);
// // // // // //                             }
// // // // // //                           : null,
// // // // // //                       child: const Text("Accept"),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             );
// // // // // //           },
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }

// // // // // //   // ================= SIGN UP =================
// // // // // //   Future<void> handleSignUp() async {
// // // // // //     if (nameController.text.isEmpty ||
// // // // // //         emailController.text.isEmpty ||
// // // // // //         passwordController.text.isEmpty ||
// // // // // //         mobileController.text.isEmpty ||
// // // // // //         addressController.text.isEmpty ||
// // // // // //         selectedDate == null) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please fill all required fields",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     if (!isTermsAccepted) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please accept Terms & Conditions",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     try {
// // // // // //       // 1️⃣ Create Firebase Auth user
// // // // // //       UserCredential userCred = await firebaseAuth
// // // // // //           .createUserWithEmailAndPassword(
// // // // // //             email: emailController.text.trim(),
// // // // // //             password: passwordController.text.trim(),
// // // // // //           );

// // // // // //       // 2️⃣ Create user model
// // // // // //       final user = AccountTypeModelFull(
// // // // // //         userId: userCred.user!.uid,
// // // // // //         name: nameController.text.trim(),
// // // // // //         email: emailController.text.trim(),
// // // // // //         mobile: mobileController.text.trim(),
// // // // // //         address: addressController.text.trim(),
// // // // // //         dob: selectedDate.toString(),
// // // // // //         profileImage: profileImageBase64 ?? '',
// // // // // //         termsAccepted: true,
// // // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // // //       );

// // // // // //       // 3️⃣ Save to Firestore
// // // // // //       await FirebaseFirestore.instance
// // // // // //           .collection('users')
// // // // // //           .doc(user.userId)
// // // // // //           .set({
// // // // // //             'userId': user.userId,
// // // // // //             'name': user.name,
// // // // // //             'email': user.email,
// // // // // //             'mobile': user.mobile,
// // // // // //             'address': user.address,
// // // // // //             'dob': user.dob,
// // // // // //             'profileImageBase64': user.profileImage,
// // // // // //             'termsAccepted': user.termsAccepted,
// // // // // //             'termsAcceptedAt': user.termsAcceptedAt,
// // // // // //             'createdAt': DateTime.now(),
// // // // // //           });

// // // // // //       // 4️⃣ Optional: Save terms acceptance in your controller
// // // // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // // // //       // 5️⃣ Navigate to next page
// // // // // //       Navigator.pushReplacement(
// // // // // //         context,
// // // // // //         MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)),
// // // // // //       );
// // // // // //     } on FirebaseAuthException catch (e) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         e.message ?? "Signup failed",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //     }
// // // // // //   }

// // // // // //   // ================= UI =================
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: Stack(
// // // // // //         children: [
// // // // // //           SizedBox.expand(
// // // // // //             child: Image.asset(
// // // // // //               "assets/signupbackground.png",
// // // // // //               fit: BoxFit.cover,
// // // // // //             ),
// // // // // //           ),
// // // // // //           Center(
// // // // // //             child: SingleChildScrollView(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // //               child: Column(
// // // // // //                 children: [
// // // // // //                   const SizedBox(height: 40),
// // // // // //                   const Text(
// // // // // //                     "MentalWell",
// // // // // //                     style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 20),
// // // // // //                   ClipRRect(
// // // // // //                     borderRadius: BorderRadius.circular(20),
// // // // // //                     child: BackdropFilter(
// // // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // // //                       child: Container(
// // // // // //                         padding: const EdgeInsets.all(24),
// // // // // //                         decoration: BoxDecoration(
// // // // // //                           color: Colors.white.withOpacity(0.2),
// // // // // //                           borderRadius: BorderRadius.circular(20),
// // // // // //                         ),
// // // // // //                         child: Column(
// // // // // //                           children: [
// // // // // //                             GestureDetector(
// // // // // //                               onTap: _pickImage,
// // // // // //                               child: CircleAvatar(
// // // // // //                                 radius: 42,
// // // // // //                                 backgroundImage: profileImageBase64 != null
// // // // // //                                     ? MemoryImage(
// // // // // //                                         base64Decode(profileImageBase64!),
// // // // // //                                       )
// // // // // //                                     : null,
// // // // // //                                 child: profileImageBase64 == null
// // // // // //                                     ? const Icon(Icons.camera_alt)
// // // // // //                                     : null,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 20),
// // // // // //                             _buildTextField(
// // // // // //                               nameController,
// // // // // //                               "Username",
// // // // // //                               Icons.person,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               emailController,
// // // // // //                               "Email",
// // // // // //                               Icons.email,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               passwordController,
// // // // // //                               "Password",
// // // // // //                               Icons.lock,
// // // // // //                               obscure: true,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               mobileController,
// // // // // //                               "Mobile",
// // // // // //                               Icons.phone,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               addressController,
// // // // // //                               "Address",
// // // // // //                               Icons.home,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 12),
// // // // // //                             _buildDatePicker(),
// // // // // //                             Row(
// // // // // //                               children: [
// // // // // //                                 Checkbox(
// // // // // //                                   value: isTermsAccepted,
// // // // // //                                   onChanged: null,
// // // // // //                                 ),
// // // // // //                                 GestureDetector(
// // // // // //                                   onTap: _showTermsDialog,
// // // // // //                                   child: const Text(
// // // // // //                                     "View & Accept Terms & Conditions",
// // // // // //                                     style: TextStyle(
// // // // // //                                       color: Colors.blue,
// // // // // //                                       decoration: TextDecoration.underline,
// // // // // //                                     ),
// // // // // //                                   ),
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 10),
// // // // // //                             ElevatedButton(
// // // // // //                               style: ElevatedButton.styleFrom(
// // // // // //                                 backgroundColor: const Color(0xFF9B5F4D),
// // // // // //                                 padding: const EdgeInsets.symmetric(
// // // // // //                                   vertical: 12,
// // // // // //                                   horizontal: 40,
// // // // // //                                 ),
// // // // // //                                 shape: RoundedRectangleBorder(
// // // // // //                                   borderRadius: BorderRadius.circular(50),
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               onPressed: handleSignUp,
// // // // // //                               child: const Text(
// // // // // //                                 "Sign Up",
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 20,
// // // // // //                                   fontWeight: FontWeight.bold,
// // // // // //                                   color: Colors.white,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             Row(
// // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                               children: [
// // // // // //                                 const Text("Already have an account? "),
// // // // // //                                 GestureDetector(
// // // // // //                                   onTap: () {
// // // // // //                                     Navigator.pushReplacement(
// // // // // //                                       context,
// // // // // //                                       MaterialPageRoute(
// // // // // //                                         builder: (_) => const LoginPage(),
// // // // // //                                       ),
// // // // // //                                     );
// // // // // //                                   },
// // // // // //                                   child: const Text(
// // // // // //                                     "Log In",
// // // // // //                                     style: TextStyle(
// // // // // //                                       color: Color(0xFF9B5F4D),
// // // // // //                                       fontWeight: FontWeight.bold,
// // // // // //                                     ),
// // // // // //                                   ),
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ================= Helper Widgets =================
// // // // // //   Widget _buildTextField(
// // // // // //     TextEditingController ctrl,
// // // // // //     String hint,
// // // // // //     IconData icon, {
// // // // // //     bool obscure = false,
// // // // // //   }) {
// // // // // //     return Padding(
// // // // // //       padding: const EdgeInsets.only(bottom: 12),
// // // // // //       child: TextField(
// // // // // //         controller: ctrl,
// // // // // //         obscureText: obscure,
// // // // // //         decoration: InputDecoration(
// // // // // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // // // // //           hintText: hint,
// // // // // //           filled: true,
// // // // // //           fillColor: Colors.grey.shade100,
// // // // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildDatePicker() {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () async {
// // // // // //         DateTime? date = await showDatePicker(
// // // // // //           context: context,
// // // // // //           initialDate: DateTime(2000),
// // // // // //           firstDate: DateTime(1960),
// // // // // //           lastDate: DateTime.now(),
// // // // // //         );
// // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // //       },
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // //         decoration: BoxDecoration(
// // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // //           color: Colors.grey.shade100,
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               selectedDate == null
// // // // // //                   ? "Select Date of Birth"
// // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // //             ),
// // // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }






// // // // // // import 'dart:io';
// // // // // // import 'dart:ui';
// // // // // // import 'dart:convert';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // class SignUpPage extends StatefulWidget {
// // // // // //   const SignUpPage({super.key});

// // // // // //   @override
// // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // }

// // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// // // // // //   final TextEditingController nameController = TextEditingController();
// // // // // //   final TextEditingController emailController = TextEditingController();
// // // // // //   final TextEditingController passwordController = TextEditingController();
// // // // // //   final TextEditingController mobileController = TextEditingController();
// // // // // //   final TextEditingController addressController = TextEditingController();

// // // // // //   File? profileImage;
// // // // // //   final ImagePicker picker = ImagePicker();
// // // // // //   DateTime? selectedDate;

// // // // // //   bool isTermsAccepted = false;

// // // // // //   // ================= IMAGE PICK =================
// // // // // //   Future<void> _pickImage() async {
// // // // // //     try {
// // // // // //       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // //       if (pickedFile != null) {
// // // // // //         // 🔹 Debug print to check if image is picked correctly
// // // // // //         print("Picked image path: ${pickedFile.path}");

// // // // // //         setState(() {
// // // // // //           profileImage = File(pickedFile.path);
// // // // // //         });
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print("Image pick error: $e");
// // // // // //     }
// // // // // //   }

// // // // // //   // ================= TERMS DIALOG =================
// // // // // //   Future<void> _showTermsDialog() async {
// // // // // //     bool dialogAccepted = false;

// // // // // //     await showDialog(
// // // // // //       context: context,
// // // // // //       barrierDismissible: false,
// // // // // //       builder: (_) {
// // // // // //         return StatefulBuilder(
// // // // // //           builder: (context, setDialogState) {
// // // // // //             return AlertDialog(
// // // // // //               title: const Text(
// // // // // //                 "Terms & Conditions",
// // // // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // // // //               ),
// // // // // //               content: SizedBox(
// // // // // //                 height: 260,
// // // // // //                 child: SingleChildScrollView(
// // // // // //                   child: const Text(
// // // // // //                     "Last Updated: January 2026\n\n"
// // // // // //                     "Welcome to MentalWell.\n\n"
// // // // // //                     "By using this application, you agree to the following terms:\n\n"
// // // // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // // // //                     "3. Personal data such as name, email, and profile image is securely stored using Firebase.\n\n"
// // // // // //                     "4. You agree not to misuse, reverse engineer, or attempt unauthorized access to the system.\n\n"
// // // // // //                     "5. MentalWell is not responsible for user-generated content but may remove harmful content.\n\n"
// // // // // //                     "6. Services may change or be discontinued without prior notice.\n\n"
// // // // // //                     "By clicking Accept, you confirm that you have read and agreed to these terms.",
// // // // // //                     style: TextStyle(fontSize: 14),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               actions: [
// // // // // //                 Row(
// // // // // //                   children: [
// // // // // //                     Checkbox(
// // // // // //                       value: dialogAccepted,
// // // // // //                       onChanged: (val) {
// // // // // //                         setDialogState(() => dialogAccepted = val!);
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     const Expanded(
// // // // // //                       child: Text("I agree to the Terms & Conditions"),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 Align(
// // // // // //                   alignment: Alignment.centerRight,
// // // // // //                   child: SizedBox(
// // // // // //                     width: 140,
// // // // // //                     height: 42,
// // // // // //                     child: ElevatedButton(
// // // // // //                       style: ElevatedButton.styleFrom(
// // // // // //                         backgroundColor: Colors.black87,
// // // // // //                         foregroundColor: Colors.white,
// // // // // //                       ),
// // // // // //                       onPressed: dialogAccepted
// // // // // //                           ? () {
// // // // // //                               setState(() => isTermsAccepted = true);
// // // // // //                               Navigator.pop(context);
// // // // // //                             }
// // // // // //                           : null,
// // // // // //                       child: const Text("Accept"),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             );
// // // // // //           },
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }

// // // // // //   // ================= SIGN UP =================
// // // // // //   Future<void> handleSignUp() async {
// // // // // //     if (nameController.text.isEmpty ||
// // // // // //         emailController.text.isEmpty ||
// // // // // //         passwordController.text.isEmpty ||
// // // // // //         mobileController.text.isEmpty ||
// // // // // //         addressController.text.isEmpty ||
// // // // // //         selectedDate == null) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please fill all required fields",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     if (!isTermsAccepted) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         "Please accept Terms & Conditions",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     try {
// // // // // //       // 1️⃣ Create Firebase Auth user
// // // // // //       UserCredential userCred = await firebaseAuth
// // // // // //           .createUserWithEmailAndPassword(
// // // // // //             email: emailController.text.trim(),
// // // // // //             password: passwordController.text.trim(),
// // // // // //           );

// // // // // //       // 2️⃣ Convert profile image to Base64
// // // // // //       String imageBase64 = '';
// // // // // //       if (profileImage != null) {
// // // // // //         final bytes = await profileImage!.readAsBytes();
// // // // // //         imageBase64 = base64Encode(bytes);
// // // // // //       }

// // // // // //       // 3️⃣ Create user model
// // // // // //       final user = AccountTypeModelFull(
// // // // // //         userId: userCred.user!.uid,
// // // // // //         name: nameController.text.trim(),
// // // // // //         email: emailController.text.trim(),
// // // // // //         mobile: mobileController.text.trim(),
// // // // // //         address: addressController.text.trim(),
// // // // // //         dob: selectedDate.toString(),
// // // // // //         profileImage: imageBase64,
// // // // // //         termsAccepted: true,
// // // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // // //       );

// // // // // //       // 4️⃣ Save to Firestore
// // // // // //       await FirebaseFirestore.instance
// // // // // //           .collection('users')
// // // // // //           .doc(user.userId)
// // // // // //           .set({
// // // // // //             'userId': user.userId,
// // // // // //             'name': user.name,
// // // // // //             'email': user.email,
// // // // // //             'mobile': user.mobile,
// // // // // //             'address': user.address,
// // // // // //             'dob': user.dob,
// // // // // //             'profileImageBase64': user.profileImage,
// // // // // //             'termsAccepted': user.termsAccepted,
// // // // // //             'termsAcceptedAt': user.termsAcceptedAt,
// // // // // //             'createdAt': DateTime.now(),
// // // // // //           });

// // // // // //       // 5️⃣ Optional: Save terms acceptance in your controller
// // // // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // // // //       // 6️⃣ Navigate to next page
// // // // // //       Navigator.pushReplacement(
// // // // // //         context,
// // // // // //         MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)),
// // // // // //       );
// // // // // //     } on FirebaseAuthException catch (e) {
// // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // //         context,
// // // // // //         e.message ?? "Signup failed",
// // // // // //         bgColor: Colors.red,
// // // // // //       );
// // // // // //     }
// // // // // //   }

// // // // // //   // ================= UI =================
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: Stack(
// // // // // //         children: [
// // // // // //           SizedBox.expand(
// // // // // //             child: Image.asset(
// // // // // //               "assets/signupbackground.png",
// // // // // //               fit: BoxFit.cover,
// // // // // //             ),
// // // // // //           ),
// // // // // //           Center(
// // // // // //             child: SingleChildScrollView(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // //               child: Column(
// // // // // //                 children: [
// // // // // //                   const SizedBox(height: 40),
// // // // // //                   const Text(
// // // // // //                     "MentalWell",
// // // // // //                     style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 20),
// // // // // //                   ClipRRect(
// // // // // //                     borderRadius: BorderRadius.circular(20),
// // // // // //                     child: BackdropFilter(
// // // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // // //                       child: Container(
// // // // // //                         padding: const EdgeInsets.all(24),
// // // // // //                         decoration: BoxDecoration(
// // // // // //                           color: Colors.white.withOpacity(0.2),
// // // // // //                           borderRadius: BorderRadius.circular(20),
// // // // // //                         ),
// // // // // //                         child: Column(
// // // // // //                           children: [
// // // // // //                             GestureDetector(
// // // // // //                               onTap: _pickImage,
// // // // // //                               child: CircleAvatar(
// // // // // //                                 radius: 42,
// // // // // //                                 backgroundImage: profileImage != null
// // // // // //                                     ? FileImage(profileImage!)
// // // // // //                                     : null,
// // // // // //                                 child: profileImage == null
// // // // // //                                     ? const Icon(Icons.camera_alt)
// // // // // //                                     : null,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 20),
// // // // // //                             _buildTextField(
// // // // // //                               nameController,
// // // // // //                               "Username",
// // // // // //                               Icons.person,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               emailController,
// // // // // //                               "Email",
// // // // // //                               Icons.email,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               passwordController,
// // // // // //                               "Password",
// // // // // //                               Icons.lock,
// // // // // //                               obscure: true,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               mobileController,
// // // // // //                               "Mobile",
// // // // // //                               Icons.phone,
// // // // // //                             ),
// // // // // //                             _buildTextField(
// // // // // //                               addressController,
// // // // // //                               "Address",
// // // // // //                               Icons.home,
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 12),
// // // // // //                             _buildDatePicker(),
// // // // // //                             Row(
// // // // // //                               children: [
// // // // // //                                 Checkbox(
// // // // // //                                   value: isTermsAccepted,
// // // // // //                                   onChanged: null,
// // // // // //                                 ),
// // // // // //                                 GestureDetector(
// // // // // //                                   onTap: _showTermsDialog,
// // // // // //                                   child: const Text(
// // // // // //                                     "View & Accept Terms & Conditions",
// // // // // //                                     style: TextStyle(
// // // // // //                                       color: Colors.blue,
// // // // // //                                       decoration: TextDecoration.underline,
// // // // // //                                     ),
// // // // // //                                   ),
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 10),
// // // // // //                             ElevatedButton(
// // // // // //                               style: ElevatedButton.styleFrom(
// // // // // //                                 backgroundColor: const Color(0xFF9B5F4D),
// // // // // //                                 padding: const EdgeInsets.symmetric(
// // // // // //                                   vertical: 12,
// // // // // //                                   horizontal: 40,
// // // // // //                                 ),
// // // // // //                                 shape: RoundedRectangleBorder(
// // // // // //                                   borderRadius: BorderRadius.circular(50),
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               onPressed: handleSignUp,
// // // // // //                               child: const Text(
// // // // // //                                 "Sign Up",
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 20,
// // // // // //                                   fontWeight: FontWeight.bold,
// // // // // //                                   color: Colors.white,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             const SizedBox(height: 16),
// // // // // //                             Row(
// // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                               children: [
// // // // // //                                 const Text("Already have an account? "),
// // // // // //                                 GestureDetector(
// // // // // //                                   onTap: () {
// // // // // //                                     Navigator.pushReplacement(
// // // // // //                                       context,
// // // // // //                                       MaterialPageRoute(
// // // // // //                                         builder: (_) => const LoginPage(),
// // // // // //                                       ),
// // // // // //                                     );
// // // // // //                                   },
// // // // // //                                   child: const Text(
// // // // // //                                     "Log In",
// // // // // //                                     style: TextStyle(
// // // // // //                                       color: Color(0xFF9B5F4D),
// // // // // //                                       fontWeight: FontWeight.bold,
// // // // // //                                     ),
// // // // // //                                   ),
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // ================= Helper Widgets =================
// // // // // //   Widget _buildTextField(
// // // // // //     TextEditingController ctrl,
// // // // // //     String hint,
// // // // // //     IconData icon, {
// // // // // //     bool obscure = false,
// // // // // //   }) {
// // // // // //     return Padding(
// // // // // //       padding: const EdgeInsets.only(bottom: 12),
// // // // // //       child: TextField(
// // // // // //         controller: ctrl,
// // // // // //         obscureText: obscure,
// // // // // //         decoration: InputDecoration(
// // // // // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // // // // //           hintText: hint,
// // // // // //           filled: true,
// // // // // //           fillColor: Colors.grey.shade100,
// // // // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildDatePicker() {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () async {
// // // // // //         DateTime? date = await showDatePicker(
// // // // // //           context: context,
// // // // // //           initialDate: DateTime(2000),
// // // // // //           firstDate: DateTime(1960),
// // // // // //           lastDate: DateTime.now(),
// // // // // //         );
// // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // //       },
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // //         decoration: BoxDecoration(
// // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // //           color: Colors.grey.shade100,
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               selectedDate == null
// // // // // //                   ? "Select Date of Birth"
// // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // //             ),
// // // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }





// // // // // // // import 'dart:io';
// // // // // // // import 'dart:ui';
// // // // // // // import 'dart:convert'; // add this to your imports
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // // class SignUpPage extends StatefulWidget {
// // // // // // //   const SignUpPage({super.key});

// // // // // // //   @override
// // // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // // }

// // // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// // // // // // //   final TextEditingController nameController = TextEditingController();
// // // // // // //   final TextEditingController emailController = TextEditingController();
// // // // // // //   final TextEditingController passwordController = TextEditingController();
// // // // // // //   final TextEditingController mobileController = TextEditingController();
// // // // // // //   final TextEditingController addressController = TextEditingController();

// // // // // // //   File? profileImage;
// // // // // // //   final ImagePicker picker = ImagePicker();
// // // // // // //   DateTime? selectedDate;

// // // // // // //   bool isTermsAccepted = false;

// // // // // // //   // ================= IMAGE PICK =================
// // // // // // //   Future<void> _pickImage() async {
// // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // //     if (pickedFile != null) {
// // // // // // //       setState(() => profileImage = File(pickedFile.path));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // ================= TERMS DIALOG =================
// // // // // // //   Future<void> _showTermsDialog() async {
// // // // // // //     bool dialogAccepted = false;

// // // // // // //     await showDialog(
// // // // // // //       context: context,
// // // // // // //       barrierDismissible: false,
// // // // // // //       builder: (_) {
// // // // // // //         return StatefulBuilder(
// // // // // // //           builder: (context, setDialogState) {
// // // // // // //             return AlertDialog(
// // // // // // //               title: const Text(
// // // // // // //                 "Terms & Conditions",
// // // // // // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // // // // // //               ),
// // // // // // //               content: SizedBox(
// // // // // // //                 height: 260, // 🔥 shorter dialog
// // // // // // //                 child: SingleChildScrollView(
// // // // // // //                   child: const Text(
// // // // // // //                     "Last Updated: January 2026\n\n"
// // // // // // //                     "Welcome to MentalWell.\n\n"
// // // // // // //                     "By using this application, you agree to the following terms:\n\n"
// // // // // // //                     "1. This app provides mental wellness support only and does not replace professional medical advice.\n\n"
// // // // // // //                     "2. Users are responsible for the accuracy of the information they provide.\n\n"
// // // // // // //                     "3. Personal data such as name, email, and profile image is securely stored using Firebase.\n\n"
// // // // // // //                     "4. You agree not to misuse, reverse engineer, or attempt unauthorized access to the system.\n\n"
// // // // // // //                     "5. MentalWell is not responsible for user-generated content but may remove harmful content.\n\n"
// // // // // // //                     "6. Services may change or be discontinued without prior notice.\n\n"
// // // // // // //                     "By clicking Accept, you confirm that you have read and agreed to these terms.",
// // // // // // //                     style: TextStyle(fontSize: 14),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               actions: [
// // // // // // //                 Row(
// // // // // // //                   children: [
// // // // // // //                     Checkbox(
// // // // // // //                       value: dialogAccepted,
// // // // // // //                       onChanged: (val) {
// // // // // // //                         setDialogState(() => dialogAccepted = val!);
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                     const Expanded(
// // // // // // //                       child: Text("I agree to the Terms & Conditions"),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //                 Align(
// // // // // // //                   alignment: Alignment.centerRight,
// // // // // // //                   child: SizedBox(
// // // // // // //                     width: 140,
// // // // // // //                     height: 42,
// // // // // // //                     child: ElevatedButton(
// // // // // // //                       style: ElevatedButton.styleFrom(
// // // // // // //                         backgroundColor: Colors.black87,
// // // // // // //                         foregroundColor: Colors.white,
// // // // // // //                       ),
// // // // // // //                       onPressed: dialogAccepted
// // // // // // //                           ? () {
// // // // // // //                               setState(() => isTermsAccepted = true);
// // // // // // //                               Navigator.pop(context);
// // // // // // //                             }
// // // // // // //                           : null,
// // // // // // //                       child: const Text("Accept"),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             );
// // // // // // //           },
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   // ================= SIGN UP =================
// // // // // // //   Future<void> handleSignUp() async {
// // // // // // //     if (nameController.text.isEmpty ||
// // // // // // //         emailController.text.isEmpty ||
// // // // // // //         passwordController.text.isEmpty ||
// // // // // // //         mobileController.text.isEmpty ||
// // // // // // //         addressController.text.isEmpty ||
// // // // // // //         selectedDate == null) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         "Please fill all required fields",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //       return;
// // // // // // //     }

// // // // // // //     if (!isTermsAccepted) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         "Please accept Terms & Conditions",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //       return;
// // // // // // //     }

// // // // // // //     try {
// // // // // // //       UserCredential userCred = await firebaseAuth
// // // // // // //           .createUserWithEmailAndPassword(
// // // // // // //             email: emailController.text.trim(),
// // // // // // //             password: passwordController.text.trim(),
// // // // // // //           );

// // // // // // //   String imageBase64 = '';
// // // // // // // if (profileImage != null) {
// // // // // // //   final bytes = await profileImage!.readAsBytes();
// // // // // // //   imageBase64 = base64Encode(bytes); // convert image to Base64 string
// // // // // // // }


// // // // // // //       final user = AccountTypeModelFull(
// // // // // // //         userId: userCred.user!.uid,
// // // // // // //         name: nameController.text.trim(),
// // // // // // //         email: emailController.text.trim(),
// // // // // // //         mobile: mobileController.text.trim(),
// // // // // // //         address: addressController.text.trim(),
// // // // // // //         dob: selectedDate.toString(),
// // // // // // //         profileImage: imageBase64,
// // // // // // //         termsAccepted: true,
// // // // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // // // //       );

// // // // // // //      await FirebaseFirestore.instance
// // // // // // //     .collection('users')
// // // // // // //     .doc(user.userId)
// // // // // // //     .set({
// // // // // // //   'name': user.name,
// // // // // // //   'email': user.email,
// // // // // // //   'mobile': user.mobile,
// // // // // // //   'address': user.address,
// // // // // // //   'dob': user.dob,
// // // // // // //   'profileImageBase64': user.profileImage,
// // // // // // //   'termsAccepted': user.termsAccepted,
// // // // // // //   'termsAcceptedAt': user.termsAcceptedAt,
// // // // // // // });


// // // // // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // // // // //       Navigator.pushReplacement(
// // // // // // //         context,
// // // // // // //         MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)),
// // // // // // //       );
// // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         e.message ?? "Signup failed",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // ================= UI =================
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       body: Stack(
// // // // // // //         children: [
// // // // // // //           SizedBox.expand(
// // // // // // //             child: Image.asset(
// // // // // // //               "assets/signupbackground.png",
// // // // // // //               fit: BoxFit.cover,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Center(
// // // // // // //             child: SingleChildScrollView(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // // //               child: Column(
// // // // // // //                 children: [
// // // // // // //                   const SizedBox(height: 40),
// // // // // // //                   const Text(
// // // // // // //                     "MentalWell",
// // // // // // //                     style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
// // // // // // //                   ),
// // // // // // //                   const SizedBox(height: 20),
// // // // // // //                   ClipRRect(
// // // // // // //                     borderRadius: BorderRadius.circular(20),
// // // // // // //                     child: BackdropFilter(
// // // // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // // // //                       child: Container(
// // // // // // //                         padding: const EdgeInsets.all(24),
// // // // // // //                         decoration: BoxDecoration(
// // // // // // //                           color: Colors.white.withOpacity(0.2),
// // // // // // //                           borderRadius: BorderRadius.circular(20),
// // // // // // //                         ),
// // // // // // //                         child: Column(
// // // // // // //                           children: [
// // // // // // //                             GestureDetector(
// // // // // // //                               onTap: _pickImage,
// // // // // // //                               child: CircleAvatar(
// // // // // // //                                 radius: 42,
// // // // // // //                                 backgroundImage: profileImage != null
// // // // // // //                                     ? FileImage(profileImage!)
// // // // // // //                                     : null,
// // // // // // //                                 child: profileImage == null
// // // // // // //                                     ? const Icon(Icons.camera_alt)
// // // // // // //                                     : null,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 20),
// // // // // // //                             _buildTextField(
// // // // // // //                               nameController,
// // // // // // //                               "Username",
// // // // // // //                               Icons.person,
// // // // // // //                             ),
// // // // // // //                             _buildTextField(
// // // // // // //                               emailController,
// // // // // // //                               "Email",
// // // // // // //                               Icons.email,
// // // // // // //                             ),
// // // // // // //                             _buildTextField(
// // // // // // //                               passwordController,
// // // // // // //                               "Password",
// // // // // // //                               Icons.lock,
// // // // // // //                               obscure: true,
// // // // // // //                             ),
// // // // // // //                             _buildTextField(
// // // // // // //                               mobileController,
// // // // // // //                               "Mobile",
// // // // // // //                               Icons.phone,
// // // // // // //                             ),
// // // // // // //                             _buildTextField(
// // // // // // //                               addressController,
// // // // // // //                               "Address",
// // // // // // //                               Icons.home,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildDatePicker(),
// // // // // // //                             Row(
// // // // // // //                               children: [
// // // // // // //                                 Checkbox(
// // // // // // //                                   value: isTermsAccepted,
// // // // // // //                                   onChanged: null,
// // // // // // //                                 ),
// // // // // // //                                 GestureDetector(
// // // // // // //                                   onTap: _showTermsDialog,
// // // // // // //                                   child: const Text(
// // // // // // //                                     "View & Accept Terms & Conditions",
// // // // // // //                                     style: TextStyle(
// // // // // // //                                       color: Colors.blue,
// // // // // // //                                       decoration: TextDecoration.underline,
// // // // // // //                                     ),
// // // // // // //                                   ),
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 10),
// // // // // // //                             ElevatedButton(
// // // // // // //                               style: ElevatedButton.styleFrom(
// // // // // // //                                 backgroundColor: const Color(0xFF9B5F4D),
// // // // // // //                                 padding: const EdgeInsets.symmetric(
// // // // // // //                                   vertical: 12,
// // // // // // //                                   horizontal: 40,
// // // // // // //                                 ),
// // // // // // //                                 shape: RoundedRectangleBorder(
// // // // // // //                                   borderRadius: BorderRadius.circular(50),
// // // // // // //                                 ),
// // // // // // //                               ),
// // // // // // //                               onPressed: handleSignUp,
// // // // // // //                               child: const Text(
// // // // // // //                                 "Sign Up",
// // // // // // //                                 style: TextStyle(
// // // // // // //                                   fontSize: 20,
// // // // // // //                                   fontWeight: FontWeight.bold,
// // // // // // //                                   color: Colors.white,
// // // // // // //                                 ),
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 16),
// // // // // // //                             Row(
// // // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                               children: [
// // // // // // //                                 const Text("Already have an account? "),
// // // // // // //                                 GestureDetector(
// // // // // // //                                   onTap: () {
// // // // // // //                                     Navigator.pushReplacement(
// // // // // // //                                       context,
// // // // // // //                                       MaterialPageRoute(
// // // // // // //                                         builder: (_) => const LoginPage(),
// // // // // // //                                       ),
// // // // // // //                                     );
// // // // // // //                                   },
// // // // // // //                                   child: const Text(
// // // // // // //                                     "Log In",
// // // // // // //                                     style: TextStyle(
// // // // // // //                                       color: Color(0xFF9B5F4D),
// // // // // // //                                       fontWeight: FontWeight.bold,
// // // // // // //                                     ),
// // // // // // //                                   ),
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                             ),
// // // // // // //                           ],
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

  

// // // // // // //   Widget _buildTextField(
// // // // // // //     TextEditingController ctrl,
// // // // // // //     String hint,
// // // // // // //     IconData icon, {
// // // // // // //     bool obscure = false,
// // // // // // //   }) {
// // // // // // //     return Padding(
// // // // // // //       padding: const EdgeInsets.only(bottom: 12),
// // // // // // //       child: TextField(
// // // // // // //         controller: ctrl,
// // // // // // //         obscureText: obscure,
// // // // // // //         decoration: InputDecoration(
// // // // // // //           prefixIcon: Icon(icon, color: const Color(0xFF9B5F4D)),
// // // // // // //           hintText: hint,
// // // // // // //           filled: true,
// // // // // // //           fillColor: Colors.grey.shade100,
// // // // // // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildDatePicker() {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () async {
// // // // // // //         DateTime? date = await showDatePicker(
// // // // // // //           context: context,
// // // // // // //           initialDate: DateTime(2000),
// // // // // // //           firstDate: DateTime(1960),
// // // // // // //           lastDate: DateTime.now(),
// // // // // // //         );
// // // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // // //       },
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // // //           color: Colors.grey.shade100,
// // // // // // //         ),
// // // // // // //         child: Row(
// // // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //           children: [
// // // // // // //             Text(
// // // // // // //               selectedDate == null
// // // // // // //                   ? "Select Date of Birth"
// // // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // // //             ),
// // // // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
    
// // // // // // //   }
// // // // // // // }







// // // // // // // import 'dart:io';
// // // // // // // import 'dart:ui';
// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // // class SignUpPage extends StatefulWidget {
// // // // // // //   const SignUpPage({super.key});

// // // // // // //   @override
// // // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // // }

// // // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// // // // // // //   TextEditingController nameController = TextEditingController();
// // // // // // //   TextEditingController emailController = TextEditingController();
// // // // // // //   TextEditingController passwordController = TextEditingController();
// // // // // // //   TextEditingController mobileController = TextEditingController();
// // // // // // //   TextEditingController addressController = TextEditingController();

// // // // // // //   File? profileImage;
// // // // // // //   final ImagePicker picker = ImagePicker();
// // // // // // //   DateTime? selectedDate;

// // // // // // //   // 🔐 TERMS & CONDITIONS
// // // // // // //   bool isTermsAccepted = false;

// // // // // // //   // ====================== PICK IMAGE ======================
// // // // // // //   Future<void> _pickImage() async {
// // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // //     if (pickedFile != null) {
// // // // // // //       setState(() {
// // // // // // //         profileImage = File(pickedFile.path);
// // // // // // //       });
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // ====================== SHOW TERMS DIALOG ======================
// // // // // // //   Future<void> _showTermsDialog() async {
// // // // // // //     bool dialogAccepted = false;

// // // // // // //     await showDialog(
// // // // // // //       context: context,
// // // // // // //       builder: (context) {
// // // // // // //         return StatefulBuilder(
// // // // // // //           builder: (context, setStateDialog) {
// // // // // // //             return AlertDialog(
// // // // // // //               title: const Text("Terms & Conditions"),
// // // // // // //               content: SizedBox(
// // // // // // //                 height: 250, // scrollable area
// // // // // // //                 child: SingleChildScrollView(
// // // // // // //                   child: Column(
// // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                     children: [
// // // // // // //                       const Text(
// // // // // // //                         "Please read and accept our Terms & Conditions to continue:",
// // // // // // //                         style: TextStyle(fontWeight: FontWeight.bold),
// // // // // // //                       ),
// // // // // // //                       const SizedBox(height: 10),
// // // // // // //                       const Text(
// // // // // // //                         "1. You agree to use the app responsibly.\n"
// // // // // // //                         "2. We store your data securely in Firebase.\n"
// // // // // // //                         "3. You accept that your data may be used for analytics.\n"
// // // // // // //                         "4. You must not misuse the app or its services.\n"
// // // // // // //                         "5. Further terms can be added here…",
// // // // // // //                       ),
// // // // // // //                       const SizedBox(height: 20),
// // // // // // //                       Row(
// // // // // // //                         children: [
// // // // // // //                           Checkbox(
// // // // // // //                             value: dialogAccepted,
// // // // // // //                             onChanged: (val) {
// // // // // // //                               setStateDialog(() {
// // // // // // //                                 dialogAccepted = val!;
// // // // // // //                               });
// // // // // // //                             },
// // // // // // //                           ),
// // // // // // //                           const Expanded(
// // // // // // //                             child: Text(
// // // // // // //                               "I have read and accept the Terms & Conditions",
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               actions: [
// // // // // // //                 TextButton(
// // // // // // //                   onPressed: dialogAccepted
// // // // // // //                       ? () {
// // // // // // //                           setState(() {
// // // // // // //                             isTermsAccepted = true; // ✅ accept in main page
// // // // // // //                           });
// // // // // // //                           Navigator.pop(context);
// // // // // // //                         }
// // // // // // //                       : null, // cannot accept without checkbox
// // // // // // //                   child: const Text("Accept"),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             );
// // // // // // //           },
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   // ====================== SIGNUP HANDLER ======================
// // // // // // //   Future<void> handleSignUp() async {
// // // // // // //     if (nameController.text.isEmpty ||
// // // // // // //         emailController.text.isEmpty ||
// // // // // // //         passwordController.text.isEmpty ||
// // // // // // //         mobileController.text.isEmpty ||
// // // // // // //         addressController.text.isEmpty ||
// // // // // // //         selectedDate == null) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         "Please fill all required fields",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //       return;
// // // // // // //     }

// // // // // // //     // 🔐 TERMS CHECK
// // // // // // //     if (!isTermsAccepted) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         "Please accept Terms & Conditions",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //       return;
// // // // // // //     }

// // // // // // //     try {
// // // // // // //       // Create user in Firebase Auth
// // // // // // //       UserCredential userCred = await firebaseAuth
// // // // // // //           .createUserWithEmailAndPassword(
// // // // // // //             email: emailController.text.trim(),
// // // // // // //             password: passwordController.text.trim(),
// // // // // // //           );

// // // // // // //       // Upload profile image
// // // // // // //       String imageUrl = '';
// // // // // // //       if (profileImage != null) {
// // // // // // //         imageUrl = await SignupController().uploadProfileImage(
// // // // // // //           profileImage!,
// // // // // // //           userCred.user!.uid,
// // // // // // //         );
// // // // // // //       }

// // // // // // //       // Prepare user model
// // // // // // //       final user = AccountTypeModelFull(
// // // // // // //         userId: userCred.user!.uid,
// // // // // // //         name: nameController.text.trim(),
// // // // // // //         email: emailController.text.trim(),
// // // // // // //         mobile: mobileController.text.trim(),
// // // // // // //         address: addressController.text.trim(),
// // // // // // //         dob: selectedDate.toString(),
// // // // // // //         profileImage: imageUrl,
// // // // // // //         termsAccepted: true,
// // // // // // //         termsAcceptedAt: DateTime.now().toIso8601String(),
// // // // // // //       );

// // // // // // //       // ✅ Save terms & consent in Firestore
// // // // // // //       await SignupController().saveTermsAcceptance(userCred.user!.uid);

// // // // // // //       // Navigate to WhoIsLogin
// // // // // // //       Navigator.pushReplacement(
// // // // // // //         context,
// // // // // // //         MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)),
// // // // // // //       );
// // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // //         context,
// // // // // // //         e.message ?? "Signup failed",
// // // // // // //         bgColor: Colors.red,
// // // // // // //       );
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // ====================== BUILD UI ======================
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       body: Stack(
// // // // // // //         children: [
// // // // // // //           SizedBox.expand(
// // // // // // //             child: Image.asset(
// // // // // // //               "assets/signupbackground.png",
// // // // // // //               fit: BoxFit.cover,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Center(
// // // // // // //             child: SingleChildScrollView(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // // //               child: Column(
// // // // // // //                 children: [
// // // // // // //                   const SizedBox(height: 40),
// // // // // // //                   const Text(
// // // // // // //                     "MentalWell",
// // // // // // //                     style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
// // // // // // //                   ),
// // // // // // //                   const SizedBox(height: 20),
// // // // // // //                   ClipRRect(
// // // // // // //                     borderRadius: BorderRadius.circular(20),
// // // // // // //                     child: BackdropFilter(
// // // // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // // // //                       child: Container(
// // // // // // //                         padding: const EdgeInsets.all(24),
// // // // // // //                         decoration: BoxDecoration(
// // // // // // //                           color: Colors.white.withOpacity(0.2),
// // // // // // //                           borderRadius: BorderRadius.circular(20),
// // // // // // //                         ),
// // // // // // //                         child: Column(
// // // // // // //                           children: [
// // // // // // //                             GestureDetector(
// // // // // // //                               onTap: _pickImage,
// // // // // // //                               child: CircleAvatar(
// // // // // // //                                 radius: 42,
// // // // // // //                                 backgroundImage: profileImage != null
// // // // // // //                                     ? FileImage(profileImage!)
// // // // // // //                                     : null,
// // // // // // //                                 child: profileImage == null
// // // // // // //                                     ? const Icon(Icons.camera_alt)
// // // // // // //                                     : null,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 20),
// // // // // // //                             _buildTextField(
// // // // // // //                               nameController,
// // // // // // //                               "Username",
// // // // // // //                               Icons.person,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildTextField(
// // // // // // //                               emailController,
// // // // // // //                               "Email",
// // // // // // //                               Icons.email,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildTextField(
// // // // // // //                               passwordController,
// // // // // // //                               "Password",
// // // // // // //                               Icons.lock,
// // // // // // //                               obscure: true,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildTextField(
// // // // // // //                               mobileController,
// // // // // // //                               "Mobile",
// // // // // // //                               Icons.phone,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildTextField(
// // // // // // //                               addressController,
// // // // // // //                               "Address",
// // // // // // //                               Icons.home,
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             _buildDatePicker(),

// // // // // // //                             // 🔐 TERMS UI
// // // // // // //                             Row(
// // // // // // //                               children: [
// // // // // // //                                 Checkbox(
// // // // // // //                                   value: isTermsAccepted,
// // // // // // //                                   onChanged:
// // // // // // //                                       null, // disabled; accept via dialog
// // // // // // //                                 ),
// // // // // // //                                 Expanded(
// // // // // // //                                   child: GestureDetector(
// // // // // // //                                     onTap: _showTermsDialog,
// // // // // // //                                     child: const Text(
// // // // // // //                                       "I have read and accept the Terms & Conditions",
// // // // // // //                                       style: TextStyle(
// // // // // // //                                         color: Colors.blue,
// // // // // // //                                         decoration: TextDecoration.underline,
// // // // // // //                                       ),
// // // // // // //                                     ),
// // // // // // //                                   ),
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                             ),

// // // // // // //                             const SizedBox(height: 10),
// // // // // // //                             ElevatedButton(
// // // // // // //                               onPressed: handleSignUp,
// // // // // // //                               child: const Text("Sign Up"),
// // // // // // //                             ),
// // // // // // //                             const SizedBox(height: 12),
// // // // // // //                             Row(
// // // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                               children: [
// // // // // // //                                 const Text("Already have an account? "),
// // // // // // //                                 GestureDetector(
// // // // // // //                                   onTap: () {
// // // // // // //                                     Navigator.pushReplacement(
// // // // // // //                                       context,
// // // // // // //                                       MaterialPageRoute(
// // // // // // //                                         builder: (_) => const LoginPage(),
// // // // // // //                                       ),
// // // // // // //                                     );
// // // // // // //                                   },
// // // // // // //                                   child: const Text(
// // // // // // //                                     "Log In",
// // // // // // //                                     style: TextStyle(
// // // // // // //                                       fontWeight: FontWeight.bold,
// // // // // // //                                     ),
// // // // // // //                                   ),
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                             ),
// // // // // // //                           ],
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   // ====================== TEXTFIELD BUILDER ======================
// // // // // // //   Widget _buildTextField(
// // // // // // //     TextEditingController ctrl,
// // // // // // //     String hint,
// // // // // // //     IconData icon, {
// // // // // // //     bool obscure = false,
// // // // // // //   }) {
// // // // // // //     return TextField(
// // // // // // //       controller: ctrl,
// // // // // // //       obscureText: obscure,
// // // // // // //       decoration: InputDecoration(
// // // // // // //         prefixIcon: Icon(icon),
// // // // // // //         hintText: hint,
// // // // // // //         filled: true,
// // // // // // //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   // ====================== DATE PICKER ======================
// // // // // // //   Widget _buildDatePicker() {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () async {
// // // // // // //         DateTime? date = await showDatePicker(
// // // // // // //           context: context,
// // // // // // //           initialDate: DateTime(2000),
// // // // // // //           firstDate: DateTime(1960),
// // // // // // //           lastDate: DateTime.now(),
// // // // // // //         );
// // // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // // //       },
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.all(15),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // // //           color: Colors.grey.shade100,
// // // // // // //         ),
// // // // // // //         child: Row(
// // // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //           children: [
// // // // // // //             Text(
// // // // // // //               selectedDate == null
// // // // // // //                   ? "Select Date of Birth"
// // // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // // //             ),
// // // // // // //             const Icon(Icons.calendar_today),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }










// // // // // // // // import 'dart:io';
// // // // // // // // import 'dart:ui';
// // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // // // class SignUpPage extends StatefulWidget {
// // // // // // // //   const SignUpPage({super.key});

// // // // // // // //   @override
// // // // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // // // }

// // // // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // // // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// // // // // // // //   TextEditingController nameController = TextEditingController();
// // // // // // // //   TextEditingController emailController = TextEditingController();
// // // // // // // //   TextEditingController passwordController = TextEditingController();
// // // // // // // //   TextEditingController mobileController = TextEditingController();
// // // // // // // //   TextEditingController addressController = TextEditingController();

// // // // // // // //   File? profileImage;
// // // // // // // //   final ImagePicker picker = ImagePicker();
// // // // // // // //   DateTime? selectedDate;

// // // // // // // //   Future<void> _pickImage() async {
// // // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // // //     if (pickedFile != null) {
// // // // // // // //       setState(() {
// // // // // // // //         profileImage = File(pickedFile.path);
// // // // // // // //       });
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> handleSignUp() async {
// // // // // // // //     if (nameController.text.isEmpty ||
// // // // // // // //         emailController.text.isEmpty ||
// // // // // // // //         passwordController.text.isEmpty ||
// // // // // // // //         mobileController.text.isEmpty ||
// // // // // // // //         addressController.text.isEmpty ||
// // // // // // // //         selectedDate == null) {
// // // // // // // //       Snackbarscreen()
// // // // // // // //           .showCustomSnackBar(context, "Please fill all required fields",
// // // // // // // //               bgColor: Colors.red);
// // // // // // // //       return;
// // // // // // // //     }

// // // // // // // //     try {
// // // // // // // //       UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
// // // // // // // //           email: emailController.text.trim(),
// // // // // // // //           password: passwordController.text.trim());

// // // // // // // //       String imageUrl = '';
// // // // // // // //       if (profileImage != null) {
// // // // // // // //         imageUrl = await SignupController()
// // // // // // // //             .uploadProfileImage(profileImage!, userCred.user!.uid);
// // // // // // // //       };

// // // // // // // //       final user = AccountTypeModelFull(
// // // // // // // //         userId: userCred.user!.uid,
// // // // // // // //         name: nameController.text.trim(),
// // // // // // // //         email: emailController.text.trim(),
// // // // // // // //         mobile: mobileController.text.trim(),
// // // // // // // //         address: addressController.text.trim(),
// // // // // // // //         dob: selectedDate.toString(),
// // // // // // // //         profileImage: imageUrl,
// // // // // // // //       );

// // // // // // // //       // Go to WhoIsLogin page to select account type
// // // // // // // //       Navigator.pushReplacement(
// // // // // // // //           context, MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)));

// // // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // // //           context, e.message ?? "Signup failed",
// // // // // // // //           bgColor: Colors.red);
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       body: Stack(
// // // // // // // //         children: [
// // // // // // // //           SizedBox.expand(
// // // // // // // //               child: Image.asset("assets/signupbackground.png", fit: BoxFit.cover)),
// // // // // // // //           Center(
// // // // // // // //             child: SingleChildScrollView(
// // // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26),
// // // // // // // //               child: Column(
// // // // // // // //                 children: [
// // // // // // // //                   const SizedBox(height: 40),
// // // // // // // //                   const Text("MentalWell",
// // // // // // // //                       style: TextStyle(
// // // // // // // //                           fontSize: 34,
// // // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // // //                           color: Colors.black87)),
// // // // // // // //                   const SizedBox(height: 20),
// // // // // // // //                   ClipRRect(
// // // // // // // //                     borderRadius: BorderRadius.circular(20),
// // // // // // // //                     child: BackdropFilter(
// // // // // // // //                       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // // // // // //                       child: Container(
// // // // // // // //                         padding: const EdgeInsets.all(24),
// // // // // // // //                         decoration: BoxDecoration(
// // // // // // // //                             color: Colors.white.withOpacity(0.2),
// // // // // // // //                             borderRadius: BorderRadius.circular(20)),
// // // // // // // //                         child: Column(
// // // // // // // //                           children: [
// // // // // // // //                             GestureDetector(
// // // // // // // //                               onTap: _pickImage,
// // // // // // // //                               child: CircleAvatar(
// // // // // // // //                                 radius: 42,
// // // // // // // //                                 backgroundColor: Colors.green.shade50,
// // // // // // // //                                 backgroundImage: profileImage != null
// // // // // // // //                                     ? FileImage(profileImage!)
// // // // // // // //                                     : null,
// // // // // // // //                                 child: profileImage == null
// // // // // // // //                                     ? const Icon(Icons.camera_alt, size: 34)
// // // // // // // //                                     : null,
// // // // // // // //                               ),
// // // // // // // //                             ),
// // // // // // // //                             const SizedBox(height: 25),
// // // // // // // //                             _buildTextField(nameController, "Username", Icons.person),
// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             _buildTextField(emailController, "Email", Icons.email),
// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             _buildTextField(passwordController, "Password",
// // // // // // // //                                 Icons.lock, obscure: true),
// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             _buildTextField(mobileController, "Mobile", Icons.phone),
// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             _buildTextField(addressController, "Address", Icons.home),
// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             _buildDatePicker(),
// // // // // // // //                             const SizedBox(height: 24),
// // // // // // // //                             ElevatedButton(
// // // // // // // //                                 onPressed: handleSignUp,
// // // // // // // //                                 style: ElevatedButton.styleFrom(
// // // // // // // //                                     backgroundColor: Color(0xFF9B5F4D),
// // // // // // // //                                     padding: const EdgeInsets.symmetric(vertical: 12),
// // // // // // // //                                     shape: RoundedRectangleBorder(
// // // // // // // //                                         borderRadius: BorderRadius.circular(50))),
// // // // // // // //                                 child: const Text("   Sign Up   ",
// // // // // // // //                                     style: TextStyle(
// // // // // // // //                                         fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold))),

// // // // // // // //                             const SizedBox(height: 16),
// // // // // // // //                             Row(
// // // // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // //                               children: [
// // // // // // // //                                 const Text("Already have an account? "),
// // // // // // // //                                 GestureDetector(
// // // // // // // //                                   onTap: () {
// // // // // // // //                                     Navigator.pushReplacement(
// // // // // // // //                                     context,
// // // // // // // //                                     MaterialPageRoute(
// // // // // // // //                                         builder: (_) => const LoginPage()));
// // // // // // // //                               },
// // // // // // // //                                   child: const Text(
// // // // // // // //                                     "Log In",
// // // // // // // //                                     style: TextStyle(
// // // // // // // //                                         color: Color(0xFF9B5F4D),
// // // // // // // //                                         fontWeight: FontWeight.w700),
// // // // // // // //                                   ),
// // // // // // // //                                 ),
                                
// // // // // // // //                               ],
// // // // // // // //                             ),
// // // // // // // //                           ],
// // // // // // // //                         ),
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                   )
// // // // // // // //                 ],
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           )
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   Widget _buildTextField(TextEditingController ctrl, String hint, IconData icon,
// // // // // // // //       {bool obscure = false}) {
// // // // // // // //     return TextField(
// // // // // // // //       controller: ctrl,
// // // // // // // //       obscureText: obscure,
// // // // // // // //       decoration: InputDecoration(
// // // // // // // //         prefixIcon: Icon(icon, color: Color(0xFF9B5F4D)),
// // // // // // // //         hintText: hint,
// // // // // // // //         filled: true,
// // // // // // // //         fillColor: Colors.grey.shade100,
// // // // // // // //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   Widget _buildDatePicker() {
// // // // // // // //     return GestureDetector(
// // // // // // // //       onTap: () async {
// // // // // // // //         DateTime? date = await showDatePicker(
// // // // // // // //             context: context,
// // // // // // // //             initialDate: DateTime(2000),
// // // // // // // //             firstDate: DateTime(1960),
// // // // // // // //             lastDate: DateTime.now());
// // // // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // // // //       },
// // // // // // // //       child: Container(
// // // // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // // // //         decoration: BoxDecoration(
// // // // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // // // //           color: Colors.grey.shade100,
// // // // // // // //         ),
// // // // // // // //         child: Row(
// // // // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // //           children: [
// // // // // // // //             Text(selectedDate == null
// // // // // // // //                 ? "Select Date of Birth"
// // // // // // // //                 : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
// // // // // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D))
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }





// // // // // // // // // import 'dart:io';
// // // // // // // // // import 'dart:ui';
// // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // // // import 'package:mentalwellapp/controller/SignUpController.dart';
// // // // // // // // // import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// // // // // // // // // import 'package:mentalwellapp/view/SnackbarScreen.dart';
// // // // // // // // // import 'package:mentalwellapp/view/WhoIsLogin.dart';

// // // // // // // // // class SignUpPage extends StatefulWidget {
// // // // // // // // //   const SignUpPage({super.key});

// // // // // // // // //   @override
// // // // // // // // //   State<SignUpPage> createState() => _SignUpPageState();
// // // // // // // // // }

// // // // // // // // // class _SignUpPageState extends State<SignUpPage> {
// // // // // // // // //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// // // // // // // // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// // // // // // // // //   TextEditingController nameController = TextEditingController();
// // // // // // // // //   TextEditingController emailController = TextEditingController();
// // // // // // // // //   TextEditingController passwordController = TextEditingController();
// // // // // // // // //   TextEditingController mobileController = TextEditingController();
// // // // // // // // //   TextEditingController addressController = TextEditingController();

// // // // // // // // //   File? profileImage;
// // // // // // // // //   final ImagePicker picker = ImagePicker();
// // // // // // // // //   DateTime? selectedDate;

// // // // // // // // //   Future<void> _pickImage() async {
// // // // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // // // //     if (pickedFile != null) {
// // // // // // // // //       setState(() {
// // // // // // // // //         profileImage = File(pickedFile.path);
// // // // // // // // //       });
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> handleSignUp() async {
// // // // // // // // //     if (nameController.text.isEmpty ||
// // // // // // // // //         emailController.text.isEmpty ||
// // // // // // // // //         passwordController.text.isEmpty ||
// // // // // // // // //         mobileController.text.isEmpty ||
// // // // // // // // //         addressController.text.isEmpty ||
// // // // // // // // //         selectedDate == null) {
// // // // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // // // //         context,
// // // // // // // // //         "Please fill all required fields",
// // // // // // // // //         bgColor: Colors.red,
// // // // // // // // //       );
// // // // // // // // //       return;
// // // // // // // // //     }

// // // // // // // // //     try {
// // // // // // // // //       UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
// // // // // // // // //           email: emailController.text.trim(),
// // // // // // // // //           password: passwordController.text.trim());

// // // // // // // // //       String imageUrl = '';
// // // // // // // // //       if (profileImage != null) {
// // // // // // // // //         imageUrl = await SignupController()
// // // // // // // // //             .uploadProfileImage(profileImage!, userCred.user!.uid);
// // // // // // // // //       }

// // // // // // // // //       final user = AccountTypeModelFull(
// // // // // // // // //         userId: userCred.user!.uid,
// // // // // // // // //         name: nameController.text.trim(),
// // // // // // // // //         email: emailController.text.trim(),
// // // // // // // // //         mobile: mobileController.text.trim(),
// // // // // // // // //         address: addressController.text.trim(),
// // // // // // // // //         dob: selectedDate.toString(),
// // // // // // // // //         profileImage: imageUrl,
// // // // // // // // //       );

// // // // // // // // //       Navigator.pushReplacement(
// // // // // // // // //           context, MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)));
// // // // // // // // //     } on FirebaseAuthException catch (e) {
// // // // // // // // //       Snackbarscreen().showCustomSnackBar(
// // // // // // // // //           context, e.message ?? "Signup failed",
// // // // // // // // //           bgColor: Colors.red);
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Scaffold(
// // // // // // // // //       body: Stack(
// // // // // // // // //         children: [
// // // // // // // // //           // Background image
// // // // // // // // //           SizedBox.expand(
// // // // // // // // //             child: Image.asset("assets/signupbackground.png", fit: BoxFit.cover),
// // // // // // // // //           ),

// // // // // // // // //           // White transparent overlay (soft glow look)
// // // // // // // // //           Container(
// // // // // // // // //             color: Colors.white.withOpacity(0.35),
// // // // // // // // //           ),

// // // // // // // // //           Center(
// // // // // // // // //             child: SingleChildScrollView(
// // // // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
// // // // // // // // //               child: Column(
// // // // // // // // //                 children: [
// // // // // // // // //                   const Text(
// // // // // // // // //                     "MentalWell",
// // // // // // // // //                     style: TextStyle(
// // // // // // // // //                       fontSize: 38,
// // // // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // // // //                       color: Colors.black87,
// // // // // // // // //                       letterSpacing: 1.2,
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                   const SizedBox(height: 20),

// // // // // // // // //                   ClipRRect(
// // // // // // // // //                     borderRadius: BorderRadius.circular(25),
// // // // // // // // //                     child: BackdropFilter(
// // // // // // // // //                       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// // // // // // // // //                       child: Container(
// // // // // // // // //                         padding: const EdgeInsets.all(24),
// // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // //                           color: Colors.white.withOpacity(0.3),
// // // // // // // // //                           borderRadius: BorderRadius.circular(25),
// // // // // // // // //                           border: Border.all(color: Colors.white54, width: 1),
// // // // // // // // //                           boxShadow: [
// // // // // // // // //                             BoxShadow(
// // // // // // // // //                                 color: Colors.black12,
// // // // // // // // //                                 blurRadius: 8,
// // // // // // // // //                                 offset: Offset(0, 4))
// // // // // // // // //                           ],
// // // // // // // // //                         ),
// // // // // // // // //                         child: Column(
// // // // // // // // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // //                           children: [
// // // // // // // // //                             GestureDetector(
// // // // // // // // //                               onTap: _pickImage,
// // // // // // // // //                               child: CircleAvatar(
// // // // // // // // //                                 radius: 48,
// // // // // // // // //                                 backgroundColor: Colors.white.withOpacity(0.6),
// // // // // // // // //                                 backgroundImage: profileImage != null
// // // // // // // // //                                     ? FileImage(profileImage!)
// // // // // // // // //                                     : null,
// // // // // // // // //                                 child: profileImage == null
// // // // // // // // //                                     ? const Icon(Icons.camera_alt,
// // // // // // // // //                                         size: 36, color: Colors.black87)
// // // // // // // // //                                     : null,
// // // // // // // // //                               ),
// // // // // // // // //                             ),
// // // // // // // // //                             const SizedBox(height: 25),

// // // // // // // // //                             _buildTextField(
// // // // // // // // //                                 nameController, "Full Name", Icons.person),
// // // // // // // // //                             const SizedBox(height: 16),
// // // // // // // // //                             _buildTextField(
// // // // // // // // //                                 emailController, "Email", Icons.email),
// // // // // // // // //                             const SizedBox(height: 16),
// // // // // // // // //                             _buildTextField(passwordController, "Password",
// // // // // // // // //                                 Icons.lock,
// // // // // // // // //                                 obscure: true),
// // // // // // // // //                             const SizedBox(height: 16),
// // // // // // // // //                             _buildTextField(
// // // // // // // // //                                 mobileController, "Mobile", Icons.phone),
// // // // // // // // //                             const SizedBox(height: 16),
// // // // // // // // //                             _buildTextField(
// // // // // // // // //                                 addressController, "Address", Icons.home),
// // // // // // // // //                             const SizedBox(height: 16),
// // // // // // // // //                             _buildDatePicker(),
// // // // // // // // //                             const SizedBox(height: 30),

// // // // // // // // //                             // Sign Up Button
// // // // // // // // //                             ElevatedButton(
// // // // // // // // //                               onPressed: handleSignUp,
// // // // // // // // //                               style: ElevatedButton.styleFrom(
// // // // // // // // //                                 backgroundColor: const Color(0xFF9B5F4D),
// // // // // // // // //                                 padding: const EdgeInsets.symmetric(
// // // // // // // // //                                     vertical: 14, horizontal: 60),
// // // // // // // // //                                 shape: RoundedRectangleBorder(
// // // // // // // // //                                   borderRadius: BorderRadius.circular(40),
// // // // // // // // //                                 ),
// // // // // // // // //                                 elevation: 6,
// // // // // // // // //                               ),
// // // // // // // // //                               child: const Text(
// // // // // // // // //                                 "Sign Up",
// // // // // // // // //                                 style: TextStyle(
// // // // // // // // //                                   fontSize: 22,
// // // // // // // // //                                   fontWeight: FontWeight.bold,
// // // // // // // // //                                   color: Colors.white,
// // // // // // // // //                                 ),
// // // // // // // // //                               ),
// // // // // // // // //                             ),
// // // // // // // // //                             const SizedBox(height: 16),

// // // // // // // // //                             Row(
// // // // // // // // //                               mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //                               children: [
// // // // // // // // //                                 const Text(
// // // // // // // // //                                   "Already have an account? ",
// // // // // // // // //                                   style: TextStyle(color: Colors.black54),
// // // // // // // // //                                 ),
// // // // // // // // //                                 GestureDetector(
// // // // // // // // //                                   onTap: () {
// // // // // // // // //                                     Navigator.pushReplacementNamed(
// // // // // // // // //                                         context, '/login');
// // // // // // // // //                                   },
// // // // // // // // //                                   child: const Text(
// // // // // // // // //                                     "Log In",
// // // // // // // // //                                     style: TextStyle(
// // // // // // // // //                                         color: Color(0xFF9B5F4D),
// // // // // // // // //                                         fontWeight: FontWeight.w700,
// // // // // // // // //                                         decoration: TextDecoration.underline),
// // // // // // // // //                                   ),
// // // // // // // // //                                 ),
// // // // // // // // //                               ],
// // // // // // // // //                             ),
// // // // // // // // //                           ],
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           )
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   Widget _buildTextField(TextEditingController ctrl, String hint, IconData icon,
// // // // // // // // //       {bool obscure = false}) {
// // // // // // // // //     return TextField(
// // // // // // // // //       controller: ctrl,
// // // // // // // // //       obscureText: obscure,
// // // // // // // // //       style: const TextStyle(color: Colors.black87),
// // // // // // // // //       decoration: InputDecoration(
// // // // // // // // //         prefixIcon: Icon(icon, color: Color(0xFF9B5F4D)),
// // // // // // // // //         hintText: hint,
// // // // // // // // //         hintStyle: const TextStyle(color: Colors.black54),
// // // // // // // // //         filled: true,
// // // // // // // // //         fillColor: Colors.white.withOpacity(0.65),
// // // // // // // // //         contentPadding:
// // // // // // // // //             const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
// // // // // // // // //         border: OutlineInputBorder(
// // // // // // // // //           borderRadius: BorderRadius.circular(26),
// // // // // // // // //           borderSide: BorderSide.none,
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   Widget _buildDatePicker() {
// // // // // // // // //     return GestureDetector(
// // // // // // // // //       onTap: () async {
// // // // // // // // //         DateTime? date = await showDatePicker(
// // // // // // // // //           context: context,
// // // // // // // // //           initialDate: DateTime(2000),
// // // // // // // // //           firstDate: DateTime(1960),
// // // // // // // // //           lastDate: DateTime.now(),
// // // // // // // // //         );
// // // // // // // // //         if (date != null) setState(() => selectedDate = date);
// // // // // // // // //       },
// // // // // // // // //       child: Container(
// // // // // // // // //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
// // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // //           borderRadius: BorderRadius.circular(26),
// // // // // // // // //           color: Colors.white.withOpacity(0.55),
// // // // // // // // //         ),
// // // // // // // // //         child: Row(
// // // // // // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // // // //           children: [
// // // // // // // // //             Text(
// // // // // // // // //               selectedDate == null
// // // // // // // // //                   ? "Select Date of Birth"
// // // // // // // // //                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
// // // // // // // // //               style: const TextStyle(color: Colors.black87),
// // // // // // // // //             ),
// // // // // // // // //             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
