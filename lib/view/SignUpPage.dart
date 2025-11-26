
import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentalwellapp/controller/LoginController.dart';
import 'package:mentalwellapp/controller/SignUpController.dart';
import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/SnackbarScreen.dart';
import 'package:mentalwellapp/view/WhoIsLogin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? profileImage;
  final ImagePicker picker = ImagePicker();
  DateTime? selectedDate;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> handleSignUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        mobileController.text.isEmpty ||
        addressController.text.isEmpty ||
        selectedDate == null) {
      Snackbarscreen()
          .showCustomSnackBar(context, "Please fill all required fields",
              bgColor: Colors.red);
      return;
    }

    try {
      UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      String imageUrl = '';
      if (profileImage != null) {
        imageUrl = await SignupController()
            .uploadProfileImage(profileImage!, userCred.user!.uid);
      };

      final user = AccountTypeModelFull(
        userId: userCred.user!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        address: addressController.text.trim(),
        dob: selectedDate.toString(),
        profileImage: imageUrl,
      );

      // Go to WhoIsLogin page to select account type
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)));

    } on FirebaseAuthException catch (e) {
      Snackbarscreen().showCustomSnackBar(
          context, e.message ?? "Signup failed",
          bgColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
              child: Image.asset("assets/signupbackground.png", fit: BoxFit.cover)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text("MentalWell",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87)),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 42,
                                backgroundColor: Colors.green.shade50,
                                backgroundImage: profileImage != null
                                    ? FileImage(profileImage!)
                                    : null,
                                child: profileImage == null
                                    ? const Icon(Icons.camera_alt, size: 34)
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 25),
                            _buildTextField(nameController, "Username", Icons.person),
                            const SizedBox(height: 16),
                            _buildTextField(emailController, "Email", Icons.email),
                            const SizedBox(height: 16),
                            _buildTextField(passwordController, "Password",
                                Icons.lock, obscure: true),
                            const SizedBox(height: 16),
                            _buildTextField(mobileController, "Mobile", Icons.phone),
                            const SizedBox(height: 16),
                            _buildTextField(addressController, "Address", Icons.home),
                            const SizedBox(height: 16),
                            _buildDatePicker(),
                            const SizedBox(height: 24),
                            ElevatedButton(
                                onPressed: handleSignUp,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF9B5F4D),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50))),
                                child: const Text("   Sign Up   ",
                                    style: TextStyle(
                                        fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold))),

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
                                        builder: (_) => const LoginPage()));
                              },
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Color(0xFF9B5F4D),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildTextField(TextEditingController ctrl, String hint, IconData icon,
      {bool obscure = false}) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF9B5F4D)),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
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
            lastDate: DateTime.now());
        if (date != null) setState(() => selectedDate = date);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedDate == null
                ? "Select Date of Birth"
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
            const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D))
          ],
        ),
      ),
    );
  }
}























// import 'dart:io';
// import 'dart:ui';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'package:mentalwellapp/view/WhoIsLogin.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   File? profileImage;
//   final ImagePicker picker = ImagePicker();
//   DateTime? selectedDate;

//   Future<void> _pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> handleSignUp() async {
//     if (nameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         mobileController.text.isEmpty ||
//         addressController.text.isEmpty ||
//         selectedDate == null) {
//       Snackbarscreen().showCustomSnackBar(
//         context,
//         "Please fill all required fields",
//         bgColor: Colors.red,
//       );
//       return;
//     }

//     try {
//       UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());

//       String imageUrl = '';
//       if (profileImage != null) {
//         imageUrl = await SignupController()
//             .uploadProfileImage(profileImage!, userCred.user!.uid);
//       }

//       final user = AccountTypeModelFull(
//         userId: userCred.user!.uid,
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         mobile: mobileController.text.trim(),
//         address: addressController.text.trim(),
//         dob: selectedDate.toString(),
//         profileImage: imageUrl,
//       );

//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => WhoIsLogin(user: user)));
//     } on FirebaseAuthException catch (e) {
//       Snackbarscreen().showCustomSnackBar(
//           context, e.message ?? "Signup failed",
//           bgColor: Colors.red);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           SizedBox.expand(
//             child: Image.asset("assets/signupbackground.png", fit: BoxFit.cover),
//           ),

//           // White transparent overlay (soft glow look)
//           Container(
//             color: Colors.white.withOpacity(0.35),
//           ),

//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
//               child: Column(
//                 children: [
//                   const Text(
//                     "MentalWell",
//                     style: TextStyle(
//                       fontSize: 38,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black87,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(25),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                       child: Container(
//                         padding: const EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(25),
//                           border: Border.all(color: Colors.white54, width: 1),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 8,
//                                 offset: Offset(0, 4))
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: _pickImage,
//                               child: CircleAvatar(
//                                 radius: 48,
//                                 backgroundColor: Colors.white.withOpacity(0.6),
//                                 backgroundImage: profileImage != null
//                                     ? FileImage(profileImage!)
//                                     : null,
//                                 child: profileImage == null
//                                     ? const Icon(Icons.camera_alt,
//                                         size: 36, color: Colors.black87)
//                                     : null,
//                               ),
//                             ),
//                             const SizedBox(height: 25),

//                             _buildTextField(
//                                 nameController, "Full Name", Icons.person),
//                             const SizedBox(height: 16),
//                             _buildTextField(
//                                 emailController, "Email", Icons.email),
//                             const SizedBox(height: 16),
//                             _buildTextField(passwordController, "Password",
//                                 Icons.lock,
//                                 obscure: true),
//                             const SizedBox(height: 16),
//                             _buildTextField(
//                                 mobileController, "Mobile", Icons.phone),
//                             const SizedBox(height: 16),
//                             _buildTextField(
//                                 addressController, "Address", Icons.home),
//                             const SizedBox(height: 16),
//                             _buildDatePicker(),
//                             const SizedBox(height: 30),

//                             // Sign Up Button
//                             ElevatedButton(
//                               onPressed: handleSignUp,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF9B5F4D),
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 14, horizontal: 60),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 elevation: 6,
//                               ),
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),

//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Already have an account? ",
//                                   style: TextStyle(color: Colors.black54),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.pushReplacementNamed(
//                                         context, '/login');
//                                   },
//                                   child: const Text(
//                                     "Log In",
//                                     style: TextStyle(
//                                         color: Color(0xFF9B5F4D),
//                                         fontWeight: FontWeight.w700,
//                                         decoration: TextDecoration.underline),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController ctrl, String hint, IconData icon,
//       {bool obscure = false}) {
//     return TextField(
//       controller: ctrl,
//       obscureText: obscure,
//       style: const TextStyle(color: Colors.black87),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Color(0xFF9B5F4D)),
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.black54),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.65),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(26),
//           borderSide: BorderSide.none,
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
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(26),
//           color: Colors.white.withOpacity(0.55),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               selectedDate == null
//                   ? "Select Date of Birth"
//                   : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
//               style: const TextStyle(color: Colors.black87),
//             ),
//             const Icon(Icons.calendar_today, color: Color(0xFF9B5F4D)),
//           ],
//         ),
//       ),
//     );
//   }
// }
