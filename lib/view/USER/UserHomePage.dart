// // // // // // // // // // // // import 'dart:convert';
// // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // // // // // // //     hide kCard, kPrimary;
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // // // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // // // // // // //   const UserHomeWrapper({super.key});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // // // // // // //   User? firebaseUser;
// // // // // // // // // // // //   String username = "";
// // // // // // // // // // // //   String? profileImageBase64;

// // // // // // // // // // // //   int selectedIndex = 0;
// // // // // // // // // // // //   String selectedMood = "🙂";

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // // // // // // //     _fetchUserData();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<void> _fetchUserData() async {
// // // // // // // // // // // //     if (firebaseUser == null) return;

// // // // // // // // // // // //     try {
// // // // // // // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // // // // // // //           .collection('users')
// // // // // // // // // // // //           .doc(firebaseUser!.uid)
// // // // // // // // // // // //           .get();

// // // // // // // // // // // //       if (doc.exists) {
// // // // // // // // // // // //         final data = doc.data()!;
// // // // // // // // // // // //         setState(() {
// // // // // // // // // // // //           username = data['name'] ?? "User";
// // // // // // // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // // // // // // //         });
// // // // // // // // // // // //       }
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print("Error fetching user data: $e");
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   // ImageProvider getProfileImage() {
// // // // // // // // // // // //   //   if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
// // // // // // // // // // // //   //     final bytes = base64Decode(profileImageBase64!);
// // // // // // // // // // // //   //     return MemoryImage(bytes);
// // // // // // // // // // // //   //   } else {
// // // // // // // // // // // //   //     return const AssetImage("assets/images/default_user.png");
// // // // // // // // // // // //   //   }
// // // // // // // // // // // //   // }

// // // // // // // // // // // //   ImageProvider getProfileImage() {
// // // // // // // // // // // //     try {
// // // // // // // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // // // // // // //             .replaceAll('\n', '')
// // // // // // // // // // // //             .replaceAll(' ', '');

// // // // // // // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // // // // // // //         return MemoryImage(bytes);
// // // // // // // // // // // //       }
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print("Profile image decode error: $e");
// // // // // // // // // // // //     }

// // // // // // // // // // // //     // ✅ CORRECT fallback
// // // // // // // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // // // // // // //     final loginController = LoginController();

// // // // // // // // // // // //     // Sign out from Firebase
// // // // // // // // // // // //     await FirebaseAuth.instance.signOut();

// // // // // // // // // // // //     // Clear saved login data
// // // // // // // // // // // //     await loginController.clearSharedPref();

// // // // // // // // // // // //     // Navigate back to LoginPage
// // // // // // // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // // // // // // //       context,
// // // // // // // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // // // // // // //       (route) => false,
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     final List<Widget> pages = [
// // // // // // // // // // // //       SafeArea(
// // // // // // // // // // // //         child: SingleChildScrollView(
// // // // // // // // // // // //           child: Column(
// // // // // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //             children: [
// // // // // // // // // // // //               SizedBox(
// // // // // // // // // // // //                 height: 180,
// // // // // // // // // // // //                 child: ListView(
// // // // // // // // // // // //                   scrollDirection: Axis.horizontal,
// // // // // // // // // // // //                   physics: const BouncingScrollPhysics(),
// // // // // // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // // // // // //                     horizontal: 16,
// // // // // // // // // // // //                     vertical: 12,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   children: const [
// // // // // // // // // // // //                     _MotivationCard(
// // // // // // // // // // // //                       text:
// // // // // // // // // // // //                           "Believe in yourself 🌟\nMagic happens when you try.",
// // // // // // // // // // // //                       icon: "🙂",
// // // // // // // // // // // //                       colors: [
// // // // // // // // // // // //                         Color.fromARGB(255, 174, 112, 184),
// // // // // // // // // // // //                         Color(0xFFE040FB),
// // // // // // // // // // // //                       ],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _MotivationCard(
// // // // // // // // // // // //                       text:
// // // // // // // // // // // //                           "Every day is a fresh start ✨\nSmile and shine today.",
// // // // // // // // // // // //                       icon: "🌸",
// // // // // // // // // // // //                       colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _MotivationCard(
// // // // // // // // // // // //                       text:
// // // // // // // // // // // //                           "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
// // // // // // // // // // // //                       icon: "🌞",
// // // // // // // // // // // //                       colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _MotivationCard(
// // // // // // // // // // // //                       text:
// // // // // // // // // // // //                           "Stay calm, stay positive 🌈\nInner peace is power.",
// // // // // // // // // // // //                       icon: "🧘",
// // // // // // // // // // // //                       colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _MotivationCard(
// // // // // // // // // // // //                       text: "Push yourself 💪\nBecause no one else will.",
// // // // // // // // // // // //                       icon: "🔥",
// // // // // // // // // // // //                       colors: [Color(0xFFF44336), Color(0xFFE57373)],
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ],
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               Padding(
// // // // // // // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // // // // // // //                   horizontal: 16,
// // // // // // // // // // // //                   vertical: 16,
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 child: Wrap(
// // // // // // // // // // // //                   spacing: 16,
// // // // // // // // // // // //                   runSpacing: 16,
// // // // // // // // // // // //                   children: [
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // // // // // // //                       label: "  Talk to Me  ",
// // // // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // // //                           context,
// // // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.health_and_safety,
// // // // // // // // // // // //                       label: "  Wellness Hub  ",
// // // // // // // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         showModalBottomSheet(
// // // // // // // // // // // //                           context: context,
// // // // // // // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // // // // // // //                               top: Radius.circular(20),
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                           builder: (context) {
// // // // // // // // // // // //                             return Container(
// // // // // // // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // // // // // // //                               child: Wrap(
// // // // // // // // // // // //                                 spacing: 16,
// // // // // // // // // // // //                                 runSpacing: 16,
// // // // // // // // // // // //                                 children: [
// // // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // // //                                     icon: Icons.spa,
// // // // // // // // // // // //                                     label: "  Self-Care  ",
// // // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // // //                                         context,
// // // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // // //                                               const DailyWellnessPage(),
// // // // // // // // // // // //                                         ),
// // // // // // // // // // // //                                       );
// // // // // // // // // // // //                                     },
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // // //                                     icon: Icons.fitness_center,
// // // // // // // // // // // //                                     label: "  Exercise  ",
// // // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // // //                                         context,
// // // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // // // // // // //                                         ),
// // // // // // // // // // // //                                       );
// // // // // // // // // // // //                                     },
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // // //                                     icon: Icons.healing,
// // // // // // // // // // // //                                     label: "  Healing  ",
// // // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // // //                                         context,
// // // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // // //                                               const StressManagementPage(),
// // // // // // // // // // // //                                         ),
// // // // // // // // // // // //                                       );
// // // // // // // // // // // //                                     },
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // // //                                     icon: Icons.bedtime,
// // // // // // // // // // // //                                     label: "  Sleep  ",
// // // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // // //                                         context,
// // // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // // //                                               const SleepRelaxationPage(),
// // // // // // // // // // // //                                         ),
// // // // // // // // // // // //                                       );
// // // // // // // // // // // //                                     },
// // // // // // // // // // // //                                   ),
// // // // // // // // // // // //                                 ],
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                             );
// // // // // // // // // // // //                           },
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // // // // // // //                       label: "  Guide  ",
// // // // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // // //                           context,
// // // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.mood,
// // // // // // // // // // // //                       label: "  Mood Tracker  ",
// // // // // // // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // // //                           context,
// // // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.favorite,
// // // // // // // // // // // //                       label: "  Relationship Advice  ",
// // // // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // // //                           context,
// // // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // // //                       icon: Icons.psychology,
// // // // // // // // // // // //                       label: "  Expert Advice  ",
// // // // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // // // //                       onTap: () {
// // // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // // //                           context,
// // // // // // // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // // // // // // //                         );
// // // // // // // // // // // //                       },
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ],
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ],
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // // // // // // //       const Center(child: Text("Book Page")),
// // // // // // // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // // // // // // //     ];

// // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // //       backgroundColor: kCard,
// // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // // // // // // //         centerTitle: false,
// // // // // // // // // // // //         title: Column(
// // // // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // // //           children: [
// // // // // // // // // // // //             Text(
// // // // // // // // // // // //               "Hello $username",
// // // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // // //                 color: Colors.black,
// // // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // // //                 fontSize: 18,
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             const Text(
// // // // // // // // // // // //               "How are you feeling today?",
// // // // // // // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ],
// // // // // // // // // // // //         ),
// // // // // // // // // // // //         actions: [
// // // // // // // // // // // //           Padding(
// // // // // // // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       drawer: Drawer(
// // // // // // // // // // // //         backgroundColor: kCard,
// // // // // // // // // // // //         child: SafeArea(
// // // // // // // // // // // //           child: Column(
// // // // // // // // // // // //             children: [
// // // // // // // // // // // //               UserAccountsDrawerHeader(
// // // // // // // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // // // // // // //                   radius: 30,
// // // // // // // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 accountName: Text(
// // // // // // // // // // // //                   username,
// // // // // // // // // // // //                   style: const TextStyle(
// // // // // // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // // // // // //                     fontSize: 18,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               ListTile(
// // // // // // // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // // // // // // //                 title: const Text("Dashboard"),
// // // // // // // // // // // //                 onTap: () {
// // // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // // //                     context,
// // // // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   );
// // // // // // // // // // // //                 },
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               ListTile(
// // // // // // // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // // // // // // // // //                 title: const Text("Notifications"),
// // // // // // // // // // // //                 onTap: () {
// // // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // // //                     context,
// // // // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   );
// // // // // // // // // // // //                 },
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               ListTile(
// // // // // // // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // // // // // // //                 title: const Text("Emergency"),
// // // // // // // // // // // //                 onTap: () {
// // // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // // //                     context,
// // // // // // // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // // // // //                   );
// // // // // // // // // // // //                 },
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               ListTile(
// // // // // // // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
// // // // // // // // // // // //                 title: const Text("Help & Support"),
// // // // // // // // // // // //                 onTap: () {
// // // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // // //                     context,
// // // // // // // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // // // // // // //                   );
// // // // // // // // // // // //                 },
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               const Spacer(),
// // // // // // // // // // // //               const Divider(),
// // // // // // // // // // // //               ListTile(
// // // // // // // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // // // // // // //                 title: const Text(
// // // // // // // // // // // //                   "Logout",
// // // // // // // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 onTap: () async {
// // // // // // // // // // // //                   Navigator.pop(context); // Close drawer
// // // // // // // // // // // //                   await handleLogout(context); // Logout
// // // // // // // // // // // //                 },
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ],
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       body: pages[selectedIndex],
// // // // // // // // // // // //       floatingActionButton: selectedIndex == 0
// // // // // // // // // // // //           ? FloatingActionButton(
// // // // // // // // // // // //               backgroundColor: Colors.orange,
// // // // // // // // // // // //               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
// // // // // // // // // // // //               onPressed: () {
// // // // // // // // // // // //                 showModalBottomSheet(
// // // // // // // // // // // //                   context: context,
// // // // // // // // // // // //                   shape: const RoundedRectangleBorder(
// // // // // // // // // // // //                     borderRadius: BorderRadius.vertical(
// // // // // // // // // // // //                       top: Radius.circular(20),
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   builder: (context) {
// // // // // // // // // // // //                     return Container(
// // // // // // // // // // // //                       padding: const EdgeInsets.all(20),
// // // // // // // // // // // //                       child: Column(
// // // // // // // // // // // //                         mainAxisSize: MainAxisSize.min,
// // // // // // // // // // // //                         children: [
// // // // // // // // // // // //                           const Text(
// // // // // // // // // // // //                             "How are you feeling?",
// // // // // // // // // // // //                             style: TextStyle(
// // // // // // // // // // // //                               fontSize: 18,
// // // // // // // // // // // //                               fontWeight: FontWeight.bold,
// // // // // // // // // // // //                             ),
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                           const SizedBox(height: 16),
// // // // // // // // // // // //                           Wrap(
// // // // // // // // // // // //                             spacing: 16,
// // // // // // // // // // // //                             runSpacing: 12,
// // // // // // // // // // // //                             children: [
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "🙂",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "🙂"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "😢",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "😢"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "😡",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "😡"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "😴",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "😴"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "😍",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "😍"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // // //                                 emoji: "😌",
// // // // // // // // // // // //                                 label: "",
// // // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // // //                                     setState(() => selectedMood = "😌"),
// // // // // // // // // // // //                               ),
// // // // // // // // // // // //                             ],
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ],
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                     );
// // // // // // // // // // // //                   },
// // // // // // // // // // // //                 );
// // // // // // // // // // // //               },
// // // // // // // // // // // //             )
// // // // // // // // // // // //           : null,
// // // // // // // // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // // // // // // // //       bottomNavigationBar: UserBottomNavBar(
// // // // // // // // // // // //       selectedIndex: selectedIndex,
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // // --- Helper Widgets ---
// // // // // // // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // // // // // // //   final String emoji;
// // // // // // // // // // // //   final String label;
// // // // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // // // //   const _MoodEmoji({
// // // // // // // // // // // //     required this.emoji,
// // // // // // // // // // // //     required this.label,
// // // // // // // // // // // //     required this.onTap,
// // // // // // // // // // // //   });

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return GestureDetector(
// // // // // // // // // // // //       onTap: () {
// // // // // // // // // // // //         onTap();
// // // // // // // // // // // //         Navigator.pop(context);
// // // // // // // // // // // //       },
// // // // // // // // // // // //       child: Column(
// // // // // // // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // // // // // // //         children: [
// // // // // // // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // // // // // // //           const SizedBox(height: 4),
// // // // // // // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // // // // // // //   final String text;
// // // // // // // // // // // //   final String icon;
// // // // // // // // // // // //   final List<Color> colors;

// // // // // // // // // // // //   const _MotivationCard({
// // // // // // // // // // // //     required this.text,
// // // // // // // // // // // //     required this.icon,
// // // // // // // // // // // //     required this.colors,
// // // // // // // // // // // //   });

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return Container(
// // // // // // // // // // // //       width: 280,
// // // // // // // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // // // // // // //         gradient: LinearGradient(
// // // // // // // // // // // //           colors: colors,
// // // // // // // // // // // //           begin: Alignment.topLeft,
// // // // // // // // // // // //           end: Alignment.bottomRight,
// // // // // // // // // // // //         ),
// // // // // // // // // // // //         boxShadow: [
// // // // // // // // // // // //           BoxShadow(
// // // // // // // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // // // // // // //             blurRadius: 8,
// // // // // // // // // // // //             offset: const Offset(0, 4),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       child: Padding(
// // // // // // // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // // // // // // //         child: Row(
// // // // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // // // // //           children: [
// // // // // // // // // // // //             CircleAvatar(
// // // // // // // // // // // //               radius: 32,
// // // // // // // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             const SizedBox(width: 16),
// // // // // // // // // // // //             Expanded(
// // // // // // // // // // // //               child: Text(
// // // // // // // // // // // //                 text,
// // // // // // // // // // // //                 style: const TextStyle(
// // // // // // // // // // // //                   color: Colors.white,
// // // // // // // // // // // //                   fontSize: 17,
// // // // // // // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // // // // // // //                   height: 1.4,
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ],
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // // // // // // //   final IconData icon;
// // // // // // // // // // // //   final String label;
// // // // // // // // // // // //   final Color color;
// // // // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // // // //   const _FeatureRoundButton({
// // // // // // // // // // // //     required this.icon,
// // // // // // // // // // // //     required this.label,
// // // // // // // // // // // //     required this.color,
// // // // // // // // // // // //     required this.onTap,
// // // // // // // // // // // //   });

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return InkWell(
// // // // // // // // // // // //       onTap: onTap,
// // // // // // // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // // // // // // //       child: Container(
// // // // // // // // // // // //         width: 150,
// // // // // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // // // // //           color: color.withOpacity(0.6),
// // // // // // // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // // // // // // //         ),
// // // // // // // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // // // // // // //         child: Column(
// // // // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // // //           children: [
// // // // // // // // // // // //             CircleAvatar(
// // // // // // // // // // // //               radius: 28,
// // // // // // // // // // // //               backgroundColor: color,
// // // // // // // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //             const SizedBox(height: 10),
// // // // // // // // // // // //             Text(
// // // // // // // // // // // //               label,
// // // // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ],
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // // // // // // import 'dart:convert';
// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // // // // // //     hide kCard, kPrimary;
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // // // // // //   const UserHomeWrapper({super.key});

// // // // // // // // // // //   @override
// // // // // // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // // // // // }

// // // // // // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // // // // // //   User? firebaseUser;
// // // // // // // // // // //   String username = "";
// // // // // // // // // // //   String? profileImageBase64;

// // // // // // // // // // //   int selectedIndex = 0;
// // // // // // // // // // //   String selectedMood = "🙂";

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // // // // // //     _fetchUserData();
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> _fetchUserData() async {
// // // // // // // // // // //     if (firebaseUser == null) return;

// // // // // // // // // // //     try {
// // // // // // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // // // // // //           .collection('users')
// // // // // // // // // // //           .doc(firebaseUser!.uid)
// // // // // // // // // // //           .get();

// // // // // // // // // // //       if (doc.exists) {
// // // // // // // // // // //         final data = doc.data()!;
// // // // // // // // // // //         setState(() {
// // // // // // // // // // //           username = data['name'] ?? "User";
// // // // // // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // // // // // //         });
// // // // // // // // // // //       }
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print("Error fetching user data: $e");
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   // ImageProvider getProfileImage() {
// // // // // // // // // // //   //   if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
// // // // // // // // // // //   //     final bytes = base64Decode(profileImageBase64!);
// // // // // // // // // // //   //     return MemoryImage(bytes);
// // // // // // // // // // //   //   } else {
// // // // // // // // // // //   //     return const AssetImage("assets/images/default_user.png");
// // // // // // // // // // //   //   }
// // // // // // // // // // //   // }

// // // // // // // // // // //   ImageProvider getProfileImage() {
// // // // // // // // // // //     try {
// // // // // // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // // // // // //             .replaceAll('\n', '')
// // // // // // // // // // //             .replaceAll(' ', '');

// // // // // // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // // // // // //         return MemoryImage(bytes);
// // // // // // // // // // //       }
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print("Profile image decode error: $e");
// // // // // // // // // // //     }

// // // // // // // // // // //     // ✅ CORRECT fallback
// // // // // // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // // // // // //     final loginController = LoginController();

// // // // // // // // // // //     // Sign out from Firebase
// // // // // // // // // // //     await FirebaseAuth.instance.signOut();

// // // // // // // // // // //     // Clear saved login data
// // // // // // // // // // //     await loginController.clearSharedPref();

// // // // // // // // // // //     // Navigate back to LoginPage
// // // // // // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // // // // // //       context,
// // // // // // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // // // // // //       (route) => false,
// // // // // // // // // // //     );
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     final List<Widget> pages = [
// // // // // // // // // // //       SafeArea(
// // // // // // // // // // //         child: SingleChildScrollView(
// // // // // // // // // // //           child: Column(
// // // // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //             children: [
// // // // // // // // // // //               const SizedBox(height: 12),
// // // // // // // // // // //               const UserHomeMotivationSection(),

// // // // // // // // // // //               Padding(
// // // // // // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // // // // // //                   horizontal: 16,
// // // // // // // // // // //                   vertical: 16,
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 child: Wrap(
// // // // // // // // // // //                   spacing: 16,
// // // // // // // // // // //                   runSpacing: 16,
// // // // // // // // // // //                   children: [
// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // // // // // //                       label: "  Talk to Me  ",
// // // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // //                           context,
// // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),

// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.health_and_safety,
// // // // // // // // // // //                       label: "  Wellness Hub  ",
// // // // // // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         showModalBottomSheet(
// // // // // // // // // // //                           context: context,
// // // // // // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // // // // // //                               top: Radius.circular(20),
// // // // // // // // // // //                             ),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                           builder: (context) {
// // // // // // // // // // //                             return Container(
// // // // // // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // // // // // //                               child: Wrap(
// // // // // // // // // // //                                 spacing: 16,
// // // // // // // // // // //                                 runSpacing: 16,
// // // // // // // // // // //                                 children: [
// // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // //                                     icon: Icons.spa,
// // // // // // // // // // //                                     label: "  Self-Care  ",
// // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // //                                         context,
// // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // //                                               const DailyWellnessPage(),
// // // // // // // // // // //                                         ),
// // // // // // // // // // //                                       );
// // // // // // // // // // //                                     },
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // //                                     icon: Icons.fitness_center,
// // // // // // // // // // //                                     label: "  Exercise  ",
// // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // //                                         context,
// // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // // // // // //                                         ),
// // // // // // // // // // //                                       );
// // // // // // // // // // //                                     },
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // //                                     icon: Icons.healing,
// // // // // // // // // // //                                     label: "  Healing  ",
// // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // //                                         context,
// // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // //                                               const StressManagementPage(),
// // // // // // // // // // //                                         ),
// // // // // // // // // // //                                       );
// // // // // // // // // // //                                     },
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // // //                                     icon: Icons.bedtime,
// // // // // // // // // // //                                     label: "  Sleep  ",
// // // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // // //                                     onTap: () {
// // // // // // // // // // //                                       Navigator.push(
// // // // // // // // // // //                                         context,
// // // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // // //                                               const SleepRelaxationPage(),
// // // // // // // // // // //                                         ),
// // // // // // // // // // //                                       );
// // // // // // // // // // //                                     },
// // // // // // // // // // //                                   ),
// // // // // // // // // // //                                 ],
// // // // // // // // // // //                               ),
// // // // // // // // // // //                             );
// // // // // // // // // // //                           },
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),

// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // // // // // //                       label: "  Guide  ",
// // // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // //                           context,
// // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),
// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.mood,
// // // // // // // // // // //                       label: "  Mood Tracker  ",
// // // // // // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // //                           context,
// // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),
// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.favorite,
// // // // // // // // // // //                       label: "  Relationship Advice  ",
// // // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // //                           context,
// // // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),
// // // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // // //                       icon: Icons.psychology,
// // // // // // // // // // //                       label: "  Expert Advice  ",
// // // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // // //                       onTap: () {
// // // // // // // // // // //                         Navigator.push(
// // // // // // // // // // //                           context,
// // // // // // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // // // // // //                         );
// // // // // // // // // // //                       },
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   ],
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),
// // // // // // // // // // //             ],
// // // // // // // // // // //           ),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // // // // // //       const Center(child: Text("Book Page")),
// // // // // // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // // // // // //     ];

// // // // // // // // // // //     return Scaffold(
// // // // // // // // // // //       backgroundColor: kCard,
// // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // // // // // //         centerTitle: false,
// // // // // // // // // // //         title: Column(
// // // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // // //           children: [
// // // // // // // // // // //             Text(
// // // // // // // // // // //               "Hello $username",
// // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // //                 color: Colors.black,
// // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // //                 fontSize: 18,
// // // // // // // // // // //               ),
// // // // // // // // // // //             ),
// // // // // // // // // // //             const Text(
// // // // // // // // // // //               "How are you feeling today?",
// // // // // // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // // // // // //             ),
// // // // // // // // // // //           ],
// // // // // // // // // // //         ),
// // // // // // // // // // //         actions: [
// // // // // // // // // // //           Padding(
// // // // // // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // // // // // //           ),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //       drawer: Drawer(
// // // // // // // // // // //         backgroundColor: kCard,
// // // // // // // // // // //         child: SafeArea(
// // // // // // // // // // //           child: Column(
// // // // // // // // // // //             children: [
// // // // // // // // // // //               UserAccountsDrawerHeader(
// // // // // // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // // // // // //                   radius: 30,
// // // // // // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 accountName: Text(
// // // // // // // // // // //                   username,
// // // // // // // // // // //                   style: const TextStyle(
// // // // // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // // // // //                     fontSize: 18,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // // // // // //               ),
// // // // // // // // // // //               ListTile(
// // // // // // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // // // // // //                 title: const Text("Dashboard"),
// // // // // // // // // // //                 onTap: () {
// // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // //                     context,
// // // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   );
// // // // // // // // // // //                 },
// // // // // // // // // // //               ),
// // // // // // // // // // //               ListTile(
// // // // // // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // // // // // // // //                 title: const Text("Notifications"),
// // // // // // // // // // //                 onTap: () {
// // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // //                     context,
// // // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   );
// // // // // // // // // // //                 },
// // // // // // // // // // //               ),
// // // // // // // // // // //               ListTile(
// // // // // // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // // // // // //                 title: const Text("Emergency"),
// // // // // // // // // // //                 onTap: () {
// // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // //                     context,
// // // // // // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // // // //                   );
// // // // // // // // // // //                 },
// // // // // // // // // // //               ),
// // // // // // // // // // //               ListTile(
// // // // // // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
// // // // // // // // // // //                 title: const Text("Help & Support"),
// // // // // // // // // // //                 onTap: () {
// // // // // // // // // // //                   Navigator.push(
// // // // // // // // // // //                     context,
// // // // // // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // // // // // //                   );
// // // // // // // // // // //                 },
// // // // // // // // // // //               ),
// // // // // // // // // // //               const Spacer(),
// // // // // // // // // // //               const Divider(),
// // // // // // // // // // //               ListTile(
// // // // // // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // // // // // //                 title: const Text(
// // // // // // // // // // //                   "Logout",
// // // // // // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 onTap: () async {
// // // // // // // // // // //                   Navigator.pop(context); // Close drawer
// // // // // // // // // // //                   await handleLogout(context); // Logout
// // // // // // // // // // //                 },
// // // // // // // // // // //               ),
// // // // // // // // // // //             ],
// // // // // // // // // // //           ),
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       body: pages[selectedIndex],
// // // // // // // // // // //       floatingActionButton: selectedIndex == 0
// // // // // // // // // // //           ? FloatingActionButton(
// // // // // // // // // // //               backgroundColor: Colors.orange,
// // // // // // // // // // //               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
// // // // // // // // // // //               onPressed: () {
// // // // // // // // // // //                 showModalBottomSheet(
// // // // // // // // // // //                   context: context,
// // // // // // // // // // //                   shape: const RoundedRectangleBorder(
// // // // // // // // // // //                     borderRadius: BorderRadius.vertical(
// // // // // // // // // // //                       top: Radius.circular(20),
// // // // // // // // // // //                     ),
// // // // // // // // // // //                   ),
// // // // // // // // // // //                   builder: (context) {
// // // // // // // // // // //                     return Container(
// // // // // // // // // // //                       padding: const EdgeInsets.all(20),
// // // // // // // // // // //                       child: Column(
// // // // // // // // // // //                         mainAxisSize: MainAxisSize.min,
// // // // // // // // // // //                         children: [
// // // // // // // // // // //                           const Text(
// // // // // // // // // // //                             "How are you feeling?",
// // // // // // // // // // //                             style: TextStyle(
// // // // // // // // // // //                               fontSize: 18,
// // // // // // // // // // //                               fontWeight: FontWeight.bold,
// // // // // // // // // // //                             ),
// // // // // // // // // // //                           ),
// // // // // // // // // // //                           const SizedBox(height: 16),
// // // // // // // // // // //                           Wrap(
// // // // // // // // // // //                             spacing: 16,
// // // // // // // // // // //                             runSpacing: 12,
// // // // // // // // // // //                             children: [
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "🙂",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "🙂"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "😢",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "😢"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "😡",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "😡"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "😴",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "😴"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "😍",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "😍"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                               _MoodEmoji(
// // // // // // // // // // //                                 emoji: "😌",
// // // // // // // // // // //                                 label: "",
// // // // // // // // // // //                                 onTap: () =>
// // // // // // // // // // //                                     setState(() => selectedMood = "😌"),
// // // // // // // // // // //                               ),
// // // // // // // // // // //                             ],
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ],
// // // // // // // // // // //                       ),
// // // // // // // // // // //                     );
// // // // // // // // // // //                   },
// // // // // // // // // // //                 );
// // // // // // // // // // //               },
// // // // // // // // // // //             )
// // // // // // // // // // //           : null,
// // // // // // // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // // // // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // // --- Helper Widgets ---
// // // // // // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // // // // // //   final String emoji;
// // // // // // // // // // //   final String label;
// // // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // // //   const _MoodEmoji({
// // // // // // // // // // //     required this.emoji,
// // // // // // // // // // //     required this.label,
// // // // // // // // // // //     required this.onTap,
// // // // // // // // // // //   });

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return GestureDetector(
// // // // // // // // // // //       onTap: () {
// // // // // // // // // // //         onTap();
// // // // // // // // // // //         Navigator.pop(context);
// // // // // // // // // // //       },
// // // // // // // // // // //       child: Column(
// // // // // // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // // // // // //         children: [
// // // // // // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // // // // // //           const SizedBox(height: 4),
// // // // // // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // // // // // //   final String text;
// // // // // // // // // // //   final String icon;
// // // // // // // // // // //   final List<Color> colors;

// // // // // // // // // // //   const _MotivationCard({
// // // // // // // // // // //     required this.text,
// // // // // // // // // // //     required this.icon,
// // // // // // // // // // //     required this.colors,
// // // // // // // // // // //   });

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return Container(
// // // // // // // // // // //       width: 280,
// // // // // // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // // // // // //         gradient: LinearGradient(
// // // // // // // // // // //           colors: colors,
// // // // // // // // // // //           begin: Alignment.topLeft,
// // // // // // // // // // //           end: Alignment.bottomRight,
// // // // // // // // // // //         ),
// // // // // // // // // // //         boxShadow: [
// // // // // // // // // // //           BoxShadow(
// // // // // // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // // // // // //             blurRadius: 8,
// // // // // // // // // // //             offset: const Offset(0, 4),
// // // // // // // // // // //           ),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //       child: Padding(
// // // // // // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // // // // // //         child: Row(
// // // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // // // //           children: [
// // // // // // // // // // //             CircleAvatar(
// // // // // // // // // // //               radius: 32,
// // // // // // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // // // // // //             ),
// // // // // // // // // // //             const SizedBox(width: 16),
// // // // // // // // // // //             Expanded(
// // // // // // // // // // //               child: Text(
// // // // // // // // // // //                 text,
// // // // // // // // // // //                 style: const TextStyle(
// // // // // // // // // // //                   color: Colors.white,
// // // // // // // // // // //                   fontSize: 17,
// // // // // // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // // // // // //                   height: 1.4,
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ),
// // // // // // // // // // //             ),
// // // // // // // // // // //           ],
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // // // // // //   final IconData icon;
// // // // // // // // // // //   final String label;
// // // // // // // // // // //   final Color color;
// // // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // // //   const _FeatureRoundButton({
// // // // // // // // // // //     required this.icon,
// // // // // // // // // // //     required this.label,
// // // // // // // // // // //     required this.color,
// // // // // // // // // // //     required this.onTap,
// // // // // // // // // // //   });

// // // // // // // // // // //   Widget _buildMotivationCards() {
// // // // // // // // // // //     return SizedBox(
// // // // // // // // // // //       height: 180,
// // // // // // // // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // // // // // // //         stream: FirebaseFirestore.instance
// // // // // // // // // // //             .collection('motivation_cards')
// // // // // // // // // // //             .where('isActive', isEqualTo: true)
// // // // // // // // // // //             .orderBy('order')
// // // // // // // // // // //             .snapshots(),
// // // // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // // // //           if (snapshot.hasError) {
// // // // // // // // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // // // // // // // //           }

// // // // // // // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // // // // // //             return const Center(child: CircularProgressIndicator());
// // // // // // // // // // //           }

// // // // // // // // // // //           final docs = snapshot.data?.docs ?? [];

// // // // // // // // // // //           if (docs.isEmpty) {
// // // // // // // // // // //             return const Center(
// // // // // // // // // // //               child: Text(
// // // // // // // // // // //                 "No motivation cards yet",
// // // // // // // // // // //                 style: TextStyle(color: Colors.white),
// // // // // // // // // // //               ),
// // // // // // // // // // //             );
// // // // // // // // // // //           }

// // // // // // // // // // //           return ListView.builder(
// // // // // // // // // // //             scrollDirection: Axis.horizontal,
// // // // // // // // // // //             physics: const BouncingScrollPhysics(),
// // // // // // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // // // // // //             itemCount: docs.length,
// // // // // // // // // // //             itemBuilder: (context, index) {
// // // // // // // // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // // // // // // // //               final docId = docs[index].id;

// // // // // // // // // // //               return _MotivationCard(
// // // // // // // // // // //                 text: data['text'] ?? '',
// // // // // // // // // // //                 icon: data['icon'] ?? '🙂',
// // // // // // // // // // //                 colors: [
// // // // // // // // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // // // // // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // // // // // // // //                 ],
// // // // // // // // // // //               );
// // // // // // // // // // //             },
// // // // // // // // // // //           );
// // // // // // // // // // //         },
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return InkWell(
// // // // // // // // // // //       onTap: onTap,
// // // // // // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // // // // // //       child: Container(
// // // // // // // // // // //         width: 150,
// // // // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // // // //           color: color.withOpacity(0.6),
// // // // // // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // // // // // //         ),
// // // // // // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // // // // // //         child: Column(
// // // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // //           children: [
// // // // // // // // // // //             CircleAvatar(
// // // // // // // // // // //               radius: 28,
// // // // // // // // // // //               backgroundColor: color,
// // // // // // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // // // // // //             ),
// // // // // // // // // // //             const SizedBox(height: 10),
// // // // // // // // // // //             Text(
// // // // // // // // // // //               label,
// // // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // // // // // //             ),
// // // // // // // // // // //           ],
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // // // // // import 'dart:convert';
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // // // // //     hide kCard, kPrimary;
// // // // // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

// // // // // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // // // // //   const UserHomeWrapper({super.key});

// // // // // // // // // //   @override
// // // // // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // // // // }

// // // // // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // // // // //   User? firebaseUser;
// // // // // // // // // //   String username = "";
// // // // // // // // // //   String? profileImageBase64;

// // // // // // // // // //   int selectedIndex = 0;
// // // // // // // // // //   String selectedMood = "🙂";

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // // // // //     _fetchUserData();
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> _fetchUserData() async {
// // // // // // // // // //     if (firebaseUser == null) return;

// // // // // // // // // //     try {
// // // // // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // // // // //           .collection('users')
// // // // // // // // // //           .doc(firebaseUser!.uid)
// // // // // // // // // //           .get();

// // // // // // // // // //       if (doc.exists) {
// // // // // // // // // //         final data = doc.data()!;
// // // // // // // // // //         setState(() {
// // // // // // // // // //           username = data['name'] ?? "User";
// // // // // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // // // // //         });
// // // // // // // // // //       }
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print("Error fetching user data: $e");
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   ImageProvider getProfileImage() {
// // // // // // // // // //     try {
// // // // // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // // // // //             .replaceAll('\n', '')
// // // // // // // // // //             .replaceAll(' ', '');

// // // // // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // // // // //         return MemoryImage(bytes);
// // // // // // // // // //       }
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print("Profile image decode error: $e");
// // // // // // // // // //     }

// // // // // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // // // // //     final loginController = LoginController();
// // // // // // // // // //     await FirebaseAuth.instance.signOut();
// // // // // // // // // //     await loginController.clearSharedPref();
// // // // // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // // // // //       context,
// // // // // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // // // // //       (route) => false,
// // // // // // // // // //     );
// // // // // // // // // //   }

// // // // // // // // // //   void _onBottomNavTapped(int index) {
// // // // // // // // // //     setState(() {
// // // // // // // // // //       selectedIndex = index;
// // // // // // // // // //     });

// // // // // // // // // //     if (index == 1) {
// // // // // // // // // //       // Chatbot
// // // // // // // // // //       Navigator.push(
// // // // // // // // // //         context,
// // // // // // // // // //         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // // // // // // // // //       );
// // // // // // // // // //     } else if (index == 2) {
// // // // // // // // // //       // Emergency
// // // // // // // // // //       Navigator.push(
// // // // // // // // // //         context,
// // // // // // // // // //         MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // // //       );
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     final List<Widget> pages = [
// // // // // // // // // //       SafeArea(
// // // // // // // // // //         child: SingleChildScrollView(
// // // // // // // // // //           child: Column(
// // // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //             children: [
// // // // // // // // // //               const SizedBox(height: 12),
// // // // // // // // // //               const UserHomeMotivationSection(),

// // // // // // // // // //               Padding(
// // // // // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // // // // //                   horizontal: 16,
// // // // // // // // // //                   vertical: 16,
// // // // // // // // // //                 ),
// // // // // // // // // //                 child: Wrap(
// // // // // // // // // //                   spacing: 16,
// // // // // // // // // //                   runSpacing: 16,
// // // // // // // // // //                   children: [
// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // // // // //                       label: "  Talk to Me  ",
// // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         Navigator.push(
// // // // // // // // // //                           context,
// // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // // // // //                           ),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),

// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.health_and_safety,
// // // // // // // // // //                       label: "  Wellness Hub  ",
// // // // // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         showModalBottomSheet(
// // // // // // // // // //                           context: context,
// // // // // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // // // // //                               top: Radius.circular(20),
// // // // // // // // // //                             ),
// // // // // // // // // //                           ),
// // // // // // // // // //                           builder: (context) {
// // // // // // // // // //                             return Container(
// // // // // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // // // // //                               child: Wrap(
// // // // // // // // // //                                 spacing: 16,
// // // // // // // // // //                                 runSpacing: 16,
// // // // // // // // // //                                 children: [
// // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // //                                     icon: Icons.spa,
// // // // // // // // // //                                     label: "  Self-Care  ",
// // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // //                                     onTap: () {
// // // // // // // // // //                                       Navigator.push(
// // // // // // // // // //                                         context,
// // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // //                                               const DailyWellnessPage(),
// // // // // // // // // //                                         ),
// // // // // // // // // //                                       );
// // // // // // // // // //                                     },
// // // // // // // // // //                                   ),
// // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // //                                     icon: Icons.fitness_center,
// // // // // // // // // //                                     label: "  Exercise  ",
// // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // //                                     onTap: () {
// // // // // // // // // //                                       Navigator.push(
// // // // // // // // // //                                         context,
// // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // // // // //                                         ),
// // // // // // // // // //                                       );
// // // // // // // // // //                                     },
// // // // // // // // // //                                   ),
// // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // //                                     icon: Icons.healing,
// // // // // // // // // //                                     label: "  Healing  ",
// // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // //                                     onTap: () {
// // // // // // // // // //                                       Navigator.push(
// // // // // // // // // //                                         context,
// // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // //                                               const StressManagementPage(),
// // // // // // // // // //                                         ),
// // // // // // // // // //                                       );
// // // // // // // // // //                                     },
// // // // // // // // // //                                   ),
// // // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // // //                                     icon: Icons.bedtime,
// // // // // // // // // //                                     label: "  Sleep  ",
// // // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // // //                                     onTap: () {
// // // // // // // // // //                                       Navigator.push(
// // // // // // // // // //                                         context,
// // // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // // //                                           builder: (_) =>
// // // // // // // // // //                                               const SleepRelaxationPage(),
// // // // // // // // // //                                         ),
// // // // // // // // // //                                       );
// // // // // // // // // //                                     },
// // // // // // // // // //                                   ),
// // // // // // // // // //                                 ],
// // // // // // // // // //                               ),
// // // // // // // // // //                             );
// // // // // // // // // //                           },
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),

// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // // // // //                       label: "  Guide  ",
// // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         Navigator.push(
// // // // // // // // // //                           context,
// // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // // // // //                           ),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),
// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.mood,
// // // // // // // // // //                       label: "  Mood Tracker  ",
// // // // // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         Navigator.push(
// // // // // // // // // //                           context,
// // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // // // // //                           ),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),
// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.favorite,
// // // // // // // // // //                       label: "  Relationship Advice  ",
// // // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         Navigator.push(
// // // // // // // // // //                           context,
// // // // // // // // // //                           MaterialPageRoute(
// // // // // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // // // // //                           ),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),
// // // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // // //                       icon: Icons.psychology,
// // // // // // // // // //                       label: "  Expert Advice  ",
// // // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // // //                       onTap: () {
// // // // // // // // // //                         Navigator.push(
// // // // // // // // // //                           context,
// // // // // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // // // // //                         );
// // // // // // // // // //                       },
// // // // // // // // // //                     ),
// // // // // // // // // //                   ],
// // // // // // // // // //                 ),
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // // // // //       const Center(child: Text("Book Page")),
// // // // // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // // // // //     ];

// // // // // // // // // //     return Scaffold(
// // // // // // // // // //       backgroundColor: kCard,
// // // // // // // // // //       appBar: AppBar(
// // // // // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // // // // //         centerTitle: false,
// // // // // // // // // //         title: Column(
// // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // // //           children: [
// // // // // // // // // //             Text(
// // // // // // // // // //               "Hello $username",
// // // // // // // // // //               style: const TextStyle(
// // // // // // // // // //                 color: Colors.black,
// // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // //                 fontSize: 18,
// // // // // // // // // //               ),
// // // // // // // // // //             ),
// // // // // // // // // //             const Text(
// // // // // // // // // //               "How are you feeling today?",
// // // // // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //         actions: [
// // // // // // // // // //           Padding(
// // // // // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //       drawer: Drawer(
// // // // // // // // // //         backgroundColor: kCard,
// // // // // // // // // //         child: SafeArea(
// // // // // // // // // //           child: Column(
// // // // // // // // // //             children: [
// // // // // // // // // //               UserAccountsDrawerHeader(
// // // // // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // // // // //                   radius: 30,
// // // // // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // // // // //                 ),
// // // // // // // // // //                 accountName: Text(
// // // // // // // // // //                   username,
// // // // // // // // // //                   style: const TextStyle(
// // // // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // // // //                     fontSize: 18,
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // // // // //               ),
// // // // // // // // // //               ListTile(
// // // // // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // // // // //                 title: const Text("Dashboard"),
// // // // // // // // // //                 onTap: () {
// // // // // // // // // //                   Navigator.push(
// // // // // // // // // //                     context,
// // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // // // // //                     ),
// // // // // // // // // //                   );
// // // // // // // // // //                 },
// // // // // // // // // //               ),
// // // // // // // // // //               ListTile(
// // // // // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // // // // // // //                 title: const Text("Notifications"),
// // // // // // // // // //                 onTap: () {
// // // // // // // // // //                   Navigator.push(
// // // // // // // // // //                     context,
// // // // // // // // // //                     MaterialPageRoute(
// // // // // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // // // // //                     ),
// // // // // // // // // //                   );
// // // // // // // // // //                 },
// // // // // // // // // //               ),
// // // // // // // // // //               ListTile(
// // // // // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // // // // //                 title: const Text("Emergency"),
// // // // // // // // // //                 onTap: () {
// // // // // // // // // //                   Navigator.push(
// // // // // // // // // //                     context,
// // // // // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // // //                   );
// // // // // // // // // //                 },
// // // // // // // // // //               ),
// // // // // // // // // //               ListTile(
// // // // // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
// // // // // // // // // //                 title: const Text("Help & Support"),
// // // // // // // // // //                 onTap: () {
// // // // // // // // // //                   Navigator.push(
// // // // // // // // // //                     context,
// // // // // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // // // // //                   );
// // // // // // // // // //                 },
// // // // // // // // // //               ),
// // // // // // // // // //               const Spacer(),
// // // // // // // // // //               const Divider(),
// // // // // // // // // //               ListTile(
// // // // // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // // // // //                 title: const Text(
// // // // // // // // // //                   "Logout",
// // // // // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // // // // //                 ),
// // // // // // // // // //                 onTap: () async {
// // // // // // // // // //                   Navigator.pop(context);
// // // // // // // // // //                   await handleLogout(context);
// // // // // // // // // //                 },
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //       body: pages[selectedIndex],
// // // // // // // // // //       floatingActionButton: FloatingActionButton(
// // // // // // // // // //         backgroundColor: Colors.redAccent,
// // // // // // // // // //         child: const Icon(Icons.warning, size: 30, color: Colors.white),
// // // // // // // // // //         onPressed: () {
// // // // // // // // // //           Navigator.push(
// // // // // // // // // //             context,
// // // // // // // // // //             MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // // //           );
// // // // // // // // // //         },
// // // // // // // // // //       ),
// // // // // // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // // // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // // --- Helper Widgets ---
// // // // // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // // // // //   final String emoji;
// // // // // // // // // //   final String label;
// // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // //   const _MoodEmoji({
// // // // // // // // // //     required this.emoji,
// // // // // // // // // //     required this.label,
// // // // // // // // // //     required this.onTap,
// // // // // // // // // //   });

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return GestureDetector(
// // // // // // // // // //       onTap: () {
// // // // // // // // // //         onTap();
// // // // // // // // // //         Navigator.pop(context);
// // // // // // // // // //       },
// // // // // // // // // //       child: Column(
// // // // // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // // // // //         children: [
// // // // // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // // // // //           const SizedBox(height: 4),
// // // // // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // // // // //   final String text;
// // // // // // // // // //   final String icon;
// // // // // // // // // //   final List<Color> colors;

// // // // // // // // // //   const _MotivationCard({
// // // // // // // // // //     required this.text,
// // // // // // // // // //     required this.icon,
// // // // // // // // // //     required this.colors,
// // // // // // // // // //   });

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Container(
// // // // // // // // // //       width: 280,
// // // // // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // // // // //         gradient: LinearGradient(
// // // // // // // // // //           colors: colors,
// // // // // // // // // //           begin: Alignment.topLeft,
// // // // // // // // // //           end: Alignment.bottomRight,
// // // // // // // // // //         ),
// // // // // // // // // //         boxShadow: [
// // // // // // // // // //           BoxShadow(
// // // // // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // // // // //             blurRadius: 8,
// // // // // // // // // //             offset: const Offset(0, 4),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //       child: Padding(
// // // // // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // // // // //         child: Row(
// // // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // // //           children: [
// // // // // // // // // //             CircleAvatar(
// // // // // // // // // //               radius: 32,
// // // // // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // // // // //             ),
// // // // // // // // // //             const SizedBox(width: 16),
// // // // // // // // // //             Expanded(
// // // // // // // // // //               child: Text(
// // // // // // // // // //                 text,
// // // // // // // // // //                 style: const TextStyle(
// // // // // // // // // //                   color: Colors.white,
// // // // // // // // // //                   fontSize: 17,
// // // // // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // // // // //                   height: 1.4,
// // // // // // // // // //                 ),
// // // // // // // // // //               ),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // // // // //   final IconData icon;
// // // // // // // // // //   final String label;
// // // // // // // // // //   final Color color;
// // // // // // // // // //   final VoidCallback onTap;

// // // // // // // // // //   const _FeatureRoundButton({
// // // // // // // // // //     required this.icon,
// // // // // // // // // //     required this.label,
// // // // // // // // // //     required this.color,
// // // // // // // // // //     required this.onTap,
// // // // // // // // // //   });

// // // // // // // // // //   Widget _buildMotivationCards() {
// // // // // // // // // //     return SizedBox(
// // // // // // // // // //       height: 180,
// // // // // // // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // // // // // //         stream: FirebaseFirestore.instance
// // // // // // // // // //             .collection('motivation_cards')
// // // // // // // // // //             .where('isActive', isEqualTo: true)
// // // // // // // // // //             .orderBy('order')
// // // // // // // // // //             .snapshots(),
// // // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // // //           if (snapshot.hasError) {
// // // // // // // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // // // // // // //           }

// // // // // // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // // // // //             return const Center(child: CircularProgressIndicator());
// // // // // // // // // //           }

// // // // // // // // // //           final docs = snapshot.data?.docs ?? [];

// // // // // // // // // //           if (docs.isEmpty) {
// // // // // // // // // //             return const Center(
// // // // // // // // // //               child: Text(
// // // // // // // // // //                 "No motivation cards yet",
// // // // // // // // // //                 style: TextStyle(color: Colors.white),
// // // // // // // // // //               ),
// // // // // // // // // //             );
// // // // // // // // // //           }

// // // // // // // // // //           return ListView.builder(
// // // // // // // // // //             scrollDirection: Axis.horizontal,
// // // // // // // // // //             physics: const BouncingScrollPhysics(),
// // // // // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // // // // //             itemCount: docs.length,
// // // // // // // // // //             itemBuilder: (context, index) {
// // // // // // // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // // // // // // //               final docId = docs[index].id;

// // // // // // // // // //               return _MotivationCard(
// // // // // // // // // //                 text: data['text'] ?? '',
// // // // // // // // // //                 icon: data['icon'] ?? '🙂',
// // // // // // // // // //                 colors: [
// // // // // // // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // // // // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // // // // // // //                 ],
// // // // // // // // // //               );
// // // // // // // // // //             },
// // // // // // // // // //           );
// // // // // // // // // //         },
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return InkWell(
// // // // // // // // // //       onTap: onTap,
// // // // // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // // // // //       child: Container(
// // // // // // // // // //         width: 150,
// // // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // // //           color: color.withOpacity(0.6),
// // // // // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // // // // //         ),
// // // // // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // // // // //         child: Column(
// // // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // //           children: [
// // // // // // // // // //             CircleAvatar(
// // // // // // // // // //               radius: 28,
// // // // // // // // // //               backgroundColor: color,
// // // // // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // // // // //             ),
// // // // // // // // // //             const SizedBox(height: 10),
// // // // // // // // // //             Text(
// // // // // // // // // //               label,
// // // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // // // // import 'dart:convert';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // // // //     hide kCard, kPrimary;
// // // // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

// // // // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // // // //   const UserHomeWrapper({super.key});

// // // // // // // // //   @override
// // // // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // // // }

// // // // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // // // //   User? firebaseUser;
// // // // // // // // //   String username = "";
// // // // // // // // //   String? profileImageBase64;

// // // // // // // // //   int selectedIndex = 0;
// // // // // // // // //   String selectedMood = "🙂";

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // // // //     _fetchUserData();
// // // // // // // // //   }

// // // // // // // // //   Future<void> _fetchUserData() async {
// // // // // // // // //     if (firebaseUser == null) return;

// // // // // // // // //     try {
// // // // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // // // //           .collection('users')
// // // // // // // // //           .doc(firebaseUser!.uid)
// // // // // // // // //           .get();

// // // // // // // // //       if (doc.exists) {
// // // // // // // // //         final data = doc.data()!;
// // // // // // // // //         setState(() {
// // // // // // // // //           username = data['name'] ?? "User";
// // // // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // // // //         });
// // // // // // // // //       }
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print("Error fetching user data: $e");
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   ImageProvider getProfileImage() {
// // // // // // // // //     try {
// // // // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // // // //             .replaceAll('\n', '')
// // // // // // // // //             .replaceAll(' ', '');

// // // // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // // // //         return MemoryImage(bytes);
// // // // // // // // //       }
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print("Profile image decode error: $e");
// // // // // // // // //     }

// // // // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // // // //   }

// // // // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // // // //     final loginController = LoginController();
// // // // // // // // //     await FirebaseAuth.instance.signOut();
// // // // // // // // //     await loginController.clearSharedPref();
// // // // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // // // //       context,
// // // // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // // // //       (route) => false,
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     final List<Widget> pages = [
// // // // // // // // //       SafeArea(
// // // // // // // // //         child: SingleChildScrollView(
// // // // // // // // //           child: Column(
// // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //             children: [
// // // // // // // // //               const SizedBox(height: 12),
// // // // // // // // //               const UserHomeMotivationSection(),

// // // // // // // // //               Padding(
// // // // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // // // //                   horizontal: 16,
// // // // // // // // //                   vertical: 16,
// // // // // // // // //                 ),
// // // // // // // // //                 child: Wrap(
// // // // // // // // //                   spacing: 16,
// // // // // // // // //                   runSpacing: 16,
// // // // // // // // //                   children: [
// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // // // //                       label: "  Talk to Me  ",
// // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         Navigator.push(
// // // // // // // // //                           context,
// // // // // // // // //                           MaterialPageRoute(
// // // // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // // // //                           ),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),

// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.health_and_safety,
// // // // // // // // //                       label: "  Wellness Hub  ",
// // // // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         showModalBottomSheet(
// // // // // // // // //                           context: context,
// // // // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // // // //                               top: Radius.circular(20),
// // // // // // // // //                             ),
// // // // // // // // //                           ),
// // // // // // // // //                           builder: (context) {
// // // // // // // // //                             return Container(
// // // // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // // // //                               child: Wrap(
// // // // // // // // //                                 spacing: 16,
// // // // // // // // //                                 runSpacing: 16,
// // // // // // // // //                                 children: [
// // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // //                                     icon: Icons.spa,
// // // // // // // // //                                     label: "  Self-Care  ",
// // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // //                                     onTap: () {
// // // // // // // // //                                       Navigator.push(
// // // // // // // // //                                         context,
// // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // //                                           builder: (_) =>
// // // // // // // // //                                               const DailyWellnessPage(),
// // // // // // // // //                                         ),
// // // // // // // // //                                       );
// // // // // // // // //                                     },
// // // // // // // // //                                   ),
// // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // //                                     icon: Icons.fitness_center,
// // // // // // // // //                                     label: "  Exercise  ",
// // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // //                                     onTap: () {
// // // // // // // // //                                       Navigator.push(
// // // // // // // // //                                         context,
// // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // // // //                                         ),
// // // // // // // // //                                       );
// // // // // // // // //                                     },
// // // // // // // // //                                   ),
// // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // //                                     icon: Icons.healing,
// // // // // // // // //                                     label: "  Healing  ",
// // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // //                                     onTap: () {
// // // // // // // // //                                       Navigator.push(
// // // // // // // // //                                         context,
// // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // //                                           builder: (_) =>
// // // // // // // // //                                               const StressManagementPage(),
// // // // // // // // //                                         ),
// // // // // // // // //                                       );
// // // // // // // // //                                     },
// // // // // // // // //                                   ),
// // // // // // // // //                                   _FeatureRoundButton(
// // // // // // // // //                                     icon: Icons.bedtime,
// // // // // // // // //                                     label: "  Sleep  ",
// // // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // // //                                     onTap: () {
// // // // // // // // //                                       Navigator.push(
// // // // // // // // //                                         context,
// // // // // // // // //                                         MaterialPageRoute(
// // // // // // // // //                                           builder: (_) =>
// // // // // // // // //                                               const SleepRelaxationPage(),
// // // // // // // // //                                         ),
// // // // // // // // //                                       );
// // // // // // // // //                                     },
// // // // // // // // //                                   ),
// // // // // // // // //                                 ],
// // // // // // // // //                               ),
// // // // // // // // //                             );
// // // // // // // // //                           },
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),

// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // // // //                       label: "  Guide  ",
// // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         Navigator.push(
// // // // // // // // //                           context,
// // // // // // // // //                           MaterialPageRoute(
// // // // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // // // //                           ),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),
// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.mood,
// // // // // // // // //                       label: "  Mood Tracker  ",
// // // // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         Navigator.push(
// // // // // // // // //                           context,
// // // // // // // // //                           MaterialPageRoute(
// // // // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // // // //                           ),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),
// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.favorite,
// // // // // // // // //                       label: "  Relationship Advice  ",
// // // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         Navigator.push(
// // // // // // // // //                           context,
// // // // // // // // //                           MaterialPageRoute(
// // // // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // // // //                           ),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),
// // // // // // // // //                     _FeatureRoundButton(
// // // // // // // // //                       icon: Icons.psychology,
// // // // // // // // //                       label: "  Expert Advice  ",
// // // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // // //                       onTap: () {
// // // // // // // // //                         Navigator.push(
// // // // // // // // //                           context,
// // // // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // // // //                         );
// // // // // // // // //                       },
// // // // // // // // //                     ),
// // // // // // // // //                   ],
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // // // //       const Center(child: Text("Book Page")),
// // // // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // // // //     ];

// // // // // // // // //     return Scaffold(
// // // // // // // // //       backgroundColor: kCard,
// // // // // // // // //       appBar: AppBar(
// // // // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // // // //         centerTitle: false,
// // // // // // // // //         title: Column(
// // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //           children: [
// // // // // // // // //             Text(
// // // // // // // // //               "Hello $username",
// // // // // // // // //               style: const TextStyle(
// // // // // // // // //                 color: Colors.black,
// // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // //                 fontSize: 18,
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //             const Text(
// // // // // // // // //               "How are you feeling today?",
// // // // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //         actions: [
// // // // // // // // //           Padding(
// // // // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //       drawer: Drawer(
// // // // // // // // //         backgroundColor: kCard,
// // // // // // // // //         child: SafeArea(
// // // // // // // // //           child: Column(
// // // // // // // // //             children: [
// // // // // // // // //               UserAccountsDrawerHeader(
// // // // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // // // //                   radius: 30,
// // // // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // // // //                 ),
// // // // // // // // //                 accountName: Text(
// // // // // // // // //                   username,
// // // // // // // // //                   style: const TextStyle(
// // // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // // //                     fontSize: 18,
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // // // //               ),
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // // // //                 title: const Text("Dashboard"),
// // // // // // // // //                 onTap: () {
// // // // // // // // //                   Navigator.push(
// // // // // // // // //                     context,
// // // // // // // // //                     MaterialPageRoute(
// // // // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // // // //                     ),
// // // // // // // // //                   );
// // // // // // // // //                 },
// // // // // // // // //               ),
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // // // // // //                 title: const Text("Notifications"),
// // // // // // // // //                 onTap: () {
// // // // // // // // //                   Navigator.push(
// // // // // // // // //                     context,
// // // // // // // // //                     MaterialPageRoute(
// // // // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // // // //                     ),
// // // // // // // // //                   );
// // // // // // // // //                 },
// // // // // // // // //               ),
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // // // //                 title: const Text("Emergency"),
// // // // // // // // //                 onTap: () {
// // // // // // // // //                   Navigator.push(
// // // // // // // // //                     context,
// // // // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // // //                   );
// // // // // // // // //                 },
// // // // // // // // //               ),
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
// // // // // // // // //                 title: const Text("Help & Support"),
// // // // // // // // //                 onTap: () {
// // // // // // // // //                   Navigator.push(
// // // // // // // // //                     context,
// // // // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // // // //                   );
// // // // // // // // //                 },
// // // // // // // // //               ),
// // // // // // // // //               const Spacer(),
// // // // // // // // //               const Divider(),
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // // // //                 title: const Text(
// // // // // // // // //                   "Logout",
// // // // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // // // //                 ),
// // // // // // // // //                 onTap: () async {
// // // // // // // // //                   Navigator.pop(context);
// // // // // // // // //                   await handleLogout(context);
// // // // // // // // //                 },
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //       body: pages[selectedIndex],
// // // // // // // // //       // ✅ REMOVED floatingActionButton - No more floating emergency button
// // // // // // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // // --- Helper Widgets ---
// // // // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // // // //   final String emoji;
// // // // // // // // //   final String label;
// // // // // // // // //   final VoidCallback onTap;

// // // // // // // // //   const _MoodEmoji({
// // // // // // // // //     required this.emoji,
// // // // // // // // //     required this.label,
// // // // // // // // //     required this.onTap,
// // // // // // // // //   });

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return GestureDetector(
// // // // // // // // //       onTap: () {
// // // // // // // // //         onTap();
// // // // // // // // //         Navigator.pop(context);
// // // // // // // // //       },
// // // // // // // // //       child: Column(
// // // // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // // // //         children: [
// // // // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // // // //           const SizedBox(height: 4),
// // // // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // // // //   final String text;
// // // // // // // // //   final String icon;
// // // // // // // // //   final List<Color> colors;

// // // // // // // // //   const _MotivationCard({
// // // // // // // // //     required this.text,
// // // // // // // // //     required this.icon,
// // // // // // // // //     required this.colors,
// // // // // // // // //   });

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Container(
// // // // // // // // //       width: 280,
// // // // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // // // //         gradient: LinearGradient(
// // // // // // // // //           colors: colors,
// // // // // // // // //           begin: Alignment.topLeft,
// // // // // // // // //           end: Alignment.bottomRight,
// // // // // // // // //         ),
// // // // // // // // //         boxShadow: [
// // // // // // // // //           BoxShadow(
// // // // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // // // //             blurRadius: 8,
// // // // // // // // //             offset: const Offset(0, 4),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //       child: Padding(
// // // // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // // // //         child: Row(
// // // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // //           children: [
// // // // // // // // //             CircleAvatar(
// // // // // // // // //               radius: 32,
// // // // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // // // //             ),
// // // // // // // // //             const SizedBox(width: 16),
// // // // // // // // //             Expanded(
// // // // // // // // //               child: Text(
// // // // // // // // //                 text,
// // // // // // // // //                 style: const TextStyle(
// // // // // // // // //                   color: Colors.white,
// // // // // // // // //                   fontSize: 17,
// // // // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // // // //                   height: 1.4,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // // // //   final IconData icon;
// // // // // // // // //   final String label;
// // // // // // // // //   final Color color;
// // // // // // // // //   final VoidCallback onTap;

// // // // // // // // //   const _FeatureRoundButton({
// // // // // // // // //     required this.icon,
// // // // // // // // //     required this.label,
// // // // // // // // //     required this.color,
// // // // // // // // //     required this.onTap,
// // // // // // // // //   });

// // // // // // // // //   Widget _buildMotivationCards() {
// // // // // // // // //     return SizedBox(
// // // // // // // // //       height: 180,
// // // // // // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // // // // //         stream: FirebaseFirestore.instance
// // // // // // // // //             .collection('motivation_cards')
// // // // // // // // //             .where('isActive', isEqualTo: true)
// // // // // // // // //             .orderBy('order')
// // // // // // // // //             .snapshots(),
// // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // //           if (snapshot.hasError) {
// // // // // // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // // // // // //           }

// // // // // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // // // //             return const Center(child: CircularProgressIndicator());
// // // // // // // // //           }

// // // // // // // // //           final docs = snapshot.data?.docs ?? [];

// // // // // // // // //           if (docs.isEmpty) {
// // // // // // // // //             return const Center(
// // // // // // // // //               child: Text(
// // // // // // // // //                 "No motivation cards yet",
// // // // // // // // //                 style: TextStyle(color: Colors.white),
// // // // // // // // //               ),
// // // // // // // // //             );
// // // // // // // // //           }

// // // // // // // // //           return ListView.builder(
// // // // // // // // //             scrollDirection: Axis.horizontal,
// // // // // // // // //             physics: const BouncingScrollPhysics(),
// // // // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // // // //             itemCount: docs.length,
// // // // // // // // //             itemBuilder: (context, index) {
// // // // // // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // // // // // //               final docId = docs[index].id;

// // // // // // // // //               return _MotivationCard(
// // // // // // // // //                 text: data['text'] ?? '',
// // // // // // // // //                 icon: data['icon'] ?? '🙂',
// // // // // // // // //                 colors: [
// // // // // // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // // // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // // // // // //                 ],
// // // // // // // // //               );
// // // // // // // // //             },
// // // // // // // // //           );
// // // // // // // // //         },
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return InkWell(
// // // // // // // // //       onTap: onTap,
// // // // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // // // //       child: Container(
// // // // // // // // //         width: 150,
// // // // // // // // //         decoration: BoxDecoration(
// // // // // // // // //           color: color.withOpacity(0.6),
// // // // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // // // //         ),
// // // // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // // // //         child: Column(
// // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //           children: [
// // // // // // // // //             CircleAvatar(
// // // // // // // // //               radius: 28,
// // // // // // // // //               backgroundColor: color,
// // // // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // // // //             ),
// // // // // // // // //             const SizedBox(height: 10),
// // // // // // // // //             Text(
// // // // // // // // //               label,
// // // // // // // // //               textAlign: TextAlign.center,
// // // // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // import 'dart:convert';

// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // //     hide kCard, kPrimary;
// // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // //   const UserHomeWrapper({super.key});

// // // // // // //   @override
// // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // }

// // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // //   User? firebaseUser;
// // // // // // //   String username = "";
// // // // // // //   String? profileImageBase64;

// // // // // // //   int selectedIndex = 0;
// // // // // // //   String selectedMood = "🙂";

// // // // // // //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// // // // // // //   final PageController _motivationPageController = PageController();
// // // // // // //   int _currentMotivationPage = 0;

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // //     _fetchUserData();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _motivationPageController.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   Future<void> _fetchUserData() async {
// // // // // // //     if (firebaseUser == null) return;

// // // // // // //     try {
// // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // //           .collection('users')
// // // // // // //           .doc(firebaseUser!.uid)
// // // // // // //           .get();

// // // // // // //       if (doc.exists) {
// // // // // // //         final data = doc.data()!;
// // // // // // //         setState(() {
// // // // // // //           username = data['name'] ?? "User";
// // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // //         });
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       debugPrint("Error fetching user data: $e");
// // // // // // //     }
// // // // // // //   }

// // // // // // //   ImageProvider getProfileImage() {
// // // // // // //     try {
// // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // //             .replaceAll('\n', '')
// // // // // // //             .replaceAll(' ', '');

// // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // //         return MemoryImage(bytes);
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       debugPrint("Profile image decode error: $e");
// // // // // // //     }
// // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // //   }

// // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // //     final loginController = LoginController();
// // // // // // //     await FirebaseAuth.instance.signOut();
// // // // // // //     await loginController.clearSharedPref();
// // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // //       context,
// // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // //       (route) => false,
// // // // // // //     );
// // // // // // //   }

// // // // // // //   List<Widget> _buildPages() {
// // // // // // //     return [
// // // // // // //       _buildHomePage(),
// // // // // // //       const ChatBotPage(),
// // // // // // //       const EmergencyPage(),
// // // // // // //       const UserProfilePage(),
// // // // // // //     ];
// // // // // // //   }

// // // // // // //   Widget _buildHomePage() {
// // // // // // //     return SafeArea(
// // // // // // //       child: SingleChildScrollView(
// // // // // // //         physics: const BouncingScrollPhysics(),
// // // // // // //         child: Column(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //           children: [
// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
// // // // // // //               child: Row(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                 children: [
// // // // // // //                   IconButton(
// // // // // // //                     icon: const Icon(
// // // // // // //                       Icons.menu,
// // // // // // //                       color: Color(0xFF1E1E24),
// // // // // // //                       size: 28,
// // // // // // //                     ),
// // // // // // //                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
// // // // // // //                   ),
// // // // // // //                   GestureDetector(
// // // // // // //                     onTap: () {
// // // // // // //                       setState(() {
// // // // // // //                         selectedIndex = 3;
// // // // // // //                       });
// // // // // // //                     },
// // // // // // //                     child: Stack(
// // // // // // //                       children: [
// // // // // // //                         CircleAvatar(
// // // // // // //                           radius: 22,
// // // // // // //                           backgroundImage: getProfileImage(),
// // // // // // //                         ),
// // // // // // //                         Positioned(
// // // // // // //                           right: 0,
// // // // // // //                           bottom: 0,
// // // // // // //                           child: Container(
// // // // // // //                             width: 12,
// // // // // // //                             height: 12,
// // // // // // //                             decoration: BoxDecoration(
// // // // // // //                               color: const Color(0xFF34C759),
// // // // // // //                               shape: BoxShape.circle,
// // // // // // //                               border: Border.all(color: Colors.white, width: 2),
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //               child: Column(
// // // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                 children: [
// // // // // // //                   Row(
// // // // // // //                     children: [
// // // // // // //                       const Text(
// // // // // // //                         "Hello ",
// // // // // // //                         style: TextStyle(
// // // // // // //                           color: Color(0xFF1E1E24),
// // // // // // //                           fontSize: 32,
// // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // //                           letterSpacing: -0.5,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       Text(
// // // // // // //                         username.isNotEmpty ? username : "User",
// // // // // // //                         style: const TextStyle(
// // // // // // //                           color: Color(0xFF636AE8),
// // // // // // //                           fontSize: 32,
// // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // //                           letterSpacing: -0.5,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       const SizedBox(width: 8),
// // // // // // //                       const Text("👋", style: TextStyle(fontSize: 26)),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                   const SizedBox(height: 4),
// // // // // // //                   const Text(
// // // // // // //                     "How are you feeling today?",
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: Color(0xFF8A8A93),
// // // // // // //                       fontSize: 16,
// // // // // // //                       fontWeight: FontWeight.w500,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             const SizedBox(height: 32),

// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //               child: Row(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                 children: [
// // // // // // //                   const Text(
// // // // // // //                     "Motivation & Daily Check-in",
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: Color(0xFF1E1E24),
// // // // // // //                       fontSize: 18,
// // // // // // //                       fontWeight: FontWeight.w700,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   Row(
// // // // // // //                     children: [
// // // // // // //                       Text(
// // // // // // //                         "Swipe",
// // // // // // //                         style: TextStyle(
// // // // // // //                           color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // // // //                           fontSize: 14,
// // // // // // //                           fontWeight: FontWeight.w500,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       const SizedBox(width: 4),
// // // // // // //                       Icon(
// // // // // // //                         Icons.arrow_forward_rounded,
// // // // // // //                         size: 16,
// // // // // // //                         color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             const SizedBox(height: 14),

// // // // // // //             _buildMotivationCardsStream(),

// // // // // // //             const SizedBox(height: 32),

// // // // // // //             const Padding(
// // // // // // //               padding: EdgeInsets.symmetric(horizontal: 24),
// // // // // // //               child: Text(
// // // // // // //                 "Quick Access Tools",
// // // // // // //                 style: TextStyle(
// // // // // // //                   color: Color(0xFF1E1E24),
// // // // // // //                   fontSize: 18,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),

// // // // // // //             const SizedBox(height: 16),

// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // // // // // //               child: GridView.count(
// // // // // // //                 shrinkWrap: true,
// // // // // // //                 physics: const NeverScrollableScrollPhysics(),
// // // // // // //                 crossAxisCount: 3,
// // // // // // //                 crossAxisSpacing: 12,
// // // // // // //                 mainAxisSpacing: 16,
// // // // // // //                 childAspectRatio: 0.88,
// // // // // // //                 children: [
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.chat_bubble_rounded,
// // // // // // //                     label: "Talk to Me",
// // // // // // //                     iconColor: const Color(0xFF636AE8),
// // // // // // //                     bgColor: const Color(0xFFEEF0FF),
// // // // // // //                     onTap: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.spa_rounded,
// // // // // // //                     label: "Wellness Hub",
// // // // // // //                     iconColor: const Color(0xFF34C759),
// // // // // // //                     bgColor: const Color(0xFFE8F8EF),
// // // // // // //                     onTap: () {
// // // // // // //                       _showWellnessBottomSheet(context);
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.menu_book_rounded,
// // // // // // //                     label: "Guide",
// // // // // // //                     iconColor: const Color(0xFFFFB323),
// // // // // // //                     bgColor: const Color(0xFFFFF7E6),
// // // // // // //                     onTap: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(
// // // // // // //                           builder: (_) => const SpiritualWisdomApp(),
// // // // // // //                         ),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.favorite_rounded,
// // // // // // //                     label: "Mood Tracker",
// // // // // // //                     iconColor: const Color(0xFFFF4B6E),
// // // // // // //                     bgColor: const Color(0xFFFFEEF1),
// // // // // // //                     onTap: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(
// // // // // // //                           builder: (_) => const MoodTrackerPage(),
// // // // // // //                         ),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.people_alt_rounded,
// // // // // // //                     label: "Relationship\nAdvice",
// // // // // // //                     iconColor: const Color(0xFF8E59FF),
// // // // // // //                     bgColor: const Color(0xFFF4EEFF),
// // // // // // //                     onTap: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(
// // // // // // //                           builder: (_) => const RelationshipAdvicePage(),
// // // // // // //                         ),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   _FeatureRoundButton(
// // // // // // //                     icon: Icons.shield_rounded,
// // // // // // //                     label: "Expert Advice",
// // // // // // //                     iconColor: const Color(0xFF4FA5FF),
// // // // // // //                     bgColor: const Color(0xFFEEF6FF),
// // // // // // //                     onTap: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 32),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final pages = _buildPages();

// // // // // // //     return Scaffold(
// // // // // // //       key: scaffoldKey,
// // // // // // //       backgroundColor: const Color(0xFFF9FAFC),
// // // // // // //       drawer: Drawer(
// // // // // // //         backgroundColor: Colors.white,
// // // // // // //         child: SafeArea(
// // // // // // //           child: Column(
// // // // // // //             children: [
// // // // // // //               UserAccountsDrawerHeader(
// // // // // // //                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
// // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // //                   radius: 30,
// // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // //                 ),
// // // // // // //                 accountName: Text(
// // // // // // //                   username.isNotEmpty ? username : "Active User",
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // //                     fontSize: 18,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
// // // // // // //                 title: const Text("Dashboard"),
// // // // // // //                 onTap: () {
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(
// // // // // // //                       builder: (_) => DashboardPage(
// // // // // // //                         username: username.isNotEmpty ? username : '',
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(
// // // // // // //                   Icons.notifications,
// // // // // // //                   color: Color(0xFF1E1E24),
// // // // // // //                 ),
// // // // // // //                 title: const Text("Notifications"),
// // // // // // //                 onTap: () {
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(
// // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // //                 title: const Text("Emergency"),
// // // // // // //                 onTap: () {
// // // // // // //                   Navigator.pop(context);
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(
// // // // // // //                   Icons.help_outline,
// // // // // // //                   color: Color(0xFF1E1E24),
// // // // // // //                 ),
// // // // // // //                 title: const Text("Help & Support"),
// // // // // // //                 onTap: () {
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               const Spacer(),
// // // // // // //               const Divider(),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // //                 title: const Text(
// // // // // // //                   "Logout",
// // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // //                 ),
// // // // // // //                 onTap: () async {
// // // // // // //                   Navigator.pop(context);
// // // // // // //                   await handleLogout(context);
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       body: pages[selectedIndex],
// // // // // // //       bottomNavigationBar: Container(
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: Colors.white,
// // // // // // //           boxShadow: [
// // // // // // //             BoxShadow(
// // // // // // //               color: Colors.black.withOpacity(0.04),
// // // // // // //               blurRadius: 20,
// // // // // // //               offset: const Offset(0, -4),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         child: SafeArea(
// // // // // // //           child: Padding(
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // // // // //             child: Row(
// // // // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // // //               children: [
// // // // // // //                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
// // // // // // //                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
// // // // // // //                 _buildMiddleEmergencyButton(context),
// // // // // // //                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
// // // // // // //                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildMotivationCardsStream() {
// // // // // // //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // // //       stream: FirebaseFirestore.instance
// // // // // // //           .collection('motivation_cards')
// // // // // // //           .where('isActive', isEqualTo: true)
// // // // // // //           .orderBy('order')
// // // // // // //           .snapshots(),
// // // // // // //       builder: (context, snapshot) {
// // // // // // //         if (snapshot.hasError) {
// // // // // // //           return Padding(
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //             child: _MotivationCard(
// // // // // // //               text: "You are stronger than you think.",
// // // // // // //               subText: "Take a deep breath. You've got this.",
// // // // // // //               emoji: "😊",
// // // // // // //               colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // // // // // //             ),
// // // // // // //           );
// // // // // // //         }

// // // // // // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // //           return Column(
// // // // // // //             children: [
// // // // // // //               Padding(
// // // // // // //                 padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //                 child: _MotivationCard(
// // // // // // //                   text: "Loading your daily quote...",
// // // // // // //                   subText: "Please wait a moment.",
// // // // // // //                   emoji: "🙂",
// // // // // // //                   colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               const SizedBox(height: 12),
// // // // // // //               _buildPageIndicator(1, 0),
// // // // // // //             ],
// // // // // // //           );
// // // // // // //         }

// // // // // // //         final docs = snapshot.data?.docs ?? [];

// // // // // // //         if (docs.isEmpty) {
// // // // // // //           return Column(
// // // // // // //             children: [
// // // // // // //               Padding(
// // // // // // //                 padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //                 child: _MotivationCard(
// // // // // // //                   text: "You are stronger than you think.",
// // // // // // //                   subText: "Take a deep breath. You've got this.",
// // // // // // //                   emoji: "😊",
// // // // // // //                   colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               const SizedBox(height: 12),
// // // // // // //               _buildPageIndicator(1, 0),
// // // // // // //             ],
// // // // // // //           );
// // // // // // //         }

// // // // // // //         return Column(
// // // // // // //           children: [
// // // // // // //             SizedBox(
// // // // // // //               height: 190,
// // // // // // //               child: PageView.builder(
// // // // // // //                 controller: _motivationPageController,
// // // // // // //                 physics: const BouncingScrollPhysics(),
// // // // // // //                 itemCount: docs.length,
// // // // // // //                 onPageChanged: (int page) {
// // // // // // //                   setState(() {
// // // // // // //                     _currentMotivationPage = page;
// // // // // // //                   });
// // // // // // //                 },
// // // // // // //                 itemBuilder: (context, index) {
// // // // // // //                   final data = docs[index].data();

// // // // // // //                   final String quoteText =
// // // // // // //                       (data['text'] ?? 'You are stronger than you think.')
// // // // // // //                           .toString();
// // // // // // //                   final String quoteEmoji = (data['icon'] ?? '😊').toString();

// // // // // // //                   final Color color1 = Color(data['color1'] ?? 0xFFEAEBFF);
// // // // // // //                   final Color color2 = Color(data['color2'] ?? 0xFFF3F4FF);

// // // // // // //                   return Padding(
// // // // // // //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // // //                     child: _MotivationCard(
// // // // // // //                       text: quoteText,
// // // // // // //                       subText: "Take a deep breath. You've got this.",
// // // // // // //                       emoji: quoteEmoji,
// // // // // // //                       colors: [color1, color2],
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 12),
// // // // // // //             _buildPageIndicator(docs.length, _currentMotivationPage),
// // // // // // //           ],
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildPageIndicator(int count, int current) {
// // // // // // //     return Row(
// // // // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //       children: List.generate(count, (index) {
// // // // // // //         final bool isSelected = index == current;
// // // // // // //         return AnimatedContainer(
// // // // // // //           duration: const Duration(milliseconds: 250),
// // // // // // //           margin: const EdgeInsets.symmetric(horizontal: 3),
// // // // // // //           height: 6,
// // // // // // //           width: isSelected ? 18 : 6,
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             color: isSelected
// // // // // // //                 ? const Color(0xFF636AE8)
// // // // // // //                 : const Color(0xFFD1D1D6),
// // // // // // //             borderRadius: BorderRadius.circular(3),
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       }),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildBottomNavItem(int index, IconData icon, String label) {
// // // // // // //     final bool isSelected = selectedIndex == index;
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () {
// // // // // // //         setState(() {
// // // // // // //           selectedIndex = index;
// // // // // // //         });
// // // // // // //       },
// // // // // // //       child: Column(
// // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // //         children: [
// // // // // // //           Icon(
// // // // // // //             icon,
// // // // // // //             color: isSelected
// // // // // // //                 ? const Color(0xFF636AE8)
// // // // // // //                 : const Color(0xFFA1A1A9),
// // // // // // //             size: 26,
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 4),
// // // // // // //           Text(
// // // // // // //             label,
// // // // // // //             style: TextStyle(
// // // // // // //               color: isSelected
// // // // // // //                   ? const Color(0xFF636AE8)
// // // // // // //                   : const Color(0xFFA1A1A9),
// // // // // // //               fontSize: 11,
// // // // // // //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildMiddleEmergencyButton(BuildContext context) {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () {
// // // // // // //         Navigator.push(
// // // // // // //           context,
// // // // // // //           MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // //         );
// // // // // // //       },
// // // // // // //       child: Container(
// // // // // // //         margin: const EdgeInsets.only(bottom: 2),
// // // // // // //         padding: const EdgeInsets.all(12),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: const Color(0xFFFF4B6E),
// // // // // // //           shape: BoxShape.circle,
// // // // // // //           boxShadow: [
// // // // // // //             BoxShadow(
// // // // // // //               color: const Color(0xFFFF4B6E).withOpacity(0.3),
// // // // // // //               blurRadius: 12,
// // // // // // //               offset: const Offset(0, 4),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         child: const Icon(
// // // // // // //           Icons.phone_in_talk_rounded,
// // // // // // //           color: Colors.white,
// // // // // // //           size: 28,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   void _showWellnessBottomSheet(BuildContext context) {
// // // // // // //     showModalBottomSheet(
// // // // // // //       context: context,
// // // // // // //       backgroundColor: Colors.white,
// // // // // // //       shape: const RoundedRectangleBorder(
// // // // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// // // // // // //       ),
// // // // // // //       builder: (bottomSheetContext) {
// // // // // // //         return Container(
// // // // // // //           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// // // // // // //           child: Column(
// // // // // // //             mainAxisSize: MainAxisSize.min,
// // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //             children: [
// // // // // // //               const Text(
// // // // // // //                 "Wellness Hub Options",
// // // // // // //                 style: TextStyle(
// // // // // // //                   fontSize: 18,
// // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // //                   color: Color(0xFF1E1E24),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               const SizedBox(height: 20),
// // // // // // //               Wrap(
// // // // // // //                 spacing: 16,
// // // // // // //                 runSpacing: 16,
// // // // // // //                 alignment: WrapAlignment.center,
// // // // // // //                 children: [
// // // // // // //                   SizedBox(
// // // // // // //                     width: 96,
// // // // // // //                     child: _FeatureRoundButton(
// // // // // // //                       icon: Icons.spa_rounded,
// // // // // // //                       label: "Self-Care",
// // // // // // //                       iconColor: const Color(0xFF34C759),
// // // // // // //                       bgColor: const Color(0xFFE8F8EF),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const DailyWellnessPage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(
// // // // // // //                     width: 96,
// // // // // // //                     child: _FeatureRoundButton(
// // // // // // //                       icon: Icons.fitness_center_rounded,
// // // // // // //                       label: "Exercise",
// // // // // // //                       iconColor: const Color(0xFF4FA5FF),
// // // // // // //                       bgColor: const Color(0xFFEEF6FF),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const ExercisePage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(
// // // // // // //                     width: 96,
// // // // // // //                     child: _FeatureRoundButton(
// // // // // // //                       icon: Icons.healing_rounded,
// // // // // // //                       label: "Healing",
// // // // // // //                       iconColor: const Color(0xFF8E59FF),
// // // // // // //                       bgColor: const Color(0xFFF4EEFF),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const StressManagementPage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(
// // // // // // //                     width: 96,
// // // // // // //                     child: _FeatureRoundButton(
// // // // // // //                       icon: Icons.bedtime_rounded,
// // // // // // //                       label: "Sleep",
// // // // // // //                       iconColor: const Color(0xFFFFB323),
// // // // // // //                       bgColor: const Color(0xFFFFF7E6),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const SleepRelaxationPage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // //   final String text;
// // // // // // //   final String subText;
// // // // // // //   final String emoji;
// // // // // // //   final List<Color> colors;

// // // // // // //   const _MotivationCard({
// // // // // // //     required this.text,
// // // // // // //     required this.subText,
// // // // // // //     required this.emoji,
// // // // // // //     required this.colors,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       width: double.infinity,
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         borderRadius: BorderRadius.circular(24),
// // // // // // //         gradient: LinearGradient(
// // // // // // //           colors: colors,
// // // // // // //           begin: Alignment.topLeft,
// // // // // // //           end: Alignment.bottomRight,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       child: Stack(
// // // // // // //         children: [
// // // // // // //           Positioned(
// // // // // // //             right: -20,
// // // // // // //             bottom: -20,
// // // // // // //             child: Opacity(
// // // // // // //               opacity: 0.08,
// // // // // // //               child: Icon(
// // // // // // //                 Icons.spa_rounded,
// // // // // // //                 size: 160,
// // // // // // //                 color: const Color(0xFF636AE8),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.all(24.0),
// // // // // // //             child: Row(
// // // // // // //               children: [
// // // // // // //                 Expanded(
// // // // // // //                   child: Column(
// // // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                     children: [
// // // // // // //                       Text(
// // // // // // //                         text,
// // // // // // //                         style: const TextStyle(
// // // // // // //                           fontSize: 22,
// // // // // // //                           color: Color(0xFF1E1E24),
// // // // // // //                           height: 1.3,
// // // // // // //                           fontWeight: FontWeight.w700,
// // // // // // //                         ),
// // // // // // //                         maxLines: 3,
// // // // // // //                         overflow: TextOverflow.ellipsis,
// // // // // // //                       ),
// // // // // // //                       const SizedBox(height: 12),
// // // // // // //                       Text(
// // // // // // //                         subText,
// // // // // // //                         style: const TextStyle(
// // // // // // //                           color: Color(0xFF7D7E87),
// // // // // // //                           fontSize: 13,
// // // // // // //                           fontWeight: FontWeight.w500,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 Container(
// // // // // // //                   width: 72,
// // // // // // //                   height: 72,
// // // // // // //                   decoration: const BoxDecoration(
// // // // // // //                     color: Color(0xFFFFDE6A),
// // // // // // //                     shape: BoxShape.circle,
// // // // // // //                     boxShadow: [
// // // // // // //                       BoxShadow(
// // // // // // //                         color: Color(0x55FFDE6A),
// // // // // // //                         blurRadius: 20,
// // // // // // //                         offset: Offset(0, 4),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                   child: Center(
// // // // // // //                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // //   final IconData icon;
// // // // // // //   final String label;
// // // // // // //   final Color iconColor;
// // // // // // //   final Color bgColor;
// // // // // // //   final VoidCallback onTap;

// // // // // // //   const _FeatureRoundButton({
// // // // // // //     required this.icon,
// // // // // // //     required this.label,
// // // // // // //     required this.iconColor,
// // // // // // //     required this.bgColor,
// // // // // // //     required this.onTap,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: onTap,
// // // // // // //       child: Container(
// // // // // // //         height: 120,
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: Colors.white,
// // // // // // //           borderRadius: BorderRadius.circular(20),
// // // // // // //           boxShadow: [
// // // // // // //             BoxShadow(
// // // // // // //               color: Colors.black.withOpacity(0.015),
// // // // // // //               blurRadius: 10,
// // // // // // //               offset: const Offset(0, 4),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         child: Padding(
// // // // // // //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // // // //           child: Column(
// // // // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //             children: [
// // // // // // //               Container(
// // // // // // //                 width: 50,
// // // // // // //                 height: 50,
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: bgColor,
// // // // // // //                   shape: BoxShape.circle,
// // // // // // //                 ),
// // // // // // //                 child: Icon(icon, color: iconColor, size: 24),
// // // // // // //               ),
// // // // // // //               const SizedBox(height: 10),
// // // // // // //               Text(
// // // // // // //                 label,
// // // // // // //                 textAlign: TextAlign.center,
// // // // // // //                 maxLines: 2,
// // // // // // //                 overflow: TextOverflow.ellipsis,
// // // // // // //                 style: const TextStyle(
// // // // // // //                   color: Color(0xFF1E1E24),
// // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // //                   fontSize: 12,
// // // // // // //                   height: 1.2,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'dart:convert';

// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // //     hide kCard, kPrimary;
// // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // //   const UserHomeWrapper({super.key});

// // // // // //   @override
// // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // }

// // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // //   User? firebaseUser;
// // // // // //   String username = "";
// // // // // //   String? profileImageBase64;

// // // // // //   int selectedIndex = 0;
// // // // // //   String selectedMood = "🙂";

// // // // // //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// // // // // //   final PageController _motivationPageController = PageController();
// // // // // //   int _currentMotivationPage = 0;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // //     _fetchUserData();
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _motivationPageController.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   Future<void> _fetchUserData() async {
// // // // // //     if (firebaseUser == null) return;

// // // // // //     try {
// // // // // //       final doc = await FirebaseFirestore.instance
// // // // // //           .collection('users')
// // // // // //           .doc(firebaseUser!.uid)
// // // // // //           .get();

// // // // // //       if (doc.exists) {
// // // // // //         final data = doc.data()!;
// // // // // //         setState(() {
// // // // // //           username = data['name'] ?? "User";
// // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // //         });
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       debugPrint("Error fetching user data: $e");
// // // // // //     }
// // // // // //   }

// // // // // //   ImageProvider getProfileImage() {
// // // // // //     try {
// // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // //         final cleanBase64 = profileImageBase64!
// // // // // //             .replaceAll('\n', '')
// // // // // //             .replaceAll(' ', '');

// // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // //         return MemoryImage(bytes);
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       debugPrint("Profile image decode error: $e");
// // // // // //     }
// // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // //   }

// // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // //     final loginController = LoginController();
// // // // // //     await FirebaseAuth.instance.signOut();
// // // // // //     await loginController.clearSharedPref();
// // // // // //     Navigator.pushAndRemoveUntil(
// // // // // //       context,
// // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // //       (route) => false,
// // // // // //     );
// // // // // //   }

// // // // // //   List<Widget> _buildPages() {
// // // // // //     return [
// // // // // //       _buildHomePage(),
// // // // // //       const ChatBotPage(),
// // // // // //       const EmergencyPage(),
// // // // // //       const UserProfilePage(),
// // // // // //     ];
// // // // // //   }

// // // // // //   Widget _buildHomePage() {
// // // // // //     return SafeArea(
// // // // // //       child: SingleChildScrollView(
// // // // // //         physics: const BouncingScrollPhysics(),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
// // // // // //               child: Row(
// // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                 children: [
// // // // // //                   IconButton(
// // // // // //                     icon: const Icon(
// // // // // //                       Icons.menu,
// // // // // //                       color: Color(0xFF1E1E24),
// // // // // //                       size: 28,
// // // // // //                     ),
// // // // // //                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
// // // // // //                   ),
// // // // // //                   GestureDetector(
// // // // // //                     onTap: () {
// // // // // //                       setState(() {
// // // // // //                         selectedIndex = 3;
// // // // // //                       });
// // // // // //                     },
// // // // // //                     child: Stack(
// // // // // //                       children: [
// // // // // //                         CircleAvatar(
// // // // // //                           radius: 22,
// // // // // //                           backgroundImage: getProfileImage(),
// // // // // //                         ),
// // // // // //                         Positioned(
// // // // // //                           right: 0,
// // // // // //                           bottom: 0,
// // // // // //                           child: Container(
// // // // // //                             width: 12,
// // // // // //                             height: 12,
// // // // // //                             decoration: BoxDecoration(
// // // // // //                               color: const Color(0xFF34C759),
// // // // // //                               shape: BoxShape.circle,
// // // // // //                               border: Border.all(color: Colors.white, width: 2),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // //               child: Column(
// // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                 children: [
// // // // // //                   Row(
// // // // // //                     children: [
// // // // // //                       const Text(
// // // // // //                         "Hello ",
// // // // // //                         style: TextStyle(
// // // // // //                           color: Color(0xFF1E1E24),
// // // // // //                           fontSize: 32,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                           letterSpacing: -0.5,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       Text(
// // // // // //                         username.isNotEmpty ? username : "User",
// // // // // //                         style: const TextStyle(
// // // // // //                           color: Color(0xFF636AE8),
// // // // // //                           fontSize: 32,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                           letterSpacing: -0.5,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       const SizedBox(width: 8),
// // // // // //                       const Text("👋", style: TextStyle(fontSize: 26)),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 4),
// // // // // //                   const Text(
// // // // // //                     "How are you feeling today?",
// // // // // //                     style: TextStyle(
// // // // // //                       color: Color(0xFF8A8A93),
// // // // // //                       fontSize: 16,
// // // // // //                       fontWeight: FontWeight.w500,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 32),
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // //               child: Row(
// // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                 children: [
// // // // // //                   const Text(
// // // // // //                     "Motivation & Daily Check-in",
// // // // // //                     style: TextStyle(
// // // // // //                       color: Color(0xFF1E1E24),
// // // // // //                       fontSize: 18,
// // // // // //                       fontWeight: FontWeight.w700,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   Row(
// // // // // //                     children: [
// // // // // //                       Text(
// // // // // //                         "Swipe",
// // // // // //                         style: TextStyle(
// // // // // //                           color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // // //                           fontSize: 14,
// // // // // //                           fontWeight: FontWeight.w500,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       const SizedBox(width: 4),
// // // // // //                       Icon(
// // // // // //                         Icons.arrow_forward_rounded,
// // // // // //                         size: 16,
// // // // // //                         color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 14),
// // // // // //             _buildMotivationCardsStream(),
// // // // // //             const SizedBox(height: 32),
// // // // // //             const Padding(
// // // // // //               padding: EdgeInsets.symmetric(horizontal: 24),
// // // // // //               child: Text(
// // // // // //                 "Quick Access Tools",
// // // // // //                 style: TextStyle(
// // // // // //                   color: Color(0xFF1E1E24),
// // // // // //                   fontSize: 18,
// // // // // //                   fontWeight: FontWeight.w700,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 16),
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // // // // //               child: GridView.count(
// // // // // //                 shrinkWrap: true,
// // // // // //                 physics: const NeverScrollableScrollPhysics(),
// // // // // //                 crossAxisCount: 3,
// // // // // //                 crossAxisSpacing: 12,
// // // // // //                 mainAxisSpacing: 16,
// // // // // //                 childAspectRatio: 0.88,
// // // // // //                 children: [
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.chat_bubble_rounded,
// // // // // //                     label: "Talk to Me",
// // // // // //                     iconColor: const Color(0xFF636AE8),
// // // // // //                     bgColor: const Color(0xFFEEF0FF),
// // // // // //                     onTap: () {
// // // // // //                       Navigator.push(
// // // // // //                         context,
// // // // // //                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.spa_rounded,
// // // // // //                     label: "Wellness Hub",
// // // // // //                     iconColor: const Color(0xFF34C759),
// // // // // //                     bgColor: const Color(0xFFE8F8EF),
// // // // // //                     onTap: () {
// // // // // //                       _showWellnessBottomSheet(context);
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.menu_book_rounded,
// // // // // //                     label: "Guide",
// // // // // //                     iconColor: const Color(0xFFFFB323),
// // // // // //                     bgColor: const Color(0xFFFFF7E6),
// // // // // //                     onTap: () {
// // // // // //                       Navigator.push(
// // // // // //                         context,
// // // // // //                         MaterialPageRoute(
// // // // // //                           builder: (_) => const SpiritualWisdomApp(),
// // // // // //                         ),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.favorite_rounded,
// // // // // //                     label: "Mood Tracker",
// // // // // //                     iconColor: const Color(0xFFFF4B6E),
// // // // // //                     bgColor: const Color(0xFFFFEEF1),
// // // // // //                     onTap: () {
// // // // // //                       Navigator.push(
// // // // // //                         context,
// // // // // //                         MaterialPageRoute(
// // // // // //                           builder: (_) => const MoodTrackerPage(),
// // // // // //                         ),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.people_alt_rounded,
// // // // // //                     label: "Relationship\nAdvice",
// // // // // //                     iconColor: const Color(0xFF8E59FF),
// // // // // //                     bgColor: const Color(0xFFF4EEFF),
// // // // // //                     onTap: () {
// // // // // //                       Navigator.push(
// // // // // //                         context,
// // // // // //                         MaterialPageRoute(
// // // // // //                           builder: (_) => const RelationshipAdvicePage(),
// // // // // //                         ),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   _FeatureRoundButton(
// // // // // //                     icon: Icons.shield_rounded,
// // // // // //                     label: "Expert Advice",
// // // // // //                     iconColor: const Color(0xFF4FA5FF),
// // // // // //                     bgColor: const Color(0xFFEEF6FF),
// // // // // //                     onTap: () {
// // // // // //                       Navigator.push(
// // // // // //                         context,
// // // // // //                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // //                       );
// // // // // //                     },
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 32),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final pages = _buildPages();

// // // // // //     return Scaffold(
// // // // // //       key: scaffoldKey,
// // // // // //       backgroundColor: const Color(0xFFF9FAFC),
// // // // // //       drawer: Drawer(
// // // // // //         backgroundColor: Colors.white,
// // // // // //         child: SafeArea(
// // // // // //           child: Column(
// // // // // //             children: [
// // // // // //               UserAccountsDrawerHeader(
// // // // // //                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
// // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // //                   radius: 30,
// // // // // //                   backgroundImage: getProfileImage(),
// // // // // //                 ),
// // // // // //                 accountName: Text(
// // // // // //                   username.isNotEmpty ? username : "Active User",
// // // // // //                   style: const TextStyle(
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     fontSize: 18,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 accountEmail: const Text("Active User"),
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
// // // // // //                 title: const Text("Dashboard"),
// // // // // //                 onTap: () {
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(
// // // // // //                       builder: (_) => DashboardPage(
// // // // // //                         username: username.isNotEmpty ? username : '',
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(
// // // // // //                   Icons.notifications,
// // // // // //                   color: Color(0xFF1E1E24),
// // // // // //                 ),
// // // // // //                 title: const Text("Notifications"),
// // // // // //                 onTap: () {
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(
// // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // //                 title: const Text("Emergency"),
// // // // // //                 onTap: () {
// // // // // //                   Navigator.pop(context);
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(
// // // // // //                   Icons.help_outline,
// // // // // //                   color: Color(0xFF1E1E24),
// // // // // //                 ),
// // // // // //                 title: const Text("Help & Support"),
// // // // // //                 onTap: () {
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               const Spacer(),
// // // // // //               const Divider(),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // //                 title: const Text(
// // // // // //                   "Logout",
// // // // // //                   style: TextStyle(color: Colors.red),
// // // // // //                 ),
// // // // // //                 onTap: () async {
// // // // // //                   Navigator.pop(context);
// // // // // //                   await handleLogout(context);
// // // // // //                 },
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //       body: pages[selectedIndex],
// // // // // //       bottomNavigationBar: Container(
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: Colors.white,
// // // // // //           boxShadow: [
// // // // // //             BoxShadow(
// // // // // //               color: Colors.black.withOpacity(0.04),
// // // // // //               blurRadius: 20,
// // // // // //               offset: const Offset(0, -4),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         child: SafeArea(
// // // // // //           child: Padding(
// // // // // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // // // //             child: Row(
// // // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // //               children: [
// // // // // //                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
// // // // // //                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
// // // // // //                 _buildMiddleEmergencyButton(context),
// // // // // //                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
// // // // // //                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildMotivationCardsStream() {
// // // // // //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // //       stream: FirebaseFirestore.instance
// // // // // //           .collection('motivation_cards')
// // // // // //           .where('isActive', isEqualTo: true)
// // // // // //           .snapshots(),
// // // // // //       builder: (context, snapshot) {
// // // // // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // //           return _buildSingleFallbackCard(
// // // // // //             text:
// // // // // //                 "Every day may not be good, but there is something good in every day.",
// // // // // //             subText: "Take a deep breath and begin gently.",
// // // // // //             emoji: "🌸",
// // // // // //             colors: const [Color(0xFFEAEBFF), Color(0xFFF8ECFF)],
// // // // // //           );
// // // // // //         }

// // // // // //         if (snapshot.hasError) {
// // // // // //           return _buildSingleFallbackCard(
// // // // // //             text:
// // // // // //                 "You are stronger than you think, and brighter days are ahead.",
// // // // // //             subText: "One small positive step is enough for today.",
// // // // // //             emoji: "🙂",
// // // // // //             colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // // // // //           );
// // // // // //         }

// // // // // //         final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
// // // // // //             snapshot.data?.docs.toList() ?? [];

// // // // // //         docs.sort((a, b) {
// // // // // //           final dynamic aRaw = a.data()['order'];
// // // // // //           final dynamic bRaw = b.data()['order'];

// // // // // //           final int aOrder = aRaw is int
// // // // // //               ? aRaw
// // // // // //               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
// // // // // //           final int bOrder = bRaw is int
// // // // // //               ? bRaw
// // // // // //               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

// // // // // //           return aOrder.compareTo(bOrder);
// // // // // //         });

// // // // // //         if (docs.isEmpty) {
// // // // // //           return _buildSingleFallbackCard(
// // // // // //             text:
// // // // // //                 "Believe in yourself. You have the power to heal, grow, and shine.",
// // // // // //             subText: "Your journey matters, even on slow days.",
// // // // // //             emoji: "💛",
// // // // // //             colors: const [Color(0xFFFFF1CC), Color(0xFFFFF7E8)],
// // // // // //           );
// // // // // //         }

// // // // // //         if (_currentMotivationPage >= docs.length) {
// // // // // //           WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // //             if (mounted) {
// // // // // //               setState(() {
// // // // // //                 _currentMotivationPage = 0;
// // // // // //               });
// // // // // //             }
// // // // // //           });
// // // // // //         }

// // // // // //         return Column(
// // // // // //           children: [
// // // // // //             SizedBox(
// // // // // //               height: 190,
// // // // // //               child: PageView.builder(
// // // // // //                 controller: _motivationPageController,
// // // // // //                 physics: const BouncingScrollPhysics(
// // // // // //                   parent: PageScrollPhysics(),
// // // // // //                 ),
// // // // // //                 itemCount: docs.length,
// // // // // //                 onPageChanged: (int page) {
// // // // // //                   setState(() {
// // // // // //                     _currentMotivationPage = page;
// // // // // //                   });
// // // // // //                 },
// // // // // //                 itemBuilder: (context, index) {
// // // // // //                   final Map<String, dynamic> data = docs[index].data();

// // // // // //                   final String quoteText =
// // // // // //                       (data['text']?.toString().trim().isNotEmpty ?? false)
// // // // // //                       ? data['text'].toString().trim()
// // // // // //                       : "Stay strong, brighter days are ahead.";

// // // // // //                   final String quoteEmoji =
// // // // // //                       (data['icon']?.toString().trim().isNotEmpty ?? false)
// // // // // //                       ? data['icon'].toString().trim()
// // // // // //                       : "🙂";

// // // // // //                   final int color1Value = _parseColorValue(
// // // // // //                     data['color1'],
// // // // // //                     0xFFEAEBFF,
// // // // // //                   );
// // // // // //                   final int color2Value = _parseColorValue(
// // // // // //                     data['color2'],
// // // // // //                     0xFFF3F4FF,
// // // // // //                   );

// // // // // //                   return Padding(
// // // // // //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // //                     child: _MotivationCard(
// // // // // //                       text: quoteText,
// // // // // //                       subText: "Take a deep breath. You've got this.",
// // // // // //                       emoji: quoteEmoji,
// // // // // //                       colors: [Color(color1Value), Color(color2Value)],
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 12),
// // // // // //             _buildPageIndicator(docs.length, _currentMotivationPage),
// // // // // //           ],
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }

// // // // // //   int _parseColorValue(dynamic value, int fallback) {
// // // // // //     if (value is int) return value;
// // // // // //     if (value is String) {
// // // // // //       final cleaned = value.replaceAll('#', '').trim();

// // // // // //       if (cleaned.isEmpty) return fallback;

// // // // // //       if (cleaned.length == 6) {
// // // // // //         return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
// // // // // //       }

// // // // // //       if (cleaned.length == 8) {
// // // // // //         return int.tryParse(cleaned, radix: 16) ?? fallback;
// // // // // //       }
// // // // // //     }
// // // // // //     return fallback;
// // // // // //   }

// // // // // //   Widget _buildSingleFallbackCard({
// // // // // //     required String text,
// // // // // //     required String subText,
// // // // // //     required String emoji,
// // // // // //     required List<Color> colors,
// // // // // //   }) {
// // // // // //     return Column(
// // // // // //       children: [
// // // // // //         Padding(
// // // // // //           padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // // //           child: SizedBox(
// // // // // //             height: 190,
// // // // // //             child: _MotivationCard(
// // // // // //               text: text,
// // // // // //               subText: subText,
// // // // // //               emoji: emoji,
// // // // // //               colors: colors,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //         const SizedBox(height: 12),
// // // // // //         _buildPageIndicator(1, 0),
// // // // // //       ],
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildPageIndicator(int count, int current) {
// // // // // //     return Row(
// // // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // // //       children: List.generate(count, (index) {
// // // // // //         final bool isSelected = index == current;
// // // // // //         return AnimatedContainer(
// // // // // //           duration: const Duration(milliseconds: 250),
// // // // // //           margin: const EdgeInsets.symmetric(horizontal: 3),
// // // // // //           height: 6,
// // // // // //           width: isSelected ? 18 : 6,
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: isSelected
// // // // // //                 ? const Color(0xFF636AE8)
// // // // // //                 : const Color(0xFFD1D1D6),
// // // // // //             borderRadius: BorderRadius.circular(3),
// // // // // //           ),
// // // // // //         );
// // // // // //       }),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildBottomNavItem(int index, IconData icon, String label) {
// // // // // //     final bool isSelected = selectedIndex == index;
// // // // // //     return GestureDetector(
// // // // // //       onTap: () {
// // // // // //         setState(() {
// // // // // //           selectedIndex = index;
// // // // // //         });
// // // // // //       },
// // // // // //       child: Column(
// // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // //         children: [
// // // // // //           Icon(
// // // // // //             icon,
// // // // // //             color: isSelected
// // // // // //                 ? const Color(0xFF636AE8)
// // // // // //                 : const Color(0xFFA1A1A9),
// // // // // //             size: 26,
// // // // // //           ),
// // // // // //           const SizedBox(height: 4),
// // // // // //           Text(
// // // // // //             label,
// // // // // //             style: TextStyle(
// // // // // //               color: isSelected
// // // // // //                   ? const Color(0xFF636AE8)
// // // // // //                   : const Color(0xFFA1A1A9),
// // // // // //               fontSize: 11,
// // // // // //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildMiddleEmergencyButton(BuildContext context) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () {
// // // // // //         Navigator.push(
// // // // // //           context,
// // // // // //           MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // //         );
// // // // // //       },
// // // // // //       child: Container(
// // // // // //         margin: const EdgeInsets.only(bottom: 2),
// // // // // //         padding: const EdgeInsets.all(12),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: const Color(0xFFFF4B6E),
// // // // // //           shape: BoxShape.circle,
// // // // // //           boxShadow: [
// // // // // //             BoxShadow(
// // // // // //               color: const Color(0xFFFF4B6E).withOpacity(0.3),
// // // // // //               blurRadius: 12,
// // // // // //               offset: const Offset(0, 4),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         child: const Icon(
// // // // // //           Icons.phone_in_talk_rounded,
// // // // // //           color: Colors.white,
// // // // // //           size: 28,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   void _showWellnessBottomSheet(BuildContext context) {
// // // // // //     showModalBottomSheet(
// // // // // //       context: context,
// // // // // //       backgroundColor: Colors.white,
// // // // // //       shape: const RoundedRectangleBorder(
// // // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// // // // // //       ),
// // // // // //       builder: (bottomSheetContext) {
// // // // // //         return Container(
// // // // // //           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// // // // // //           child: Column(
// // // // // //             mainAxisSize: MainAxisSize.min,
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               const Text(
// // // // // //                 "Wellness Hub Options",
// // // // // //                 style: TextStyle(
// // // // // //                   fontSize: 18,
// // // // // //                   fontWeight: FontWeight.bold,
// // // // // //                   color: Color(0xFF1E1E24),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 20),
// // // // // //               Wrap(
// // // // // //                 spacing: 16,
// // // // // //                 runSpacing: 16,
// // // // // //                 alignment: WrapAlignment.center,
// // // // // //                 children: [
// // // // // //                   SizedBox(
// // // // // //                     width: 96,
// // // // // //                     child: _FeatureRoundButton(
// // // // // //                       icon: Icons.spa_rounded,
// // // // // //                       label: "Self-Care",
// // // // // //                       iconColor: const Color(0xFF34C759),
// // // // // //                       bgColor: const Color(0xFFE8F8EF),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const DailyWellnessPage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(
// // // // // //                     width: 96,
// // // // // //                     child: _FeatureRoundButton(
// // // // // //                       icon: Icons.fitness_center_rounded,
// // // // // //                       label: "Exercise",
// // // // // //                       iconColor: const Color(0xFF4FA5FF),
// // // // // //                       bgColor: const Color(0xFFEEF6FF),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const ExercisePage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(
// // // // // //                     width: 96,
// // // // // //                     child: _FeatureRoundButton(
// // // // // //                       icon: Icons.healing_rounded,
// // // // // //                       label: "Healing",
// // // // // //                       iconColor: const Color(0xFF8E59FF),
// // // // // //                       bgColor: const Color(0xFFF4EEFF),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const StressManagementPage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(
// // // // // //                     width: 96,
// // // // // //                     child: _FeatureRoundButton(
// // // // // //                       icon: Icons.bedtime_rounded,
// // // // // //                       label: "Sleep",
// // // // // //                       iconColor: const Color(0xFFFFB323),
// // // // // //                       bgColor: const Color(0xFFFFF7E6),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.pop(bottomSheetContext);
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const SleepRelaxationPage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class _MotivationCard extends StatelessWidget {
// // // // // //   final String text;
// // // // // //   final String subText;
// // // // // //   final String emoji;
// // // // // //   final List<Color> colors;

// // // // // //   const _MotivationCard({
// // // // // //     required this.text,
// // // // // //     required this.subText,
// // // // // //     required this.emoji,
// // // // // //     required this.colors,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       width: double.infinity,
// // // // // //       decoration: BoxDecoration(
// // // // // //         borderRadius: BorderRadius.circular(24),
// // // // // //         gradient: LinearGradient(
// // // // // //           colors: colors,
// // // // // //           begin: Alignment.topLeft,
// // // // // //           end: Alignment.bottomRight,
// // // // // //         ),
// // // // // //       ),
// // // // // //       child: Stack(
// // // // // //         children: [
// // // // // //           Positioned(
// // // // // //             right: -20,
// // // // // //             bottom: -20,
// // // // // //             child: Opacity(
// // // // // //               opacity: 0.08,
// // // // // //               child: Icon(
// // // // // //                 Icons.spa_rounded,
// // // // // //                 size: 160,
// // // // // //                 color: const Color(0xFF636AE8),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.all(24.0),
// // // // // //             child: Row(
// // // // // //               children: [
// // // // // //                 Expanded(
// // // // // //                   child: Column(
// // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                     children: [
// // // // // //                       Text(
// // // // // //                         text,
// // // // // //                         style: const TextStyle(
// // // // // //                           fontSize: 22,
// // // // // //                           color: Color(0xFF1E1E24),
// // // // // //                           height: 1.3,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                         ),
// // // // // //                         maxLines: 3,
// // // // // //                         overflow: TextOverflow.ellipsis,
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 12),
// // // // // //                       Text(
// // // // // //                         subText,
// // // // // //                         style: const TextStyle(
// // // // // //                           color: Color(0xFF7D7E87),
// // // // // //                           fontSize: 13,
// // // // // //                           fontWeight: FontWeight.w500,
// // // // // //                         ),
// // // // // //                         maxLines: 2,
// // // // // //                         overflow: TextOverflow.ellipsis,
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 Container(
// // // // // //                   width: 72,
// // // // // //                   height: 72,
// // // // // //                   decoration: const BoxDecoration(
// // // // // //                     color: Color(0xFFFFDE6A),
// // // // // //                     shape: BoxShape.circle,
// // // // // //                     boxShadow: [
// // // // // //                       BoxShadow(
// // // // // //                         color: Color(0x55FFDE6A),
// // // // // //                         blurRadius: 20,
// // // // // //                         offset: Offset(0, 4),
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                   child: Center(
// // // // // //                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // //   final IconData icon;
// // // // // //   final String label;
// // // // // //   final Color iconColor;
// // // // // //   final Color bgColor;
// // // // // //   final VoidCallback onTap;

// // // // // //   const _FeatureRoundButton({
// // // // // //     required this.icon,
// // // // // //     required this.label,
// // // // // //     required this.iconColor,
// // // // // //     required this.bgColor,
// // // // // //     required this.onTap,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: onTap,
// // // // // //       child: Container(
// // // // // //         height: 120,
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(20),
// // // // // //           boxShadow: [
// // // // // //             BoxShadow(
// // // // // //               color: Colors.black.withOpacity(0.015),
// // // // // //               blurRadius: 10,
// // // // // //               offset: const Offset(0, 4),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         child: Padding(
// // // // // //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // // //           child: Column(
// // // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // // //             children: [
// // // // // //               Container(
// // // // // //                 width: 50,
// // // // // //                 height: 50,
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: bgColor,
// // // // // //                   shape: BoxShape.circle,
// // // // // //                 ),
// // // // // //                 child: Icon(icon, color: iconColor, size: 24),
// // // // // //               ),
// // // // // //               const SizedBox(height: 10),
// // // // // //               Text(
// // // // // //                 label,
// // // // // //                 textAlign: TextAlign.center,
// // // // // //                 maxLines: 2,
// // // // // //                 overflow: TextOverflow.ellipsis,
// // // // // //                 style: const TextStyle(
// // // // // //                   color: Color(0xFF1E1E24),
// // // // // //                   fontWeight: FontWeight.w600,
// // // // // //                   fontSize: 12,
// // // // // //                   height: 1.2,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:convert';

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // //     hide kCard, kPrimary;
// // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // // // class UserHomeWrapper extends StatefulWidget {
// // // // //   const UserHomeWrapper({super.key});

// // // // //   @override
// // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // }

// // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // //   User? firebaseUser;
// // // // //   String username = "";
// // // // //   String? profileImageBase64;

// // // // //   int selectedIndex = 0;
// // // // //   String selectedMood = "🙂";

// // // // //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// // // // //   final PageController _motivationPageController = PageController();
// // // // //   int _currentMotivationPage = 0;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // //     _fetchUserData();
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _motivationPageController.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   Future<void> _fetchUserData() async {
// // // // //     if (firebaseUser == null) return;

// // // // //     try {
// // // // //       final doc = await FirebaseFirestore.instance
// // // // //           .collection('users')
// // // // //           .doc(firebaseUser!.uid)
// // // // //           .get();

// // // // //       if (doc.exists) {
// // // // //         final data = doc.data()!;
// // // // //         setState(() {
// // // // //           username = data['name'] ?? "User";
// // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // //         });
// // // // //       }
// // // // //     } catch (e) {
// // // // //       debugPrint("Error fetching user data: $e");
// // // // //     }
// // // // //   }

// // // // //   ImageProvider getProfileImage() {
// // // // //     try {
// // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // //         final cleanBase64 = profileImageBase64!
// // // // //             .replaceAll('\n', '')
// // // // //             .replaceAll(' ', '');

// // // // //         final bytes = base64Decode(cleanBase64);
// // // // //         return MemoryImage(bytes);
// // // // //       }
// // // // //     } catch (e) {
// // // // //       debugPrint("Profile image decode error: $e");
// // // // //     }
// // // // //     return const AssetImage("assets/images/admin.png");
// // // // //   }

// // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // //     final loginController = LoginController();
// // // // //     await FirebaseAuth.instance.signOut();
// // // // //     await loginController.clearSharedPref();
// // // // //     Navigator.pushAndRemoveUntil(
// // // // //       context,
// // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // //       (route) => false,
// // // // //     );
// // // // //   }

// // // // //   List<Widget> _buildPages() {
// // // // //     return [
// // // // //       _buildHomePage(),
// // // // //       const ChatBotPage(),
// // // // //       const EmergencyPage(),
// // // // //       const UserProfilePage(),
// // // // //     ];
// // // // //   }

// // // // //   Widget _buildHomePage() {
// // // // //     return SafeArea(
// // // // //       child: SingleChildScrollView(
// // // // //         physics: const BouncingScrollPhysics(),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
// // // // //               child: Row(
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                 children: [
// // // // //                   IconButton(
// // // // //                     icon: const Icon(
// // // // //                       Icons.menu,
// // // // //                       color: Color(0xFF1E1E24),
// // // // //                       size: 28,
// // // // //                     ),
// // // // //                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
// // // // //                   ),
// // // // //                   GestureDetector(
// // // // //                     onTap: () {
// // // // //                       setState(() {
// // // // //                         selectedIndex = 3;
// // // // //                       });
// // // // //                     },
// // // // //                     child: Stack(
// // // // //                       children: [
// // // // //                         CircleAvatar(
// // // // //                           radius: 22,
// // // // //                           backgroundImage: getProfileImage(),
// // // // //                         ),
// // // // //                         Positioned(
// // // // //                           right: 0,
// // // // //                           bottom: 0,
// // // // //                           child: Container(
// // // // //                             width: 12,
// // // // //                             height: 12,
// // // // //                             decoration: BoxDecoration(
// // // // //                               color: const Color(0xFF34C759),
// // // // //                               shape: BoxShape.circle,
// // // // //                               border: Border.all(color: Colors.white, width: 2),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 children: [
// // // // //                   Row(
// // // // //                     children: [
// // // // //                       const Text(
// // // // //                         "Hello ",
// // // // //                         style: TextStyle(
// // // // //                           color: Color(0xFF1E1E24),
// // // // //                           fontSize: 32,
// // // // //                           fontWeight: FontWeight.w700,
// // // // //                           letterSpacing: -0.5,
// // // // //                         ),
// // // // //                       ),
// // // // //                       Text(
// // // // //                         username.isNotEmpty ? username : "User",
// // // // //                         style: const TextStyle(
// // // // //                           color: Color(0xFF636AE8),
// // // // //                           fontSize: 32,
// // // // //                           fontWeight: FontWeight.w700,
// // // // //                           letterSpacing: -0.5,
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(width: 8),
// // // // //                       const Text("👋", style: TextStyle(fontSize: 26)),
// // // // //                     ],
// // // // //                   ),
// // // // //                   const SizedBox(height: 4),
// // // // //                   const Text(
// // // // //                     "How are you feeling today?",
// // // // //                     style: TextStyle(
// // // // //                       color: Color(0xFF8A8A93),
// // // // //                       fontSize: 16,
// // // // //                       fontWeight: FontWeight.w500,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 32),
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // //               child: Row(
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                 children: [
// // // // //                   const Text(
// // // // //                     "Motivation & Daily Check-in",
// // // // //                     style: TextStyle(
// // // // //                       color: Color(0xFF1E1E24),
// // // // //                       fontSize: 18,
// // // // //                       fontWeight: FontWeight.w700,
// // // // //                     ),
// // // // //                   ),
// // // // //                   Row(
// // // // //                     children: [
// // // // //                       Text(
// // // // //                         "Swipe",
// // // // //                         style: TextStyle(
// // // // //                           color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // //                           fontSize: 14,
// // // // //                           fontWeight: FontWeight.w500,
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(width: 4),
// // // // //                       Icon(
// // // // //                         Icons.arrow_forward_rounded,
// // // // //                         size: 16,
// // // // //                         color: const Color(0xFF1E1E24).withOpacity(0.4),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 14),
// // // // //             _buildMotivationCardsStream(),
// // // // //             const SizedBox(height: 32),
// // // // //             const Padding(
// // // // //               padding: EdgeInsets.symmetric(horizontal: 24),
// // // // //               child: Text(
// // // // //                 "Quick Access Tools",
// // // // //                 style: TextStyle(
// // // // //                   color: Color(0xFF1E1E24),
// // // // //                   fontSize: 18,
// // // // //                   fontWeight: FontWeight.w700,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 16),
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // // // //               child: GridView.count(
// // // // //                 shrinkWrap: true,
// // // // //                 physics: const NeverScrollableScrollPhysics(),
// // // // //                 crossAxisCount: 3,
// // // // //                 crossAxisSpacing: 12,
// // // // //                 mainAxisSpacing: 16,
// // // // //                 childAspectRatio: 0.88,
// // // // //                 children: [
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.chat_bubble_rounded,
// // // // //                     label: "Talk to Me",
// // // // //                     iconColor: const Color(0xFF636AE8),
// // // // //                     bgColor: const Color(0xFFEEF0FF),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.menu_book_rounded,
// // // // //                     label: "Guide",
// // // // //                     iconColor: const Color(0xFFFFB323),
// // // // //                     bgColor: const Color(0xFFFFF7E6),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(
// // // // //                           builder: (_) => const SpiritualWisdomApp(),
// // // // //                         ),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.people_alt_rounded,
// // // // //                     label: "Relationship\nAdvice",
// // // // //                     iconColor: const Color(0xFF8E59FF),
// // // // //                     bgColor: const Color(0xFFF4EEFF),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(
// // // // //                           builder: (_) => const RelationshipAdvicePage(),
// // // // //                         ),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.shield_rounded,
// // // // //                     label: "Expert Advice",
// // // // //                     iconColor: const Color(0xFF4FA5FF),
// // // // //                     bgColor: const Color(0xFFEEF6FF),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.fitness_center_rounded,
// // // // //                     label: "Exercise",
// // // // //                     iconColor: const Color(0xFF4FA5FF),
// // // // //                     bgColor: const Color(0xFFEEF6FF),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(builder: (_) => const ExercisePage()),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                   _FeatureRoundButton(
// // // // //                     icon: Icons.healing_rounded,
// // // // //                     label: "Healing",
// // // // //                     iconColor: const Color(0xFF8E59FF),
// // // // //                     bgColor: const Color(0xFFF4EEFF),
// // // // //                     onTap: () {
// // // // //                       Navigator.push(
// // // // //                         context,
// // // // //                         MaterialPageRoute(
// // // // //                           builder: (_) => const StressManagementPage(),
// // // // //                         ),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 32),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final pages = _buildPages();

// // // // //     return Scaffold(
// // // // //       key: scaffoldKey,
// // // // //       backgroundColor: const Color(0xFFF9FAFC),
// // // // //       drawer: Drawer(
// // // // //         backgroundColor: Colors.white,
// // // // //         child: SafeArea(
// // // // //           child: Column(
// // // // //             children: [
// // // // //               UserAccountsDrawerHeader(
// // // // //                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
// // // // //                 currentAccountPicture: GestureDetector(
// // // // //                   onTap: () {
// // // // //                     setState(() {
// // // // //                       selectedIndex = 3;
// // // // //                     });
// // // // //                   },
// // // // //                   child: CircleAvatar(
// // // // //                     radius: 30,
// // // // //                     backgroundImage: getProfileImage(),
// // // // //                   ),
// // // // //                 ),
// // // // //                 accountName: Text(
// // // // //                   username.isNotEmpty ? username : "Active User",
// // // // //                   style: const TextStyle(
// // // // //                     fontWeight: FontWeight.bold,
// // // // //                     fontSize: 18,
// // // // //                   ),
// // // // //                 ),
// // // // //                 accountEmail: const SizedBox.shrink(),
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
// // // // //                 title: const Text("Dashboard"),
// // // // //                 onTap: () {
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(
// // // // //                       builder: (_) => DashboardPage(
// // // // //                         username: username.isNotEmpty ? username : '',
// // // // //                       ),
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // //                 title: const Text("Emergency"),
// // // // //                 onTap: () {
// // // // //                   Navigator.pop(context);
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(
// // // // //                   Icons.help_outline,
// // // // //                   color: Color(0xFF1E1E24),
// // // // //                 ),
// // // // //                 title: const Text("Help & Support"),
// // // // //                 onTap: () {
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               const Spacer(),
// // // // //               const Divider(),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // //                 title: const Text(
// // // // //                   "Logout",
// // // // //                   style: TextStyle(color: Colors.red),
// // // // //                 ),
// // // // //                 onTap: () async {
// // // // //                   Navigator.pop(context);
// // // // //                   await handleLogout(context);
// // // // //                 },
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       body: pages[selectedIndex],
// // // // //       bottomNavigationBar: Container(
// // // // //         decoration: BoxDecoration(
// // // // //           color: Colors.white,
// // // // //           boxShadow: [
// // // // //             BoxShadow(
// // // // //               color: Colors.black.withOpacity(0.04),
// // // // //               blurRadius: 20,
// // // // //               offset: const Offset(0, -4),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         child: SafeArea(
// // // // //           child: Padding(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // // //             child: Row(
// // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //               children: [
// // // // //                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
// // // // //                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
// // // // //                 _buildMiddleEmergencyButton(context),
// // // // //                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
// // // // //                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMotivationCardsStream() {
// // // // //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // //       stream: FirebaseFirestore.instance
// // // // //           .collection('motivation_cards')
// // // // //           .where('isActive', isEqualTo: true)
// // // // //           .snapshots(),
// // // // //       builder: (context, snapshot) {
// // // // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // // // //           return _buildSingleFallbackCard(
// // // // //             text:
// // // // //                 "Every day may not be good, but there is something good in every day.",
// // // // //             subText: "Take a deep breath and begin gently.",
// // // // //             emoji: "🌸",
// // // // //             colors: const [Color(0xFFEAEBFF), Color(0xFFF8ECFF)],
// // // // //           );
// // // // //         }

// // // // //         if (snapshot.hasError) {
// // // // //           return _buildSingleFallbackCard(
// // // // //             text:
// // // // //                 "You are stronger than you think, and brighter days are ahead.",
// // // // //             subText: "One small positive step is enough for today.",
// // // // //             emoji: "🙂",
// // // // //             colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // // // //           );
// // // // //         }

// // // // //         final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
// // // // //             snapshot.data?.docs.toList() ?? [];

// // // // //         docs.sort((a, b) {
// // // // //           final dynamic aRaw = a.data()['order'];
// // // // //           final dynamic bRaw = b.data()['order'];

// // // // //           final int aOrder = aRaw is int
// // // // //               ? aRaw
// // // // //               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
// // // // //           final int bOrder = bRaw is int
// // // // //               ? bRaw
// // // // //               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

// // // // //           return aOrder.compareTo(bOrder);
// // // // //         });

// // // // //         if (docs.isEmpty) {
// // // // //           return _buildSingleFallbackCard(
// // // // //             text:
// // // // //                 "Believe in yourself. You have the power to heal, grow, and shine.",
// // // // //             subText: "Your journey matters, even on slow days.",
// // // // //             emoji: "💛",
// // // // //             colors: const [Color(0xFFFFF1CC), Color(0xFFFFF7E8)],
// // // // //           );
// // // // //         }

// // // // //         if (_currentMotivationPage >= docs.length) {
// // // // //           WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //             if (mounted) {
// // // // //               setState(() {
// // // // //                 _currentMotivationPage = 0;
// // // // //               });
// // // // //             }
// // // // //           });
// // // // //         }

// // // // //         return Column(
// // // // //           children: [
// // // // //             SizedBox(
// // // // //               height: 190,
// // // // //               child: PageView.builder(
// // // // //                 controller: _motivationPageController,
// // // // //                 physics: const BouncingScrollPhysics(
// // // // //                   parent: PageScrollPhysics(),
// // // // //                 ),
// // // // //                 itemCount: docs.length,
// // // // //                 onPageChanged: (int page) {
// // // // //                   setState(() {
// // // // //                     _currentMotivationPage = page;
// // // // //                   });
// // // // //                 },
// // // // //                 itemBuilder: (context, index) {
// // // // //                   final Map<String, dynamic> data = docs[index].data();

// // // // //                   final String quoteText =
// // // // //                       (data['text']?.toString().trim().isNotEmpty ?? false)
// // // // //                       ? data['text'].toString().trim()
// // // // //                       : "Stay strong, brighter days are ahead.";

// // // // //                   final String quoteEmoji =
// // // // //                       (data['icon']?.toString().trim().isNotEmpty ?? false)
// // // // //                       ? data['icon'].toString().trim()
// // // // //                       : "🙂";

// // // // //                   final int color1Value = _parseColorValue(
// // // // //                     data['color1'],
// // // // //                     0xFFEAEBFF,
// // // // //                   );
// // // // //                   final int color2Value = _parseColorValue(
// // // // //                     data['color2'],
// // // // //                     0xFFF3F4FF,
// // // // //                   );

// // // // //                   return Padding(
// // // // //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // //                     child: _MotivationCard(
// // // // //                       text: quoteText,
// // // // //                       subText: "Take a deep breath. You've got this.",
// // // // //                       emoji: quoteEmoji,
// // // // //                       colors: [Color(color1Value), Color(color2Value)],
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 12),
// // // // //             _buildPageIndicator(docs.length, _currentMotivationPage),
// // // // //           ],
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }

// // // // //   int _parseColorValue(dynamic value, int fallback) {
// // // // //     if (value is int) return value;
// // // // //     if (value is String) {
// // // // //       final cleaned = value.replaceAll('#', '').trim();

// // // // //       if (cleaned.isEmpty) return fallback;

// // // // //       if (cleaned.length == 6) {
// // // // //         return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
// // // // //       }

// // // // //       if (cleaned.length == 8) {
// // // // //         return int.tryParse(cleaned, radix: 16) ?? fallback;
// // // // //       }
// // // // //     }
// // // // //     return fallback;
// // // // //   }

// // // // //   Widget _buildSingleFallbackCard({
// // // // //     required String text,
// // // // //     required String subText,
// // // // //     required String emoji,
// // // // //     required List<Color> colors,
// // // // //   }) {
// // // // //     return Column(
// // // // //       children: [
// // // // //         Padding(
// // // // //           padding: const EdgeInsets.symmetric(horizontal: 24),
// // // // //           child: SizedBox(
// // // // //             height: 190,
// // // // //             child: _MotivationCard(
// // // // //               text: text,
// // // // //               subText: subText,
// // // // //               emoji: emoji,
// // // // //               colors: colors,
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //         const SizedBox(height: 12),
// // // // //         _buildPageIndicator(1, 0),
// // // // //       ],
// // // // //     );
// // // // //   }

// // // // //   Widget _buildPageIndicator(int count, int current) {
// // // // //     return Row(
// // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // //       children: List.generate(count, (index) {
// // // // //         final bool isSelected = index == current;
// // // // //         return AnimatedContainer(
// // // // //           duration: const Duration(milliseconds: 250),
// // // // //           margin: const EdgeInsets.symmetric(horizontal: 3),
// // // // //           height: 6,
// // // // //           width: isSelected ? 18 : 6,
// // // // //           decoration: BoxDecoration(
// // // // //             color: isSelected
// // // // //                 ? const Color(0xFF636AE8)
// // // // //                 : const Color(0xFFD1D1D6),
// // // // //             borderRadius: BorderRadius.circular(3),
// // // // //           ),
// // // // //         );
// // // // //       }),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildBottomNavItem(int index, IconData icon, String label) {
// // // // //     final bool isSelected = selectedIndex == index;
// // // // //     return GestureDetector(
// // // // //       onTap: () {
// // // // //         setState(() {
// // // // //           selectedIndex = index;
// // // // //         });
// // // // //       },
// // // // //       child: Column(
// // // // //         mainAxisSize: MainAxisSize.min,
// // // // //         children: [
// // // // //           Icon(
// // // // //             icon,
// // // // //             color: isSelected
// // // // //                 ? const Color(0xFF636AE8)
// // // // //                 : const Color(0xFFA1A1A9),
// // // // //             size: 26,
// // // // //           ),
// // // // //           const SizedBox(height: 4),
// // // // //           Text(
// // // // //             label,
// // // // //             style: TextStyle(
// // // // //               color: isSelected
// // // // //                   ? const Color(0xFF636AE8)
// // // // //                   : const Color(0xFFA1A1A9),
// // // // //               fontSize: 11,
// // // // //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMiddleEmergencyButton(BuildContext context) {
// // // // //     return GestureDetector(
// // // // //       onTap: () {
// // // // //         Navigator.push(
// // // // //           context,
// // // // //           MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // //         );
// // // // //       },
// // // // //       child: Container(
// // // // //         margin: const EdgeInsets.only(bottom: 2),
// // // // //         padding: const EdgeInsets.all(12),
// // // // //         decoration: BoxDecoration(
// // // // //           color: const Color(0xFFFF4B6E),
// // // // //           shape: BoxShape.circle,
// // // // //           boxShadow: [
// // // // //             BoxShadow(
// // // // //               color: const Color(0xFFFF4B6E).withOpacity(0.3),
// // // // //               blurRadius: 12,
// // // // //               offset: const Offset(0, 4),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         child: const Icon(
// // // // //           Icons.phone_in_talk_rounded,
// // // // //           color: Colors.white,
// // // // //           size: 28,
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   void _showWellnessBottomSheet(BuildContext context) {
// // // // //     showModalBottomSheet(
// // // // //       context: context,
// // // // //       backgroundColor: Colors.white,
// // // // //       shape: const RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// // // // //       ),
// // // // //       builder: (bottomSheetContext) {
// // // // //         return Container(
// // // // //           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// // // // //           child: Column(
// // // // //             mainAxisSize: MainAxisSize.min,
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               const Text(
// // // // //                 "Wellness Hub Options",
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 18,
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                   color: Color(0xFF1E1E24),
// // // // //                 ),
// // // // //               ),
// // // // //               const SizedBox(height: 20),
// // // // //               Wrap(
// // // // //                 spacing: 16,
// // // // //                 runSpacing: 16,
// // // // //                 alignment: WrapAlignment.center,
// // // // //                 children: [
// // // // //                   SizedBox(
// // // // //                     width: 96,
// // // // //                     child: _FeatureRoundButton(
// // // // //                       icon: Icons.fitness_center_rounded,
// // // // //                       label: "Exercise",
// // // // //                       iconColor: const Color(0xFF4FA5FF),
// // // // //                       bgColor: const Color(0xFFEEF6FF),
// // // // //                       onTap: () {
// // // // //                         Navigator.pop(bottomSheetContext);
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const ExercisePage(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                   ),
// // // // //                   SizedBox(
// // // // //                     width: 96,
// // // // //                     child: _FeatureRoundButton(
// // // // //                       icon: Icons.healing_rounded,
// // // // //                       label: "Healing",
// // // // //                       iconColor: const Color(0xFF8E59FF),
// // // // //                       bgColor: const Color(0xFFF4EEFF),
// // // // //                       onTap: () {
// // // // //                         Navigator.pop(bottomSheetContext);
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const StressManagementPage(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _MotivationCard extends StatelessWidget {
// // // // //   final String text;
// // // // //   final String subText;
// // // // //   final String emoji;
// // // // //   final List<Color> colors;

// // // // //   const _MotivationCard({
// // // // //     required this.text,
// // // // //     required this.subText,
// // // // //     required this.emoji,
// // // // //     required this.colors,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       width: double.infinity,
// // // // //       decoration: BoxDecoration(
// // // // //         borderRadius: BorderRadius.circular(24),
// // // // //         gradient: LinearGradient(
// // // // //           colors: colors,
// // // // //           begin: Alignment.topLeft,
// // // // //           end: Alignment.bottomRight,
// // // // //         ),
// // // // //       ),
// // // // //       child: Stack(
// // // // //         children: [
// // // // //           Positioned(
// // // // //             right: -20,
// // // // //             bottom: -20,
// // // // //             child: Opacity(
// // // // //               opacity: 0.08,
// // // // //               child: Icon(
// // // // //                 Icons.spa_rounded,
// // // // //                 size: 160,
// // // // //                 color: const Color(0xFF636AE8),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(24.0),
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // //                     children: [
// // // // //                       Text(
// // // // //                         text,
// // // // //                         style: const TextStyle(
// // // // //                           fontSize: 22,
// // // // //                           color: Color(0xFF1E1E24),
// // // // //                           height: 1.3,
// // // // //                           fontWeight: FontWeight.w700,
// // // // //                         ),
// // // // //                         maxLines: 3,
// // // // //                         overflow: TextOverflow.ellipsis,
// // // // //                       ),
// // // // //                       const SizedBox(height: 12),
// // // // //                       Text(
// // // // //                         subText,
// // // // //                         style: const TextStyle(
// // // // //                           color: Color(0xFF7D7E87),
// // // // //                           fontSize: 13,
// // // // //                           fontWeight: FontWeight.w500,
// // // // //                         ),
// // // // //                         maxLines: 2,
// // // // //                         overflow: TextOverflow.ellipsis,
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //                 Container(
// // // // //                   width: 72,
// // // // //                   height: 72,
// // // // //                   decoration: const BoxDecoration(
// // // // //                     color: Color(0xFFFFDE6A),
// // // // //                     shape: BoxShape.circle,
// // // // //                     boxShadow: [
// // // // //                       BoxShadow(
// // // // //                         color: Color(0x55FFDE6A),
// // // // //                         blurRadius: 20,
// // // // //                         offset: Offset(0, 4),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   child: Center(
// // // // //                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // //   final IconData icon;
// // // // //   final String label;
// // // // //   final Color iconColor;
// // // // //   final Color bgColor;
// // // // //   final VoidCallback onTap;

// // // // //   const _FeatureRoundButton({
// // // // //     required this.icon,
// // // // //     required this.label,
// // // // //     required this.iconColor,
// // // // //     required this.bgColor,
// // // // //     required this.onTap,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return GestureDetector(
// // // // //       onTap: onTap,
// // // // //       child: Container(
// // // // //         height: 120,
// // // // //         decoration: BoxDecoration(
// // // // //           color: Colors.white,
// // // // //           borderRadius: BorderRadius.circular(20),
// // // // //           boxShadow: [
// // // // //             BoxShadow(
// // // // //               color: Colors.black.withOpacity(0.015),
// // // // //               blurRadius: 10,
// // // // //               offset: const Offset(0, 4),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         child: Padding(
// // // // //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // //           child: Column(
// // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // //             children: [
// // // // //               Container(
// // // // //                 width: 50,
// // // // //                 height: 50,
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: bgColor,
// // // // //                   shape: BoxShape.circle,
// // // // //                 ),
// // // // //                 child: Icon(icon, color: iconColor, size: 24),
// // // // //               ),
// // // // //               const SizedBox(height: 10),
// // // // //               Text(
// // // // //                 label,
// // // // //                 textAlign: TextAlign.center,
// // // // //                 maxLines: 2,
// // // // //                 overflow: TextOverflow.ellipsis,
// // // // //                 style: const TextStyle(
// // // // //                   color: Color(0xFF1E1E24),
// // // // //                   fontWeight: FontWeight.w600,
// // // // //                   fontSize: 12,
// // // // //                   height: 1.2,
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }import 'dart:convert';

// // // import 'dart:convert';
// // // import 'dart:ui';
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/controller/ActivityController.dart';
// // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // class UserHomeWrapper extends StatefulWidget {
// // //   const UserHomeWrapper({super.key});

// // //   @override
// // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // }

// // // class _UserHomeWrapperState extends State<UserHomeWrapper>
// // //     with WidgetsBindingObserver {
// // //   static const Color primaryPurple = Color(0xFF7C8CF8);
// // //   static const Color secondaryPurple = Color(0xFFA786FA);
// // //   static const Color pastelPink = Color(0xFFF9C5D5);
// // //   static const Color mintGreen = Color(0xFFB8E7C9);
// // //   static const Color warmYellow = Color(0xFFFCE38A);
// // //   static const Color background = Color(0xFFFAF8F5);
// // //   static const Color darkText = Color(0xFF687280);

// // //   static const double kPagePadding = 24;

// // //   User? firebaseUser;
// // //   String username = "";
// // //   String? profileImageBase64;

// // //   int selectedIndex = 0;
// // //   String selectedMood = "🙂";

// // //   final ActivityController activityController = ActivityController();
// // //   bool _hasLoggedResume = false;

// // //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// // //   final PageController _motivationPageController = PageController();
// // //   int _currentMotivationPage = 0;

// // //   bool _pageReady = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addObserver(this);
// // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // //     _fetchUserData();
// // //     _logOpenActivity();

// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       if (mounted) {
// // //         setState(() {
// // //           _pageReady = true;
// // //         });
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     WidgetsBinding.instance.removeObserver(this);
// // //     _motivationPageController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   void didChangeAppLifecycleState(AppLifecycleState state) {
// // //     if (state == AppLifecycleState.resumed && !_hasLoggedResume) {
// // //       _hasLoggedResume = true;
// // //       _logResumeActivity().whenComplete(() {
// // //         _hasLoggedResume = false;
// // //       });
// // //     }
// // //   }

// // //   Future<void> _fetchUserData() async {
// // //     if (firebaseUser == null) return;

// // //     try {
// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(firebaseUser!.uid)
// // //           .get();

// // //       if (!mounted) return;

// // //       if (doc.exists) {
// // //         final data = doc.data()!;
// // //         setState(() {
// // //           username = data['name'] ?? "User";
// // //           profileImageBase64 = data['profileImageBase64'];
// // //         });
// // //       }
// // //     } catch (e) {
// // //       debugPrint("Error fetching user data: $e");
// // //     }
// // //   }

// // //   Future<void> _logOpenActivity() async {
// // //     if (firebaseUser == null) return;

// // //     try {
// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(firebaseUser!.uid)
// // //           .get();

// // //       if (!doc.exists) return;

// // //       final data = doc.data()!;
// // //       final userName = data['name'] ?? "User";

// // //       await activityController.logActivity(
// // //         userId: firebaseUser!.uid,
// // //         userName: userName,
// // //         action: "open_app",
// // //       );
// // //     } catch (e) {
// // //       debugPrint("Error logging open activity: $e");
// // //     }
// // //   }

// // //   Future<void> _logResumeActivity() async {
// // //     if (firebaseUser == null) return;

// // //     try {
// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(firebaseUser!.uid)
// // //           .get();

// // //       if (!doc.exists) return;

// // //       final data = doc.data()!;
// // //       final userName = data['name'] ?? "User";

// // //       await activityController.logActivity(
// // //         userId: firebaseUser!.uid,
// // //         userName: userName,
// // //         action: "resume_app",
// // //       );
// // //     } catch (e) {
// // //       debugPrint("Error logging resume activity: $e");
// // //     }
// // //   }

// // //   ImageProvider getProfileImage() {
// // //     try {
// // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // //         final cleanBase64 = profileImageBase64!
// // //             .replaceAll('\n', '')
// // //             .replaceAll(' ', '');
// // //         final bytes = base64Decode(cleanBase64);
// // //         return MemoryImage(bytes);
// // //       }
// // //     } catch (e) {
// // //       debugPrint("Profile image decode error: $e");
// // //     }
// // //     return const AssetImage("assets/images/user.png");
// // //   }

// // //   Future<void> handleLogout(BuildContext context) async {
// // //     final loginController = LoginController();
// // //     await FirebaseAuth.instance.signOut();
// // //     await loginController.clearSharedPref();

// // //     if (!context.mounted) return;

// // //     Navigator.pushAndRemoveUntil(
// // //       context,
// // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // //       (route) => false,
// // //     );
// // //   }

// // //   List<Widget> _buildPages() {
// // //     return [
// // //       _buildHomePage(),
// // //       const ChatBotPage(),
// // //       const EmergencyPage(),
// // //       const UserProfilePage(),
// // //     ];
// // //   }

// // //   Widget _buildHomePage() {
// // //     return Stack(
// // //       children: [
// // //         const _WellnessBackground(),
// // //         SafeArea(
// // //           child: SingleChildScrollView(
// // //             physics: const BouncingScrollPhysics(),
// // //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 118),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 _AnimatedEntrance(
// // //                   delay: 0,
// // //                   visible: _pageReady,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(
// // //                       horizontal: kPagePadding,
// // //                     ),
// // //                     child: _buildPremiumHeader(),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 28),
// // //                 _AnimatedEntrance(
// // //                   delay: 100,
// // //                   visible: _pageReady,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(
// // //                       horizontal: kPagePadding,
// // //                     ),
// // //                     child: _buildSectionHeader(
// // //                       title: "Motivation & Daily Check-in",
// // //                       trailing: Row(
// // //                         children: [
// // //                           Text(
// // //                             "Swipe",
// // //                             style: TextStyle(
// // //                               color: darkText.withOpacity(0.72),
// // //                               fontSize: 13,
// // //                               fontWeight: FontWeight.w600,
// // //                             ),
// // //                           ),
// // //                           const SizedBox(width: 4),
// // //                           Icon(
// // //                             Icons.arrow_forward_rounded,
// // //                             size: 16,
// // //                             color: darkText.withOpacity(0.72),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 14),
// // //                 _AnimatedEntrance(
// // //                   delay: 160,
// // //                   visible: _pageReady,
// // //                   child: _buildMotivationCardsStream(),
// // //                 ),
// // //                 const SizedBox(height: 24),
// // //                 _AnimatedEntrance(
// // //                   delay: 220,
// // //                   visible: _pageReady,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(
// // //                       horizontal: kPagePadding,
// // //                     ),
// // //                     child: _FeaturedTalkToMeCard(
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (_) => const ChatBotPage(),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 30),
// // //                 _AnimatedEntrance(
// // //                   delay: 280,
// // //                   visible: _pageReady,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(
// // //                       horizontal: kPagePadding,
// // //                     ),
// // //                     child: _buildSectionHeader(title: "Quick Access Tools"),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 _AnimatedEntrance(
// // //                   delay: 340,
// // //                   visible: _pageReady,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// // //                     child: _buildQuickAccessGrid(),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildPremiumHeader() {
// // //     return Row(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Expanded(
// // //           child: TweenAnimationBuilder<double>(
// // //             tween: Tween<double>(begin: 0.88, end: _pageReady ? 1 : 0.88),
// // //             duration: const Duration(milliseconds: 700),
// // //             curve: Curves.easeOutCubic,
// // //             builder: (context, value, child) {
// // //               return Transform.scale(
// // //                 scale: value,
// // //                 alignment: Alignment.centerLeft,
// // //                 child: AnimatedOpacity(
// // //                   opacity: _pageReady ? 1 : 0,
// // //                   duration: const Duration(milliseconds: 700),
// // //                   curve: Curves.easeOut,
// // //                   child: child,
// // //                 ),
// // //               );
// // //             },
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Wrap(
// // //                   crossAxisAlignment: WrapCrossAlignment.center,
// // //                   spacing: 6,
// // //                   children: [
// // //                     const Text(
// // //                       "Hello",
// // //                       style: TextStyle(
// // //                         fontSize: 34,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: darkText,
// // //                         height: 1.15,
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       username.isNotEmpty ? username : "User",
// // //                       style: const TextStyle(
// // //                         fontSize: 29,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: primaryPurple,
// // //                         height: 1.15,
// // //                       ),
// // //                     ),
// // //                     const Text("👋", style: TextStyle(fontSize: 28)),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 Text(
// // //                   "How are you feeling today?",
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w500,
// // //                     color: darkText.withOpacity(0.84),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(width: 12),
// // //         GestureDetector(
// // //           onTap: () {
// // //             setState(() {
// // //               selectedIndex = 3;
// // //             });
// // //           },
// // //           child: TweenAnimationBuilder<double>(
// // //             tween: Tween<double>(begin: 0.80, end: _pageReady ? 1 : 0.80),
// // //             duration: const Duration(milliseconds: 800),
// // //             curve: Curves.easeOutBack,
// // //             builder: (context, scale, child) {
// // //               return Transform.scale(scale: scale, child: child);
// // //             },
// // //             child: Hero(
// // //               tag: 'premium_profile_avatar',
// // //               child: Container(
// // //                 padding: const EdgeInsets.all(3),
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   border: Border.all(
// // //                     color: Colors.white.withOpacity(0.92),
// // //                     width: 1.5,
// // //                   ),
// // //                   boxShadow: [
// // //                     BoxShadow(
// // //                       color: primaryPurple.withOpacity(0.20),
// // //                       blurRadius: 24,
// // //                       spreadRadius: 2,
// // //                       offset: const Offset(0, 10),
// // //                     ),
// // //                   ],
// // //                   gradient: LinearGradient(
// // //                     colors: [
// // //                       Colors.white.withOpacity(0.88),
// // //                       Colors.white.withOpacity(0.55),
// // //                     ],
// // //                     begin: Alignment.topLeft,
// // //                     end: Alignment.bottomRight,
// // //                   ),
// // //                 ),
// // //                 child: Stack(
// // //                   children: [
// // //                     CircleAvatar(
// // //                       radius: 28,
// // //                       backgroundImage: getProfileImage(),
// // //                     ),
// // //                     Positioned(
// // //                       right: 2,
// // //                       bottom: 2,
// // //                       child: Container(
// // //                         width: 14,
// // //                         height: 14,
// // //                         decoration: BoxDecoration(
// // //                           color: const Color(0xFF34C759),
// // //                           shape: BoxShape.circle,
// // //                           border: Border.all(color: Colors.white, width: 2),
// // //                           boxShadow: [
// // //                             BoxShadow(
// // //                               color: const Color(0xFF34C759).withOpacity(0.35),
// // //                               blurRadius: 10,
// // //                               spreadRadius: 1,
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildSectionHeader({required String title, Widget? trailing}) {
// // //     return Row(
// // //       children: [
// // //         Expanded(
// // //           child: Text(
// // //             title,
// // //             style: const TextStyle(
// // //               fontSize: 19,
// // //               fontWeight: FontWeight.w700,
// // //               color: darkText,
// // //             ),
// // //           ),
// // //         ),
// // //         if (trailing != null) trailing,
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildQuickAccessGrid() {
// // //     final tools = [
// // //       _ToolItem(
// // //         icon: Icons.menu_book_rounded,
// // //         label: "Guide",
// // //         colors: const [warmYellow, Color(0xFFF6C56D)],
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
// // //           );
// // //         },
// // //       ),
// // //       _ToolItem(
// // //         icon: Icons.people_alt_rounded,
// // //         label: "Relationship Advice",
// // //         colors: const [secondaryPurple, pastelPink],
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (_) => const RelationshipAdvicePage()),
// // //           );
// // //         },
// // //       ),
// // //       _ToolItem(
// // //         icon: Icons.shield_rounded,
// // //         label: "Expert Advice",
// // //         colors: const [Color(0xFF8ED8FF), Color(0xFF6FA8FF)],
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // //           );
// // //         },
// // //       ),
// // //       _ToolItem(
// // //         icon: Icons.fitness_center_rounded,
// // //         label: "Exercise",
// // //         colors: const [mintGreen, Color(0xFF8FD7B0)],
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (_) => const ExercisePage()),
// // //           );
// // //         },
// // //       ),
// // //       _ToolItem(
// // //         icon: Icons.healing_rounded,
// // //         label: "Healing",
// // //         colors: const [pastelPink, Color(0xFFF3AFC6)],
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(builder: (_) => const StressManagementPage()),
// // //           );
// // //         },
// // //       ),
// // //     ];

// // //     return GridView.builder(
// // //       itemCount: tools.length,
// // //       shrinkWrap: true,
// // //       physics: const NeverScrollableScrollPhysics(),
// // //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //         crossAxisCount: 3,
// // //         crossAxisSpacing: 12,
// // //         mainAxisSpacing: 14,
// // //         childAspectRatio: 0.76,
// // //       ),
// // //       itemBuilder: (context, index) {
// // //         return TweenAnimationBuilder<double>(
// // //           tween: Tween<double>(begin: 0.92, end: _pageReady ? 1 : 0.92),
// // //           duration: Duration(milliseconds: 450 + (index * 80)),
// // //           curve: Curves.easeOutCubic,
// // //           builder: (context, value, child) {
// // //             return Transform.translate(
// // //               offset: Offset(0, (1 - value) * 30),
// // //               child: Opacity(opacity: value.clamp(0.0, 1.0), child: child),
// // //             );
// // //           },
// // //           child: _PremiumToolCard(item: tools[index]),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final pages = _buildPages();

// // //     return Theme(
// // //       data: ThemeData(
// // //         useMaterial3: true,
// // //         scaffoldBackgroundColor: background,
// // //         colorScheme: ColorScheme.fromSeed(
// // //           seedColor: primaryPurple,
// // //           brightness: Brightness.light,
// // //           surface: background,
// // //         ),
// // //         fontFamily: 'Poppins',
// // //       ),
// // //       child: Scaffold(
// // //         key: scaffoldKey,
// // //         extendBody: true,
// // //         backgroundColor: background,
// // //         drawer: _PremiumDrawer(
// // //           username: username,
// // //           profileImage: getProfileImage(),
// // //           onProfileTap: () {
// // //             Navigator.pop(context);
// // //             setState(() {
// // //               selectedIndex = 3;
// // //             });
// // //           },
// // //           onDashboardTap: () {
// // //             Navigator.push(
// // //               context,
// // //               MaterialPageRoute(
// // //                 builder: (_) => DashboardPage(
// // //                   username: username.isNotEmpty ? username : '',
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //           onEmergencyTap: () {
// // //             Navigator.pop(context);
// // //             Navigator.push(
// // //               context,
// // //               MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // //             );
// // //           },
// // //           onHelpTap: () {
// // //             Navigator.push(
// // //               context,
// // //               MaterialPageRoute(builder: (_) => const HelpPage()),
// // //             );
// // //           },
// // //           onLogoutTap: () async {
// // //             Navigator.pop(context);
// // //             await handleLogout(context);
// // //           },
// // //         ),
// // //         body: IndexedStack(index: selectedIndex, children: pages),
// // //         bottomNavigationBar: SafeArea(
// // //           minimum: const EdgeInsets.fromLTRB(20, 0, 20, 18),
// // //           child: _FloatingBottomNav(
// // //             selectedIndex: selectedIndex,
// // //             onItemSelected: (index) {
// // //               setState(() {
// // //                 selectedIndex = index;
// // //               });
// // //             },
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildMotivationCardsStream() {
// // //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // //       stream: FirebaseFirestore.instance
// // //           .collection('motivation_cards')
// // //           .where('isActive', isEqualTo: true)
// // //           .snapshots(),
// // //       builder: (context, snapshot) {
// // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // //           return _buildSingleFallbackCard(
// // //             text:
// // //                 "Every day may not be good, but there is something good in every day.",
// // //             subText: "Take a deep breath and begin gently.",
// // //             emoji: "🌸",
// // //             colors: const [Color(0xFF8D9BFF), Color(0xFFF4B9D2)],
// // //           );
// // //         }

// // //         if (snapshot.hasError) {
// // //           return _buildSingleFallbackCard(
// // //             text:
// // //                 "You are stronger than you think, and brighter days are ahead.",
// // //             subText: "One small positive step is enough for today.",
// // //             emoji: "🙂",
// // //             colors: const [Color(0xFF95A4FF), Color(0xFFDDB8FF)],
// // //           );
// // //         }

// // //         final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
// // //             snapshot.data?.docs.toList() ?? [];

// // //         docs.sort((a, b) {
// // //           final dynamic aRaw = a.data()['order'];
// // //           final dynamic bRaw = b.data()['order'];

// // //           final int aOrder = aRaw is int
// // //               ? aRaw
// // //               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
// // //           final int bOrder = bRaw is int
// // //               ? bRaw
// // //               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

// // //           return aOrder.compareTo(bOrder);
// // //         });

// // //         if (docs.isEmpty) {
// // //           return _buildSingleFallbackCard(
// // //             text:
// // //                 "Believe in yourself. You have the power to heal, grow, and shine.",
// // //             subText: "Your journey matters, even on slow days.",
// // //             emoji: "💛",
// // //             colors: const [Color(0xFFF8D98D), Color(0xFFF7B8C9)],
// // //           );
// // //         }

// // //         if (_currentMotivationPage >= docs.length) {
// // //           WidgetsBinding.instance.addPostFrameCallback((_) {
// // //             if (mounted) {
// // //               setState(() {
// // //                 _currentMotivationPage = 0;
// // //               });
// // //             }
// // //           });
// // //         }

// // //         return Column(
// // //           children: [
// // //             SizedBox(
// // //               height: 214,
// // //               child: PageView.builder(
// // //                 controller: _motivationPageController,
// // //                 physics: const BouncingScrollPhysics(),
// // //                 padEnds: false,
// // //                 itemCount: docs.length,
// // //                 onPageChanged: (int page) {
// // //                   if (mounted) {
// // //                     setState(() {
// // //                       _currentMotivationPage = page;
// // //                     });
// // //                   }
// // //                 },
// // //                 itemBuilder: (context, index) {
// // //                   final Map<String, dynamic> data = docs[index].data();

// // //                   final String quoteText =
// // //                       (data['text']?.toString().trim().isNotEmpty ?? false)
// // //                       ? data['text'].toString().trim()
// // //                       : "Stay strong, brighter days are ahead.";

// // //                   final String quoteEmoji =
// // //                       (data['icon']?.toString().trim().isNotEmpty ?? false)
// // //                       ? data['icon'].toString().trim()
// // //                       : "🙂";

// // //                   final int color1Value = _parseColorValue(
// // //                     data['color1'],
// // //                     0xFF7C8CF8,
// // //                   );
// // //                   final int color2Value = _parseColorValue(
// // //                     data['color2'],
// // //                     0xFFF9C5D5,
// // //                   );

// // //                   return Padding(
// // //                     padding: EdgeInsets.only(
// // //                       left: index == 0 ? 24 : 8,
// // //                       right: index == docs.length - 1 ? 24 : 8,
// // //                     ),
// // //                     child: TweenAnimationBuilder<double>(
// // //                       tween: Tween<double>(
// // //                         begin: 0.98,
// // //                         end: _currentMotivationPage == index ? 1.0 : 0.985,
// // //                       ),
// // //                       duration: const Duration(milliseconds: 280),
// // //                       curve: Curves.easeOutCubic,
// // //                       builder: (context, value, child) {
// // //                         return Transform.scale(scale: value, child: child);
// // //                       },
// // //                       child: _MotivationCard(
// // //                         text: quoteText,
// // //                         subText: "Take a deep breath. You've got this.",
// // //                         emoji: quoteEmoji,
// // //                         colors: [Color(color1Value), Color(color2Value)],
// // //                         isActive: _currentMotivationPage == index,
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             _buildPageIndicator(docs.length, _currentMotivationPage),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   int _parseColorValue(dynamic value, int fallback) {
// // //     if (value is int) return value;
// // //     if (value is String) {
// // //       final cleaned = value.replaceAll('#', '').trim();

// // //       if (cleaned.isEmpty) return fallback;

// // //       if (cleaned.length == 6) {
// // //         return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
// // //       }

// // //       if (cleaned.length == 8) {
// // //         return int.tryParse(cleaned, radix: 16) ?? fallback;
// // //       }
// // //     }
// // //     return fallback;
// // //   }

// // //   Widget _buildSingleFallbackCard({
// // //     required String text,
// // //     required String subText,
// // //     required String emoji,
// // //     required List<Color> colors,
// // //   }) {
// // //     return Column(
// // //       children: [
// // //         Padding(
// // //           padding: const EdgeInsets.symmetric(horizontal: 24),
// // //           child: SizedBox(
// // //             height: 214,
// // //             child: _MotivationCard(
// // //               text: text,
// // //               subText: subText,
// // //               emoji: emoji,
// // //               colors: colors,
// // //               isActive: true,
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 12),
// // //         _buildPageIndicator(1, 0),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildPageIndicator(int count, int current) {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       children: List.generate(count, (index) {
// // //         final bool isSelected = index == current;
// // //         return AnimatedContainer(
// // //           duration: const Duration(milliseconds: 260),
// // //           curve: Curves.easeOutCubic,
// // //           margin: const EdgeInsets.symmetric(horizontal: 4),
// // //           height: 8,
// // //           width: isSelected ? 24 : 8,
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(999),
// // //             gradient: isSelected
// // //                 ? const LinearGradient(colors: [primaryPurple, secondaryPurple])
// // //                 : null,
// // //             color: isSelected ? null : Colors.white.withOpacity(0.82),
// // //             boxShadow: isSelected
// // //                 ? [
// // //                     BoxShadow(
// // //                       color: primaryPurple.withOpacity(0.20),
// // //                       blurRadius: 10,
// // //                       offset: const Offset(0, 4),
// // //                     ),
// // //                   ]
// // //                 : [],
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }

// // //   void _showWellnessBottomSheet(BuildContext context) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (bottomSheetContext) {
// // //         return ClipRRect(
// // //           borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
// // //           child: BackdropFilter(
// // //             filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
// // //             child: Container(
// // //               padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white.withOpacity(0.88),
// // //                 borderRadius: const BorderRadius.vertical(
// // //                   top: Radius.circular(32),
// // //                 ),
// // //               ),
// // //               child: Column(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   const Text(
// // //                     "Wellness Hub Options",
// // //                     style: TextStyle(
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: darkText,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Wrap(
// // //                     spacing: 16,
// // //                     runSpacing: 16,
// // //                     children: [
// // //                       SizedBox(
// // //                         width: 120,
// // //                         child: _PremiumMiniAction(
// // //                           icon: Icons.fitness_center_rounded,
// // //                           label: "Exercise",
// // //                           colors: const [mintGreen, Color(0xFF8FD7B0)],
// // //                           onTap: () {
// // //                             Navigator.pop(bottomSheetContext);
// // //                             Navigator.push(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (_) => const ExercisePage(),
// // //                               ),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ),
// // //                       SizedBox(
// // //                         width: 120,
// // //                         child: _PremiumMiniAction(
// // //                           icon: Icons.healing_rounded,
// // //                           label: "Healing",
// // //                           colors: const [secondaryPurple, pastelPink],
// // //                           onTap: () {
// // //                             Navigator.pop(bottomSheetContext);
// // //                             Navigator.push(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (_) => const StressManagementPage(),
// // //                               ),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // // class _WellnessBackground extends StatelessWidget {
// // //   const _WellnessBackground();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Stack(
// // //       children: [
// // //         Container(
// // //           decoration: const BoxDecoration(
// // //             gradient: LinearGradient(
// // //               colors: [Color(0xFFFCFBF8), Color(0xFFF9F5FC), Color(0xFFF8FBFD)],
// // //               begin: Alignment.topLeft,
// // //               end: Alignment.bottomRight,
// // //             ),
// // //           ),
// // //         ),
// // //         Positioned(
// // //           top: -50,
// // //           right: -40,
// // //           child: _SoftBlob(
// // //             size: 180,
// // //             colors: [
// // //               const Color(0xFF7C8CF8).withOpacity(0.22),
// // //               const Color(0xFFA786FA).withOpacity(0.14),
// // //             ],
// // //           ),
// // //         ),
// // //         Positioned(
// // //           top: 160,
// // //           left: -60,
// // //           child: _SoftBlob(
// // //             size: 170,
// // //             colors: [
// // //               const Color(0xFFF9C5D5).withOpacity(0.24),
// // //               const Color(0xFFFCE38A).withOpacity(0.12),
// // //             ],
// // //           ),
// // //         ),
// // //         Positioned(
// // //           bottom: 180,
// // //           right: -30,
// // //           child: _SoftBlob(
// // //             size: 140,
// // //             colors: [
// // //               const Color(0xFFB8E7C9).withOpacity(0.24),
// // //               const Color(0xFF7C8CF8).withOpacity(0.10),
// // //             ],
// // //           ),
// // //         ),
// // //         Positioned(
// // //           top: 120,
// // //           right: 36,
// // //           child: _FloatingCircle(
// // //             size: 60,
// // //             color: Colors.white.withOpacity(0.24),
// // //           ),
// // //         ),
// // //         Positioned(
// // //           top: 360,
// // //           left: 28,
// // //           child: _FloatingCircle(
// // //             size: 32,
// // //             color: Colors.white.withOpacity(0.28),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }

// // // class _SoftBlob extends StatelessWidget {
// // //   final double size;
// // //   final List<Color> colors;

// // //   const _SoftBlob({required this.size, required this.colors});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       width: size,
// // //       height: size,
// // //       decoration: BoxDecoration(
// // //         shape: BoxShape.circle,
// // //         gradient: LinearGradient(
// // //           colors: colors,
// // //           begin: Alignment.topLeft,
// // //           end: Alignment.bottomRight,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _FloatingCircle extends StatefulWidget {
// // //   final double size;
// // //   final Color color;

// // //   const _FloatingCircle({required this.size, required this.color});

// // //   @override
// // //   State<_FloatingCircle> createState() => _FloatingCircleState();
// // // }

// // // class _FloatingCircleState extends State<_FloatingCircle> {
// // //   bool _moved = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     Future.microtask(() {
// // //       if (mounted) {
// // //         setState(() {
// // //           _moved = true;
// // //         });
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AnimatedContainer(
// // //       duration: const Duration(seconds: 3),
// // //       curve: Curves.easeInOut,
// // //       transform: Matrix4.translationValues(0, _moved ? 6 : -6, 0),
// // //       child: Container(
// // //         width: widget.size,
// // //         height: widget.size,
// // //         decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _AnimatedEntrance extends StatelessWidget {
// // //   final Widget child;
// // //   final bool visible;
// // //   final int delay;

// // //   const _AnimatedEntrance({
// // //     required this.child,
// // //     required this.visible,
// // //     required this.delay,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final duration = Duration(milliseconds: 420 + delay);
// // //     return TweenAnimationBuilder<double>(
// // //       tween: Tween<double>(begin: 0, end: visible ? 1 : 0),
// // //       duration: duration,
// // //       curve: Curves.easeOutCubic,
// // //       builder: (context, value, widgetChild) {
// // //         return Transform.translate(
// // //           offset: Offset(0, (1 - value) * 28),
// // //           child: Opacity(opacity: value.clamp(0.0, 1.0), child: widgetChild),
// // //         );
// // //       },
// // //       child: child,
// // //     );
// // //   }
// // // }

// // // class _FeaturedTalkToMeCard extends StatefulWidget {
// // //   final VoidCallback onTap;

// // //   const _FeaturedTalkToMeCard({required this.onTap});

// // //   @override
// // //   State<_FeaturedTalkToMeCard> createState() => _FeaturedTalkToMeCardState();
// // // }

// // // class _FeaturedTalkToMeCardState extends State<_FeaturedTalkToMeCard> {
// // //   bool _pressed = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AnimatedScale(
// // //       scale: _pressed ? 0.985 : 1.0,
// // //       duration: const Duration(milliseconds: 140),
// // //       child: GestureDetector(
// // //         onTapDown: (_) => setState(() => _pressed = true),
// // //         onTapCancel: () => setState(() => _pressed = false),
// // //         onTapUp: (_) => setState(() => _pressed = false),
// // //         onTap: widget.onTap,
// // //         child: AnimatedContainer(
// // //           duration: const Duration(milliseconds: 220),
// // //           curve: Curves.easeOutCubic,
// // //           width: double.infinity,
// // //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(28),
// // //             gradient: const LinearGradient(
// // //               colors: [Color(0xFF7B61FF), Color(0xFF9C6BFF), Color(0xFFFFA6C9)],
// // //               begin: Alignment.topLeft,
// // //               end: Alignment.bottomRight,
// // //             ),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Color(0xFF7B61FF).withOpacity(0.24),
// // //                 blurRadius: 24,
// // //                 offset: const Offset(0, 14),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Row(
// // //             children: [
// // //               Container(
// // //                 width: 62,
// // //                 height: 62,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Colors.white.withOpacity(0.20),
// // //                   border: Border.all(color: Colors.white.withOpacity(0.25)),
// // //                 ),
// // //                 child: const Icon(
// // //                   Icons.chat_bubble_rounded,
// // //                   color: Colors.white,
// // //                   size: 28,
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 16),
// // //               const Expanded(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       "Talk to Me",
// // //                       style: TextStyle(
// // //                         color: Colors.white,
// // //                         fontSize: 22,
// // //                         fontWeight: FontWeight.w700,
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 6),
// // //                     Text(
// // //                       "Start a supportive conversation and feel heard.",
// // //                       style: TextStyle(
// // //                         color: Colors.white,
// // //                         fontSize: 14,
// // //                         height: 1.4,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //               Container(
// // //                 width: 42,
// // //                 height: 42,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Colors.white.withOpacity(0.18),
// // //                 ),
// // //                 child: const Icon(
// // //                   Icons.arrow_forward_rounded,
// // //                   color: Colors.white,
// // //                   size: 22,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _GlassIconButton extends StatelessWidget {
// // //   final IconData icon;
// // //   final VoidCallback onTap;

// // //   const _GlassIconButton({required this.icon, required this.onTap});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ClipRRect(
// // //       borderRadius: BorderRadius.circular(22),
// // //       child: BackdropFilter(
// // //         filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
// // //         child: Material(
// // //           color: Colors.white.withOpacity(0.55),
// // //           child: InkWell(
// // //             onTap: onTap,
// // //             borderRadius: BorderRadius.circular(22),
// // //             child: Container(
// // //               width: 52,
// // //               height: 52,
// // //               decoration: BoxDecoration(
// // //                 borderRadius: BorderRadius.circular(22),
// // //                 border: Border.all(color: Colors.white.withOpacity(0.70)),
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: const Color(0xFF7C8CF8).withOpacity(0.10),
// // //                     blurRadius: 18,
// // //                     offset: const Offset(0, 8),
// // //                   ),
// // //                 ],
// // //               ),
// // //               child: Icon(
// // //                 icon,
// // //                 color: _UserHomeWrapperState.darkText,
// // //                 size: 24,
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _MotivationCard extends StatelessWidget {
// // //   final String text;
// // //   final String subText;
// // //   final String emoji;
// // //   final List<Color> colors;
// // //   final bool isActive;

// // //   const _MotivationCard({
// // //     required this.text,
// // //     required this.subText,
// // //     required this.emoji,
// // //     required this.colors,
// // //     required this.isActive,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return TweenAnimationBuilder<double>(
// // //       tween: Tween<double>(begin: 0.985, end: isActive ? 1 : 0.99),
// // //       duration: const Duration(milliseconds: 280),
// // //       curve: Curves.easeOutCubic,
// // //       builder: (context, value, child) {
// // //         return Transform.scale(scale: value, child: child);
// // //       },
// // //       child: Container(
// // //         width: double.infinity,
// // //         height: 194,
// // //         decoration: BoxDecoration(
// // //           borderRadius: BorderRadius.circular(26),
// // //           gradient: LinearGradient(
// // //             colors: [
// // //               colors.first.withOpacity(0.98),
// // //               colors.last.withOpacity(0.96),
// // //             ],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: colors.first.withOpacity(0.22),
// // //               blurRadius: 26,
// // //               offset: const Offset(0, 14),
// // //             ),
// // //           ],
// // //         ),
// // //         child: ClipRRect(
// // //           borderRadius: BorderRadius.circular(26),
// // //           child: Stack(
// // //             children: [
// // //               Positioned(
// // //                 top: -14,
// // //                 right: -8,
// // //                 child: Container(
// // //                   width: 108,
// // //                   height: 108,
// // //                   decoration: BoxDecoration(
// // //                     shape: BoxShape.circle,
// // //                     color: Colors.white.withOpacity(0.12),
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 bottom: 12,
// // //                 right: 18,
// // //                 child: Container(
// // //                   width: 76,
// // //                   height: 76,
// // //                   decoration: BoxDecoration(
// // //                     shape: BoxShape.circle,
// // //                     color: Colors.white.withOpacity(0.16),
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: -18,
// // //                 bottom: -30,
// // //                 child: Container(
// // //                   width: 172,
// // //                   height: 72,
// // //                   decoration: BoxDecoration(
// // //                     borderRadius: BorderRadius.circular(90),
// // //                     color: Colors.white.withOpacity(0.12),
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 bottom: 28,
// // //                 right: 88,
// // //                 child: Opacity(
// // //                   opacity: 0.16,
// // //                   child: Icon(
// // //                     Icons.self_improvement_rounded,
// // //                     size: 58,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //               Padding(
// // //                 padding: const EdgeInsets.all(20),
// // //                 child: Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: TweenAnimationBuilder<double>(
// // //                         tween: Tween<double>(begin: 0, end: 1),
// // //                         duration: const Duration(milliseconds: 500),
// // //                         curve: Curves.easeOut,
// // //                         builder: (context, opacity, child) {
// // //                           return Opacity(opacity: opacity, child: child);
// // //                         },
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             Text(
// // //                               text,
// // //                               maxLines: 3,
// // //                               overflow: TextOverflow.ellipsis,
// // //                               style: const TextStyle(
// // //                                 fontSize: 22,
// // //                                 height: 1.24,
// // //                                 fontWeight: FontWeight.w700,
// // //                                 color: Colors.white,
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 10),
// // //                             Text(
// // //                               subText,
// // //                               maxLines: 2,
// // //                               overflow: TextOverflow.ellipsis,
// // //                               style: TextStyle(
// // //                                 color: Colors.white.withOpacity(0.92),
// // //                                 fontSize: 14,
// // //                                 fontWeight: FontWeight.w500,
// // //                                 height: 1.35,
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 14),
// // //                     TweenAnimationBuilder<double>(
// // //                       tween: Tween<double>(begin: 0.84, end: 1),
// // //                       duration: const Duration(milliseconds: 520),
// // //                       curve: Curves.easeOutBack,
// // //                       builder: (context, scale, child) {
// // //                         return Transform.scale(scale: scale, child: child);
// // //                       },
// // //                       child: Container(
// // //                         width: 70,
// // //                         height: 70,
// // //                         decoration: BoxDecoration(
// // //                           shape: BoxShape.circle,
// // //                           color: Colors.white.withOpacity(0.22),
// // //                           border: Border.all(
// // //                             color: Colors.white.withOpacity(0.28),
// // //                           ),
// // //                           boxShadow: [
// // //                             BoxShadow(
// // //                               color: Colors.white.withOpacity(0.10),
// // //                               blurRadius: 18,
// // //                               spreadRadius: 1,
// // //                             ),
// // //                           ],
// // //                         ),
// // //                         child: Center(
// // //                           child: Text(
// // //                             emoji,
// // //                             style: const TextStyle(fontSize: 34),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _ToolItem {
// // //   final IconData icon;
// // //   final String label;
// // //   final List<Color> colors;
// // //   final VoidCallback onTap;

// // //   const _ToolItem({
// // //     required this.icon,
// // //     required this.label,
// // //     required this.colors,
// // //     required this.onTap,
// // //   });
// // // }

// // // class _PremiumToolCard extends StatefulWidget {
// // //   final _ToolItem item;

// // //   const _PremiumToolCard({required this.item});

// // //   @override
// // //   State<_PremiumToolCard> createState() => _PremiumToolCardState();
// // // }

// // // class _PremiumToolCardState extends State<_PremiumToolCard> {
// // //   bool _pressed = false;

// // //   void _setPressed(bool value) {
// // //     if (_pressed == value) return;
// // //     setState(() {
// // //       _pressed = value;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AnimatedScale(
// // //       scale: _pressed ? 0.97 : 1.0,
// // //       duration: const Duration(milliseconds: 140),
// // //       curve: Curves.easeOut,
// // //       child: GestureDetector(
// // //         onTapDown: (_) => _setPressed(true),
// // //         onTapUp: (_) => _setPressed(false),
// // //         onTapCancel: () => _setPressed(false),
// // //         onTap: widget.item.onTap,
// // //         child: AnimatedContainer(
// // //           duration: const Duration(milliseconds: 220),
// // //           curve: Curves.easeOutCubic,
// // //           height: 140,
// // //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(24),
// // //             color: Colors.white.withOpacity(0.62),
// // //             border: Border.all(color: Colors.white.withOpacity(0.72)),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: widget.item.colors.first.withOpacity(
// // //                   _pressed ? 0.16 : 0.12,
// // //                 ),
// // //                 blurRadius: _pressed ? 14 : 22,
// // //                 offset: Offset(0, _pressed ? 6 : 12),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               AnimatedContainer(
// // //                 duration: const Duration(milliseconds: 220),
// // //                 curve: Curves.easeOutCubic,
// // //                 width: 58,
// // //                 height: 58,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   gradient: LinearGradient(
// // //                     colors: widget.item.colors,
// // //                     begin: Alignment.topLeft,
// // //                     end: Alignment.bottomRight,
// // //                   ),
// // //                   boxShadow: [
// // //                     BoxShadow(
// // //                       color: widget.item.colors.first.withOpacity(0.24),
// // //                       blurRadius: 18,
// // //                       offset: const Offset(0, 8),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 child: Icon(widget.item.icon, color: Colors.white, size: 26),
// // //               ),
// // //               const SizedBox(height: 14),
// // //               Text(
// // //                 widget.item.label,
// // //                 textAlign: TextAlign.center,
// // //                 maxLines: 2,
// // //                 overflow: TextOverflow.ellipsis,
// // //                 style: const TextStyle(
// // //                   color: _UserHomeWrapperState.darkText,
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 12.5,
// // //                   height: 1.25,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _FloatingBottomNav extends StatelessWidget {
// // //   final int selectedIndex;
// // //   final ValueChanged<int> onItemSelected;

// // //   const _FloatingBottomNav({
// // //     required this.selectedIndex,
// // //     required this.onItemSelected,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SizedBox(
// // //       height: 84,
// // //       child: ClipRRect(
// // //         borderRadius: BorderRadius.circular(28),
// // //         child: BackdropFilter(
// // //           filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
// // //           child: AnimatedContainer(
// // //             duration: const Duration(milliseconds: 320),
// // //             curve: Curves.easeOutCubic,
// // //             height: 74,
// // //             padding: const EdgeInsets.symmetric(horizontal: 12),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white.withOpacity(0.82),
// // //               borderRadius: BorderRadius.circular(28),
// // //               border: Border.all(color: Colors.white.withOpacity(0.72)),
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: const Color(0xFF7C8CF8).withOpacity(0.12),
// // //                   blurRadius: 28,
// // //                   offset: const Offset(0, 16),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //               children: [
// // //                 Expanded(
// // //                   child: _PremiumNavItem(
// // //                     icon: Icons.home_rounded,
// // //                     label: "Home",
// // //                     isSelected: selectedIndex == 0,
// // //                     onTap: () => onItemSelected(0),
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: _PremiumNavItem(
// // //                     icon: Icons.chat_bubble_rounded,
// // //                     label: "Chat",
// // //                     isSelected: selectedIndex == 1,
// // //                     onTap: () => onItemSelected(1),
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: _PremiumNavItem(
// // //                     icon: Icons.warning_rounded,
// // //                     label: "Emergency",
// // //                     isSelected: selectedIndex == 2,
// // //                     onTap: () => onItemSelected(2),
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: _PremiumNavItem(
// // //                     icon: Icons.person_rounded,
// // //                     label: "Profile",
// // //                     isSelected: selectedIndex == 3,
// // //                     onTap: () => onItemSelected(3),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _PremiumNavItem extends StatelessWidget {
// // //   final IconData icon;
// // //   final String label;
// // //   final bool isSelected;
// // //   final VoidCallback onTap;

// // //   const _PremiumNavItem({
// // //     required this.icon,
// // //     required this.label,
// // //     required this.isSelected,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final color = isSelected
// // //         ? _UserHomeWrapperState.primaryPurple
// // //         : _UserHomeWrapperState.darkText.withOpacity(0.62);

// // //     return InkWell(
// // //       onTap: onTap,
// // //       borderRadius: BorderRadius.circular(18),
// // //       child: AnimatedContainer(
// // //         duration: const Duration(milliseconds: 260),
// // //         curve: Curves.easeOutCubic,
// // //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             AnimatedSwitcher(
// // //               duration: const Duration(milliseconds: 220),
// // //               child: Icon(
// // //                 icon,
// // //                 key: ValueKey<String>('${label}_$isSelected'),
// // //                 color: color,
// // //                 size: isSelected ? 26 : 24,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 4),
// // //             Text(
// // //               label,
// // //               style: TextStyle(
// // //                 color: color,
// // //                 fontSize: 11,
// // //                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 6),
// // //             AnimatedContainer(
// // //               duration: const Duration(milliseconds: 260),
// // //               width: isSelected ? 18 : 0,
// // //               height: 4,
// // //               decoration: BoxDecoration(
// // //                 color: _UserHomeWrapperState.primaryPurple,
// // //                 borderRadius: BorderRadius.circular(999),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _PremiumDrawer extends StatelessWidget {
// // //   final String username;
// // //   final ImageProvider profileImage;
// // //   final VoidCallback onProfileTap;
// // //   final VoidCallback onDashboardTap;
// // //   final VoidCallback onEmergencyTap;
// // //   final VoidCallback onHelpTap;
// // //   final VoidCallback onLogoutTap;

// // //   const _PremiumDrawer({
// // //     required this.username,
// // //     required this.profileImage,
// // //     required this.onProfileTap,
// // //     required this.onDashboardTap,
// // //     required this.onEmergencyTap,
// // //     required this.onHelpTap,
// // //     required this.onLogoutTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Drawer(
// // //       backgroundColor: _UserHomeWrapperState.background,
// // //       child: Stack(
// // //         children: [
// // //           const _WellnessBackground(),
// // //           SafeArea(
// // //             child: Padding(
// // //               padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
// // //               child: Column(
// // //                 children: [
// // //                   Container(
// // //                     width: double.infinity,
// // //                     padding: const EdgeInsets.all(20),
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(28),
// // //                       gradient: const LinearGradient(
// // //                         colors: [
// // //                           _UserHomeWrapperState.primaryPurple,
// // //                           _UserHomeWrapperState.secondaryPurple,
// // //                           _UserHomeWrapperState.pastelPink,
// // //                         ],
// // //                         begin: Alignment.topLeft,
// // //                         end: Alignment.bottomRight,
// // //                       ),
// // //                       boxShadow: [
// // //                         BoxShadow(
// // //                           color: _UserHomeWrapperState.primaryPurple
// // //                               .withOpacity(0.22),
// // //                           blurRadius: 24,
// // //                           offset: const Offset(0, 14),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child: Row(
// // //                       children: [
// // //                         GestureDetector(
// // //                           onTap: onProfileTap,
// // //                           child: Container(
// // //                             padding: const EdgeInsets.all(3),
// // //                             decoration: BoxDecoration(
// // //                               shape: BoxShape.circle,
// // //                               border: Border.all(
// // //                                 color: Colors.white.withOpacity(0.85),
// // //                               ),
// // //                             ),
// // //                             child: CircleAvatar(
// // //                               radius: 30,
// // //                               backgroundImage: profileImage,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(width: 14),
// // //                         Expanded(
// // //                           child: Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             children: [
// // //                               Text(
// // //                                 username.isNotEmpty ? username : "Active User",
// // //                                 style: const TextStyle(
// // //                                   color: Colors.white,
// // //                                   fontWeight: FontWeight.w700,
// // //                                   fontSize: 18,
// // //                                 ),
// // //                               ),
// // //                               const SizedBox(height: 6),
// // //                               Text(
// // //                                 "Your calm space, beautifully organized",
// // //                                 style: TextStyle(
// // //                                   color: Colors.white.withOpacity(0.92),
// // //                                   fontSize: 13,
// // //                                   fontWeight: FontWeight.w500,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 18),
// // //                   _DrawerGlassTile(
// // //                     icon: Icons.dashboard_rounded,
// // //                     title: "Dashboard",
// // //                     iconColor: _UserHomeWrapperState.primaryPurple,
// // //                     onTap: onDashboardTap,
// // //                   ),
// // //                   const SizedBox(height: 12),
// // //                   _DrawerGlassTile(
// // //                     icon: Icons.warning_rounded,
// // //                     title: "Emergency",
// // //                     iconColor: Colors.redAccent,
// // //                     onTap: onEmergencyTap,
// // //                   ),
// // //                   const SizedBox(height: 12),
// // //                   _DrawerGlassTile(
// // //                     icon: Icons.help_outline_rounded,
// // //                     title: "Help & Support",
// // //                     iconColor: _UserHomeWrapperState.darkText,
// // //                     onTap: onHelpTap,
// // //                   ),
// // //                   const Spacer(),
// // //                   _DrawerGlassTile(
// // //                     icon: Icons.logout_rounded,
// // //                     title: "Logout",
// // //                     iconColor: Colors.redAccent,
// // //                     onTap: onLogoutTap,
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

// // // class _DrawerGlassTile extends StatelessWidget {
// // //   final IconData icon;
// // //   final String title;
// // //   final Color iconColor;
// // //   final VoidCallback onTap;

// // //   const _DrawerGlassTile({
// // //     required this.icon,
// // //     required this.title,
// // //     required this.iconColor,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Material(
// // //       color: Colors.white.withOpacity(0.58),
// // //       borderRadius: BorderRadius.circular(22),
// // //       child: InkWell(
// // //         onTap: onTap,
// // //         borderRadius: BorderRadius.circular(22),
// // //         child: Container(
// // //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(22),
// // //             border: Border.all(color: Colors.white.withOpacity(0.70)),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: iconColor.withOpacity(0.08),
// // //                 blurRadius: 18,
// // //                 offset: const Offset(0, 10),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Row(
// // //             children: [
// // //               Icon(icon, color: iconColor, size: 22),
// // //               const SizedBox(width: 14),
// // //               Expanded(
// // //                 child: Text(
// // //                   title,
// // //                   style: const TextStyle(
// // //                     color: _UserHomeWrapperState.darkText,
// // //                     fontSize: 15,
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //                 ),
// // //               ),
// // //               Icon(
// // //                 Icons.arrow_forward_ios_rounded,
// // //                 size: 14,
// // //                 color: _UserHomeWrapperState.darkText.withOpacity(0.55),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _PremiumMiniAction extends StatefulWidget {
// // //   final IconData icon;
// // //   final String label;
// // //   final List<Color> colors;
// // //   final VoidCallback onTap;

// // //   const _PremiumMiniAction({
// // //     required this.icon,
// // //     required this.label,
// // //     required this.colors,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   State<_PremiumMiniAction> createState() => _PremiumMiniActionState();
// // // }

// // // class _PremiumMiniActionState extends State<_PremiumMiniAction> {
// // //   bool pressed = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AnimatedScale(
// // //       scale: pressed ? 0.97 : 1.0,
// // //       duration: const Duration(milliseconds: 120),
// // //       child: GestureDetector(
// // //         onTapDown: (_) => setState(() => pressed = true),
// // //         onTapCancel: () => setState(() => pressed = false),
// // //         onTapUp: (_) => setState(() => pressed = false),
// // //         onTap: widget.onTap,
// // //         child: Container(
// // //           padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(22),
// // //             color: Colors.white.withOpacity(0.62),
// // //             border: Border.all(color: Colors.white.withOpacity(0.72)),
// // //           ),
// // //           child: Column(
// // //             children: [
// // //               Container(
// // //                 width: 52,
// // //                 height: 52,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   gradient: LinearGradient(colors: widget.colors),
// // //                 ),
// // //                 child: Icon(widget.icon, color: Colors.white),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               Text(
// // //                 widget.label,
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(
// // //                   color: _UserHomeWrapperState.darkText,
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 13,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:convert';
// // import 'dart:ui';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/ActivityController.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // ─── Design tokens ────────────────────────────────────────────────────────────
// // const _kBg = Color(0xFFFAF8F5);
// // const _kPurple = Color(0xFF7C8CF8);
// // const _kPurple2 = Color(0xFFA786FA);
// // const _kPink = Color(0xFFF9C5D5);
// // const _kMint = Color(0xFFB8E7C9);
// // const _kYellow = Color(0xFFFCE38A);
// // const _kDark = Color(0xFF4A5568);
// // const _kLight = Color(0xFF8896A8);
// // const _kRed = Color(0xFFFF5252);
// // const _kWhite = Colors.white;

// // // ─────────────────────────────────────────────────────────────────────────────
// // class UserHomeWrapper extends StatefulWidget {
// //   const UserHomeWrapper({super.key});

// //   @override
// //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // }

// // class _UserHomeWrapperState extends State<UserHomeWrapper>
// //     with WidgetsBindingObserver {
// //   // ── State ─────────────────────────────────────────────────────────────────
// //   User? firebaseUser;
// //   String username = "";
// //   String? profileImageBase64;
// //   int selectedIndex = 0;
// //   bool _hasLoggedResume = false;
// //   bool _pageReady = false;

// //   final ActivityController activityController = ActivityController();
// //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// //   // Fixed: viewportFraction 0.92 so adjacent cards peek, enabling reliable swipe
// //   late final PageController _motivationPageController = PageController(
// //     viewportFraction: 0.92,
// //   );
// //   int _currentMotivationPage = 0;

// //   // ── Lifecycle ─────────────────────────────────────────────────────────────
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //     firebaseUser = FirebaseAuth.instance.currentUser;
// //     _fetchUserData();
// //     _logOpenActivity();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       if (mounted) setState(() => _pageReady = true);
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     WidgetsBinding.instance.removeObserver(this);
// //     _motivationPageController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {
// //     if (state == AppLifecycleState.resumed && !_hasLoggedResume) {
// //       _hasLoggedResume = true;
// //       _logResumeActivity().whenComplete(() => _hasLoggedResume = false);
// //     }
// //   }

// //   // ── Firebase ──────────────────────────────────────────────────────────────
// //   Future<void> _fetchUserData() async {
// //     if (firebaseUser == null) return;
// //     try {
// //       final doc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(firebaseUser!.uid)
// //           .get();
// //       if (!mounted) return;
// //       if (doc.exists) {
// //         final d = doc.data()!;
// //         setState(() {
// //           username = d['name'] ?? "User";
// //           profileImageBase64 = d['profileImageBase64'];
// //         });
// //       }
// //     } catch (e) {
// //       debugPrint("Error fetching user data: $e");
// //     }
// //   }

// //   Future<void> _logOpenActivity() async {
// //     if (firebaseUser == null) return;
// //     try {
// //       final doc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(firebaseUser!.uid)
// //           .get();
// //       if (!doc.exists) return;
// //       final d = doc.data()!;
// //       await activityController.logActivity(
// //         userId: firebaseUser!.uid,
// //         userName: d['name'] ?? "User",
// //         action: "open_app",
// //       );
// //     } catch (e) {
// //       debugPrint("Error logging open activity: $e");
// //     }
// //   }

// //   Future<void> _logResumeActivity() async {
// //     if (firebaseUser == null) return;
// //     try {
// //       final doc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(firebaseUser!.uid)
// //           .get();
// //       if (!doc.exists) return;
// //       final d = doc.data()!;
// //       await activityController.logActivity(
// //         userId: firebaseUser!.uid,
// //         userName: d['name'] ?? "User",
// //         action: "resume_app",
// //       );
// //     } catch (e) {
// //       debugPrint("Error logging resume activity: $e");
// //     }
// //   }

// //   ImageProvider getProfileImage() {
// //     try {
// //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// //         final clean = profileImageBase64!
// //             .replaceAll('\n', '')
// //             .replaceAll(' ', '');
// //         return MemoryImage(base64Decode(clean));
// //       }
// //     } catch (e) {
// //       debugPrint("Profile image decode error: $e");
// //     }
// //     return const AssetImage("assets/images/user.png");
// //   }

// //   Future<void> handleLogout(BuildContext context) async {
// //     final ctrl = LoginController();
// //     await FirebaseAuth.instance.signOut();
// //     await ctrl.clearSharedPref();
// //     if (!context.mounted) return;
// //     Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(builder: (_) => const LoginPage()),
// //       (route) => false,
// //     );
// //   }

// //   // ── Pages ──────────────────────────────────────────────────────────────────
// //   List<Widget> _buildPages() => [
// //     _buildHomePage(),
// //     const ChatBotPage(),
// //     const EmergencyPage(),
// //     const UserProfilePage(),
// //   ];

// //   // ── Home page ──────────────────────────────────────────────────────────────
// //   Widget _buildHomePage() {
// //     return Stack(
// //       children: [
// //         const _WellnessBackground(),
// //         SafeArea(
// //           child: SingleChildScrollView(
// //             // ClampingScrollPhysics here prevents the scroll from eating
// //             // horizontal swipes that should belong to the PageView
// //             physics: const ClampingScrollPhysics(),
// //             padding: const EdgeInsets.only(bottom: 110),
// //             child: Center(
// //               child: ConstrainedBox(
// //                 constraints: const BoxConstraints(maxWidth: 1200),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // ── Header (no drawer / hamburger) ─────────────────────
// //                     _AnimatedEntrance(
// //                       delay: 0,
// //                       visible: _pageReady,
// //                       child: Padding(
// //                         padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
// //                         child: _buildHeader(),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 28),

// //                     // ── Motivation section ──────────────────────────────────
// //                     _AnimatedEntrance(
// //                       delay: 80,
// //                       visible: _pageReady,
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 24),
// //                         child: _SectionLabel(
// //                           title: "Motivation & Daily Check-in",
// //                           trailing: Row(
// //                             children: [
// //                               Text(
// //                                 "Swipe",
// //                                 style: TextStyle(
// //                                   color: _kLight,
// //                                   fontSize: 13,
// //                                   fontWeight: FontWeight.w600,
// //                                 ),
// //                               ),
// //                               const SizedBox(width: 4),
// //                               Icon(
// //                                 Icons.swipe_rounded,
// //                                 size: 16,
// //                                 color: _kLight,
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 14),
// //                     _AnimatedEntrance(
// //                       delay: 140,
// //                       visible: _pageReady,
// //                       child: _buildMotivationCardsStream(),
// //                     ),
// //                     const SizedBox(height: 24),

// //                     // ── Talk To Me card (compact, consistent style) ─────────
// //                     _AnimatedEntrance(
// //                       delay: 200,
// //                       visible: _pageReady,
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 24),
// //                         child: _TalkToMeCard(
// //                           onTap: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (_) => const ChatBotPage(),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 30),

// //                     // ── Quick access ───────────────────────────────────────
// //                     _AnimatedEntrance(
// //                       delay: 260,
// //                       visible: _pageReady,
// //                       child: const Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 24),
// //                         child: _SectionLabel(title: "Quick Access Tools"),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     _AnimatedEntrance(
// //                       delay: 320,
// //                       visible: _pageReady,
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20),
// //                         child: _buildQuickAccess(),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // ── Header — no hamburger, no drawer ──────────────────────────────────────
// //   Widget _buildHeader() {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Wrap(
// //                 crossAxisAlignment: WrapCrossAlignment.center,
// //                 spacing: 6,
// //                 children: [
// //                   const Text(
// //                     "Hello,",
// //                     style: TextStyle(
// //                       fontSize: 30,
// //                       fontWeight: FontWeight.w700,
// //                       color: _kDark,
// //                       height: 1.15,
// //                     ),
// //                   ),
// //                   Text(
// //                     username.isNotEmpty ? username : "User",
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 1,
// //                     style: const TextStyle(
// //                       fontSize: 26,
// //                       fontWeight: FontWeight.w700,
// //                       color: _kPurple,
// //                       height: 1.15,
// //                     ),
// //                   ),
// //                   const Text("👋", style: TextStyle(fontSize: 26)),
// //                 ],
// //               ),
// //               const SizedBox(height: 6),
// //               Text(
// //                 "How are you feeling today?",
// //                 style: TextStyle(
// //                   fontSize: 15,
// //                   fontWeight: FontWeight.w500,
// //                   color: _kDark.withOpacity(0.72),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const SizedBox(width: 12),
// //         // Profile avatar — tapping navigates to Profile tab (index 3)
// //         GestureDetector(
// //           onTap: () => setState(() => selectedIndex = 3),
// //           child: Stack(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.all(3),
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   gradient: LinearGradient(
// //                     colors: [
// //                       _kPurple.withOpacity(0.28),
// //                       _kPurple2.withOpacity(0.18),
// //                     ],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: _kPurple.withOpacity(0.20),
// //                       blurRadius: 22,
// //                       offset: const Offset(0, 8),
// //                     ),
// //                   ],
// //                 ),
// //                 child: CircleAvatar(
// //                   radius: 26,
// //                   backgroundImage: getProfileImage(),
// //                 ),
// //               ),
// //               Positioned(
// //                 right: 3,
// //                 bottom: 3,
// //                 child: Container(
// //                   width: 13,
// //                   height: 13,
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFF34C759),
// //                     shape: BoxShape.circle,
// //                     border: Border.all(color: _kWhite, width: 2),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: const Color(0xFF34C759).withOpacity(0.35),
// //                         blurRadius: 8,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // ── Quick access layout ────────────────────────────────────────────────────
// //   Widget _buildQuickAccess() {
// //     return LayoutBuilder(
// //       builder: (ctx, box) {
// //         final wide = box.maxWidth > 600;
// //         // Wide: 3-column grid. Narrow: structured column layout matching reference.
// //         if (wide) {
// //           return _buildQuickGrid(3);
// //         }
// //         return Column(
// //           children: [
// //             // Guide — full-width large card
// //             _QuickCard(
// //               icon: Icons.menu_book_rounded,
// //               label: "Guide",
// //               subtitle: "Spiritual wisdom & insights",
// //               colors: const [_kYellow, Color(0xFFF6C56D)],
// //               large: true,
// //               onTap: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             // Row: Relationship + Expert
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: _QuickCard(
// //                     icon: Icons.people_alt_rounded,
// //                     label: "Relationship\nAdvice",
// //                     colors: const [_kPurple2, _kPink],
// //                     onTap: () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const RelationshipAdvicePage(),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: _QuickCard(
// //                     icon: Icons.shield_rounded,
// //                     label: "Expert\nAdvice",
// //                     colors: const [Color(0xFF8ED8FF), Color(0xFF6FA8FF)],
// //                     onTap: () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 12),
// //             // Row: Exercise + Healing
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: _QuickCard(
// //                     icon: Icons.fitness_center_rounded,
// //                     label: "Exercise",
// //                     colors: const [_kMint, Color(0xFF8FD7B0)],
// //                     onTap: () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (_) => const ExercisePage()),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: _QuickCard(
// //                     icon: Icons.healing_rounded,
// //                     label: "Healing",
// //                     colors: const [_kPink, Color(0xFFF3AFC6)],
// //                     onTap: () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const StressManagementPage(),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildQuickGrid(int cols) {
// //     final items = [
// //       _GridTool(
// //         Icons.menu_book_rounded,
// //         "Guide",
// //         const [_kYellow, Color(0xFFF6C56D)],
// //         () => Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
// //         ),
// //       ),
// //       _GridTool(
// //         Icons.people_alt_rounded,
// //         "Relationship\nAdvice",
// //         const [_kPurple2, _kPink],
// //         () => Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const RelationshipAdvicePage()),
// //         ),
// //       ),
// //       _GridTool(
// //         Icons.shield_rounded,
// //         "Expert Advice",
// //         const [Color(0xFF8ED8FF), Color(0xFF6FA8FF)],
// //         () => Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// //         ),
// //       ),
// //       _GridTool(
// //         Icons.fitness_center_rounded,
// //         "Exercise",
// //         const [_kMint, Color(0xFF8FD7B0)],
// //         () => Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const ExercisePage()),
// //         ),
// //       ),
// //       _GridTool(
// //         Icons.healing_rounded,
// //         "Healing",
// //         const [_kPink, Color(0xFFF3AFC6)],
// //         () => Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const StressManagementPage()),
// //         ),
// //       ),
// //     ];
// //     return GridView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       itemCount: items.length,
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: cols,
// //         crossAxisSpacing: 12,
// //         mainAxisSpacing: 12,
// //         childAspectRatio: 0.78,
// //       ),
// //       itemBuilder: (_, i) => _PremiumToolCard(item: items[i]),
// //     );
// //   }

// //   // ── Motivation stream ──────────────────────────────────────────────────────
// //   Widget _buildMotivationCardsStream() {
// //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// //       stream: FirebaseFirestore.instance
// //           .collection('motivation_cards')
// //           .where('isActive', isEqualTo: true)
// //           .snapshots(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return _fallbackCard(
// //             text:
// //                 "Every day may not be good, but there is something good in every day.",
// //             subText: "Take a deep breath and begin gently.",
// //             emoji: "🌸",
// //             colors: const [Color(0xFF8D9BFF), Color(0xFFF4B9D2)],
// //           );
// //         }
// //         if (snapshot.hasError) {
// //           return _fallbackCard(
// //             text:
// //                 "You are stronger than you think, and brighter days are ahead.",
// //             subText: "One small positive step is enough for today.",
// //             emoji: "🙂",
// //             colors: const [Color(0xFF95A4FF), Color(0xFFDDB8FF)],
// //           );
// //         }

// //         final docs = snapshot.data?.docs.toList() ?? [];
// //         docs.sort((a, b) {
// //           final aRaw = a.data()['order'];
// //           final bRaw = b.data()['order'];
// //           final aO = aRaw is int
// //               ? aRaw
// //               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
// //           final bO = bRaw is int
// //               ? bRaw
// //               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;
// //           return aO.compareTo(bO);
// //         });

// //         if (docs.isEmpty) {
// //           return _fallbackCard(
// //             text:
// //                 "Believe in yourself. You have the power to heal, grow, and shine.",
// //             subText: "Your journey matters, even on slow days.",
// //             emoji: "💛",
// //             colors: const [Color(0xFFF8D98D), Color(0xFFF7B8C9)],
// //           );
// //         }

// //         if (_currentMotivationPage >= docs.length) {
// //           WidgetsBinding.instance.addPostFrameCallback((_) {
// //             if (mounted) setState(() => _currentMotivationPage = 0);
// //           });
// //         }

// //         return Column(
// //           children: [
// //             SizedBox(
// //               height: 210,
// //               // NotificationListener absorbs scroll notifications only for
// //               // the PageView, preventing the outer scroll from blocking swipes.
// //               child: NotificationListener<ScrollNotification>(
// //                 onNotification: (_) => false,
// //                 child: PageView.builder(
// //                   controller: _motivationPageController,
// //                   // ClampingScrollPhysics on parent + BouncingScrollPhysics
// //                   // on PageView gives the smoothest cross-axis swipe separation.
// //                   physics: const BouncingScrollPhysics(
// //                     parent: PageScrollPhysics(),
// //                   ),
// //                   itemCount: docs.length,
// //                   onPageChanged: (p) {
// //                     if (mounted) setState(() => _currentMotivationPage = p);
// //                   },
// //                   itemBuilder: (ctx, index) {
// //                     final data = docs[index].data();
// //                     final quoteText =
// //                         (data['text']?.toString().trim().isNotEmpty ?? false)
// //                         ? data['text'].toString().trim()
// //                         : "Stay strong, brighter days are ahead.";
// //                     final quoteEmoji =
// //                         (data['icon']?.toString().trim().isNotEmpty ?? false)
// //                         ? data['icon'].toString().trim()
// //                         : "🙂";
// //                     final c1 = _parseColorValue(data['color1'], 0xFF7C8CF8);
// //                     final c2 = _parseColorValue(data['color2'], 0xFFF9C5D5);

// //                     return Padding(
// //                       // Consistent padding on all cards; viewportFraction handles peeking
// //                       padding: const EdgeInsets.symmetric(horizontal: 8),
// //                       child: _MotivationCard(
// //                         text: quoteText,
// //                         subText: "Take a deep breath. You've got this.",
// //                         emoji: quoteEmoji,
// //                         colors: [Color(c1), Color(c2)],
// //                         isActive: _currentMotivationPage == index,
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             _buildPageIndicator(docs.length, _currentMotivationPage),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   int _parseColorValue(dynamic value, int fallback) {
// //     if (value is int) return value;
// //     if (value is String) {
// //       final c = value.replaceAll('#', '').trim();
// //       if (c.isEmpty) return fallback;
// //       if (c.length == 6) return int.tryParse('FF$c', radix: 16) ?? fallback;
// //       if (c.length == 8) return int.tryParse(c, radix: 16) ?? fallback;
// //     }
// //     return fallback;
// //   }

// //   Widget _fallbackCard({
// //     required String text,
// //     required String subText,
// //     required String emoji,
// //     required List<Color> colors,
// //   }) {
// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 24),
// //           child: SizedBox(
// //             height: 210,
// //             child: _MotivationCard(
// //               text: text,
// //               subText: subText,
// //               emoji: emoji,
// //               colors: colors,
// //               isActive: true,
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 12),
// //         _buildPageIndicator(1, 0),
// //       ],
// //     );
// //   }

// //   Widget _buildPageIndicator(int count, int current) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: List.generate(count, (i) {
// //         final sel = i == current;
// //         return AnimatedContainer(
// //           duration: const Duration(milliseconds: 280),
// //           curve: Curves.easeOutCubic,
// //           margin: const EdgeInsets.symmetric(horizontal: 4),
// //           height: 8,
// //           width: sel ? 24 : 8,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(999),
// //             gradient: sel
// //                 ? const LinearGradient(colors: [_kPurple, _kPurple2])
// //                 : null,
// //             color: sel ? null : Colors.white.withOpacity(0.75),
// //             boxShadow: sel
// //                 ? [
// //                     BoxShadow(
// //                       color: _kPurple.withOpacity(0.22),
// //                       blurRadius: 10,
// //                       offset: const Offset(0, 4),
// //                     ),
// //                   ]
// //                 : [],
// //           ),
// //         );
// //       }),
// //     );
// //   }

// //   // ── Scaffold ───────────────────────────────────────────────────────────────
// //   @override
// //   Widget build(BuildContext context) {
// //     final pages = _buildPages();

// //     return Theme(
// //       data: ThemeData(
// //         useMaterial3: true,
// //         scaffoldBackgroundColor: _kBg,
// //         colorScheme: ColorScheme.fromSeed(
// //           seedColor: _kPurple,
// //           brightness: Brightness.light,
// //           surface: _kBg,
// //         ),
// //         fontFamily: 'Poppins',
// //       ),
// //       child: Scaffold(
// //         key: scaffoldKey,
// //         extendBody: true,
// //         backgroundColor: _kBg,
// //         // Drawer removed — no drawer property here
// //         body: IndexedStack(index: selectedIndex, children: pages),
// //         bottomNavigationBar: SafeArea(
// //           minimum: const EdgeInsets.fromLTRB(20, 0, 20, 18),
// //           child: _FloatingBottomNav(
// //             selectedIndex: selectedIndex,
// //             onItemSelected: (i) => setState(() => selectedIndex = i),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // _showWellnessBottomSheet preserved ────────────────────────────────────────
// //   void _showWellnessBottomSheet(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       backgroundColor: Colors.transparent,
// //       builder: (sheetCtx) {
// //         return ClipRRect(
// //           borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
// //           child: BackdropFilter(
// //             filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
// //             child: Container(
// //               padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.88),
// //                 borderRadius: const BorderRadius.vertical(
// //                   top: Radius.circular(32),
// //                 ),
// //               ),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     "Wellness Hub Options",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w700,
// //                       color: _kDark,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Wrap(
// //                     spacing: 16,
// //                     runSpacing: 16,
// //                     children: [
// //                       SizedBox(
// //                         width: 120,
// //                         child: _MiniAction(
// //                           icon: Icons.fitness_center_rounded,
// //                           label: "Exercise",
// //                           colors: const [_kMint, Color(0xFF8FD7B0)],
// //                           onTap: () {
// //                             Navigator.pop(sheetCtx);
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (_) => const ExercisePage(),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                       SizedBox(
// //                         width: 120,
// //                         child: _MiniAction(
// //                           icon: Icons.healing_rounded,
// //                           label: "Healing",
// //                           colors: const [_kPurple2, _kPink],
// //                           onTap: () {
// //                             Navigator.pop(sheetCtx);
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (_) => const StressManagementPage(),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // // ─── Animated entrance ────────────────────────────────────────────────────────
// // class _AnimatedEntrance extends StatelessWidget {
// //   final Widget child;
// //   final bool visible;
// //   final int delay;

// //   const _AnimatedEntrance({
// //     required this.child,
// //     required this.visible,
// //     required this.delay,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return TweenAnimationBuilder<double>(
// //       tween: Tween(begin: 0, end: visible ? 1.0 : 0.0),
// //       duration: Duration(milliseconds: 420 + delay),
// //       curve: Curves.easeOutCubic,
// //       builder: (_, v, c) => Transform.translate(
// //         offset: Offset(0, (1 - v) * 26),
// //         child: Opacity(opacity: v.clamp(0, 1), child: c),
// //       ),
// //       child: child,
// //     );
// //   }
// // }

// // // ─── Wellness Background ──────────────────────────────────────────────────────
// // class _WellnessBackground extends StatelessWidget {
// //   const _WellnessBackground();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Color(0xFFFCFBF8), Color(0xFFF7F4FD), Color(0xFFF5FBFF)],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //         Positioned(
// //           top: -55,
// //           right: -45,
// //           child: _Blob(180, [
// //             _kPurple.withOpacity(0.30),
// //             _kPurple2.withOpacity(0.18),
// //           ]),
// //         ),
// //         Positioned(
// //           top: 170,
// //           left: -65,
// //           child: _Blob(175, [
// //             _kPink.withOpacity(0.34),
// //             _kYellow.withOpacity(0.18),
// //           ]),
// //         ),
// //         Positioned(
// //           bottom: 190,
// //           right: -35,
// //           child: _Blob(150, [
// //             _kMint.withOpacity(0.34),
// //             _kPurple.withOpacity(0.14),
// //           ]),
// //         ),
// //         Positioned(
// //           top: 340,
// //           left: 32,
// //           child: _Blob(60, [
// //             Colors.white.withOpacity(0.48),
// //             Colors.white.withOpacity(0.20),
// //           ]),
// //         ),
// //         Positioned(
// //           top: 110,
// //           right: 40,
// //           child: _Blob(50, [
// //             Colors.white.withOpacity(0.38),
// //             Colors.white.withOpacity(0.16),
// //           ]),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _Blob extends StatelessWidget {
// //   final double size;
// //   final List<Color> colors;
// //   const _Blob(this.size, this.colors);

// //   @override
// //   Widget build(BuildContext context) => Container(
// //     width: size,
// //     height: size,
// //     decoration: BoxDecoration(
// //       shape: BoxShape.circle,
// //       gradient: LinearGradient(
// //         colors: colors,
// //         begin: Alignment.topLeft,
// //         end: Alignment.bottomRight,
// //       ),
// //     ),
// //   );
// // }

// // // ─── Section label ────────────────────────────────────────────────────────────
// // class _SectionLabel extends StatelessWidget {
// //   final String title;
// //   final Widget? trailing;
// //   const _SectionLabel({required this.title, this.trailing});

// //   @override
// //   Widget build(BuildContext context) => Row(
// //     children: [
// //       Expanded(
// //         child: Text(
// //           title,
// //           style: const TextStyle(
// //             fontSize: 17,
// //             fontWeight: FontWeight.w700,
// //             color: _kDark,
// //           ),
// //         ),
// //       ),
// //       if (trailing != null) trailing!,
// //     ],
// //   );
// // }

// // // ─── Talk To Me card (compact, card-style) ────────────────────────────────────
// // class _TalkToMeCard extends StatefulWidget {
// //   final VoidCallback onTap;
// //   const _TalkToMeCard({required this.onTap});

// //   @override
// //   State<_TalkToMeCard> createState() => _TalkToMeCardState();
// // }

// // class _TalkToMeCardState extends State<_TalkToMeCard> {
// //   bool _pressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedScale(
// //       scale: _pressed ? 0.97 : 1.0,
// //       duration: const Duration(milliseconds: 140),
// //       child: GestureDetector(
// //         onTapDown: (_) => setState(() => _pressed = true),
// //         onTapCancel: () => setState(() => _pressed = false),
// //         onTapUp: (_) => setState(() => _pressed = false),
// //         onTap: widget.onTap,
// //         child: Container(
// //           width: double.infinity,
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(28),
// //             color: Colors.white.withOpacity(0.72),
// //             border: Border.all(color: Colors.white.withOpacity(0.80)),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: _kPurple.withOpacity(0.14),
// //                 blurRadius: 20,
// //                 offset: const Offset(0, 8),
// //               ),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               Container(
// //                 width: 54,
// //                 height: 54,
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   gradient: const LinearGradient(
// //                     colors: [_kPurple, _kPurple2],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: _kPurple.withOpacity(0.28),
// //                       blurRadius: 14,
// //                       offset: const Offset(0, 6),
// //                     ),
// //                   ],
// //                 ),
// //                 child: const Icon(
// //                   Icons.chat_bubble_rounded,
// //                   color: _kWhite,
// //                   size: 26,
// //                 ),
// //               ),
// //               const SizedBox(width: 16),
// //               const Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Talk to Me",
// //                       style: TextStyle(
// //                         color: _kDark,
// //                         fontSize: 17,
// //                         fontWeight: FontWeight.w700,
// //                       ),
// //                     ),
// //                     SizedBox(height: 4),
// //                     Text(
// //                       "Start a supportive conversation.",
// //                       style: TextStyle(
// //                         color: _kLight,
// //                         fontSize: 13,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 width: 36,
// //                 height: 36,
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   color: _kPurple.withOpacity(0.10),
// //                 ),
// //                 child: const Icon(
// //                   Icons.arrow_forward_rounded,
// //                   color: _kPurple,
// //                   size: 18,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Quick access card — mobile layout ───────────────────────────────────────
// // class _QuickCard extends StatefulWidget {
// //   final IconData icon;
// //   final String label;
// //   final String? subtitle;
// //   final List<Color> colors;
// //   final bool large;
// //   final VoidCallback onTap;

// //   const _QuickCard({
// //     required this.icon,
// //     required this.label,
// //     required this.colors,
// //     required this.onTap,
// //     this.subtitle,
// //     this.large = false,
// //   });

// //   @override
// //   State<_QuickCard> createState() => _QuickCardState();
// // }

// // class _QuickCardState extends State<_QuickCard> {
// //   bool _pressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedScale(
// //       scale: _pressed ? 0.97 : 1.0,
// //       duration: const Duration(milliseconds: 130),
// //       child: GestureDetector(
// //         onTapDown: (_) => setState(() => _pressed = true),
// //         onTapCancel: () => setState(() => _pressed = false),
// //         onTapUp: (_) => setState(() => _pressed = false),
// //         onTap: widget.onTap,
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 200),
// //           height: widget.large ? 130 : 120,
// //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(28),
// //             color: Colors.white.withOpacity(0.68),
// //             border: Border.all(color: Colors.white.withOpacity(0.75)),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: widget.colors.first.withOpacity(_pressed ? 0.14 : 0.18),
// //                 blurRadius: _pressed ? 12 : 20,
// //                 offset: Offset(0, _pressed ? 4 : 10),
// //               ),
// //             ],
// //           ),
// //           child: widget.large
// //               // Large card: horizontal layout
// //               ? Row(
// //                   children: [
// //                     Container(
// //                       width: 60,
// //                       height: 60,
// //                       decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         gradient: LinearGradient(
// //                           colors: widget.colors,
// //                           begin: Alignment.topLeft,
// //                           end: Alignment.bottomRight,
// //                         ),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: widget.colors.first.withOpacity(0.30),
// //                             blurRadius: 14,
// //                             offset: const Offset(0, 6),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Icon(widget.icon, color: _kWhite, size: 28),
// //                     ),
// //                     const SizedBox(width: 16),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Text(
// //                             widget.label,
// //                             style: const TextStyle(
// //                               color: _kDark,
// //                               fontSize: 17,
// //                               fontWeight: FontWeight.w700,
// //                             ),
// //                           ),
// //                           if (widget.subtitle != null) ...[
// //                             const SizedBox(height: 4),
// //                             Text(
// //                               widget.subtitle!,
// //                               style: TextStyle(color: _kLight, fontSize: 13),
// //                             ),
// //                           ],
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                       width: 34,
// //                       height: 34,
// //                       decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: widget.colors.first.withOpacity(0.14),
// //                       ),
// //                       child: Icon(
// //                         Icons.arrow_forward_rounded,
// //                         color: widget.colors.first,
// //                         size: 17,
// //                       ),
// //                     ),
// //                   ],
// //                 )
// //               // Small card: vertical layout
// //               : Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Container(
// //                       width: 52,
// //                       height: 52,
// //                       decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         gradient: LinearGradient(
// //                           colors: widget.colors,
// //                           begin: Alignment.topLeft,
// //                           end: Alignment.bottomRight,
// //                         ),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: widget.colors.first.withOpacity(0.28),
// //                             blurRadius: 14,
// //                             offset: const Offset(0, 6),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Icon(widget.icon, color: _kWhite, size: 24),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     Text(
// //                       widget.label,
// //                       textAlign: TextAlign.center,
// //                       maxLines: 2,
// //                       overflow: TextOverflow.ellipsis,
// //                       style: const TextStyle(
// //                         color: _kDark,
// //                         fontWeight: FontWeight.w600,
// //                         fontSize: 12.5,
// //                         height: 1.25,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Grid tool model + card (tablet / desktop) ────────────────────────────────
// // class _GridTool {
// //   final IconData icon;
// //   final String label;
// //   final List<Color> colors;
// //   final VoidCallback onTap;
// //   const _GridTool(this.icon, this.label, this.colors, this.onTap);
// // }

// // class _PremiumToolCard extends StatefulWidget {
// //   final _GridTool item;
// //   const _PremiumToolCard({required this.item});

// //   @override
// //   State<_PremiumToolCard> createState() => _PremiumToolCardState();
// // }

// // class _PremiumToolCardState extends State<_PremiumToolCard> {
// //   bool _pressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedScale(
// //       scale: _pressed ? 0.97 : 1.0,
// //       duration: const Duration(milliseconds: 130),
// //       curve: Curves.easeOut,
// //       child: GestureDetector(
// //         onTapDown: (_) => setState(() => _pressed = true),
// //         onTapUp: (_) => setState(() => _pressed = false),
// //         onTapCancel: () => setState(() => _pressed = false),
// //         onTap: widget.item.onTap,
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 200),
// //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(24),
// //             color: Colors.white.withOpacity(0.65),
// //             border: Border.all(color: Colors.white.withOpacity(0.75)),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: widget.item.colors.first.withOpacity(
// //                   _pressed ? 0.12 : 0.18,
// //                 ),
// //                 blurRadius: _pressed ? 12 : 20,
// //                 offset: Offset(0, _pressed ? 4 : 10),
// //               ),
// //             ],
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Container(
// //                 width: 56,
// //                 height: 56,
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   gradient: LinearGradient(
// //                     colors: widget.item.colors,
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: widget.item.colors.first.withOpacity(0.26),
// //                       blurRadius: 16,
// //                       offset: const Offset(0, 6),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Icon(widget.item.icon, color: _kWhite, size: 26),
// //               ),
// //               const SizedBox(height: 12),
// //               Text(
// //                 widget.item.label,
// //                 textAlign: TextAlign.center,
// //                 maxLines: 2,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: const TextStyle(
// //                   color: _kDark,
// //                   fontWeight: FontWeight.w600,
// //                   fontSize: 12.5,
// //                   height: 1.25,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Motivation Card ──────────────────────────────────────────────────────────
// // class _MotivationCard extends StatelessWidget {
// //   final String text;
// //   final String subText;
// //   final String emoji;
// //   final List<Color> colors;
// //   final bool isActive;

// //   const _MotivationCard({
// //     required this.text,
// //     required this.subText,
// //     required this.emoji,
// //     required this.colors,
// //     required this.isActive,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedScale(
// //       scale: isActive ? 1.0 : 0.97,
// //       duration: const Duration(milliseconds: 280),
// //       curve: Curves.easeOutCubic,
// //       child: Container(
// //         width: double.infinity,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(28),
// //           gradient: LinearGradient(
// //             colors: [
// //               colors.first.withOpacity(0.97),
// //               colors.last.withOpacity(0.95),
// //             ],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //           boxShadow: [
// //             BoxShadow(
// //               color: colors.first.withOpacity(0.25),
// //               blurRadius: 28,
// //               offset: const Offset(0, 14),
// //             ),
// //           ],
// //         ),
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.circular(28),
// //           child: Stack(
// //             children: [
// //               // Decorative circles
// //               Positioned(
// //                 top: -18,
// //                 right: -10,
// //                 child: _Circle(104, Colors.white.withOpacity(0.13)),
// //               ),
// //               Positioned(
// //                 bottom: 10,
// //                 right: 16,
// //                 child: _Circle(72, Colors.white.withOpacity(0.16)),
// //               ),
// //               Positioned(
// //                 left: -20,
// //                 bottom: -32,
// //                 child: Container(
// //                   width: 170,
// //                   height: 70,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(90),
// //                     color: Colors.white.withOpacity(0.11),
// //                   ),
// //                 ),
// //               ),
// //               // Content
// //               Padding(
// //                 padding: const EdgeInsets.all(22),
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Text(
// //                             text,
// //                             maxLines: 3,
// //                             overflow: TextOverflow.ellipsis,
// //                             style: const TextStyle(
// //                               fontSize: 20,
// //                               height: 1.28,
// //                               fontWeight: FontWeight.w700,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 10),
// //                           Text(
// //                             subText,
// //                             maxLines: 2,
// //                             overflow: TextOverflow.ellipsis,
// //                             style: TextStyle(
// //                               color: Colors.white.withOpacity(0.88),
// //                               fontSize: 13.5,
// //                               fontWeight: FontWeight.w500,
// //                               height: 1.35,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(width: 14),
// //                     Container(
// //                       width: 68,
// //                       height: 68,
// //                       decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: Colors.white.withOpacity(0.22),
// //                         border: Border.all(
// //                           color: Colors.white.withOpacity(0.28),
// //                         ),
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           emoji,
// //                           style: const TextStyle(fontSize: 34),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _Circle extends StatelessWidget {
// //   final double size;
// //   final Color color;
// //   const _Circle(this.size, this.color);

// //   @override
// //   Widget build(BuildContext context) => Container(
// //     width: size,
// //     height: size,
// //     decoration: BoxDecoration(shape: BoxShape.circle, color: color),
// //   );
// // }

// // // ─── Floating Bottom Nav (preserved, visual-only improvement) ─────────────────
// // class _FloatingBottomNav extends StatelessWidget {
// //   final int selectedIndex;
// //   final ValueChanged<int> onItemSelected;

// //   const _FloatingBottomNav({
// //     required this.selectedIndex,
// //     required this.onItemSelected,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 78,
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(28),
// //         child: BackdropFilter(
// //           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
// //           child: Container(
// //             height: 72,
// //             padding: const EdgeInsets.symmetric(horizontal: 12),
// //             decoration: BoxDecoration(
// //               color: Colors.white.withOpacity(0.84),
// //               borderRadius: BorderRadius.circular(28),
// //               border: Border.all(color: Colors.white.withOpacity(0.70)),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: _kPurple.withOpacity(0.12),
// //                   blurRadius: 28,
// //                   offset: const Offset(0, 14),
// //                 ),
// //               ],
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 Expanded(
// //                   child: _NavItem(
// //                     icon: Icons.home_rounded,
// //                     label: "Home",
// //                     isSelected: selectedIndex == 0,
// //                     onTap: () => onItemSelected(0),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: _NavItem(
// //                     icon: Icons.chat_bubble_rounded,
// //                     label: "Chat",
// //                     isSelected: selectedIndex == 1,
// //                     onTap: () => onItemSelected(1),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: _NavItem(
// //                     icon: Icons.warning_rounded,
// //                     label: "Emergency",
// //                     isSelected: selectedIndex == 2,
// //                     onTap: () => onItemSelected(2),
// //                     selectedColor: _kRed,
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: _NavItem(
// //                     icon: Icons.person_rounded,
// //                     label: "Profile",
// //                     isSelected: selectedIndex == 3,
// //                     onTap: () => onItemSelected(3),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _NavItem extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final bool isSelected;
// //   final VoidCallback onTap;
// //   final Color selectedColor;

// //   const _NavItem({
// //     required this.icon,
// //     required this.label,
// //     required this.isSelected,
// //     required this.onTap,
// //     this.selectedColor = _kPurple,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final color = isSelected ? selectedColor : _kLight;

// //     return InkWell(
// //       onTap: onTap,
// //       borderRadius: BorderRadius.circular(18),
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, color: color, size: isSelected ? 26 : 23),
// //             const SizedBox(height: 3),
// //             Text(
// //               label,
// //               style: TextStyle(
// //                 color: color,
// //                 fontSize: 10.5,
// //                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
// //               ),
// //             ),
// //             const SizedBox(height: 4),
// //             AnimatedContainer(
// //               duration: const Duration(milliseconds: 260),
// //               width: isSelected ? 18 : 0,
// //               height: 4,
// //               decoration: BoxDecoration(
// //                 color: selectedColor,
// //                 borderRadius: BorderRadius.circular(999),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ─── Mini action (for bottom sheet) ──────────────────────────────────────────
// // class _MiniAction extends StatefulWidget {
// //   final IconData icon;
// //   final String label;
// //   final List<Color> colors;
// //   final VoidCallback onTap;

// //   const _MiniAction({
// //     required this.icon,
// //     required this.label,
// //     required this.colors,
// //     required this.onTap,
// //   });

// //   @override
// //   State<_MiniAction> createState() => _MiniActionState();
// // }

// // class _MiniActionState extends State<_MiniAction> {
// //   bool _pressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedScale(
// //       scale: _pressed ? 0.97 : 1.0,
// //       duration: const Duration(milliseconds: 120),
// //       child: GestureDetector(
// //         onTapDown: (_) => setState(() => _pressed = true),
// //         onTapCancel: () => setState(() => _pressed = false),
// //         onTapUp: (_) => setState(() => _pressed = false),
// //         onTap: widget.onTap,
// //         child: Container(
// //           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(22),
// //             color: Colors.white.withOpacity(0.65),
// //             border: Border.all(color: Colors.white.withOpacity(0.72)),
// //           ),
// //           child: Column(
// //             children: [
// //               Container(
// //                 width: 52,
// //                 height: 52,
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   gradient: LinearGradient(colors: widget.colors),
// //                 ),
// //                 child: Icon(widget.icon, color: _kWhite),
// //               ),
// //               const SizedBox(height: 10),
// //               Text(
// //                 widget.label,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   color: _kDark,
// //                   fontWeight: FontWeight.w600,
// //                   fontSize: 13,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/ActivityController.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// import 'package:mentalwellapp/view/USER/exercise_page.dart';
// import 'package:mentalwellapp/view/USER/expert_advice.dart';
// import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // ─── Design tokens (updated to match reference) ───────────────────────────────
// // const _kBg = Color(0xFFF2F3FA); // Soft lavender-white background
// const _kBg = Color(0xFFF6EEE3);
// const _kPurple = Color(0xFF6C63FF); // Primary purple (reference)
// const _kPurple2 = Color(0xFF9B8FFF); // Lighter purple
// const _kPink = Color(0xFFFFD6CC); // Soft peach/pink card
// const _kMint = Color(0xFFD4F0E0); // Soft mint/green card
// const _kYellow = Color(0xFFFFF3CC); // Soft yellow/gold card
// const _kLavender = Color(0xFFE8E4FF); // Soft lavender card
// const _kBlueCard = Color(0xFFD6EEFF); // Soft blue card
// const _kDark = Color(0xFF2D2B5A); // Deep navy text
// const _kLight = Color(0xFF9898B0); // Muted grey text
// const _kRed = Color(0xFFFF4D4D);
// const _kWhite = Colors.white;

// // ─────────────────────────────────────────────────────────────────────────────
// class UserHomeWrapper extends StatefulWidget {
//   const UserHomeWrapper({super.key});

//   @override
//   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// }

// class _UserHomeWrapperState extends State<UserHomeWrapper>
//     with WidgetsBindingObserver {
//   // ── State ─────────────────────────────────────────────────────────────────
//   User? firebaseUser;
//   String username = "";
//   String? profileImageBase64;
//   int selectedIndex = 0;
//   bool _hasLoggedResume = false;
//   bool _pageReady = false;

//   final ActivityController activityController = ActivityController();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   late final PageController _motivationPageController = PageController(
//     viewportFraction: 0.88,
//   );
//   int _currentMotivationPage = 0;

//   // ── Lifecycle ─────────────────────────────────────────────────────────────
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     firebaseUser = FirebaseAuth.instance.currentUser;
//     _fetchUserData();
//     _logOpenActivity();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) setState(() => _pageReady = true);
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _motivationPageController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed && !_hasLoggedResume) {
//       _hasLoggedResume = true;
//       _logResumeActivity().whenComplete(() => _hasLoggedResume = false);
//     }
//   }

//   // ── Firebase (unchanged) ──────────────────────────────────────────────────
//   Future<void> _fetchUserData() async {
//     if (firebaseUser == null) return;
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser!.uid)
//           .get();
//       if (!mounted) return;
//       if (doc.exists) {
//         final d = doc.data()!;
//         setState(() {
//           username = d['name'] ?? "User";
//           profileImageBase64 = d['profileImageBase64'];
//         });
//       }
//     } catch (e) {
//       debugPrint("Error fetching user data: $e");
//     }
//   }

//   Future<void> _logOpenActivity() async {
//     if (firebaseUser == null) return;
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser!.uid)
//           .get();
//       if (!doc.exists) return;
//       final d = doc.data()!;
//       await activityController.logActivity(
//         userId: firebaseUser!.uid,
//         userName: d['name'] ?? "User",
//         action: "open_app",
//       );
//     } catch (e) {
//       debugPrint("Error logging open activity: $e");
//     }
//   }

//   Future<void> _logResumeActivity() async {
//     if (firebaseUser == null) return;
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser!.uid)
//           .get();
//       if (!doc.exists) return;
//       final d = doc.data()!;
//       await activityController.logActivity(
//         userId: firebaseUser!.uid,
//         userName: d['name'] ?? "User",
//         action: "resume_app",
//       );
//     } catch (e) {
//       debugPrint("Error logging resume activity: $e");
//     }
//   }

//   ImageProvider getProfileImage() {
//     try {
//       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
//         final clean = profileImageBase64!
//             .replaceAll('\n', '')
//             .replaceAll(' ', '');
//         return MemoryImage(base64Decode(clean));
//       }
//     } catch (e) {
//       debugPrint("Profile image decode error: $e");
//     }
//     return const AssetImage("assets/default_profile.jpg");
//   }

//   Future<void> handleLogout(BuildContext context) async {
//     final ctrl = LoginController();
//     await FirebaseAuth.instance.signOut();
//     await ctrl.clearSharedPref();
//     if (!context.mounted) return;
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginPage()),
//       (route) => false,
//     );
//   }

//   // ── Pages (unchanged) ─────────────────────────────────────────────────────
//   List<Widget> _buildPages() => [
//     _buildHomePage(),
//     const ChatBotPage(),
//     const EmergencyPage(),
//     const UserProfilePage(),
//   ];

//   // ── Home page (redesigned) ────────────────────────────────────────────────
//   Widget _buildHomePage() {
//     return Stack(
//       children: [
//         const _WellnessBackground(),
//         SafeArea(
//           child: SingleChildScrollView(
//             physics: const ClampingScrollPhysics(),
//             padding: const EdgeInsets.only(bottom: 110),
//             child: Center(
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 1200),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // ── Header ─────────────────────────────────────────────
//                     _AnimatedEntrance(
//                       delay: 0,
//                       visible: _pageReady,
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
//                         child: _buildHeader(),
//                       ),
//                     ),
//                     const SizedBox(height: 24),

//                     // ── Talk To Me card ────────────────────────────────────
//                     _AnimatedEntrance(
//                       delay: 80,
//                       visible: _pageReady,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: _TalkToMeCard(
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const ChatBotPage(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 28),

//                     // ── Motivation section ─────────────────────────────────
//                     _AnimatedEntrance(
//                       delay: 140,
//                       visible: _pageReady,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: _buildMotivationHeader(),
//                       ),
//                     ),
//                     const SizedBox(height: 14),
//                     _AnimatedEntrance(
//                       delay: 200,
//                       visible: _pageReady,
//                       child: _buildMotivationCardsStream(),
//                     ),
//                     const SizedBox(height: 28),

//                     // ── Quick Access Tools ─────────────────────────────────
//                     _AnimatedEntrance(
//                       delay: 260,
//                       visible: _pageReady,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: _buildQuickAccessHeader(),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     _AnimatedEntrance(
//                       delay: 320,
//                       visible: _pageReady,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: _buildQuickAccess(),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ── Motivation section label with counter ──────────────────────────────────
//   Widget _buildMotivationHeader() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance
//           .collection('motivation_cards')
//           .where('isActive', isEqualTo: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         final count = snapshot.data?.docs.length ?? 0;
//         return Row(
//           children: [
//             const Text("✦", style: TextStyle(color: _kPurple, fontSize: 18)),
//             const SizedBox(width: 8),
//             const Text(
//               "Motivation for You",
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.w700,
//                 color: _kDark,
//               ),
//             ),
//             const Spacer(),
//             if (count > 0)
//               Text(
//                 "${_currentMotivationPage + 1} / $count",
//                 style: const TextStyle(
//                   color: _kLight,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }

//   // ── Quick Access header ────────────────────────────────────────────────────
//   Widget _buildQuickAccessHeader() {
//     return Row(
//       children: const [
//         Text("✦", style: TextStyle(color: _kPurple, fontSize: 18)),
//         SizedBox(width: 8),
//         Text(
//           "Quick Access Tools",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w700,
//             color: _kDark,
//           ),
//         ),
//       ],
//     );
//   }

//   // ── Header ────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Wrap(
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 spacing: 4,
//                 children: [
//                   Text(
//                     "Hello, ${username.isNotEmpty ? username : 'User'}! 👋",
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: const TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w800,
//                       color: _kDark,
//                       height: 1.15,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 "How are you feeling today?",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                   color: _kDark.withOpacity(0.55),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 12),
//         // Profile avatar
//         GestureDetector(
//           onTap: () => setState(() => selectedIndex = 3),
//           child: Container(
//             padding: const EdgeInsets.all(3),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: _kPurple.withOpacity(0.18),
//                   blurRadius: 18,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//             child: CircleAvatar(radius: 28, backgroundImage: getProfileImage()),
//           ),
//         ),
//       ],
//     );
//   }

//   // ── Quick access layout (matches reference) ────────────────────────────────
//   Widget _buildQuickAccess() {
//     return LayoutBuilder(
//       builder: (ctx, box) {
//         final wide = box.maxWidth > 600;
//         if (wide) {
//           return _buildQuickGrid(3);
//         }
//         return Column(
//           children: [
//             // Guide — full-width large card (soft green)
//             _ReferenceQuickCard(
//               icon: Icons.menu_book_rounded,
//               label: "Guide",
//               subtitle: "Spiritual wisdom & insights",
//               bgColor: const Color.fromARGB(255, 139, 219, 148),
//               iconBg: const Color.fromARGB(255, 41, 97, 73),
//               arrowColor: const Color(0xFF4CAF84),
//               large: true,
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
//               ),
//             ),
//             const SizedBox(height: 12),
//             // Row: Relationship + Expert
//             Row(
//               children: [
//                 Expanded(
//                   child: _ReferenceQuickCard(
//                     icon: Icons.people_alt_rounded,
//                     label: "Relationship\nAdvice",
//                     bgColor: const Color.fromARGB(255, 239, 207, 197),
//                     iconBg: const Color(0xFFFF7043),
//                     arrowColor: const Color(0xFFFF7043),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const RelationshipAdvicePage(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: _ReferenceQuickCard(
//                     icon: Icons.shield_rounded,
//                     label: "Expert\nAdvice",
//                     bgColor: const Color.fromARGB(255, 210, 204, 243),
//                     iconBg: const Color(0xFF6C63FF),
//                     arrowColor: const Color(0xFF6C63FF),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             // Row: Exercise + Healing
//             Row(
//               children: [
//                 Expanded(
//                   child: _ReferenceQuickCard(
//                     icon: Icons.fitness_center_rounded,
//                     label: "Exercise",
//                     subtitle: "Body & mind fitness",
//                     bgColor: const Color.fromARGB(255, 139, 219, 148),
//                     iconBg: const Color.fromARGB(255, 41, 97, 73),
//                     arrowColor: const Color(0xFF4CAF84),

//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => const ExercisePage()),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: _ReferenceQuickCard(
//                     icon: Icons.spa_rounded,
//                     label: "Healing",
//                     subtitle: "Inner peace & recovery",
//                     bgColor: const Color.fromARGB(255, 248, 233, 185),
//                     iconBg: const Color.fromARGB(255, 230, 156, 28),
//                     arrowColor: const Color(0xFFE8A020),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const StressManagementPage(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildQuickGrid(int cols) {
//     final items = [
//       _GridTool(
//         Icons.menu_book_rounded,
//         "Guide",
//         const [Color(0xFF4CAF84), Color(0xFF81C784)],
//         () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
//         ),
//       ),
//       _GridTool(
//         Icons.people_alt_rounded,
//         "Relationship\nAdvice",
//         const [Color(0xFFFF7043), Color(0xFFFF8A65)],
//         () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const RelationshipAdvicePage()),
//         ),
//       ),
//       _GridTool(
//         Icons.shield_rounded,
//         "Expert Advice",
//         const [Color(0xFF6C63FF), Color(0xFF9B8FFF)],
//         () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
//         ),
//       ),
//       _GridTool(
//         Icons.fitness_center_rounded,
//         "Exercise",
//         const [Color(0xFF4A90D9), Color(0xFF64B5F6)],
//         () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const ExercisePage()),
//         ),
//       ),
//       _GridTool(
//         Icons.spa_rounded,
//         "Healing",
//         const [Color(0xFFE8A020), Color(0xFFFFB74D)],
//         () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const StressManagementPage()),
//         ),
//       ),
//     ];
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: cols,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         childAspectRatio: 0.78,
//       ),
//       itemBuilder: (_, i) => _PremiumToolCard(item: items[i]),
//     );
//   }

//   // ── Motivation stream (unchanged logic, improved UI) ───────────────────────
//   Widget _buildMotivationCardsStream() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance
//           .collection('motivation_cards')
//           .where('isActive', isEqualTo: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return _fallbackCard(
//             text:
//                 "Every day may not be good, but there is something good in every day.",
//             subText: "Take a deep breath and begin gently.",
//             emoji: "🌸",
//             colors: const [Color(0xFF8D6FFF), Color(0xFFB06FFF)],
//           );
//         }
//         if (snapshot.hasError) {
//           return _fallbackCard(
//             text:
//                 "You are stronger than you think, and brighter days are ahead.",
//             subText: "One small positive step is enough for today.",
//             emoji: "🙂",
//             colors: const [Color(0xFF6C63FF), Color(0xFF9B8FFF)],
//           );
//         }

//         final docs = snapshot.data?.docs.toList() ?? [];
//         docs.sort((a, b) {
//           final aRaw = a.data()['order'];
//           final bRaw = b.data()['order'];
//           final aO = aRaw is int
//               ? aRaw
//               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
//           final bO = bRaw is int
//               ? bRaw
//               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;
//           return aO.compareTo(bO);
//         });

//         if (docs.isEmpty) {
//           return _fallbackCard(
//             text:
//                 "Believe in yourself. You have the power to heal, grow, and shine.",
//             subText: "Your journey matters, even on slow days.",
//             emoji: "💛",
//             colors: const [Color(0xFF7C6FFF), Color(0xFFB06FFF)],
//           );
//         }

//         if (_currentMotivationPage >= docs.length) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (mounted) setState(() => _currentMotivationPage = 0);
//           });
//         }

//         return Column(
//           children: [
//             SizedBox(
//               height: 220,
//               child: NotificationListener<ScrollNotification>(
//                 onNotification: (_) => false,
//                 child: PageView.builder(
//                   controller: _motivationPageController,
//                   physics: const BouncingScrollPhysics(
//                     parent: PageScrollPhysics(),
//                   ),
//                   itemCount: docs.length,
//                   onPageChanged: (p) {
//                     if (mounted) setState(() => _currentMotivationPage = p);
//                   },
//                   itemBuilder: (ctx, index) {
//                     final data = docs[index].data();
//                     final quoteText =
//                         (data['text']?.toString().trim().isNotEmpty ?? false)
//                         ? data['text'].toString().trim()
//                         : "Stay strong, brighter days are ahead.";
//                     final quoteEmoji =
//                         (data['icon']?.toString().trim().isNotEmpty ?? false)
//                         ? data['icon'].toString().trim()
//                         : "🙂";
//                     final c1 = _parseColorValue(data['color1'], 0xFF8D6FFF);
//                     final c2 = _parseColorValue(data['color2'], 0xFFB86FFF);

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: _MotivationCard(
//                         text: quoteText,
//                         subText: "Take a deep breath. You've got this.",
//                         emoji: quoteEmoji,
//                         colors: [Color(c1), Color(c2)],
//                         isActive: _currentMotivationPage == index,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 14),
//             _buildPageIndicator(docs.length, _currentMotivationPage),
//           ],
//         );
//       },
//     );
//   }

//   int _parseColorValue(dynamic value, int fallback) {
//     if (value is int) return value;
//     if (value is String) {
//       final c = value.replaceAll('#', '').trim();
//       if (c.isEmpty) return fallback;
//       if (c.length == 6) return int.tryParse('FF$c', radix: 16) ?? fallback;
//       if (c.length == 8) return int.tryParse(c, radix: 16) ?? fallback;
//     }
//     return fallback;
//   }

//   Widget _fallbackCard({
//     required String text,
//     required String subText,
//     required String emoji,
//     required List<Color> colors,
//   }) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SizedBox(
//             height: 220,
//             child: _MotivationCard(
//               text: text,
//               subText: subText,
//               emoji: emoji,
//               colors: colors,
//               isActive: true,
//             ),
//           ),
//         ),
//         const SizedBox(height: 14),
//         _buildPageIndicator(1, 0),
//       ],
//     );
//   }

//   // ── Page indicator (matches reference — dot style) ─────────────────────────
//   Widget _buildPageIndicator(int count, int current) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(count, (i) {
//         final sel = i == current;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 280),
//           curve: Curves.easeOutCubic,
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           height: 8,
//           width: sel ? 22 : 8,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(999),
//             color: sel ? _kPurple : const Color(0xFFD4D4E8),
//           ),
//         );
//       }),
//     );
//   }

//   // ── Scaffold ───────────────────────────────────────────────────────────────
//   @override
//   Widget build(BuildContext context) {
//     final pages = _buildPages();

//     return Theme(
//       data: ThemeData(
//         useMaterial3: true,
//         scaffoldBackgroundColor: _kBg,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: _kPurple,
//           brightness: Brightness.light,
//           surface: _kBg,
//         ),
//         fontFamily: 'Poppins',
//       ),
//       child: Scaffold(
//         key: scaffoldKey,
//         extendBody: true,
//         backgroundColor: _kBg,
//         body: IndexedStack(index: selectedIndex, children: pages),
//         bottomNavigationBar: SafeArea(
//           minimum: const EdgeInsets.fromLTRB(20, 0, 20, 16),
//           child: _FloatingBottomNav(
//             selectedIndex: selectedIndex,
//             onItemSelected: (i) => setState(() => selectedIndex = i),
//           ),
//         ),
//       ),
//     );
//   }

//   // _showWellnessBottomSheet preserved ────────────────────────────────────────
//   void _showWellnessBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (sheetCtx) {
//         return ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.88),
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(32),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Wellness Hub Options",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: _kDark,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Wrap(
//                     spacing: 16,
//                     runSpacing: 16,
//                     children: [
//                       SizedBox(
//                         width: 120,
//                         child: _MiniAction(
//                           icon: Icons.fitness_center_rounded,
//                           label: "Exercise",
//                           colors: const [Color(0xFF4A90D9), Color(0xFF64B5F6)],
//                           onTap: () {
//                             Navigator.pop(sheetCtx);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => const ExercisePage(),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         width: 120,
//                         child: _MiniAction(
//                           icon: Icons.spa_rounded,
//                           label: "Healing",
//                           colors: const [Color(0xFFE8A020), Color(0xFFFFB74D)],
//                           onTap: () {
//                             Navigator.pop(sheetCtx);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => const StressManagementPage(),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // ─── Animated entrance (unchanged) ───────────────────────────────────────────
// class _AnimatedEntrance extends StatelessWidget {
//   final Widget child;
//   final bool visible;
//   final int delay;

//   const _AnimatedEntrance({
//     required this.child,
//     required this.visible,
//     required this.delay,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0, end: visible ? 1.0 : 0.0),
//       duration: Duration(milliseconds: 420 + delay),
//       curve: Curves.easeOutCubic,
//       builder: (_, v, c) => Transform.translate(
//         offset: Offset(0, (1 - v) * 26),
//         child: Opacity(opacity: v.clamp(0, 1), child: c),
//       ),
//       child: child,
//     );
//   }
// }

// // ─── Wellness Background (more vibrant, stronger blobs) ───────────────────────
// class _WellnessBackground extends StatelessWidget {
//   const _WellnessBackground();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Soft lavender-to-white gradient matching reference
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               // colors: [Color(0xFFECEBFF), Color(0xFFF4F0FF), Color(0xFFF0F6FF)],
//               colors: [
//                 Color(0xFFFFF5EC), // kLight
//                 Color(0xFFF6EEE3), // kCard
//                 Color(0xFFFFF8F2),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         // Top-right purple blob (matches reference)
//         Positioned(
//           top: -40,
//           right: -40,
//           child: _Blob(200, [
//             const Color(0xFFB8AFFF).withOpacity(0.55),
//             const Color(0xFFD4C8FF).withOpacity(0.35),
//           ]),
//         ),
//         // Top-left soft pink blob
//         Positioned(
//           top: 60,
//           left: -50,
//           child: _Blob(160, [
//             const Color(0xFFFFD6CC).withOpacity(0.45),
//             const Color(0xFFFFE8E0).withOpacity(0.30),
//           ]),
//         ),
//         // Bottom-right mint blob
//         Positioned(
//           bottom: 160,
//           right: -30,
//           child: _Blob(130, [
//             const Color(0xFFB8F0D0).withOpacity(0.40),
//             const Color(0xFFD4F8E8).withOpacity(0.22),
//           ]),
//         ),
//         // Small accent dots
//         Positioned(
//           top: 320,
//           left: 28,
//           child: _Blob(50, [
//             Colors.white.withOpacity(0.55),
//             Colors.white.withOpacity(0.25),
//           ]),
//         ),
//         Positioned(
//           top: 140,
//           right: 38,
//           child: _Blob(44, [
//             Colors.white.withOpacity(0.45),
//             Colors.white.withOpacity(0.20),
//           ]),
//         ),
//       ],
//     );
//   }
// }

// class _Blob extends StatelessWidget {
//   final double size;
//   final List<Color> colors;
//   const _Blob(this.size, this.colors);

//   @override
//   Widget build(BuildContext context) => Container(
//     width: size,
//     height: size,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: LinearGradient(
//         colors: colors,
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//     ),
//   );
// }

// // ─── Talk To Me Card (matches reference — white card, purple icon) ─────────────
// class _TalkToMeCard extends StatefulWidget {
//   final VoidCallback onTap;
//   const _TalkToMeCard({required this.onTap});

//   @override
//   State<_TalkToMeCard> createState() => _TalkToMeCardState();
// }

// class _TalkToMeCardState extends State<_TalkToMeCard> {
//   bool _pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       scale: _pressed ? 0.97 : 1.0,
//       duration: const Duration(milliseconds: 140),
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _pressed = true),
//         onTapCancel: () => setState(() => _pressed = false),
//         onTapUp: (_) => setState(() => _pressed = false),
//         onTap: widget.onTap,
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white.withOpacity(0.90),
//             border: Border.all(color: Colors.white, width: 1.5),
//             boxShadow: [
//               BoxShadow(
//                 color: _kPurple.withOpacity(0.10),
//                 blurRadius: 24,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // Purple circle icon
//               Container(
//                 width: 54,
//                 height: 54,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _kPurple.withOpacity(0.15),
//                 ),
//                 child: const Icon(
//                   Icons.chat_bubble_rounded,
//                   color: _kPurple,
//                   size: 26,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               const Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Talk to Me",
//                       style: TextStyle(
//                         color: _kDark,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: 3),
//                     Text(
//                       "Start a supportive conversation.",
//                       style: TextStyle(
//                         color: _kLight,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Circular arrow button
//               Container(
//                 width: 38,
//                 height: 38,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _kPurple.withOpacity(0.12),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_forward_rounded,
//                   color: _kPurple,
//                   size: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Reference-style Quick Card (matches the reference design closely) ─────────
// class _ReferenceQuickCard extends StatefulWidget {
//   final IconData icon;
//   final String label;
//   final String? subtitle;
//   final Color bgColor;
//   final Color iconBg;
//   final Color arrowColor;
//   final bool large;
//   final VoidCallback onTap;

//   const _ReferenceQuickCard({
//     required this.icon,
//     required this.label,
//     required this.bgColor,
//     required this.iconBg,
//     required this.arrowColor,
//     required this.onTap,
//     this.subtitle,
//     this.large = false,
//   });

//   @override
//   State<_ReferenceQuickCard> createState() => _ReferenceQuickCardState();
// }

// class _ReferenceQuickCardState extends State<_ReferenceQuickCard> {
//   bool _pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       scale: _pressed ? 0.97 : 1.0,
//       duration: const Duration(milliseconds: 130),
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _pressed = true),
//         onTapCancel: () => setState(() => _pressed = false),
//         onTapUp: (_) => setState(() => _pressed = false),
//         onTap: widget.onTap,
//         child: Container(
//           height: widget.large ? 110 : 110,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             color: widget.bgColor,
//             boxShadow: [
//               BoxShadow(
//                 color: widget.iconBg.withOpacity(0.12),
//                 blurRadius: 16,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // Icon container
//               Container(
//                 width: widget.large ? 64 : 52,
//                 height: widget.large ? 64 : 52,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: widget.iconBg.withOpacity(0.18),
//                 ),
//                 child: Icon(
//                   widget.icon,
//                   color: widget.iconBg,
//                   size: widget.large ? 30 : 26,
//                 ),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       widget.label,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: _kDark,
//                         fontSize: widget.large ? 17 : 15,
//                         fontWeight: FontWeight.w700,
//                         height: 1.25,
//                       ),
//                     ),
//                     if (widget.subtitle != null) ...[
//                       const SizedBox(height: 3),
//                       Text(
//                         widget.subtitle!,
//                         style: TextStyle(
//                           color: _kDark.withOpacity(0.55),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//               // Arrow button
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: widget.arrowColor.withOpacity(0.15),
//                 ),
//                 child: Icon(
//                   Icons.arrow_forward_rounded,
//                   color: widget.arrowColor,
//                   size: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Grid tool model + card (tablet/desktop, unchanged logic) ─────────────────
// class _GridTool {
//   final IconData icon;
//   final String label;
//   final List<Color> colors;
//   final VoidCallback onTap;
//   const _GridTool(this.icon, this.label, this.colors, this.onTap);
// }

// class _PremiumToolCard extends StatefulWidget {
//   final _GridTool item;
//   const _PremiumToolCard({required this.item});

//   @override
//   State<_PremiumToolCard> createState() => _PremiumToolCardState();
// }

// class _PremiumToolCardState extends State<_PremiumToolCard> {
//   bool _pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       scale: _pressed ? 0.97 : 1.0,
//       duration: const Duration(milliseconds: 130),
//       curve: Curves.easeOut,
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _pressed = true),
//         onTapUp: (_) => setState(() => _pressed = false),
//         onTapCancel: () => setState(() => _pressed = false),
//         onTap: widget.item.onTap,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             color: Colors.white.withOpacity(0.75),
//             border: Border.all(color: Colors.white.withOpacity(0.75)),
//             boxShadow: [
//               BoxShadow(
//                 color: widget.item.colors.first.withOpacity(0.15),
//                 blurRadius: 18,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: widget.item.colors,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Icon(widget.item.icon, color: _kWhite, size: 26),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 widget.item.label,
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: _kDark,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12.5,
//                   height: 1.25,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─── Motivation Card (rich gradient, matches reference feel) ──────────────────
// class _MotivationCard extends StatelessWidget {
//   final String text;
//   final String subText;
//   final String emoji;
//   final List<Color> colors;
//   final bool isActive;

//   const _MotivationCard({
//     required this.text,
//     required this.subText,
//     required this.emoji,
//     required this.colors,
//     required this.isActive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       scale: isActive ? 1.0 : 0.96,
//       duration: const Duration(milliseconds: 280),
//       curve: Curves.easeOutCubic,
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: LinearGradient(
//             colors: [
//               colors.first.withOpacity(0.97),
//               colors.last.withOpacity(0.92),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: colors.first.withOpacity(0.30),
//               blurRadius: 28,
//               offset: const Offset(0, 12),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(24),
//           child: Stack(
//             children: [
//               // Decorative circles
//               Positioned(
//                 top: -20,
//                 right: -12,
//                 child: _Circle(110, Colors.white.withOpacity(0.12)),
//               ),
//               Positioned(
//                 bottom: 8,
//                 right: 14,
//                 child: _Circle(68, Colors.white.withOpacity(0.14)),
//               ),
//               Positioned(
//                 left: -22,
//                 bottom: -30,
//                 child: Container(
//                   width: 160,
//                   height: 68,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(90),
//                     color: Colors.white.withOpacity(0.10),
//                   ),
//                 ),
//               ),
//               // Content
//               Padding(
//                 padding: const EdgeInsets.all(22),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             text,
//                             maxLines: 4,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 19,
//                               height: 1.30,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             subText,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(0.85),
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               height: 1.35,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 14),
//                     Container(
//                       width: 64,
//                       height: 64,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.20),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.25),
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           emoji,
//                           style: const TextStyle(fontSize: 32),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Circle extends StatelessWidget {
//   final double size;
//   final Color color;
//   const _Circle(this.size, this.color);

//   @override
//   Widget build(BuildContext context) => Container(
//     width: size,
//     height: size,
//     decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//   );
// }

// // ─── Floating Bottom Nav (matches reference — simple, clean style) ─────────────
// class _FloatingBottomNav extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemSelected;

//   const _FloatingBottomNav({
//     required this.selectedIndex,
//     required this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 72,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: _kPurple.withOpacity(0.10),
//             blurRadius: 24,
//             offset: const Offset(0, 8),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 12,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             child: _NavItem(
//               icon: Icons.home_rounded,
//               label: "Home",
//               isSelected: selectedIndex == 0,
//               onTap: () => onItemSelected(0),
//             ),
//           ),
//           Expanded(
//             child: _NavItem(
//               icon: Icons.chat_bubble_outline_rounded,
//               label: "Chat",
//               isSelected: selectedIndex == 1,
//               onTap: () => onItemSelected(1),
//             ),
//           ),
//           Expanded(
//             child: _NavItem(
//               icon: Icons.warning_amber_rounded,
//               label: "Emergency",
//               isSelected: selectedIndex == 2,
//               onTap: () => onItemSelected(2),
//               selectedColor: _kRed,
//             ),
//           ),
//           Expanded(
//             child: _NavItem(
//               icon: Icons.person_outline_rounded,
//               label: "Profile",
//               isSelected: selectedIndex == 3,
//               onTap: () => onItemSelected(3),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _NavItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;
//   final Color selectedColor;

//   const _NavItem({
//     required this.icon,
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//     this.selectedColor = _kPurple,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final color = isSelected ? selectedColor : const Color(0xFFAAAEC4);

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(18),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color, size: isSelected ? 26 : 24),
//             const SizedBox(height: 3),
//             Text(
//               label,
//               style: TextStyle(
//                 color: color,
//                 fontSize: 10.5,
//                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 3),
//             // Underline indicator matching reference
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 260),
//               width: isSelected ? 20 : 0,
//               height: 3,
//               decoration: BoxDecoration(
//                 color: selectedColor,
//                 borderRadius: BorderRadius.circular(999),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Mini action (for bottom sheet, unchanged) ────────────────────────────────
// class _MiniAction extends StatefulWidget {
//   final IconData icon;
//   final String label;
//   final List<Color> colors;
//   final VoidCallback onTap;

//   const _MiniAction({
//     required this.icon,
//     required this.label,
//     required this.colors,
//     required this.onTap,
//   });

//   @override
//   State<_MiniAction> createState() => _MiniActionState();
// }

// class _MiniActionState extends State<_MiniAction> {
//   bool _pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedScale(
//       scale: _pressed ? 0.97 : 1.0,
//       duration: const Duration(milliseconds: 120),
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _pressed = true),
//         onTapCancel: () => setState(() => _pressed = false),
//         onTapUp: (_) => setState(() => _pressed = false),
//         onTap: widget.onTap,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(22),
//             color: Colors.white.withOpacity(0.65),
//             border: Border.all(color: Colors.white.withOpacity(0.72)),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 width: 52,
//                 height: 52,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(colors: widget.colors),
//                 ),
//                 child: Icon(widget.icon, color: _kWhite),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 widget.label,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: _kDark,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/controller/ActivityController.dart';
import 'package:mentalwellapp/controller/LoginController.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
import 'package:mentalwellapp/view/USER/exercise_page.dart';
import 'package:mentalwellapp/view/USER/expert_advice.dart';
import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// ─── Design tokens (updated to match reference) ───────────────────────────────
const _kBg = Color(0xFFF2F3FA); // Soft lavender-white background
const _kPurple = Color(0xFF6C63FF); // Primary purple (reference)
const _kPurple2 = Color(0xFF9B8FFF); // Lighter purple
const _kPink = Color(0xFFFFD6CC); // Soft peach/pink card
const _kMint = Color(0xFFD4F0E0); // Soft mint/green card
const _kYellow = Color(0xFFFFF3CC); // Soft yellow/gold card
const _kLavender = Color(0xFFE8E4FF); // Soft lavender card
const _kBlueCard = Color(0xFFD6EEFF); // Soft blue card
const _kDark = Color(0xFF2D2B5A); // Deep navy text
const _kLight = Color(0xFF9898B0); // Muted grey text
const _kRed = Color(0xFFFF4D4D);
const _kWhite = Colors.white;

// ─────────────────────────────────────────────────────────────────────────────
class UserHomeWrapper extends StatefulWidget {
  const UserHomeWrapper({super.key});

  @override
  State<UserHomeWrapper> createState() => _UserHomeWrapperState();
}

class _UserHomeWrapperState extends State<UserHomeWrapper>
    with WidgetsBindingObserver {
  // ── State ─────────────────────────────────────────────────────────────────
  User? firebaseUser;
  String username = "";
  String? profileImageBase64;
  int selectedIndex = 0;
  bool _hasLoggedResume = false;
  bool _pageReady = false;

  final ActivityController activityController = ActivityController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final PageController _motivationPageController = PageController(
    viewportFraction: 0.88,
  );
  int _currentMotivationPage = 0;

  // ── Lifecycle ─────────────────────────────────────────────────────────────
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    firebaseUser = FirebaseAuth.instance.currentUser;
    _fetchUserData();
    _logOpenActivity();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _pageReady = true);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _motivationPageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_hasLoggedResume) {
      _hasLoggedResume = true;
      _logResumeActivity().whenComplete(() => _hasLoggedResume = false);
    }
  }

  // ── Firebase (unchanged) ──────────────────────────────────────────────────
  Future<void> _fetchUserData() async {
    if (firebaseUser == null) return;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();
      if (!mounted) return;
      if (doc.exists) {
        final d = doc.data()!;
        setState(() {
          username = d['name'] ?? "User";
          profileImageBase64 = d['profileImageBase64'];
        });
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    }
  }

  Future<void> _logOpenActivity() async {
    if (firebaseUser == null) return;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();
      if (!doc.exists) return;
      final d = doc.data()!;
      await activityController.logActivity(
        userId: firebaseUser!.uid,
        userName: d['name'] ?? "User",
        action: "open_app",
      );
    } catch (e) {
      debugPrint("Error logging open activity: $e");
    }
  }

  Future<void> _logResumeActivity() async {
    if (firebaseUser == null) return;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();
      if (!doc.exists) return;
      final d = doc.data()!;
      await activityController.logActivity(
        userId: firebaseUser!.uid,
        userName: d['name'] ?? "User",
        action: "resume_app",
      );
    } catch (e) {
      debugPrint("Error logging resume activity: $e");
    }
  }

  ImageProvider getProfileImage() {
    try {
      if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
        final clean = profileImageBase64!
            .replaceAll('\n', '')
            .replaceAll(' ', '');
        return MemoryImage(base64Decode(clean));
      }
    } catch (e) {
      debugPrint("Profile image decode error: $e");
    }
    return const AssetImage("assets/default_profile.jpg");
  }

  Future<void> handleLogout(BuildContext context) async {
    final ctrl = LoginController();
    await FirebaseAuth.instance.signOut();
    await ctrl.clearSharedPref();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  // ── Pages (unchanged) ─────────────────────────────────────────────────────
  List<Widget> _buildPages() => [
    _buildHomePage(),
    const ChatBotPage(),
    const EmergencyPage(),
    const UserProfilePage(),
  ];

  // ── Home page (redesigned) ────────────────────────────────────────────────
  Widget _buildHomePage() {
    return Stack(
      children: [
        const _WellnessBackground(),
        SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 110),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header ─────────────────────────────────────────────
                    _AnimatedEntrance(
                      delay: 0,
                      visible: _pageReady,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                        child: _buildHeader(),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── Talk To Me card ────────────────────────────────────
                    _AnimatedEntrance(
                      delay: 80,
                      visible: _pageReady,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _TalkToMeCard(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ChatBotPage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // ── Motivation section ─────────────────────────────────
                    _AnimatedEntrance(
                      delay: 140,
                      visible: _pageReady,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildMotivationHeader(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _AnimatedEntrance(
                      delay: 200,
                      visible: _pageReady,
                      child: _buildMotivationCardsStream(),
                    ),
                    const SizedBox(height: 22),

                    // ── Quick Access Tools ─────────────────────────────────
                    _AnimatedEntrance(
                      delay: 260,
                      visible: _pageReady,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildQuickAccessHeader(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedEntrance(
                      delay: 320,
                      visible: _pageReady,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildQuickAccess(),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Motivation section label with counter ──────────────────────────────────
  Widget _buildMotivationHeader() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('motivation_cards')
          .where('isActive', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        final count = snapshot.data?.docs.length ?? 0;
        return Row(
          children: [
            const Text("✦", style: TextStyle(color: _kPurple, fontSize: 18)),
            const SizedBox(width: 8),
            const Text(
              "Motivation for You",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: _kDark,
              ),
            ),
            const Spacer(),
            if (count > 0)
              Text(
                "${_currentMotivationPage + 1} / $count",
                style: const TextStyle(
                  color: _kLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        );
      },
    );
  }

  // ── Quick Access header ────────────────────────────────────────────────────
  Widget _buildQuickAccessHeader() {
    return Row(
      children: const [
        Text("✦", style: TextStyle(color: _kPurple, fontSize: 18)),
        SizedBox(width: 8),
        Text(
          "Quick Access Tools",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: _kDark,
          ),
        ),
      ],
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    "Hello, ${username.isNotEmpty ? username : 'User'}! 👋",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: _kDark,
                      height: 1.15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: _kDark.withOpacity(0.55),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Profile avatar
        GestureDetector(
          onTap: () => setState(() => selectedIndex = 3),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: _kPurple.withOpacity(0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: CircleAvatar(radius: 28, backgroundImage: getProfileImage()),
          ),
        ),
      ],
    );
  }

  // ── Quick access layout (matches reference) ────────────────────────────────
  Widget _buildQuickAccess() {
    return LayoutBuilder(
      builder: (ctx, box) {
        final wide = box.maxWidth > 600;
        if (wide) {
          return _buildQuickGrid(3);
        }
        return Column(
          children: [
            // Guide — full-width large card (soft green)
            _ReferenceQuickCard(
              icon: Icons.menu_book_rounded,
              label: "Guide",
              subtitle: "Spiritual wisdom & insights",
              bgColor: const Color.fromARGB(255, 197, 237, 213),
              iconBg: const Color(0xFF4CAF84),
              arrowColor: const Color(0xFF4CAF84),
              large: true,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
              ),
            ),
            const SizedBox(height: 12),
            // Row: Relationship + Expert
            Row(
              children: [
                Expanded(
                  child: _ReferenceQuickCard(
                    icon: Icons.people_alt_rounded,
                    label: "Relationship\nAdvice",
                    bgColor: const Color.fromARGB(255, 225, 187, 174),
                    iconBg: const Color(0xFFFF7043),
                    arrowColor: const Color(0xFFFF7043),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RelationshipAdvicePage(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ReferenceQuickCard(
                    icon: Icons.shield_rounded,
                    label: "Expert\nAdvice",
                    bgColor: const Color.fromARGB(255, 212, 205, 244),
                    iconBg: const Color(0xFF6C63FF),
                    arrowColor: const Color(0xFF6C63FF),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Row: Exercise + Healing
            Row(
              children: [
                Expanded(
                  child: _ReferenceQuickCard(
                    icon: Icons.fitness_center_rounded,
                    label: "Exercise",
                    subtitle: "Body & mind fitness",
                    bgColor: const Color.fromARGB(255, 180, 210, 232),
                    iconBg: const Color(0xFF4A90D9),
                    arrowColor: const Color(0xFF4A90D9),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ExercisePage()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ReferenceQuickCard(
                    icon: Icons.spa_rounded,
                    label: "Healing",
                    subtitle: "Inner peace & recovery",
                    bgColor: const Color.fromARGB(255, 237, 222, 175),
                    iconBg: const Color(0xFFE8A020),
                    arrowColor: const Color(0xFFE8A020),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StressManagementPage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuickGrid(int cols) {
    final items = [
      _GridTool(
        Icons.menu_book_rounded,
        "Guide",
        const [Color(0xFF4CAF84), Color(0xFF81C784)],
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SpiritualWisdomApp()),
        ),
      ),
      _GridTool(
        Icons.people_alt_rounded,
        "Relationship\nAdvice",
        const [Color(0xFFFF7043), Color(0xFFFF8A65)],
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RelationshipAdvicePage()),
        ),
      ),
      _GridTool(
        Icons.shield_rounded,
        "Expert Advice",
        const [Color(0xFF6C63FF), Color(0xFF9B8FFF)],
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
        ),
      ),
      _GridTool(
        Icons.fitness_center_rounded,
        "Exercise",
        const [Color(0xFF4A90D9), Color(0xFF64B5F6)],
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ExercisePage()),
        ),
      ),
      _GridTool(
        Icons.spa_rounded,
        "Healing",
        const [Color(0xFFE8A020), Color(0xFFFFB74D)],
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const StressManagementPage()),
        ),
      ),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (_, i) => _PremiumToolCard(item: items[i]),
    );
  }

  // ── Motivation stream (unchanged logic, improved UI) ───────────────────────
  Widget _buildMotivationCardsStream() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('motivation_cards')
          .where('isActive', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _fallbackCard(
            text:
                "Every day may not be good, but there is something good in every day.",
            subText: "Take a deep breath and begin gently.",
            emoji: "🌸",
            colors: const [Color(0xFF8D6FFF), Color(0xFFB06FFF)],
          );
        }
        if (snapshot.hasError) {
          return _fallbackCard(
            text:
                "You are stronger than you think, and brighter days are ahead.",
            subText: "One small positive step is enough for today.",
            emoji: "🙂",
            colors: const [Color(0xFF6C63FF), Color(0xFF9B8FFF)],
          );
        }

        final docs = snapshot.data?.docs.toList() ?? [];
        docs.sort((a, b) {
          final aRaw = a.data()['order'];
          final bRaw = b.data()['order'];
          final aO = aRaw is int
              ? aRaw
              : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
          final bO = bRaw is int
              ? bRaw
              : int.tryParse(bRaw?.toString() ?? '') ?? 999999;
          return aO.compareTo(bO);
        });

        if (docs.isEmpty) {
          return _fallbackCard(
            text:
                "Believe in yourself. You have the power to heal, grow, and shine.",
            subText: "Your journey matters, even on slow days.",
            emoji: "💛",
            colors: const [Color(0xFF7C6FFF), Color(0xFFB06FFF)],
          );
        }

        if (_currentMotivationPage >= docs.length) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _currentMotivationPage = 0);
          });
        }

        return Column(
          children: [
            SizedBox(
              height: 220,
              child: NotificationListener<ScrollNotification>(
                onNotification: (_) => false,
                child: PageView.builder(
                  controller: _motivationPageController,
                  physics: const BouncingScrollPhysics(
                    parent: PageScrollPhysics(),
                  ),
                  itemCount: docs.length,
                  onPageChanged: (p) {
                    if (mounted) setState(() => _currentMotivationPage = p);
                  },
                  itemBuilder: (ctx, index) {
                    final data = docs[index].data();
                    final quoteText =
                        (data['text']?.toString().trim().isNotEmpty ?? false)
                        ? data['text'].toString().trim()
                        : "Stay strong, brighter days are ahead.";
                    final quoteEmoji =
                        (data['icon']?.toString().trim().isNotEmpty ?? false)
                        ? data['icon'].toString().trim()
                        : "🙂";
                    final c1 = _parseColorValue(data['color1'], 0xFF8D6FFF);
                    final c2 = _parseColorValue(data['color2'], 0xFFB86FFF);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: _MotivationCard(
                        text: quoteText,
                        subText: "Take a deep breath. You've got this.",
                        emoji: quoteEmoji,
                        colors: [Color(c1), Color(c2)],
                        isActive: _currentMotivationPage == index,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 14),
            _buildPageIndicator(docs.length, _currentMotivationPage),
          ],
        );
      },
    );
  }

  int _parseColorValue(dynamic value, int fallback) {
    if (value is int) return value;
    if (value is String) {
      final c = value.replaceAll('#', '').trim();
      if (c.isEmpty) return fallback;
      if (c.length == 6) return int.tryParse('FF$c', radix: 16) ?? fallback;
      if (c.length == 8) return int.tryParse(c, radix: 16) ?? fallback;
    }
    return fallback;
  }

  Widget _fallbackCard({
    required String text,
    required String subText,
    required String emoji,
    required List<Color> colors,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 220,
            child: _MotivationCard(
              text: text,
              subText: subText,
              emoji: emoji,
              colors: colors,
              isActive: true,
            ),
          ),
        ),
        const SizedBox(height: 14),
        _buildPageIndicator(1, 0),
      ],
    );
  }

  // ── Page indicator (matches reference — dot style) ─────────────────────────
  Widget _buildPageIndicator(int count, int current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final sel = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: sel ? 22 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: sel ? _kPurple : const Color(0xFFD4D4E8),
          ),
        );
      }),
    );
  }

  // ── Scaffold ───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: _kBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _kPurple,
          brightness: Brightness.light,
          surface: _kBg,
        ),
        fontFamily: 'Poppins',
      ),
      child: Scaffold(
        key: scaffoldKey,
        extendBody: true,
        backgroundColor: _kBg,
        body: IndexedStack(index: selectedIndex, children: pages),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: _FloatingBottomNav(
            selectedIndex: selectedIndex,
            onItemSelected: (i) => setState(() => selectedIndex = i),
          ),
        ),
      ),
    );
  }

  // _showWellnessBottomSheet preserved ────────────────────────────────────────
  void _showWellnessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.88),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Wellness Hub Options",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _kDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: 120,
                        child: _MiniAction(
                          icon: Icons.fitness_center_rounded,
                          label: "Exercise",
                          colors: const [Color(0xFF4A90D9), Color(0xFF64B5F6)],
                          onTap: () {
                            Navigator.pop(sheetCtx);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ExercisePage(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: _MiniAction(
                          icon: Icons.spa_rounded,
                          label: "Healing",
                          colors: const [Color(0xFFE8A020), Color(0xFFFFB74D)],
                          onTap: () {
                            Navigator.pop(sheetCtx);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StressManagementPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Animated entrance (unchanged) ───────────────────────────────────────────
class _AnimatedEntrance extends StatelessWidget {
  final Widget child;
  final bool visible;
  final int delay;

  const _AnimatedEntrance({
    required this.child,
    required this.visible,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: visible ? 1.0 : 0.0),
      duration: Duration(milliseconds: 420 + delay),
      curve: Curves.easeOutCubic,
      builder: (_, v, c) => Transform.translate(
        offset: Offset(0, (1 - v) * 26),
        child: Opacity(opacity: v.clamp(0, 1), child: c),
      ),
      child: child,
    );
  }
}

// ─── Wellness Background (more vibrant, stronger blobs) ───────────────────────
class _WellnessBackground extends StatelessWidget {
  const _WellnessBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Soft lavender-to-white gradient matching reference
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFECEBFF), Color(0xFFF4F0FF), Color(0xFFF0F6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Top-right purple blob (matches reference)
        Positioned(
          top: -40,
          right: -40,
          child: _Blob(200, [
            const Color(0xFFB8AFFF).withOpacity(0.55),
            const Color(0xFFD4C8FF).withOpacity(0.35),
          ]),
        ),
        // Top-left soft pink blob
        Positioned(
          top: 60,
          left: -50,
          child: _Blob(160, [
            const Color(0xFFFFD6CC).withOpacity(0.45),
            const Color(0xFFFFE8E0).withOpacity(0.30),
          ]),
        ),
        // Bottom-right mint blob
        Positioned(
          bottom: 160,
          right: -30,
          child: _Blob(130, [
            const Color(0xFFB8F0D0).withOpacity(0.40),
            const Color(0xFFD4F8E8).withOpacity(0.22),
          ]),
        ),
        // Small accent dots
        Positioned(
          top: 320,
          left: 28,
          child: _Blob(50, [
            Colors.white.withOpacity(0.55),
            Colors.white.withOpacity(0.25),
          ]),
        ),
        Positioned(
          top: 140,
          right: 38,
          child: _Blob(44, [
            Colors.white.withOpacity(0.45),
            Colors.white.withOpacity(0.20),
          ]),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final List<Color> colors;
  const _Blob(this.size, this.colors);

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}

// ─── Talk To Me Card (matches reference — white card, purple icon) ─────────────
class _TalkToMeCard extends StatefulWidget {
  final VoidCallback onTap;
  const _TalkToMeCard({required this.onTap});

  @override
  State<_TalkToMeCard> createState() => _TalkToMeCardState();
}

class _TalkToMeCardState extends State<_TalkToMeCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 140),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.90),
            border: Border.all(color: Colors.white, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: _kPurple.withOpacity(0.10),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // Purple circle icon
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kPurple.withOpacity(0.15),
                ),
                child: const Icon(
                  Icons.chat_bubble_rounded,
                  color: _kPurple,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Talk to Me",
                      style: TextStyle(
                        color: _kDark,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Start a supportive conversation.",
                      style: TextStyle(
                        color: _kLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Circular arrow button
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kPurple.withOpacity(0.12),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: _kPurple,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Reference-style Quick Card (matches the reference design closely) ─────────
class _ReferenceQuickCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final Color bgColor;
  final Color iconBg;
  final Color arrowColor;
  final bool large;
  final VoidCallback onTap;

  const _ReferenceQuickCard({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconBg,
    required this.arrowColor,
    required this.onTap,
    this.subtitle,
    this.large = false,
  });

  @override
  State<_ReferenceQuickCard> createState() => _ReferenceQuickCardState();
}

class _ReferenceQuickCardState extends State<_ReferenceQuickCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 130),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: Container(
          height: widget.large ? 110 : 110,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: widget.bgColor,
            boxShadow: [
              BoxShadow(
                color: widget.iconBg.withOpacity(0.12),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container
              Container(
                width: widget.large ? 64 : 52,
                height: widget.large ? 64 : 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.iconBg.withOpacity(0.18),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconBg,
                  size: widget.large ? 30 : 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _kDark,
                        fontSize: widget.large ? 17 : 15,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    if (widget.subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        widget.subtitle!,
                        style: TextStyle(
                          color: _kDark.withOpacity(0.55),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Arrow button
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.arrowColor.withOpacity(0.15),
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: widget.arrowColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Grid tool model + card (tablet/desktop, unchanged logic) ─────────────────
class _GridTool {
  final IconData icon;
  final String label;
  final List<Color> colors;
  final VoidCallback onTap;
  const _GridTool(this.icon, this.label, this.colors, this.onTap);
}

class _PremiumToolCard extends StatefulWidget {
  final _GridTool item;
  const _PremiumToolCard({required this.item});

  @override
  State<_PremiumToolCard> createState() => _PremiumToolCardState();
}

class _PremiumToolCardState extends State<_PremiumToolCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 130),
      curve: Curves.easeOut,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.item.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withOpacity(0.75),
            border: Border.all(color: Colors.white.withOpacity(0.75)),
            boxShadow: [
              BoxShadow(
                color: widget.item.colors.first.withOpacity(0.15),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: widget.item.colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(widget.item.icon, color: _kWhite, size: 26),
              ),
              const SizedBox(height: 12),
              Text(
                widget.item.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _kDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Motivation Card (rich gradient, matches reference feel) ──────────────────
class _MotivationCard extends StatelessWidget {
  final String text;
  final String subText;
  final String emoji;
  final List<Color> colors;
  final bool isActive;

  const _MotivationCard({
    required this.text,
    required this.subText,
    required this.emoji,
    required this.colors,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isActive ? 1.0 : 0.96,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              colors.first.withOpacity(0.97),
              colors.last.withOpacity(0.92),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.first.withOpacity(0.30),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Decorative circles
              Positioned(
                top: -20,
                right: -12,
                child: _Circle(110, Colors.white.withOpacity(0.12)),
              ),
              Positioned(
                bottom: 8,
                right: 14,
                child: _Circle(68, Colors.white.withOpacity(0.14)),
              ),
              Positioned(
                left: -22,
                bottom: -30,
                child: Container(
                  width: 160,
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white.withOpacity(0.10),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(22),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 19,
                              height: 1.30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            subText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final Color color;
  const _Circle(this.size, this.color);

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

// ─── Floating Bottom Nav (matches reference — simple, clean style) ─────────────
class _FloatingBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const _FloatingBottomNav({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _kPurple.withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _NavItem(
              icon: Icons.home_rounded,
              label: "Home",
              isSelected: selectedIndex == 0,
              onTap: () => onItemSelected(0),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.chat_bubble_outline_rounded,
              label: "Chat",
              isSelected: selectedIndex == 1,
              onTap: () => onItemSelected(1),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.warning_amber_rounded,
              label: "Emergency",
              isSelected: selectedIndex == 2,
              onTap: () => onItemSelected(2),
              selectedColor: _kRed,
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.person_outline_rounded,
              label: "Profile",
              isSelected: selectedIndex == 3,
              onTap: () => onItemSelected(3),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = _kPurple,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : const Color(0xFFAAAEC4);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: isSelected ? 26 : 24),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            // Underline indicator matching reference
            AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              width: isSelected ? 20 : 0,
              height: 3,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Mini action (for bottom sheet, unchanged) ────────────────────────────────
class _MiniAction extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<Color> colors;
  final VoidCallback onTap;

  const _MiniAction({
    required this.icon,
    required this.label,
    required this.colors,
    required this.onTap,
  });

  @override
  State<_MiniAction> createState() => _MiniActionState();
}

class _MiniActionState extends State<_MiniAction> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.65),
            border: Border.all(color: Colors.white.withOpacity(0.72)),
          ),
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: widget.colors),
                ),
                child: Icon(widget.icon, color: _kWhite),
              ),
              const SizedBox(height: 10),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _kDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
