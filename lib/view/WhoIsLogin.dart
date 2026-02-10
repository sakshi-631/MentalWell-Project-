
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';
// // import 'package:mentalwellapp/controller/SignUpController.dart';
// // import 'pacentalwellapp/model/AccountTypeModelFull.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/SnackbarScreen.dart';

// // class WhoIsLogin extends StatefulWidget {
// //   final AccountTypeModelFull user;
// //   const WhoIsLogin({super.key, required this.user});

// //   @override
// //   State<WhoIsLogin> createState() => _WhoIsLoginState();
// // }

// // class _WhoIsLoginState extends State<WhoIsLogin> {
// //   String? selectedType;

// //   final List<AccountTypeModel> accountTypes = [
// //     AccountTypeModel(label: "User", subtitle: "General user", asset: "assets/user.png"),
// //     AccountTypeModel(label: "Admin", subtitle: "Admin account", asset: "assets/admin.png"),
// //   ];

// //   Future<void> saveAccountType() async {
// //     if (selectedType == null) {
// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Please select account type", bgColor: Colors.red);
// //       return;
// //     }

// //     try {
// //       widget.user.accountType = selectedType!;

// //       String collection = selectedType == "User" ? 'users' : 'admin';
// //       await SignupController().addData(
// //           collection, widget.user.userId, widget.user.toMap());

// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Account setup successful 🎉", bgColor: Colors.green);

// //       Navigator.pushReplacement(
// //           context, MaterialPageRoute(builder: (_) => const LoginPage()));
// //     } catch (e) {
// //       Snackbarscreen().showCustomSnackBar(
// //           context, "Error saving account: $e", bgColor: Colors.red);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 60),
// //             const Text("Select your account type",
// //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
// //             const SizedBox(height: 34),
// //             ...accountTypes.map(
// //               (type) => GestureDetector(
// //                 onTap: () => setState(() => selectedType = type.label),
// //                 child: Card(
// //                   color: selectedType == type.label
// //                       ? Colors.green.shade50
// //                       : Colors.white,
// //                   elevation: 3,
// //                   child: ListTile(
// //                     leading: CircleAvatar(
// //                       backgroundImage: AssetImage(type.asset),
// //                     ),
// //                     title: Text(type.label),
// //                     subtitle: Text(type.subtitle),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Spacer(),
// //             ElevatedButton(
// //               onPressed: saveAccountType,
// //               style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.green.shade700,
// //                   padding: const EdgeInsets.symmetric(vertical: 16),
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(30))),
// //               child: const Center(
// //                   child: Text("Continue",
// //                       style: TextStyle(fontSize: 18, color: Colors.white))),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }








// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/SignUpController.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/SnackbarScreen.dart';
// import 'dart:developer'; // Add this for log()


// class WhoIsLogin extends StatefulWidget {
//   final AccountTypeModelFull user;
//   const WhoIsLogin({super.key, required this.user});

//   @override
//   State<WhoIsLogin> createState() => _WhoIsLoginState();
// }

// class _WhoIsLoginState extends State<WhoIsLogin> {
//   String? selectedType;

//   final List<AccountTypeModel> accountTypes = [
//     AccountTypeModel(label: "User", subtitle: "General user", asset: "assets/user.png"),
//     AccountTypeModel(label: "Admin", subtitle: "Admin account", asset: "assets/admin.png"),
//   ];

//   Future<void> saveAccountType() async {
//     if (selectedType == null) {
//       Snackbarscreen().showCustomSnackBar(
//           context, "Please select account type", bgColor: Colors.red);
//       return;
//     }

//     try {
//       // 1️⃣ Set account type in the user object
//       widget.user.accountType = selectedType!;
//       log("Selected account type: $selectedType");
//       log("User map: ${widget.user.toMap()}");

//       // 2️⃣ Determine Firestore collection
//       String collection = selectedType == "User" ? 'users' : 'admin';

//       // 3️⃣ Save to Firestore
//       await SignupController().addData(
//           collection, widget.user.userId, widget.user.toMap());
//       log("Data saved successfully at $collection/${widget.user.userId}");

//       // 4️⃣ Show success message
//       Snackbarscreen().showCustomSnackBar(
//           context, "Account setup successful 🎉", bgColor: Colors.green);

//       // 5️⃣ Navigate to LoginPage
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => const LoginPage()));

//     } catch (e) {
//       log("Error saving account: $e");
//       Snackbarscreen().showCustomSnackBar(
//           context, "Error saving account: $e", bgColor: Colors.red);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 60),
//             const Text("Select your account type",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 34),
//             ...accountTypes.map(
//               (type) => GestureDetector(
//                 onTap: () => setState(() => selectedType = type.label),
//                 child: Card(
//                   color: selectedType == type.label
//                       ? Colors.green.shade50
//                       : Colors.white,
//                   elevation: 3,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(type.asset),
//                     ),
//                     title: Text(type.label),
//                     subtitle: Text(type.subtitle),
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: saveAccountType,
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green.shade700,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30))),
//               child: const Center(
//                   child: Text("Continue",
//                       style: TextStyle(fontSize: 18, color: Colors.white))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Helper class for account type items
// class AccountTypeModel {
//   final String label;
//   final String subtitle;
//   final String asset;
//   AccountTypeModel({required this.label, required this.subtitle, required this.asset});
// }
