// // // // // // // // import 'dart:convert';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // // // // //     hide kCard, kPrimary;
// // // // // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

// // // // // // // // class UserHomeWrapper extends StatefulWidget {
// // // // // // // //   const UserHomeWrapper({super.key});

// // // // // // // //   @override
// // // // // // // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // // // // // // }

// // // // // // // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // // // // // // //   User? firebaseUser;
// // // // // // // //   String username = "";
// // // // // // // //   String? profileImageBase64;

// // // // // // // //   int selectedIndex = 0;
// // // // // // // //   String selectedMood = "🙂";

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // // //     _fetchUserData();
// // // // // // // //   }

// // // // // // // //   Future<void> _fetchUserData() async {
// // // // // // // //     if (firebaseUser == null) return;

// // // // // // // //     try {
// // // // // // // //       final doc = await FirebaseFirestore.instance
// // // // // // // //           .collection('users')
// // // // // // // //           .doc(firebaseUser!.uid)
// // // // // // // //           .get();

// // // // // // // //       if (doc.exists) {
// // // // // // // //         final data = doc.data()!;
// // // // // // // //         setState(() {
// // // // // // // //           username = data['name'] ?? "User";
// // // // // // // //           profileImageBase64 = data['profileImageBase64'];
// // // // // // // //         });
// // // // // // // //       }
// // // // // // // //     } catch (e) {
// // // // // // // //       print("Error fetching user data: $e");
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   // ImageProvider getProfileImage() {
// // // // // // // //   //   if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
// // // // // // // //   //     final bytes = base64Decode(profileImageBase64!);
// // // // // // // //   //     return MemoryImage(bytes);
// // // // // // // //   //   } else {
// // // // // // // //   //     return const AssetImage("assets/images/default_user.png");
// // // // // // // //   //   }
// // // // // // // //   // }

// // // // // // // //   ImageProvider getProfileImage() {
// // // // // // // //     try {
// // // // // // // //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// // // // // // // //         final cleanBase64 = profileImageBase64!
// // // // // // // //             .replaceAll('\n', '')
// // // // // // // //             .replaceAll(' ', '');

// // // // // // // //         final bytes = base64Decode(cleanBase64);
// // // // // // // //         return MemoryImage(bytes);
// // // // // // // //       }
// // // // // // // //     } catch (e) {
// // // // // // // //       print("Profile image decode error: $e");
// // // // // // // //     }

// // // // // // // //     // ✅ CORRECT fallback
// // // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // // //   }

// // // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // // //     final loginController = LoginController();

// // // // // // // //     // Sign out from Firebase
// // // // // // // //     await FirebaseAuth.instance.signOut();

// // // // // // // //     // Clear saved login data
// // // // // // // //     await loginController.clearSharedPref();

// // // // // // // //     // Navigate back to LoginPage
// // // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // // //       context,
// // // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // // //       (route) => false,
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     final List<Widget> pages = [
// // // // // // // //       SafeArea(
// // // // // // // //         child: SingleChildScrollView(
// // // // // // // //           child: Column(
// // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //             children: [
// // // // // // // //               SizedBox(
// // // // // // // //                 height: 180,
// // // // // // // //                 child: ListView(
// // // // // // // //                   scrollDirection: Axis.horizontal,
// // // // // // // //                   physics: const BouncingScrollPhysics(),
// // // // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // // // //                     horizontal: 16,
// // // // // // // //                     vertical: 12,
// // // // // // // //                   ),
// // // // // // // //                   children: const [
// // // // // // // //                     _MotivationCard(
// // // // // // // //                       text:
// // // // // // // //                           "Believe in yourself 🌟\nMagic happens when you try.",
// // // // // // // //                       icon: "🙂",
// // // // // // // //                       colors: [
// // // // // // // //                         Color.fromARGB(255, 174, 112, 184),
// // // // // // // //                         Color(0xFFE040FB),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                     _MotivationCard(
// // // // // // // //                       text:
// // // // // // // //                           "Every day is a fresh start ✨\nSmile and shine today.",
// // // // // // // //                       icon: "🌸",
// // // // // // // //                       colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
// // // // // // // //                     ),
// // // // // // // //                     _MotivationCard(
// // // // // // // //                       text:
// // // // // // // //                           "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
// // // // // // // //                       icon: "🌞",
// // // // // // // //                       colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
// // // // // // // //                     ),
// // // // // // // //                     _MotivationCard(
// // // // // // // //                       text:
// // // // // // // //                           "Stay calm, stay positive 🌈\nInner peace is power.",
// // // // // // // //                       icon: "🧘",
// // // // // // // //                       colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
// // // // // // // //                     ),
// // // // // // // //                     _MotivationCard(
// // // // // // // //                       text: "Push yourself 💪\nBecause no one else will.",
// // // // // // // //                       icon: "🔥",
// // // // // // // //                       colors: [Color(0xFFF44336), Color(0xFFE57373)],
// // // // // // // //                     ),
// // // // // // // //                   ],
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //               Padding(
// // // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // // //                   horizontal: 16,
// // // // // // // //                   vertical: 16,
// // // // // // // //                 ),
// // // // // // // //                 child: Wrap(
// // // // // // // //                   spacing: 16,
// // // // // // // //                   runSpacing: 16,
// // // // // // // //                   children: [
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // // //                       label: "  Talk to Me  ",
// // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // //                       onTap: () {
// // // // // // // //                         Navigator.push(
// // // // // // // //                           context,
// // // // // // // //                           MaterialPageRoute(
// // // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // // //                           ),
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.health_and_safety,
// // // // // // // //                       label: "  Wellness Hub  ",
// // // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // // //                       onTap: () {
// // // // // // // //                         showModalBottomSheet(
// // // // // // // //                           context: context,
// // // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // // //                               top: Radius.circular(20),
// // // // // // // //                             ),
// // // // // // // //                           ),
// // // // // // // //                           builder: (context) {
// // // // // // // //                             return Container(
// // // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // // //                               child: Wrap(
// // // // // // // //                                 spacing: 16,
// // // // // // // //                                 runSpacing: 16,
// // // // // // // //                                 children: [
// // // // // // // //                                   _FeatureRoundButton(
// // // // // // // //                                     icon: Icons.spa,
// // // // // // // //                                     label: "  Self-Care  ",
// // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // //                                     onTap: () {
// // // // // // // //                                       Navigator.push(
// // // // // // // //                                         context,
// // // // // // // //                                         MaterialPageRoute(
// // // // // // // //                                           builder: (_) =>
// // // // // // // //                                               const DailyWellnessPage(),
// // // // // // // //                                         ),
// // // // // // // //                                       );
// // // // // // // //                                     },
// // // // // // // //                                   ),
// // // // // // // //                                   _FeatureRoundButton(
// // // // // // // //                                     icon: Icons.fitness_center,
// // // // // // // //                                     label: "  Exercise  ",
// // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // //                                     onTap: () {
// // // // // // // //                                       Navigator.push(
// // // // // // // //                                         context,
// // // // // // // //                                         MaterialPageRoute(
// // // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // // //                                         ),
// // // // // // // //                                       );
// // // // // // // //                                     },
// // // // // // // //                                   ),
// // // // // // // //                                   _FeatureRoundButton(
// // // // // // // //                                     icon: Icons.healing,
// // // // // // // //                                     label: "  Healing  ",
// // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // //                                     onTap: () {
// // // // // // // //                                       Navigator.push(
// // // // // // // //                                         context,
// // // // // // // //                                         MaterialPageRoute(
// // // // // // // //                                           builder: (_) =>
// // // // // // // //                                               const StressManagementPage(),
// // // // // // // //                                         ),
// // // // // // // //                                       );
// // // // // // // //                                     },
// // // // // // // //                                   ),
// // // // // // // //                                   _FeatureRoundButton(
// // // // // // // //                                     icon: Icons.bedtime,
// // // // // // // //                                     label: "  Sleep  ",
// // // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // // //                                     onTap: () {
// // // // // // // //                                       Navigator.push(
// // // // // // // //                                         context,
// // // // // // // //                                         MaterialPageRoute(
// // // // // // // //                                           builder: (_) =>
// // // // // // // //                                               const SleepRelaxationPage(),
// // // // // // // //                                         ),
// // // // // // // //                                       );
// // // // // // // //                                     },
// // // // // // // //                                   ),
// // // // // // // //                                 ],
// // // // // // // //                               ),
// // // // // // // //                             );
// // // // // // // //                           },
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // // //                       label: "  Guide  ",
// // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // //                       onTap: () {
// // // // // // // //                         Navigator.push(
// // // // // // // //                           context,
// // // // // // // //                           MaterialPageRoute(
// // // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // // //                           ),
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.mood,
// // // // // // // //                       label: "  Mood Tracker  ",
// // // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // // //                       onTap: () {
// // // // // // // //                         Navigator.push(
// // // // // // // //                           context,
// // // // // // // //                           MaterialPageRoute(
// // // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // // //                           ),
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.favorite,
// // // // // // // //                       label: "  Relationship Advice  ",
// // // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // // //                       onTap: () {
// // // // // // // //                         Navigator.push(
// // // // // // // //                           context,
// // // // // // // //                           MaterialPageRoute(
// // // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // // //                           ),
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                     _FeatureRoundButton(
// // // // // // // //                       icon: Icons.psychology,
// // // // // // // //                       label: "  Expert Advice  ",
// // // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // // //                       onTap: () {
// // // // // // // //                         Navigator.push(
// // // // // // // //                           context,
// // // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // // //                         );
// // // // // // // //                       },
// // // // // // // //                     ),
// // // // // // // //                   ],
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // // //       const Center(child: Text("Book Page")),
// // // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // // //     ];

// // // // // // // //     return Scaffold(
// // // // // // // //       backgroundColor: kCard,
// // // // // // // //       appBar: AppBar(
// // // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // // //         centerTitle: false,
// // // // // // // //         title: Column(
// // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //           children: [
// // // // // // // //             Text(
// // // // // // // //               "Hello $username",
// // // // // // // //               style: const TextStyle(
// // // // // // // //                 color: Colors.black,
// // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // //                 fontSize: 18,
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //             const Text(
// // // // // // // //               "How are you feeling today?",
// // // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //         actions: [
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //       drawer: Drawer(
// // // // // // // //         backgroundColor: kCard,
// // // // // // // //         child: SafeArea(
// // // // // // // //           child: Column(
// // // // // // // //             children: [
// // // // // // // //               UserAccountsDrawerHeader(
// // // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // // //                   radius: 30,
// // // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // // //                 ),
// // // // // // // //                 accountName: Text(
// // // // // // // //                   username,
// // // // // // // //                   style: const TextStyle(
// // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // //                     fontSize: 18,
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // // //               ),
// // // // // // // //               ListTile(
// // // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // // //                 title: const Text("Dashboard"),
// // // // // // // //                 onTap: () {
// // // // // // // //                   Navigator.push(
// // // // // // // //                     context,
// // // // // // // //                     MaterialPageRoute(
// // // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // // //                     ),
// // // // // // // //                   );
// // // // // // // //                 },
// // // // // // // //               ),
// // // // // // // //               ListTile(
// // // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // // // // //                 title: const Text("Notifications"),
// // // // // // // //                 onTap: () {
// // // // // // // //                   Navigator.push(
// // // // // // // //                     context,
// // // // // // // //                     MaterialPageRoute(
// // // // // // // //                       builder: (_) => const NotificationsPage(),
// // // // // // // //                     ),
// // // // // // // //                   );
// // // // // // // //                 },
// // // // // // // //               ),
// // // // // // // //               ListTile(
// // // // // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // // // // //                 title: const Text("Emergency"),
// // // // // // // //                 onTap: () {
// // // // // // // //                   Navigator.push(
// // // // // // // //                     context,
// // // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // // //                   );
// // // // // // // //                 },
// // // // // // // //               ),
// // // // // // // //               ListTile(
// // // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
// // // // // // // //                 title: const Text("Help & Support"),
// // // // // // // //                 onTap: () {
// // // // // // // //                   Navigator.push(
// // // // // // // //                     context,
// // // // // // // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // // // // // // //                   );
// // // // // // // //                 },
// // // // // // // //               ),
// // // // // // // //               const Spacer(),
// // // // // // // //               const Divider(),
// // // // // // // //               ListTile(
// // // // // // // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // // // // // // //                 title: const Text(
// // // // // // // //                   "Logout",
// // // // // // // //                   style: TextStyle(color: Colors.red),
// // // // // // // //                 ),
// // // // // // // //                 onTap: () async {
// // // // // // // //                   Navigator.pop(context); // Close drawer
// // // // // // // //                   await handleLogout(context); // Logout
// // // // // // // //                 },
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       body: pages[selectedIndex],
// // // // // // // //       floatingActionButton: selectedIndex == 0
// // // // // // // //           ? FloatingActionButton(
// // // // // // // //               backgroundColor: Colors.orange,
// // // // // // // //               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
// // // // // // // //               onPressed: () {
// // // // // // // //                 showModalBottomSheet(
// // // // // // // //                   context: context,
// // // // // // // //                   shape: const RoundedRectangleBorder(
// // // // // // // //                     borderRadius: BorderRadius.vertical(
// // // // // // // //                       top: Radius.circular(20),
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                   builder: (context) {
// // // // // // // //                     return Container(
// // // // // // // //                       padding: const EdgeInsets.all(20),
// // // // // // // //                       child: Column(
// // // // // // // //                         mainAxisSize: MainAxisSize.min,
// // // // // // // //                         children: [
// // // // // // // //                           const Text(
// // // // // // // //                             "How are you feeling?",
// // // // // // // //                             style: TextStyle(
// // // // // // // //                               fontSize: 18,
// // // // // // // //                               fontWeight: FontWeight.bold,
// // // // // // // //                             ),
// // // // // // // //                           ),
// // // // // // // //                           const SizedBox(height: 16),
// // // // // // // //                           Wrap(
// // // // // // // //                             spacing: 16,
// // // // // // // //                             runSpacing: 12,
// // // // // // // //                             children: [
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "🙂",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "🙂"),
// // // // // // // //                               ),
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "😢",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "😢"),
// // // // // // // //                               ),
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "😡",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "😡"),
// // // // // // // //                               ),
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "😴",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "😴"),
// // // // // // // //                               ),
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "😍",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "😍"),
// // // // // // // //                               ),
// // // // // // // //                               _MoodEmoji(
// // // // // // // //                                 emoji: "😌",
// // // // // // // //                                 label: "",
// // // // // // // //                                 onTap: () =>
// // // // // // // //                                     setState(() => selectedMood = "😌"),
// // // // // // // //                               ),
// // // // // // // //                             ],
// // // // // // // //                           ),
// // // // // // // //                         ],
// // // // // // // //                       ),
// // // // // // // //                     );
// // // // // // // //                   },
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             )
// // // // // // // //           : null,
// // // // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // // // //       bottomNavigationBar: UserBottomNavBar(
// // // // // // // //       selectedIndex: selectedIndex,
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // // --- Helper Widgets ---
// // // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // // //   final String emoji;
// // // // // // // //   final String label;
// // // // // // // //   final VoidCallback onTap;

// // // // // // // //   const _MoodEmoji({
// // // // // // // //     required this.emoji,
// // // // // // // //     required this.label,
// // // // // // // //     required this.onTap,
// // // // // // // //   });

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return GestureDetector(
// // // // // // // //       onTap: () {
// // // // // // // //         onTap();
// // // // // // // //         Navigator.pop(context);
// // // // // // // //       },
// // // // // // // //       child: Column(
// // // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // // //         children: [
// // // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // // //           const SizedBox(height: 4),
// // // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // // //   final String text;
// // // // // // // //   final String icon;
// // // // // // // //   final List<Color> colors;

// // // // // // // //   const _MotivationCard({
// // // // // // // //     required this.text,
// // // // // // // //     required this.icon,
// // // // // // // //     required this.colors,
// // // // // // // //   });

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Container(
// // // // // // // //       width: 280,
// // // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // // //       decoration: BoxDecoration(
// // // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // // //         gradient: LinearGradient(
// // // // // // // //           colors: colors,
// // // // // // // //           begin: Alignment.topLeft,
// // // // // // // //           end: Alignment.bottomRight,
// // // // // // // //         ),
// // // // // // // //         boxShadow: [
// // // // // // // //           BoxShadow(
// // // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // // //             blurRadius: 8,
// // // // // // // //             offset: const Offset(0, 4),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //       child: Padding(
// // // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // // //         child: Row(
// // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // //           children: [
// // // // // // // //             CircleAvatar(
// // // // // // // //               radius: 32,
// // // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(width: 16),
// // // // // // // //             Expanded(
// // // // // // // //               child: Text(
// // // // // // // //                 text,
// // // // // // // //                 style: const TextStyle(
// // // // // // // //                   color: Colors.white,
// // // // // // // //                   fontSize: 17,
// // // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // // //                   height: 1.4,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // // //   final IconData icon;
// // // // // // // //   final String label;
// // // // // // // //   final Color color;
// // // // // // // //   final VoidCallback onTap;

// // // // // // // //   const _FeatureRoundButton({
// // // // // // // //     required this.icon,
// // // // // // // //     required this.label,
// // // // // // // //     required this.color,
// // // // // // // //     required this.onTap,
// // // // // // // //   });

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return InkWell(
// // // // // // // //       onTap: onTap,
// // // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // // //       child: Container(
// // // // // // // //         width: 150,
// // // // // // // //         decoration: BoxDecoration(
// // // // // // // //           color: color.withOpacity(0.6),
// // // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // // //         ),
// // // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // // //         child: Column(
// // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // //           children: [
// // // // // // // //             CircleAvatar(
// // // // // // // //               radius: 28,
// // // // // // // //               backgroundColor: color,
// // // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 10),
// // // // // // // //             Text(
// // // // // // // //               label,
// // // // // // // //               textAlign: TextAlign.center,
// // // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // // import 'dart:convert';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
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
// // // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // // import 'package:mentalwellapp/controller/LoginController.dart';

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

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // // //     _fetchUserData();
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
// // // // // // //       print("Error fetching user data: $e");
// // // // // // //     }
// // // // // // //   }

// // // // // // //   // ImageProvider getProfileImage() {
// // // // // // //   //   if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
// // // // // // //   //     final bytes = base64Decode(profileImageBase64!);
// // // // // // //   //     return MemoryImage(bytes);
// // // // // // //   //   } else {
// // // // // // //   //     return const AssetImage("assets/images/default_user.png");
// // // // // // //   //   }
// // // // // // //   // }

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
// // // // // // //       print("Profile image decode error: $e");
// // // // // // //     }

// // // // // // //     // ✅ CORRECT fallback
// // // // // // //     return const AssetImage("assets/default_profile.jpg");
// // // // // // //   }

// // // // // // //   Future<void> handleLogout(BuildContext context) async {
// // // // // // //     final loginController = LoginController();

// // // // // // //     // Sign out from Firebase
// // // // // // //     await FirebaseAuth.instance.signOut();

// // // // // // //     // Clear saved login data
// // // // // // //     await loginController.clearSharedPref();

// // // // // // //     // Navigate back to LoginPage
// // // // // // //     Navigator.pushAndRemoveUntil(
// // // // // // //       context,
// // // // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // // // //       (route) => false,
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final List<Widget> pages = [
// // // // // // //       SafeArea(
// // // // // // //         child: SingleChildScrollView(
// // // // // // //           child: Column(
// // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //             children: [
// // // // // // //               const SizedBox(height: 12),
// // // // // // //               const UserHomeMotivationSection(),

// // // // // // //               Padding(
// // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // //                   horizontal: 16,
// // // // // // //                   vertical: 16,
// // // // // // //                 ),
// // // // // // //                 child: Wrap(
// // // // // // //                   spacing: 16,
// // // // // // //                   runSpacing: 16,
// // // // // // //                   children: [
// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // // //                       label: "  Talk to Me  ",
// // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),

// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.health_and_safety,
// // // // // // //                       label: "  Wellness Hub  ",
// // // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // // //                       onTap: () {
// // // // // // //                         showModalBottomSheet(
// // // // // // //                           context: context,
// // // // // // //                           shape: const RoundedRectangleBorder(
// // // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // // //                               top: Radius.circular(20),
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                           builder: (context) {
// // // // // // //                             return Container(
// // // // // // //                               padding: const EdgeInsets.all(16),
// // // // // // //                               child: Wrap(
// // // // // // //                                 spacing: 16,
// // // // // // //                                 runSpacing: 16,
// // // // // // //                                 children: [
// // // // // // //                                   _FeatureRoundButton(
// // // // // // //                                     icon: Icons.spa,
// // // // // // //                                     label: "  Self-Care  ",
// // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // //                                     onTap: () {
// // // // // // //                                       Navigator.push(
// // // // // // //                                         context,
// // // // // // //                                         MaterialPageRoute(
// // // // // // //                                           builder: (_) =>
// // // // // // //                                               const DailyWellnessPage(),
// // // // // // //                                         ),
// // // // // // //                                       );
// // // // // // //                                     },
// // // // // // //                                   ),
// // // // // // //                                   _FeatureRoundButton(
// // // // // // //                                     icon: Icons.fitness_center,
// // // // // // //                                     label: "  Exercise  ",
// // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // //                                     onTap: () {
// // // // // // //                                       Navigator.push(
// // // // // // //                                         context,
// // // // // // //                                         MaterialPageRoute(
// // // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // // //                                         ),
// // // // // // //                                       );
// // // // // // //                                     },
// // // // // // //                                   ),
// // // // // // //                                   _FeatureRoundButton(
// // // // // // //                                     icon: Icons.healing,
// // // // // // //                                     label: "  Healing  ",
// // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // //                                     onTap: () {
// // // // // // //                                       Navigator.push(
// // // // // // //                                         context,
// // // // // // //                                         MaterialPageRoute(
// // // // // // //                                           builder: (_) =>
// // // // // // //                                               const StressManagementPage(),
// // // // // // //                                         ),
// // // // // // //                                       );
// // // // // // //                                     },
// // // // // // //                                   ),
// // // // // // //                                   _FeatureRoundButton(
// // // // // // //                                     icon: Icons.bedtime,
// // // // // // //                                     label: "  Sleep  ",
// // // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // // //                                     onTap: () {
// // // // // // //                                       Navigator.push(
// // // // // // //                                         context,
// // // // // // //                                         MaterialPageRoute(
// // // // // // //                                           builder: (_) =>
// // // // // // //                                               const SleepRelaxationPage(),
// // // // // // //                                         ),
// // // // // // //                                       );
// // // // // // //                                     },
// // // // // // //                                   ),
// // // // // // //                                 ],
// // // // // // //                               ),
// // // // // // //                             );
// // // // // // //                           },
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),

// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.menu_book_rounded,
// // // // // // //                       label: "  Guide  ",
// // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.mood,
// // // // // // //                       label: "  Mood Tracker  ",
// // // // // // //                       color: const Color(0xFFFFCE70),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.favorite,
// // // // // // //                       label: "  Relationship Advice  ",
// // // // // // //                       color: const Color(0xFF6DD47E),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                     _FeatureRoundButton(
// // // // // // //                       icon: Icons.psychology,
// // // // // // //                       label: "  Expert Advice  ",
// // // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // // //                       onTap: () {
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       const Center(child: Text("Explore Page")),
// // // // // // //       const Center(child: Text("Book Page")),
// // // // // // //       const Center(child: Text("Profile Page")),
// // // // // // //     ];

// // // // // // //     return Scaffold(
// // // // // // //       backgroundColor: kCard,
// // // // // // //       appBar: AppBar(
// // // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // // //         centerTitle: false,
// // // // // // //         title: Column(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //           children: [
// // // // // // //             Text(
// // // // // // //               "Hello $username",
// // // // // // //               style: const TextStyle(
// // // // // // //                 color: Colors.black,
// // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // //                 fontSize: 18,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const Text(
// // // // // // //               "How are you feeling today?",
// // // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         actions: [
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       drawer: Drawer(
// // // // // // //         backgroundColor: kCard,
// // // // // // //         child: SafeArea(
// // // // // // //           child: Column(
// // // // // // //             children: [
// // // // // // //               UserAccountsDrawerHeader(
// // // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // // //                   radius: 30,
// // // // // // //                   backgroundImage: getProfileImage(),
// // // // // // //                 ),
// // // // // // //                 accountName: Text(
// // // // // // //                   username,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // //                     fontSize: 18,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 accountEmail: const Text("Active User"),
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // // //                 title: const Text("Dashboard"),
// // // // // // //                 onTap: () {
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(
// // // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
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
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //               ListTile(
// // // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
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
// // // // // // //                   Navigator.pop(context); // Close drawer
// // // // // // //                   await handleLogout(context); // Logout
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       body: pages[selectedIndex],
// // // // // // //       floatingActionButton: selectedIndex == 0
// // // // // // //           ? FloatingActionButton(
// // // // // // //               backgroundColor: Colors.orange,
// // // // // // //               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
// // // // // // //               onPressed: () {
// // // // // // //                 showModalBottomSheet(
// // // // // // //                   context: context,
// // // // // // //                   shape: const RoundedRectangleBorder(
// // // // // // //                     borderRadius: BorderRadius.vertical(
// // // // // // //                       top: Radius.circular(20),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   builder: (context) {
// // // // // // //                     return Container(
// // // // // // //                       padding: const EdgeInsets.all(20),
// // // // // // //                       child: Column(
// // // // // // //                         mainAxisSize: MainAxisSize.min,
// // // // // // //                         children: [
// // // // // // //                           const Text(
// // // // // // //                             "How are you feeling?",
// // // // // // //                             style: TextStyle(
// // // // // // //                               fontSize: 18,
// // // // // // //                               fontWeight: FontWeight.bold,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                           const SizedBox(height: 16),
// // // // // // //                           Wrap(
// // // // // // //                             spacing: 16,
// // // // // // //                             runSpacing: 12,
// // // // // // //                             children: [
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "🙂",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "🙂"),
// // // // // // //                               ),
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "😢",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "😢"),
// // // // // // //                               ),
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "😡",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "😡"),
// // // // // // //                               ),
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "😴",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "😴"),
// // // // // // //                               ),
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "😍",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "😍"),
// // // // // // //                               ),
// // // // // // //                               _MoodEmoji(
// // // // // // //                                 emoji: "😌",
// // // // // // //                                 label: "",
// // // // // // //                                 onTap: () =>
// // // // // // //                                     setState(() => selectedMood = "😌"),
// // // // // // //                               ),
// // // // // // //                             ],
// // // // // // //                           ),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                     );
// // // // // // //                   },
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             )
// // // // // // //           : null,
// // // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // // --- Helper Widgets ---
// // // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // // //   final String emoji;
// // // // // // //   final String label;
// // // // // // //   final VoidCallback onTap;

// // // // // // //   const _MoodEmoji({
// // // // // // //     required this.emoji,
// // // // // // //     required this.label,
// // // // // // //     required this.onTap,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () {
// // // // // // //         onTap();
// // // // // // //         Navigator.pop(context);
// // // // // // //       },
// // // // // // //       child: Column(
// // // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // // //         children: [
// // // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // // //           const SizedBox(height: 4),
// // // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class _MotivationCard extends StatelessWidget {
// // // // // // //   final String text;
// // // // // // //   final String icon;
// // // // // // //   final List<Color> colors;

// // // // // // //   const _MotivationCard({
// // // // // // //     required this.text,
// // // // // // //     required this.icon,
// // // // // // //     required this.colors,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       width: 280,
// // // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // // //         gradient: LinearGradient(
// // // // // // //           colors: colors,
// // // // // // //           begin: Alignment.topLeft,
// // // // // // //           end: Alignment.bottomRight,
// // // // // // //         ),
// // // // // // //         boxShadow: [
// // // // // // //           BoxShadow(
// // // // // // //             color: colors.last.withOpacity(0.4),
// // // // // // //             blurRadius: 8,
// // // // // // //             offset: const Offset(0, 4),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       child: Padding(
// // // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // // //         child: Row(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // //           children: [
// // // // // // //             CircleAvatar(
// // // // // // //               radius: 32,
// // // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // // //             ),
// // // // // // //             const SizedBox(width: 16),
// // // // // // //             Expanded(
// // // // // // //               child: Text(
// // // // // // //                 text,
// // // // // // //                 style: const TextStyle(
// // // // // // //                   color: Colors.white,
// // // // // // //                   fontSize: 17,
// // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // //                   height: 1.4,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // // //   final IconData icon;
// // // // // // //   final String label;
// // // // // // //   final Color color;
// // // // // // //   final VoidCallback onTap;

// // // // // // //   const _FeatureRoundButton({
// // // // // // //     required this.icon,
// // // // // // //     required this.label,
// // // // // // //     required this.color,
// // // // // // //     required this.onTap,
// // // // // // //   });

// // // // // // //   Widget _buildMotivationCards() {
// // // // // // //     return SizedBox(
// // // // // // //       height: 180,
// // // // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // // //         stream: FirebaseFirestore.instance
// // // // // // //             .collection('motivation_cards')
// // // // // // //             .where('isActive', isEqualTo: true)
// // // // // // //             .orderBy('order')
// // // // // // //             .snapshots(),
// // // // // // //         builder: (context, snapshot) {
// // // // // // //           if (snapshot.hasError) {
// // // // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // // // //           }

// // // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // //             return const Center(child: CircularProgressIndicator());
// // // // // // //           }

// // // // // // //           final docs = snapshot.data?.docs ?? [];

// // // // // // //           if (docs.isEmpty) {
// // // // // // //             return const Center(
// // // // // // //               child: Text(
// // // // // // //                 "No motivation cards yet",
// // // // // // //                 style: TextStyle(color: Colors.white),
// // // // // // //               ),
// // // // // // //             );
// // // // // // //           }

// // // // // // //           return ListView.builder(
// // // // // // //             scrollDirection: Axis.horizontal,
// // // // // // //             physics: const BouncingScrollPhysics(),
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // //             itemCount: docs.length,
// // // // // // //             itemBuilder: (context, index) {
// // // // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // // // //               final docId = docs[index].id;

// // // // // // //               return _MotivationCard(
// // // // // // //                 text: data['text'] ?? '',
// // // // // // //                 icon: data['icon'] ?? '🙂',
// // // // // // //                 colors: [
// // // // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // // // //                 ],
// // // // // // //               );
// // // // // // //             },
// // // // // // //           );
// // // // // // //         },
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return InkWell(
// // // // // // //       onTap: onTap,
// // // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // // //       child: Container(
// // // // // // //         width: 150,
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: color.withOpacity(0.6),
// // // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // // //         ),
// // // // // // //         padding: const EdgeInsets.all(20),
// // // // // // //         child: Column(
// // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //           children: [
// // // // // // //             CircleAvatar(
// // // // // // //               radius: 28,
// // // // // // //               backgroundColor: color,
// // // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 10),
// // // // // // //             Text(
// // // // // // //               label,
// // // // // // //               textAlign: TextAlign.center,
// // // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // // import 'dart:convert';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
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
// // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

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

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // // //     _fetchUserData();
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
// // // // // //       print("Error fetching user data: $e");
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
// // // // // //       print("Profile image decode error: $e");
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

// // // // // //   void _onBottomNavTapped(int index) {
// // // // // //     setState(() {
// // // // // //       selectedIndex = index;
// // // // // //     });

// // // // // //     if (index == 1) {
// // // // // //       // Chatbot
// // // // // //       Navigator.push(
// // // // // //         context,
// // // // // //         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // // // // //       );
// // // // // //     } else if (index == 2) {
// // // // // //       // Emergency
// // // // // //       Navigator.push(
// // // // // //         context,
// // // // // //         MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // //       );
// // // // // //     }
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final List<Widget> pages = [
// // // // // //       SafeArea(
// // // // // //         child: SingleChildScrollView(
// // // // // //           child: Column(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               const SizedBox(height: 12),
// // // // // //               const UserHomeMotivationSection(),

// // // // // //               Padding(
// // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // //                   horizontal: 16,
// // // // // //                   vertical: 16,
// // // // // //                 ),
// // // // // //                 child: Wrap(
// // // // // //                   spacing: 16,
// // // // // //                   runSpacing: 16,
// // // // // //                   children: [
// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.chat_bubble_rounded,
// // // // // //                       label: "  Talk to Me  ",
// // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const ChatBotPage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),

// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.health_and_safety,
// // // // // //                       label: "  Wellness Hub  ",
// // // // // //                       color: const Color(0xFFF6A7C1),
// // // // // //                       onTap: () {
// // // // // //                         showModalBottomSheet(
// // // // // //                           context: context,
// // // // // //                           shape: const RoundedRectangleBorder(
// // // // // //                             borderRadius: BorderRadius.vertical(
// // // // // //                               top: Radius.circular(20),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                           builder: (context) {
// // // // // //                             return Container(
// // // // // //                               padding: const EdgeInsets.all(16),
// // // // // //                               child: Wrap(
// // // // // //                                 spacing: 16,
// // // // // //                                 runSpacing: 16,
// // // // // //                                 children: [
// // // // // //                                   _FeatureRoundButton(
// // // // // //                                     icon: Icons.spa,
// // // // // //                                     label: "  Self-Care  ",
// // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // //                                     onTap: () {
// // // // // //                                       Navigator.push(
// // // // // //                                         context,
// // // // // //                                         MaterialPageRoute(
// // // // // //                                           builder: (_) =>
// // // // // //                                               const DailyWellnessPage(),
// // // // // //                                         ),
// // // // // //                                       );
// // // // // //                                     },
// // // // // //                                   ),
// // // // // //                                   _FeatureRoundButton(
// // // // // //                                     icon: Icons.fitness_center,
// // // // // //                                     label: "  Exercise  ",
// // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // //                                     onTap: () {
// // // // // //                                       Navigator.push(
// // // // // //                                         context,
// // // // // //                                         MaterialPageRoute(
// // // // // //                                           builder: (_) => const ExercisePage(),
// // // // // //                                         ),
// // // // // //                                       );
// // // // // //                                     },
// // // // // //                                   ),
// // // // // //                                   _FeatureRoundButton(
// // // // // //                                     icon: Icons.healing,
// // // // // //                                     label: "  Healing  ",
// // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // //                                     onTap: () {
// // // // // //                                       Navigator.push(
// // // // // //                                         context,
// // // // // //                                         MaterialPageRoute(
// // // // // //                                           builder: (_) =>
// // // // // //                                               const StressManagementPage(),
// // // // // //                                         ),
// // // // // //                                       );
// // // // // //                                     },
// // // // // //                                   ),
// // // // // //                                   _FeatureRoundButton(
// // // // // //                                     icon: Icons.bedtime,
// // // // // //                                     label: "  Sleep  ",
// // // // // //                                     color: const Color(0xFFF6A7C1),
// // // // // //                                     onTap: () {
// // // // // //                                       Navigator.push(
// // // // // //                                         context,
// // // // // //                                         MaterialPageRoute(
// // // // // //                                           builder: (_) =>
// // // // // //                                               const SleepRelaxationPage(),
// // // // // //                                         ),
// // // // // //                                       );
// // // // // //                                     },
// // // // // //                                   ),
// // // // // //                                 ],
// // // // // //                               ),
// // // // // //                             );
// // // // // //                           },
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),

// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.menu_book_rounded,
// // // // // //                       label: "  Guide  ",
// // // // // //                       color: const Color(0xFF6DD47E),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.mood,
// // // // // //                       label: "  Mood Tracker  ",
// // // // // //                       color: const Color(0xFFFFCE70),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.favorite,
// // // // // //                       label: "  Relationship Advice  ",
// // // // // //                       color: const Color(0xFF6DD47E),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(
// // // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                     _FeatureRoundButton(
// // // // // //                       icon: Icons.psychology,
// // // // // //                       label: "  Expert Advice  ",
// // // // // //                       color: const Color(0xFFA7B8F6),
// // // // // //                       onTap: () {
// // // // // //                         Navigator.push(
// // // // // //                           context,
// // // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // // //                         );
// // // // // //                       },
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //       const Center(child: Text("Explore Page")),
// // // // // //       const Center(child: Text("Book Page")),
// // // // // //       const Center(child: Text("Profile Page")),
// // // // // //     ];

// // // // // //     return Scaffold(
// // // // // //       backgroundColor: kCard,
// // // // // //       appBar: AppBar(
// // // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // // //         centerTitle: false,
// // // // // //         title: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               "Hello $username",
// // // // // //               style: const TextStyle(
// // // // // //                 color: Colors.black,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //                 fontSize: 18,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const Text(
// // // // // //               "How are you feeling today?",
// // // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         actions: [
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.only(right: 12),
// // // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       drawer: Drawer(
// // // // // //         backgroundColor: kCard,
// // // // // //         child: SafeArea(
// // // // // //           child: Column(
// // // // // //             children: [
// // // // // //               UserAccountsDrawerHeader(
// // // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // // //                 currentAccountPicture: CircleAvatar(
// // // // // //                   radius: 30,
// // // // // //                   backgroundImage: getProfileImage(),
// // // // // //                 ),
// // // // // //                 accountName: Text(
// // // // // //                   username,
// // // // // //                   style: const TextStyle(
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     fontSize: 18,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 accountEmail: const Text("Active User"),
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // // //                 title: const Text("Dashboard"),
// // // // // //                 onTap: () {
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(
// // // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.notifications, color: kDark),
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
// // // // // //                   Navigator.push(
// // // // // //                     context,
// // // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //               ListTile(
// // // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
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
// // // // // //       floatingActionButton: FloatingActionButton(
// // // // // //         backgroundColor: Colors.redAccent,
// // // // // //         child: const Icon(Icons.warning, size: 30, color: Colors.white),
// // // // // //         onPressed: () {
// // // // // //           Navigator.push(
// // // // // //             context,
// // // // // //             MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // // //           );
// // // // // //         },
// // // // // //       ),
// // // // // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // --- Helper Widgets ---
// // // // // // class _MoodEmoji extends StatelessWidget {
// // // // // //   final String emoji;
// // // // // //   final String label;
// // // // // //   final VoidCallback onTap;

// // // // // //   const _MoodEmoji({
// // // // // //     required this.emoji,
// // // // // //     required this.label,
// // // // // //     required this.onTap,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () {
// // // // // //         onTap();
// // // // // //         Navigator.pop(context);
// // // // // //       },
// // // // // //       child: Column(
// // // // // //         mainAxisSize: MainAxisSize.min,
// // // // // //         children: [
// // // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // // //           const SizedBox(height: 4),
// // // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class _MotivationCard extends StatelessWidget {
// // // // // //   final String text;
// // // // // //   final String icon;
// // // // // //   final List<Color> colors;

// // // // // //   const _MotivationCard({
// // // // // //     required this.text,
// // // // // //     required this.icon,
// // // // // //     required this.colors,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       width: 280,
// // // // // //       margin: const EdgeInsets.only(right: 16),
// // // // // //       decoration: BoxDecoration(
// // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // //         gradient: LinearGradient(
// // // // // //           colors: colors,
// // // // // //           begin: Alignment.topLeft,
// // // // // //           end: Alignment.bottomRight,
// // // // // //         ),
// // // // // //         boxShadow: [
// // // // // //           BoxShadow(
// // // // // //             color: colors.last.withOpacity(0.4),
// // // // // //             blurRadius: 8,
// // // // // //             offset: const Offset(0, 4),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       child: Padding(
// // // // // //         padding: const EdgeInsets.all(20.0),
// // // // // //         child: Row(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //           children: [
// // // // // //             CircleAvatar(
// // // // // //               radius: 32,
// // // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // // //             ),
// // // // // //             const SizedBox(width: 16),
// // // // // //             Expanded(
// // // // // //               child: Text(
// // // // // //                 text,
// // // // // //                 style: const TextStyle(
// // // // // //                   color: Colors.white,
// // // // // //                   fontSize: 17,
// // // // // //                   fontWeight: FontWeight.w600,
// // // // // //                   height: 1.4,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // // //   final IconData icon;
// // // // // //   final String label;
// // // // // //   final Color color;
// // // // // //   final VoidCallback onTap;

// // // // // //   const _FeatureRoundButton({
// // // // // //     required this.icon,
// // // // // //     required this.label,
// // // // // //     required this.color,
// // // // // //     required this.onTap,
// // // // // //   });

// // // // // //   Widget _buildMotivationCards() {
// // // // // //     return SizedBox(
// // // // // //       height: 180,
// // // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // // //         stream: FirebaseFirestore.instance
// // // // // //             .collection('motivation_cards')
// // // // // //             .where('isActive', isEqualTo: true)
// // // // // //             .orderBy('order')
// // // // // //             .snapshots(),
// // // // // //         builder: (context, snapshot) {
// // // // // //           if (snapshot.hasError) {
// // // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // // //           }

// // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // //             return const Center(child: CircularProgressIndicator());
// // // // // //           }

// // // // // //           final docs = snapshot.data?.docs ?? [];

// // // // // //           if (docs.isEmpty) {
// // // // // //             return const Center(
// // // // // //               child: Text(
// // // // // //                 "No motivation cards yet",
// // // // // //                 style: TextStyle(color: Colors.white),
// // // // // //               ),
// // // // // //             );
// // // // // //           }

// // // // // //           return ListView.builder(
// // // // // //             scrollDirection: Axis.horizontal,
// // // // // //             physics: const BouncingScrollPhysics(),
// // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // //             itemCount: docs.length,
// // // // // //             itemBuilder: (context, index) {
// // // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // // //               final docId = docs[index].id;

// // // // // //               return _MotivationCard(
// // // // // //                 text: data['text'] ?? '',
// // // // // //                 icon: data['icon'] ?? '🙂',
// // // // // //                 colors: [
// // // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // // //                 ],
// // // // // //               );
// // // // // //             },
// // // // // //           );
// // // // // //         },
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return InkWell(
// // // // // //       onTap: onTap,
// // // // // //       borderRadius: BorderRadius.circular(22),
// // // // // //       child: Container(
// // // // // //         width: 150,
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: color.withOpacity(0.6),
// // // // // //           borderRadius: BorderRadius.circular(22),
// // // // // //         ),
// // // // // //         padding: const EdgeInsets.all(20),
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             CircleAvatar(
// // // // // //               radius: 28,
// // // // // //               backgroundColor: color,
// // // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // // //             ),
// // // // // //             const SizedBox(height: 10),
// // // // // //             Text(
// // // // // //               label,
// // // // // //               textAlign: TextAlign.center,
// // // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // // // import 'dart:convert';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // // // //     hide kCard, kPrimary;
// // // // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // // // import 'package:mentalwellapp/view/WIDGETS/user_home_motivation_section.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

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

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // // // //     _fetchUserData();
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
// // // // //       print("Error fetching user data: $e");
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
// // // // //       print("Profile image decode error: $e");
// // // // //     }

// // // // //     return const AssetImage("assets/default_profile.jpg");
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

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final List<Widget> pages = [
// // // // //       SafeArea(
// // // // //         child: SingleChildScrollView(
// // // // //           child: Column(
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               const SizedBox(height: 12),
// // // // //               const UserHomeMotivationSection(),

// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.symmetric(
// // // // //                   horizontal: 16,
// // // // //                   vertical: 16,
// // // // //                 ),
// // // // //                 child: Wrap(
// // // // //                   spacing: 16,
// // // // //                   runSpacing: 16,
// // // // //                   children: [
// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.chat_bubble_rounded,
// // // // //                       label: "  Talk to Me  ",
// // // // //                       color: const Color(0xFFA7B8F6),
// // // // //                       onTap: () {
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const ChatBotPage(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),

// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.health_and_safety,
// // // // //                       label: "  Wellness Hub  ",
// // // // //                       color: const Color(0xFFF6A7C1),
// // // // //                       onTap: () {
// // // // //                         showModalBottomSheet(
// // // // //                           context: context,
// // // // //                           shape: const RoundedRectangleBorder(
// // // // //                             borderRadius: BorderRadius.vertical(
// // // // //                               top: Radius.circular(20),
// // // // //                             ),
// // // // //                           ),
// // // // //                           builder: (context) {
// // // // //                             return Container(
// // // // //                               padding: const EdgeInsets.all(16),
// // // // //                               child: Wrap(
// // // // //                                 spacing: 16,
// // // // //                                 runSpacing: 16,
// // // // //                                 children: [
// // // // //                                   _FeatureRoundButton(
// // // // //                                     icon: Icons.spa,
// // // // //                                     label: "  Self-Care  ",
// // // // //                                     color: const Color(0xFFF6A7C1),
// // // // //                                     onTap: () {
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (_) =>
// // // // //                                               const DailyWellnessPage(),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   _FeatureRoundButton(
// // // // //                                     icon: Icons.fitness_center,
// // // // //                                     label: "  Exercise  ",
// // // // //                                     color: const Color(0xFFF6A7C1),
// // // // //                                     onTap: () {
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (_) => const ExercisePage(),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   _FeatureRoundButton(
// // // // //                                     icon: Icons.healing,
// // // // //                                     label: "  Healing  ",
// // // // //                                     color: const Color(0xFFF6A7C1),
// // // // //                                     onTap: () {
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (_) =>
// // // // //                                               const StressManagementPage(),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   _FeatureRoundButton(
// // // // //                                     icon: Icons.bedtime,
// // // // //                                     label: "  Sleep  ",
// // // // //                                     color: const Color(0xFFF6A7C1),
// // // // //                                     onTap: () {
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (_) =>
// // // // //                                               const SleepRelaxationPage(),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                 ],
// // // // //                               ),
// // // // //                             );
// // // // //                           },
// // // // //                         );
// // // // //                       },
// // // // //                     ),

// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.menu_book_rounded,
// // // // //                       label: "  Guide  ",
// // // // //                       color: const Color(0xFF6DD47E),
// // // // //                       onTap: () {
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const SpiritualWisdomApp(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.mood,
// // // // //                       label: "  Mood Tracker  ",
// // // // //                       color: const Color(0xFFFFCE70),
// // // // //                       onTap: () {
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const MoodTrackerPage(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.favorite,
// // // // //                       label: "  Relationship Advice  ",
// // // // //                       color: const Color(0xFF6DD47E),
// // // // //                       onTap: () {
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(
// // // // //                             builder: (_) => const RelationshipAdvicePage(),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                     _FeatureRoundButton(
// // // // //                       icon: Icons.psychology,
// // // // //                       label: "  Expert Advice  ",
// // // // //                       color: const Color(0xFFA7B8F6),
// // // // //                       onTap: () {
// // // // //                         Navigator.push(
// // // // //                           context,
// // // // //                           MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // // // //                         );
// // // // //                       },
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       const Center(child: Text("Explore Page")),
// // // // //       const Center(child: Text("Book Page")),
// // // // //       const Center(child: Text("Profile Page")),
// // // // //     ];

// // // // //     return Scaffold(
// // // // //       backgroundColor: kCard,
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
// // // // //         iconTheme: const IconThemeData(color: kDark),
// // // // //         centerTitle: false,
// // // // //         title: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             Text(
// // // // //               "Hello $username",
// // // // //               style: const TextStyle(
// // // // //                 color: Colors.black,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //                 fontSize: 18,
// // // // //               ),
// // // // //             ),
// // // // //             const Text(
// // // // //               "How are you feeling today?",
// // // // //               style: TextStyle(color: Colors.black54, fontSize: 13),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         actions: [
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.only(right: 12),
// // // // //             child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       drawer: Drawer(
// // // // //         backgroundColor: kCard,
// // // // //         child: SafeArea(
// // // // //           child: Column(
// // // // //             children: [
// // // // //               UserAccountsDrawerHeader(
// // // // //                 decoration: const BoxDecoration(color: kPrimary),
// // // // //                 currentAccountPicture: CircleAvatar(
// // // // //                   radius: 30,
// // // // //                   backgroundImage: getProfileImage(),
// // // // //                 ),
// // // // //                 accountName: Text(
// // // // //                   username,
// // // // //                   style: const TextStyle(
// // // // //                     fontWeight: FontWeight.bold,
// // // // //                     fontSize: 18,
// // // // //                   ),
// // // // //                 ),
// // // // //                 accountEmail: const Text("Active User"),
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // // // //                 title: const Text("Dashboard"),
// // // // //                 onTap: () {
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(
// // // // //                       builder: (_) => const DashboardPage(username: ''),
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.notifications, color: kDark),
// // // // //                 title: const Text("Notifications"),
// // // // //                 onTap: () {
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(
// // // // //                       builder: (_) => const NotificationsPage(),
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // // // //                 title: const Text("Emergency"),
// // // // //                 onTap: () {
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //               ListTile(
// // // // //                 leading: const Icon(Icons.help_outline, color: kDark),
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
// // // // //       // ✅ REMOVED floatingActionButton - No more floating emergency button
// // // // //       bottomNavigationBar: UserBottomNavBar(selectedIndex: selectedIndex),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // --- Helper Widgets ---
// // // // // class _MoodEmoji extends StatelessWidget {
// // // // //   final String emoji;
// // // // //   final String label;
// // // // //   final VoidCallback onTap;

// // // // //   const _MoodEmoji({
// // // // //     required this.emoji,
// // // // //     required this.label,
// // // // //     required this.onTap,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return GestureDetector(
// // // // //       onTap: () {
// // // // //         onTap();
// // // // //         Navigator.pop(context);
// // // // //       },
// // // // //       child: Column(
// // // // //         mainAxisSize: MainAxisSize.min,
// // // // //         children: [
// // // // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // // // //           const SizedBox(height: 4),
// // // // //           Text(label, style: const TextStyle(fontSize: 14)),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _MotivationCard extends StatelessWidget {
// // // // //   final String text;
// // // // //   final String icon;
// // // // //   final List<Color> colors;

// // // // //   const _MotivationCard({
// // // // //     required this.text,
// // // // //     required this.icon,
// // // // //     required this.colors,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       width: 280,
// // // // //       margin: const EdgeInsets.only(right: 16),
// // // // //       decoration: BoxDecoration(
// // // // //         borderRadius: BorderRadius.circular(22),
// // // // //         gradient: LinearGradient(
// // // // //           colors: colors,
// // // // //           begin: Alignment.topLeft,
// // // // //           end: Alignment.bottomRight,
// // // // //         ),
// // // // //         boxShadow: [
// // // // //           BoxShadow(
// // // // //             color: colors.last.withOpacity(0.4),
// // // // //             blurRadius: 8,
// // // // //             offset: const Offset(0, 4),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Padding(
// // // // //         padding: const EdgeInsets.all(20.0),
// // // // //         child: Row(
// // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // //           children: [
// // // // //             CircleAvatar(
// // // // //               radius: 32,
// // // // //               backgroundColor: Colors.white.withOpacity(0.25),
// // // // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // // // //             ),
// // // // //             const SizedBox(width: 16),
// // // // //             Expanded(
// // // // //               child: Text(
// // // // //                 text,
// // // // //                 style: const TextStyle(
// // // // //                   color: Colors.white,
// // // // //                   fontSize: 17,
// // // // //                   fontWeight: FontWeight.w600,
// // // // //                   height: 1.4,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _FeatureRoundButton extends StatelessWidget {
// // // // //   final IconData icon;
// // // // //   final String label;
// // // // //   final Color color;
// // // // //   final VoidCallback onTap;

// // // // //   const _FeatureRoundButton({
// // // // //     required this.icon,
// // // // //     required this.label,
// // // // //     required this.color,
// // // // //     required this.onTap,
// // // // //   });

// // // // //   Widget _buildMotivationCards() {
// // // // //     return SizedBox(
// // // // //       height: 180,
// // // // //       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // //         stream: FirebaseFirestore.instance
// // // // //             .collection('motivation_cards')
// // // // //             .where('isActive', isEqualTo: true)
// // // // //             .orderBy('order')
// // // // //             .snapshots(),
// // // // //         builder: (context, snapshot) {
// // // // //           if (snapshot.hasError) {
// // // // //             return Center(child: Text("Error: ${snapshot.error}"));
// // // // //           }

// // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // //             return const Center(child: CircularProgressIndicator());
// // // // //           }

// // // // //           final docs = snapshot.data?.docs ?? [];

// // // // //           if (docs.isEmpty) {
// // // // //             return const Center(
// // // // //               child: Text(
// // // // //                 "No motivation cards yet",
// // // // //                 style: TextStyle(color: Colors.white),
// // // // //               ),
// // // // //             );
// // // // //           }

// // // // //           return ListView.builder(
// // // // //             scrollDirection: Axis.horizontal,
// // // // //             physics: const BouncingScrollPhysics(),
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // //             itemCount: docs.length,
// // // // //             itemBuilder: (context, index) {
// // // // //               final data = docs[index].data() as Map<String, dynamic>;
// // // // //               final docId = docs[index].id;

// // // // //               return _MotivationCard(
// // // // //                 text: data['text'] ?? '',
// // // // //                 icon: data['icon'] ?? '🙂',
// // // // //                 colors: [
// // // // //                   Color(data['color1'] ?? 0xFFAE70B8),
// // // // //                   Color(data['color2'] ?? 0xFFE040FB),
// // // // //                 ],
// // // // //               );
// // // // //             },
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return InkWell(
// // // // //       onTap: onTap,
// // // // //       borderRadius: BorderRadius.circular(22),
// // // // //       child: Container(
// // // // //         width: 150,
// // // // //         decoration: BoxDecoration(
// // // // //           color: color.withOpacity(0.6),
// // // // //           borderRadius: BorderRadius.circular(22),
// // // // //         ),
// // // // //         padding: const EdgeInsets.all(20),
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             CircleAvatar(
// // // // //               radius: 28,
// // // // //               backgroundColor: color,
// // // // //               child: Icon(icon, color: Colors.white, size: 26),
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             Text(
// // // // //               label,
// // // // //               textAlign: TextAlign.center,
// // // // //               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // import 'dart:convert';

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // import 'package:mentalwellapp/model/MotivationCardModel.dart';
// // // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';
// // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// // //     hide kCard, kPrimary;
// // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // // class UserHomeWrapper extends StatefulWidget {
// // //   const UserHomeWrapper({super.key});

// // //   @override
// // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // }

// // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // //   User? firebaseUser;
// // //   String username = "";
// // //   String? profileImageBase64;

// // //   int selectedIndex = 0;
// // //   String selectedMood = "🙂";

// // //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// // //   final PageController _motivationPageController = PageController();
// // //   int _currentMotivationPage = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     firebaseUser = FirebaseAuth.instance.currentUser;
// // //     _fetchUserData();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _motivationPageController.dispose();
// // //     super.dispose();
// // //   }

// // //   Future<void> _fetchUserData() async {
// // //     if (firebaseUser == null) return;

// // //     try {
// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(firebaseUser!.uid)
// // //           .get();

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
// // //     return const AssetImage("assets/default_profile.jpg");
// // //   }

// // //   Future<void> handleLogout(BuildContext context) async {
// // //     final loginController = LoginController();
// // //     await FirebaseAuth.instance.signOut();
// // //     await loginController.clearSharedPref();
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
// // //     return SafeArea(
// // //       child: SingleChildScrollView(
// // //         physics: const BouncingScrollPhysics(),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   IconButton(
// // //                     icon: const Icon(
// // //                       Icons.menu,
// // //                       color: Color(0xFF1E1E24),
// // //                       size: 28,
// // //                     ),
// // //                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
// // //                   ),
// // //                   GestureDetector(
// // //                     onTap: () {
// // //                       setState(() {
// // //                         selectedIndex = 3;
// // //                       });
// // //                     },
// // //                     child: Stack(
// // //                       children: [
// // //                         CircleAvatar(
// // //                           radius: 22,
// // //                           backgroundImage: getProfileImage(),
// // //                         ),
// // //                         Positioned(
// // //                           right: 0,
// // //                           bottom: 0,
// // //                           child: Container(
// // //                             width: 12,
// // //                             height: 12,
// // //                             decoration: BoxDecoration(
// // //                               color: const Color(0xFF34C759),
// // //                               shape: BoxShape.circle,
// // //                               border: Border.all(color: Colors.white, width: 2),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Row(
// // //                     children: [
// // //                       const Text(
// // //                         "Hello ",
// // //                         style: TextStyle(
// // //                           color: Color(0xFF1E1E24),
// // //                           fontSize: 32,
// // //                           fontWeight: FontWeight.w700,
// // //                           letterSpacing: -0.5,
// // //                         ),
// // //                       ),
// // //                       Text(
// // //                         username.isNotEmpty ? username : "User",
// // //                         style: const TextStyle(
// // //                           color: Color(0xFF636AE8),
// // //                           fontSize: 32,
// // //                           fontWeight: FontWeight.w700,
// // //                           letterSpacing: -0.5,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 8),
// // //                       const Text("👋", style: TextStyle(fontSize: 26)),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 4),
// // //                   const Text(
// // //                     "How are you feeling today?",
// // //                     style: TextStyle(
// // //                       color: Color(0xFF8A8A93),
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w500,
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             const SizedBox(height: 32),

// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 24),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   const Text(
// // //                     "Motivation & Daily Check-in",
// // //                     style: TextStyle(
// // //                       color: Color(0xFF1E1E24),
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.w700,
// // //                     ),
// // //                   ),
// // //                   Row(
// // //                     children: [
// // //                       Text(
// // //                         "Swipe",
// // //                         style: TextStyle(
// // //                           color: const Color(0xFF1E1E24).withOpacity(0.4),
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 4),
// // //                       Icon(
// // //                         Icons.arrow_forward_rounded,
// // //                         size: 16,
// // //                         color: const Color(0xFF1E1E24).withOpacity(0.4),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             const SizedBox(height: 14),

// // //             _buildMotivationCardsStream(),

// // //             const SizedBox(height: 32),

// // //             const Padding(
// // //               padding: EdgeInsets.symmetric(horizontal: 24),
// // //               child: Text(
// // //                 "Quick Access Tools",
// // //                 style: TextStyle(
// // //                   color: Color(0xFF1E1E24),
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.w700,
// // //                 ),
// // //               ),
// // //             ),

// // //             const SizedBox(height: 16),

// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: GridView.count(
// // //                 shrinkWrap: true,
// // //                 physics: const NeverScrollableScrollPhysics(),
// // //                 crossAxisCount: 3,
// // //                 crossAxisSpacing: 12,
// // //                 mainAxisSpacing: 16,
// // //                 childAspectRatio: 0.88,
// // //                 children: [
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.chat_bubble_rounded,
// // //                     label: "Talk to Me",
// // //                     iconColor: const Color(0xFF636AE8),
// // //                     bgColor: const Color(0xFFEEF0FF),
// // //                     onTap: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // //                       );
// // //                     },
// // //                   ),
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.spa_rounded,
// // //                     label: "Wellness Hub",
// // //                     iconColor: const Color(0xFF34C759),
// // //                     bgColor: const Color(0xFFE8F8EF),
// // //                     onTap: () {
// // //                       _showWellnessBottomSheet(context);
// // //                     },
// // //                   ),
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.menu_book_rounded,
// // //                     label: "Guide",
// // //                     iconColor: const Color(0xFFFFB323),
// // //                     bgColor: const Color(0xFFFFF7E6),
// // //                     onTap: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (_) => const SpiritualWisdomApp(),
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.favorite_rounded,
// // //                     label: "Mood Tracker",
// // //                     iconColor: const Color(0xFFFF4B6E),
// // //                     bgColor: const Color(0xFFFFEEF1),
// // //                     onTap: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (_) => const MoodTrackerPage(),
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.people_alt_rounded,
// // //                     label: "Relationship\nAdvice",
// // //                     iconColor: const Color(0xFF8E59FF),
// // //                     bgColor: const Color(0xFFF4EEFF),
// // //                     onTap: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (_) => const RelationshipAdvicePage(),
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                   _FeatureRoundButton(
// // //                     icon: Icons.shield_rounded,
// // //                     label: "Expert Advice",
// // //                     iconColor: const Color(0xFF4FA5FF),
// // //                     bgColor: const Color(0xFFEEF6FF),
// // //                     onTap: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// // //                       );
// // //                     },
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             const SizedBox(height: 32),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final pages = _buildPages();

// // //     return Scaffold(
// // //       key: scaffoldKey,
// // //       backgroundColor: const Color(0xFFF9FAFC),
// // //       drawer: Drawer(
// // //         backgroundColor: Colors.white,
// // //         child: SafeArea(
// // //           child: Column(
// // //             children: [
// // //               UserAccountsDrawerHeader(
// // //                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
// // //                 currentAccountPicture: CircleAvatar(
// // //                   radius: 30,
// // //                   backgroundImage: getProfileImage(),
// // //                 ),
// // //                 accountName: Text(
// // //                   username.isNotEmpty ? username : "Active User",
// // //                   style: const TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 18,
// // //                   ),
// // //                 ),
// // //                 accountEmail: const Text("Active User"),
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
// // //                 title: const Text("Dashboard"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => DashboardPage(
// // //                         username: username.isNotEmpty ? username : '',
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(
// // //                   Icons.notifications,
// // //                   color: Color(0xFF1E1E24),
// // //                 ),
// // //                 title: const Text("Notifications"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const NotificationsPage(),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // //                 title: const Text("Emergency"),
// // //                 onTap: () {
// // //                   Navigator.pop(context);
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(
// // //                   Icons.help_outline,
// // //                   color: Color(0xFF1E1E24),
// // //                 ),
// // //                 title: const Text("Help & Support"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// // //                   );
// // //                 },
// // //               ),
// // //               const Spacer(),
// // //               const Divider(),
// // //               ListTile(
// // //                 leading: const Icon(Icons.logout, color: Colors.red),
// // //                 title: const Text(
// // //                   "Logout",
// // //                   style: TextStyle(color: Colors.red),
// // //                 ),
// // //                 onTap: () async {
// // //                   Navigator.pop(context);
// // //                   await handleLogout(context);
// // //                 },
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       body: pages[selectedIndex],
// // //       bottomNavigationBar: Container(
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.04),
// // //               blurRadius: 20,
// // //               offset: const Offset(0, -4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: SafeArea(
// // //           child: Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //               children: [
// // //                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
// // //                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
// // //                 _buildMiddleEmergencyButton(context),
// // //                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
// // //                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
// // //               ],
// // //             ),
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
// // //           .orderBy('order')
// // //           .snapshots(),
// // //       builder: (context, snapshot) {
// // //         if (snapshot.hasError) {
// // //           return Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 24),
// // //             child: _MotivationCard(
// // //               text: "You are stronger than you think.",
// // //               subText: "Take a deep breath. You've got this.",
// // //               emoji: "😊",
// // //               colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // //             ),
// // //           );
// // //         }

// // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // //           return Column(
// // //             children: [
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 24),
// // //                 child: _MotivationCard(
// // //                   text: "Loading your daily quote...",
// // //                   subText: "Please wait a moment.",
// // //                   emoji: "🙂",
// // //                   colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               _buildPageIndicator(1, 0),
// // //             ],
// // //           );
// // //         }

// // //         final docs = snapshot.data?.docs ?? [];

// // //         if (docs.isEmpty) {
// // //           return Column(
// // //             children: [
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 24),
// // //                 child: _MotivationCard(
// // //                   text: "You are stronger than you think.",
// // //                   subText: "Take a deep breath. You've got this.",
// // //                   emoji: "😊",
// // //                   colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               _buildPageIndicator(1, 0),
// // //             ],
// // //           );
// // //         }

// // //         return Column(
// // //           children: [
// // //             SizedBox(
// // //               height: 190,
// // //               child: PageView.builder(
// // //                 controller: _motivationPageController,
// // //                 physics: const BouncingScrollPhysics(),
// // //                 itemCount: docs.length,
// // //                 onPageChanged: (int page) {
// // //                   setState(() {
// // //                     _currentMotivationPage = page;
// // //                   });
// // //                 },
// // //                 itemBuilder: (context, index) {
// // //                   final data = docs[index].data();

// // //                   final String quoteText =
// // //                       (data['text'] ?? 'You are stronger than you think.')
// // //                           .toString();
// // //                   final String quoteEmoji = (data['icon'] ?? '😊').toString();

// // //                   final Color color1 = Color(data['color1'] ?? 0xFFEAEBFF);
// // //                   final Color color2 = Color(data['color2'] ?? 0xFFF3F4FF);

// // //                   return Padding(
// // //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// // //                     child: _MotivationCard(
// // //                       text: quoteText,
// // //                       subText: "Take a deep breath. You've got this.",
// // //                       emoji: quoteEmoji,
// // //                       colors: [color1, color2],
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

// // //   Widget _buildPageIndicator(int count, int current) {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       children: List.generate(count, (index) {
// // //         final bool isSelected = index == current;
// // //         return AnimatedContainer(
// // //           duration: const Duration(milliseconds: 250),
// // //           margin: const EdgeInsets.symmetric(horizontal: 3),
// // //           height: 6,
// // //           width: isSelected ? 18 : 6,
// // //           decoration: BoxDecoration(
// // //             color: isSelected
// // //                 ? const Color(0xFF636AE8)
// // //                 : const Color(0xFFD1D1D6),
// // //             borderRadius: BorderRadius.circular(3),
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }

// // //   Widget _buildBottomNavItem(int index, IconData icon, String label) {
// // //     final bool isSelected = selectedIndex == index;
// // //     return GestureDetector(
// // //       onTap: () {
// // //         setState(() {
// // //           selectedIndex = index;
// // //         });
// // //       },
// // //       child: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           Icon(
// // //             icon,
// // //             color: isSelected
// // //                 ? const Color(0xFF636AE8)
// // //                 : const Color(0xFFA1A1A9),
// // //             size: 26,
// // //           ),
// // //           const SizedBox(height: 4),
// // //           Text(
// // //             label,
// // //             style: TextStyle(
// // //               color: isSelected
// // //                   ? const Color(0xFF636AE8)
// // //                   : const Color(0xFFA1A1A9),
// // //               fontSize: 11,
// // //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildMiddleEmergencyButton(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // //         );
// // //       },
// // //       child: Container(
// // //         margin: const EdgeInsets.only(bottom: 2),
// // //         padding: const EdgeInsets.all(12),
// // //         decoration: BoxDecoration(
// // //           color: const Color(0xFFFF4B6E),
// // //           shape: BoxShape.circle,
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: const Color(0xFFFF4B6E).withOpacity(0.3),
// // //               blurRadius: 12,
// // //               offset: const Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: const Icon(
// // //           Icons.phone_in_talk_rounded,
// // //           color: Colors.white,
// // //           size: 28,
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   void _showWellnessBottomSheet(BuildContext context) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       backgroundColor: Colors.white,
// // //       shape: const RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// // //       ),
// // //       builder: (bottomSheetContext) {
// // //         return Container(
// // //           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               const Text(
// // //                 "Wellness Hub Options",
// // //                 style: TextStyle(
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Color(0xFF1E1E24),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 20),
// // //               Wrap(
// // //                 spacing: 16,
// // //                 runSpacing: 16,
// // //                 alignment: WrapAlignment.center,
// // //                 children: [
// // //                   SizedBox(
// // //                     width: 96,
// // //                     child: _FeatureRoundButton(
// // //                       icon: Icons.spa_rounded,
// // //                       label: "Self-Care",
// // //                       iconColor: const Color(0xFF34C759),
// // //                       bgColor: const Color(0xFFE8F8EF),
// // //                       onTap: () {
// // //                         Navigator.pop(bottomSheetContext);
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (_) => const DailyWellnessPage(),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     width: 96,
// // //                     child: _FeatureRoundButton(
// // //                       icon: Icons.fitness_center_rounded,
// // //                       label: "Exercise",
// // //                       iconColor: const Color(0xFF4FA5FF),
// // //                       bgColor: const Color(0xFFEEF6FF),
// // //                       onTap: () {
// // //                         Navigator.pop(bottomSheetContext);
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (_) => const ExercisePage(),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     width: 96,
// // //                     child: _FeatureRoundButton(
// // //                       icon: Icons.healing_rounded,
// // //                       label: "Healing",
// // //                       iconColor: const Color(0xFF8E59FF),
// // //                       bgColor: const Color(0xFFF4EEFF),
// // //                       onTap: () {
// // //                         Navigator.pop(bottomSheetContext);
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (_) => const StressManagementPage(),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     width: 96,
// // //                     child: _FeatureRoundButton(
// // //                       icon: Icons.bedtime_rounded,
// // //                       label: "Sleep",
// // //                       iconColor: const Color(0xFFFFB323),
// // //                       bgColor: const Color(0xFFFFF7E6),
// // //                       onTap: () {
// // //                         Navigator.pop(bottomSheetContext);
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (_) => const SleepRelaxationPage(),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // // class _MotivationCard extends StatelessWidget {
// // //   final String text;
// // //   final String subText;
// // //   final String emoji;
// // //   final List<Color> colors;

// // //   const _MotivationCard({
// // //     required this.text,
// // //     required this.subText,
// // //     required this.emoji,
// // //     required this.colors,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       width: double.infinity,
// // //       decoration: BoxDecoration(
// // //         borderRadius: BorderRadius.circular(24),
// // //         gradient: LinearGradient(
// // //           colors: colors,
// // //           begin: Alignment.topLeft,
// // //           end: Alignment.bottomRight,
// // //         ),
// // //       ),
// // //       child: Stack(
// // //         children: [
// // //           Positioned(
// // //             right: -20,
// // //             bottom: -20,
// // //             child: Opacity(
// // //               opacity: 0.08,
// // //               child: Icon(
// // //                 Icons.spa_rounded,
// // //                 size: 160,
// // //                 color: const Color(0xFF636AE8),
// // //               ),
// // //             ),
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.all(24.0),
// // //             child: Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       Text(
// // //                         text,
// // //                         style: const TextStyle(
// // //                           fontSize: 22,
// // //                           color: Color(0xFF1E1E24),
// // //                           height: 1.3,
// // //                           fontWeight: FontWeight.w700,
// // //                         ),
// // //                         maxLines: 3,
// // //                         overflow: TextOverflow.ellipsis,
// // //                       ),
// // //                       const SizedBox(height: 12),
// // //                       Text(
// // //                         subText,
// // //                         style: const TextStyle(
// // //                           color: Color(0xFF7D7E87),
// // //                           fontSize: 13,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 Container(
// // //                   width: 72,
// // //                   height: 72,
// // //                   decoration: const BoxDecoration(
// // //                     color: Color(0xFFFFDE6A),
// // //                     shape: BoxShape.circle,
// // //                     boxShadow: [
// // //                       BoxShadow(
// // //                         color: Color(0x55FFDE6A),
// // //                         blurRadius: 20,
// // //                         offset: Offset(0, 4),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   child: Center(
// // //                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _FeatureRoundButton extends StatelessWidget {
// // //   final IconData icon;
// // //   final String label;
// // //   final Color iconColor;
// // //   final Color bgColor;
// // //   final VoidCallback onTap;

// // //   const _FeatureRoundButton({
// // //     required this.icon,
// // //     required this.label,
// // //     required this.iconColor,
// // //     required this.bgColor,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: onTap,
// // //       child: Container(
// // //         height: 120,
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(20),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.015),
// // //               blurRadius: 10,
// // //               offset: const Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Padding(
// // //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Container(
// // //                 width: 50,
// // //                 height: 50,
// // //                 decoration: BoxDecoration(
// // //                   color: bgColor,
// // //                   shape: BoxShape.circle,
// // //                 ),
// // //                 child: Icon(icon, color: iconColor, size: 24),
// // //               ),
// // //               const SizedBox(height: 10),
// // //               Text(
// // //                 label,
// // //                 textAlign: TextAlign.center,
// // //                 maxLines: 2,
// // //                 overflow: TextOverflow.ellipsis,
// // //                 style: const TextStyle(
// // //                   color: Color(0xFF1E1E24),
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 12,
// // //                   height: 1.2,
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

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/controller/LoginController.dart';
// // import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';
// // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // import 'package:mentalwellapp/view/USER/selfcare_page.dart'
// //     hide kCard, kPrimary;
// // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// // class UserHomeWrapper extends StatefulWidget {
// //   const UserHomeWrapper({super.key});

// //   @override
// //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // }

// // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// //   User? firebaseUser;
// //   String username = "";
// //   String? profileImageBase64;

// //   int selectedIndex = 0;
// //   String selectedMood = "🙂";

// //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// //   final PageController _motivationPageController = PageController();
// //   int _currentMotivationPage = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     firebaseUser = FirebaseAuth.instance.currentUser;
// //     _fetchUserData();
// //   }

// //   @override
// //   void dispose() {
// //     _motivationPageController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _fetchUserData() async {
// //     if (firebaseUser == null) return;

// //     try {
// //       final doc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(firebaseUser!.uid)
// //           .get();

// //       if (doc.exists) {
// //         final data = doc.data()!;
// //         setState(() {
// //           username = data['name'] ?? "User";
// //           profileImageBase64 = data['profileImageBase64'];
// //         });
// //       }
// //     } catch (e) {
// //       debugPrint("Error fetching user data: $e");
// //     }
// //   }

// //   ImageProvider getProfileImage() {
// //     try {
// //       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
// //         final cleanBase64 = profileImageBase64!
// //             .replaceAll('\n', '')
// //             .replaceAll(' ', '');

// //         final bytes = base64Decode(cleanBase64);
// //         return MemoryImage(bytes);
// //       }
// //     } catch (e) {
// //       debugPrint("Profile image decode error: $e");
// //     }
// //     return const AssetImage("assets/default_profile.jpg");
// //   }

// //   Future<void> handleLogout(BuildContext context) async {
// //     final loginController = LoginController();
// //     await FirebaseAuth.instance.signOut();
// //     await loginController.clearSharedPref();
// //     Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(builder: (_) => const LoginPage()),
// //       (route) => false,
// //     );
// //   }

// //   List<Widget> _buildPages() {
// //     return [
// //       _buildHomePage(),
// //       const ChatBotPage(),
// //       const EmergencyPage(),
// //       const UserProfilePage(),
// //     ];
// //   }

// //   Widget _buildHomePage() {
// //     return SafeArea(
// //       child: SingleChildScrollView(
// //         physics: const BouncingScrollPhysics(),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   IconButton(
// //                     icon: const Icon(
// //                       Icons.menu,
// //                       color: Color(0xFF1E1E24),
// //                       size: 28,
// //                     ),
// //                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       setState(() {
// //                         selectedIndex = 3;
// //                       });
// //                     },
// //                     child: Stack(
// //                       children: [
// //                         CircleAvatar(
// //                           radius: 22,
// //                           backgroundImage: getProfileImage(),
// //                         ),
// //                         Positioned(
// //                           right: 0,
// //                           bottom: 0,
// //                           child: Container(
// //                             width: 12,
// //                             height: 12,
// //                             decoration: BoxDecoration(
// //                               color: const Color(0xFF34C759),
// //                               shape: BoxShape.circle,
// //                               border: Border.all(color: Colors.white, width: 2),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       const Text(
// //                         "Hello ",
// //                         style: TextStyle(
// //                           color: Color(0xFF1E1E24),
// //                           fontSize: 32,
// //                           fontWeight: FontWeight.w700,
// //                           letterSpacing: -0.5,
// //                         ),
// //                       ),
// //                       Text(
// //                         username.isNotEmpty ? username : "User",
// //                         style: const TextStyle(
// //                           color: Color(0xFF636AE8),
// //                           fontSize: 32,
// //                           fontWeight: FontWeight.w700,
// //                           letterSpacing: -0.5,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 8),
// //                       const Text("👋", style: TextStyle(fontSize: 26)),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 4),
// //                   const Text(
// //                     "How are you feeling today?",
// //                     style: TextStyle(
// //                       color: Color(0xFF8A8A93),
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 32),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   const Text(
// //                     "Motivation & Daily Check-in",
// //                     style: TextStyle(
// //                       color: Color(0xFF1E1E24),
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.w700,
// //                     ),
// //                   ),
// //                   Row(
// //                     children: [
// //                       Text(
// //                         "Swipe",
// //                         style: TextStyle(
// //                           color: const Color(0xFF1E1E24).withOpacity(0.4),
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                       const SizedBox(width: 4),
// //                       Icon(
// //                         Icons.arrow_forward_rounded,
// //                         size: 16,
// //                         color: const Color(0xFF1E1E24).withOpacity(0.4),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 14),
// //             _buildMotivationCardsStream(),
// //             const SizedBox(height: 32),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 24),
// //               child: Text(
// //                 "Quick Access Tools",
// //                 style: TextStyle(
// //                   color: Color(0xFF1E1E24),
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.w700,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: GridView.count(
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 crossAxisCount: 3,
// //                 crossAxisSpacing: 12,
// //                 mainAxisSpacing: 16,
// //                 childAspectRatio: 0.88,
// //                 children: [
// //                   _FeatureRoundButton(
// //                     icon: Icons.chat_bubble_rounded,
// //                     label: "Talk to Me",
// //                     iconColor: const Color(0xFF636AE8),
// //                     bgColor: const Color(0xFFEEF0FF),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
// //                       );
// //                     },
// //                   ),
// //                   _FeatureRoundButton(
// //                     icon: Icons.spa_rounded,
// //                     label: "Wellness Hub",
// //                     iconColor: const Color(0xFF34C759),
// //                     bgColor: const Color(0xFFE8F8EF),
// //                     onTap: () {
// //                       _showWellnessBottomSheet(context);
// //                     },
// //                   ),
// //                   _FeatureRoundButton(
// //                     icon: Icons.menu_book_rounded,
// //                     label: "Guide",
// //                     iconColor: const Color(0xFFFFB323),
// //                     bgColor: const Color(0xFFFFF7E6),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (_) => const SpiritualWisdomApp(),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                   _FeatureRoundButton(
// //                     icon: Icons.favorite_rounded,
// //                     label: "Mood Tracker",
// //                     iconColor: const Color(0xFFFF4B6E),
// //                     bgColor: const Color(0xFFFFEEF1),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (_) => const MoodTrackerPage(),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                   _FeatureRoundButton(
// //                     icon: Icons.people_alt_rounded,
// //                     label: "Relationship\nAdvice",
// //                     iconColor: const Color(0xFF8E59FF),
// //                     bgColor: const Color(0xFFF4EEFF),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (_) => const RelationshipAdvicePage(),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                   _FeatureRoundButton(
// //                     icon: Icons.shield_rounded,
// //                     label: "Expert Advice",
// //                     iconColor: const Color(0xFF4FA5FF),
// //                     bgColor: const Color(0xFFEEF6FF),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
// //                       );
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 32),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final pages = _buildPages();

// //     return Scaffold(
// //       key: scaffoldKey,
// //       backgroundColor: const Color(0xFFF9FAFC),
// //       drawer: Drawer(
// //         backgroundColor: Colors.white,
// //         child: SafeArea(
// //           child: Column(
// //             children: [
// //               UserAccountsDrawerHeader(
// //                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
// //                 currentAccountPicture: CircleAvatar(
// //                   radius: 30,
// //                   backgroundImage: getProfileImage(),
// //                 ),
// //                 accountName: Text(
// //                   username.isNotEmpty ? username : "Active User",
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 accountEmail: const Text("Active User"),
// //               ),
// //               ListTile(
// //                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
// //                 title: const Text("Dashboard"),
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (_) => DashboardPage(
// //                         username: username.isNotEmpty ? username : '',
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //               ListTile(
// //                 leading: const Icon(
// //                   Icons.notifications,
// //                   color: Color(0xFF1E1E24),
// //                 ),
// //                 title: const Text("Notifications"),
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (_) => const NotificationsPage(),
// //                     ),
// //                   );
// //                 },
// //               ),
// //               ListTile(
// //                 leading: const Icon(Icons.warning, color: Colors.red),
// //                 title: const Text("Emergency"),
// //                 onTap: () {
// //                   Navigator.pop(context);
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// //                   );
// //                 },
// //               ),
// //               ListTile(
// //                 leading: const Icon(
// //                   Icons.help_outline,
// //                   color: Color(0xFF1E1E24),
// //                 ),
// //                 title: const Text("Help & Support"),
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (_) => const HelpPage()),
// //                   );
// //                 },
// //               ),
// //               const Spacer(),
// //               const Divider(),
// //               ListTile(
// //                 leading: const Icon(Icons.logout, color: Colors.red),
// //                 title: const Text(
// //                   "Logout",
// //                   style: TextStyle(color: Colors.red),
// //                 ),
// //                 onTap: () async {
// //                   Navigator.pop(context);
// //                   await handleLogout(context);
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       body: pages[selectedIndex],
// //       bottomNavigationBar: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.04),
// //               blurRadius: 20,
// //               offset: const Offset(0, -4),
// //             ),
// //           ],
// //         ),
// //         child: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
// //                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
// //                 _buildMiddleEmergencyButton(context),
// //                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
// //                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildMotivationCardsStream() {
// //     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// //       stream: FirebaseFirestore.instance
// //           .collection('motivation_cards')
// //           .where('isActive', isEqualTo: true)
// //           .snapshots(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return _buildSingleFallbackCard(
// //             text:
// //                 "Every day may not be good, but there is something good in every day.",
// //             subText: "Take a deep breath and begin gently.",
// //             emoji: "🌸",
// //             colors: const [Color(0xFFEAEBFF), Color(0xFFF8ECFF)],
// //           );
// //         }

// //         if (snapshot.hasError) {
// //           return _buildSingleFallbackCard(
// //             text:
// //                 "You are stronger than you think, and brighter days are ahead.",
// //             subText: "One small positive step is enough for today.",
// //             emoji: "🙂",
// //             colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
// //           );
// //         }

// //         final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
// //             snapshot.data?.docs.toList() ?? [];

// //         docs.sort((a, b) {
// //           final dynamic aRaw = a.data()['order'];
// //           final dynamic bRaw = b.data()['order'];

// //           final int aOrder = aRaw is int
// //               ? aRaw
// //               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
// //           final int bOrder = bRaw is int
// //               ? bRaw
// //               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

// //           return aOrder.compareTo(bOrder);
// //         });

// //         if (docs.isEmpty) {
// //           return _buildSingleFallbackCard(
// //             text:
// //                 "Believe in yourself. You have the power to heal, grow, and shine.",
// //             subText: "Your journey matters, even on slow days.",
// //             emoji: "💛",
// //             colors: const [Color(0xFFFFF1CC), Color(0xFFFFF7E8)],
// //           );
// //         }

// //         if (_currentMotivationPage >= docs.length) {
// //           WidgetsBinding.instance.addPostFrameCallback((_) {
// //             if (mounted) {
// //               setState(() {
// //                 _currentMotivationPage = 0;
// //               });
// //             }
// //           });
// //         }

// //         return Column(
// //           children: [
// //             SizedBox(
// //               height: 190,
// //               child: PageView.builder(
// //                 controller: _motivationPageController,
// //                 physics: const BouncingScrollPhysics(
// //                   parent: PageScrollPhysics(),
// //                 ),
// //                 itemCount: docs.length,
// //                 onPageChanged: (int page) {
// //                   setState(() {
// //                     _currentMotivationPage = page;
// //                   });
// //                 },
// //                 itemBuilder: (context, index) {
// //                   final Map<String, dynamic> data = docs[index].data();

// //                   final String quoteText =
// //                       (data['text']?.toString().trim().isNotEmpty ?? false)
// //                       ? data['text'].toString().trim()
// //                       : "Stay strong, brighter days are ahead.";

// //                   final String quoteEmoji =
// //                       (data['icon']?.toString().trim().isNotEmpty ?? false)
// //                       ? data['icon'].toString().trim()
// //                       : "🙂";

// //                   final int color1Value = _parseColorValue(
// //                     data['color1'],
// //                     0xFFEAEBFF,
// //                   );
// //                   final int color2Value = _parseColorValue(
// //                     data['color2'],
// //                     0xFFF3F4FF,
// //                   );

// //                   return Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 24),
// //                     child: _MotivationCard(
// //                       text: quoteText,
// //                       subText: "Take a deep breath. You've got this.",
// //                       emoji: quoteEmoji,
// //                       colors: [Color(color1Value), Color(color2Value)],
// //                     ),
// //                   );
// //                 },
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
// //       final cleaned = value.replaceAll('#', '').trim();

// //       if (cleaned.isEmpty) return fallback;

// //       if (cleaned.length == 6) {
// //         return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
// //       }

// //       if (cleaned.length == 8) {
// //         return int.tryParse(cleaned, radix: 16) ?? fallback;
// //       }
// //     }
// //     return fallback;
// //   }

// //   Widget _buildSingleFallbackCard({
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
// //             height: 190,
// //             child: _MotivationCard(
// //               text: text,
// //               subText: subText,
// //               emoji: emoji,
// //               colors: colors,
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
// //       children: List.generate(count, (index) {
// //         final bool isSelected = index == current;
// //         return AnimatedContainer(
// //           duration: const Duration(milliseconds: 250),
// //           margin: const EdgeInsets.symmetric(horizontal: 3),
// //           height: 6,
// //           width: isSelected ? 18 : 6,
// //           decoration: BoxDecoration(
// //             color: isSelected
// //                 ? const Color(0xFF636AE8)
// //                 : const Color(0xFFD1D1D6),
// //             borderRadius: BorderRadius.circular(3),
// //           ),
// //         );
// //       }),
// //     );
// //   }

// //   Widget _buildBottomNavItem(int index, IconData icon, String label) {
// //     final bool isSelected = selectedIndex == index;
// //     return GestureDetector(
// //       onTap: () {
// //         setState(() {
// //           selectedIndex = index;
// //         });
// //       },
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(
// //             icon,
// //             color: isSelected
// //                 ? const Color(0xFF636AE8)
// //                 : const Color(0xFFA1A1A9),
// //             size: 26,
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: isSelected
// //                   ? const Color(0xFF636AE8)
// //                   : const Color(0xFFA1A1A9),
// //               fontSize: 11,
// //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMiddleEmergencyButton(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const EmergencyPage()),
// //         );
// //       },
// //       child: Container(
// //         margin: const EdgeInsets.only(bottom: 2),
// //         padding: const EdgeInsets.all(12),
// //         decoration: BoxDecoration(
// //           color: const Color(0xFFFF4B6E),
// //           shape: BoxShape.circle,
// //           boxShadow: [
// //             BoxShadow(
// //               color: const Color(0xFFFF4B6E).withOpacity(0.3),
// //               blurRadius: 12,
// //               offset: const Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: const Icon(
// //           Icons.phone_in_talk_rounded,
// //           color: Colors.white,
// //           size: 28,
// //         ),
// //       ),
// //     );
// //   }

// //   void _showWellnessBottomSheet(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       backgroundColor: Colors.white,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// //       ),
// //       builder: (bottomSheetContext) {
// //         return Container(
// //           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text(
// //                 "Wellness Hub Options",
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: Color(0xFF1E1E24),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Wrap(
// //                 spacing: 16,
// //                 runSpacing: 16,
// //                 alignment: WrapAlignment.center,
// //                 children: [
// //                   SizedBox(
// //                     width: 96,
// //                     child: _FeatureRoundButton(
// //                       icon: Icons.spa_rounded,
// //                       label: "Self-Care",
// //                       iconColor: const Color(0xFF34C759),
// //                       bgColor: const Color(0xFFE8F8EF),
// //                       onTap: () {
// //                         Navigator.pop(bottomSheetContext);
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (_) => const DailyWellnessPage(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 96,
// //                     child: _FeatureRoundButton(
// //                       icon: Icons.fitness_center_rounded,
// //                       label: "Exercise",
// //                       iconColor: const Color(0xFF4FA5FF),
// //                       bgColor: const Color(0xFFEEF6FF),
// //                       onTap: () {
// //                         Navigator.pop(bottomSheetContext);
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (_) => const ExercisePage(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 96,
// //                     child: _FeatureRoundButton(
// //                       icon: Icons.healing_rounded,
// //                       label: "Healing",
// //                       iconColor: const Color(0xFF8E59FF),
// //                       bgColor: const Color(0xFFF4EEFF),
// //                       onTap: () {
// //                         Navigator.pop(bottomSheetContext);
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (_) => const StressManagementPage(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 96,
// //                     child: _FeatureRoundButton(
// //                       icon: Icons.bedtime_rounded,
// //                       label: "Sleep",
// //                       iconColor: const Color(0xFFFFB323),
// //                       bgColor: const Color(0xFFFFF7E6),
// //                       onTap: () {
// //                         Navigator.pop(bottomSheetContext);
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (_) => const SleepRelaxationPage(),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class _MotivationCard extends StatelessWidget {
// //   final String text;
// //   final String subText;
// //   final String emoji;
// //   final List<Color> colors;

// //   const _MotivationCard({
// //     required this.text,
// //     required this.subText,
// //     required this.emoji,
// //     required this.colors,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(24),
// //         gradient: LinearGradient(
// //           colors: colors,
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),
// //       ),
// //       child: Stack(
// //         children: [
// //           Positioned(
// //             right: -20,
// //             bottom: -20,
// //             child: Opacity(
// //               opacity: 0.08,
// //               child: Icon(
// //                 Icons.spa_rounded,
// //                 size: 160,
// //                 color: const Color(0xFF636AE8),
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(24.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         text,
// //                         style: const TextStyle(
// //                           fontSize: 22,
// //                           color: Color(0xFF1E1E24),
// //                           height: 1.3,
// //                           fontWeight: FontWeight.w700,
// //                         ),
// //                         maxLines: 3,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                       const SizedBox(height: 12),
// //                       Text(
// //                         subText,
// //                         style: const TextStyle(
// //                           color: Color(0xFF7D7E87),
// //                           fontSize: 13,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                         maxLines: 2,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Container(
// //                   width: 72,
// //                   height: 72,
// //                   decoration: const BoxDecoration(
// //                     color: Color(0xFFFFDE6A),
// //                     shape: BoxShape.circle,
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Color(0x55FFDE6A),
// //                         blurRadius: 20,
// //                         offset: Offset(0, 4),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Center(
// //                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _FeatureRoundButton extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final Color iconColor;
// //   final Color bgColor;
// //   final VoidCallback onTap;

// //   const _FeatureRoundButton({
// //     required this.icon,
// //     required this.label,
// //     required this.iconColor,
// //     required this.bgColor,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         height: 120,
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(20),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.015),
// //               blurRadius: 10,
// //               offset: const Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Container(
// //                 width: 50,
// //                 height: 50,
// //                 decoration: BoxDecoration(
// //                   color: bgColor,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: Icon(icon, color: iconColor, size: 24),
// //               ),
// //               const SizedBox(height: 10),
// //               Text(
// //                 label,
// //                 textAlign: TextAlign.center,
// //                 maxLines: 2,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: const TextStyle(
// //                   color: Color(0xFF1E1E24),
// //                   fontWeight: FontWeight.w600,
// //                   fontSize: 12,
// //                   height: 1.2,
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// import 'package:mentalwellapp/view/USER/exercise_page.dart';
// import 'package:mentalwellapp/view/USER/expert_advice.dart';
// import 'package:mentalwellapp/view/USER/guide_page.dart' hide kCard, kPrimary;
// import 'package:mentalwellapp/view/USER/healing_page.dart';
// import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// import 'package:mentalwellapp/view/USER/selfcare_page.dart'
//     hide kCard, kPrimary;
// import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// import 'package:mentalwellapp/view/user_drawer/help_page.dart';

// class UserHomeWrapper extends StatefulWidget {
//   const UserHomeWrapper({super.key});

//   @override
//   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// }

// class _UserHomeWrapperState extends State<UserHomeWrapper> {
//   User? firebaseUser;
//   String username = "";
//   String? profileImageBase64;

//   int selectedIndex = 0;
//   String selectedMood = "🙂";

//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final PageController _motivationPageController = PageController();
//   int _currentMotivationPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     firebaseUser = FirebaseAuth.instance.currentUser;
//     _fetchUserData();
//   }

//   @override
//   void dispose() {
//     _motivationPageController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchUserData() async {
//     if (firebaseUser == null) return;

//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser!.uid)
//           .get();

//       if (doc.exists) {
//         final data = doc.data()!;
//         setState(() {
//           username = data['name'] ?? "User";
//           profileImageBase64 = data['profileImageBase64'];
//         });
//       }
//     } catch (e) {
//       debugPrint("Error fetching user data: $e");
//     }
//   }

//   ImageProvider getProfileImage() {
//     try {
//       if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
//         final cleanBase64 = profileImageBase64!
//             .replaceAll('\n', '')
//             .replaceAll(' ', '');

//         final bytes = base64Decode(cleanBase64);
//         return MemoryImage(bytes);
//       }
//     } catch (e) {
//       debugPrint("Profile image decode error: $e");
//     }
//     return const AssetImage("assets/images/admin.png");
//   }

//   Future<void> handleLogout(BuildContext context) async {
//     final loginController = LoginController();
//     await FirebaseAuth.instance.signOut();
//     await loginController.clearSharedPref();
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginPage()),
//       (route) => false,
//     );
//   }

//   List<Widget> _buildPages() {
//     return [
//       _buildHomePage(),
//       const ChatBotPage(),
//       const EmergencyPage(),
//       const UserProfilePage(),
//     ];
//   }

//   Widget _buildHomePage() {
//     return SafeArea(
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.menu,
//                       color: Color(0xFF1E1E24),
//                       size: 28,
//                     ),
//                     onPressed: () => scaffoldKey.currentState?.openDrawer(),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = 3;
//                       });
//                     },
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage: getProfileImage(),
//                         ),
//                         Positioned(
//                           right: 0,
//                           bottom: 0,
//                           child: Container(
//                             width: 12,
//                             height: 12,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF34C759),
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.white, width: 2),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         "Hello ",
//                         style: TextStyle(
//                           color: Color(0xFF1E1E24),
//                           fontSize: 32,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                       Text(
//                         username.isNotEmpty ? username : "User",
//                         style: const TextStyle(
//                           color: Color(0xFF636AE8),
//                           fontSize: 32,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text("👋", style: TextStyle(fontSize: 26)),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     "How are you feeling today?",
//                     style: TextStyle(
//                       color: Color(0xFF8A8A93),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Motivation & Daily Check-in",
//                     style: TextStyle(
//                       color: Color(0xFF1E1E24),
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Swipe",
//                         style: TextStyle(
//                           color: const Color(0xFF1E1E24).withOpacity(0.4),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.arrow_forward_rounded,
//                         size: 16,
//                         color: const Color(0xFF1E1E24).withOpacity(0.4),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 14),
//             _buildMotivationCardsStream(),
//             const SizedBox(height: 32),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 "Quick Access Tools",
//                 style: TextStyle(
//                   color: Color(0xFF1E1E24),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 0.88,
//                 children: [
//                   _FeatureRoundButton(
//                     icon: Icons.chat_bubble_rounded,
//                     label: "Talk to Me",
//                     iconColor: const Color(0xFF636AE8),
//                     bgColor: const Color(0xFFEEF0FF),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const ChatBotPage()),
//                       );
//                     },
//                   ),
//                   _FeatureRoundButton(
//                     icon: Icons.menu_book_rounded,
//                     label: "Guide",
//                     iconColor: const Color(0xFFFFB323),
//                     bgColor: const Color(0xFFFFF7E6),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const SpiritualWisdomApp(),
//                         ),
//                       );
//                     },
//                   ),
//                   _FeatureRoundButton(
//                     icon: Icons.people_alt_rounded,
//                     label: "Relationship\nAdvice",
//                     iconColor: const Color(0xFF8E59FF),
//                     bgColor: const Color(0xFFF4EEFF),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const RelationshipAdvicePage(),
//                         ),
//                       );
//                     },
//                   ),
//                   _FeatureRoundButton(
//                     icon: Icons.shield_rounded,
//                     label: "Expert Advice",
//                     iconColor: const Color(0xFF4FA5FF),
//                     bgColor: const Color(0xFFEEF6FF),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
//                       );
//                     },
//                   ),
//                   _FeatureRoundButton(
//                     icon: Icons.fitness_center_rounded,
//                     label: "Exercise",
//                     iconColor: const Color(0xFF4FA5FF),
//                     bgColor: const Color(0xFFEEF6FF),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const ExercisePage()),
//                       );
//                     },
//                   ),
//                   _FeatureRoundButton(
//                     icon: Icons.healing_rounded,
//                     label: "Healing",
//                     iconColor: const Color(0xFF8E59FF),
//                     bgColor: const Color(0xFFF4EEFF),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const StressManagementPage(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pages = _buildPages();

//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: const Color(0xFFF9FAFC),
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: SafeArea(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 decoration: const BoxDecoration(color: Color(0xFF636AE8)),
//                 currentAccountPicture: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedIndex = 3;
//                     });
//                   },
//                   child: CircleAvatar(
//                     radius: 30,
//                     backgroundImage: getProfileImage(),
//                   ),
//                 ),
//                 accountName: Text(
//                   username.isNotEmpty ? username : "Active User",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 accountEmail: const SizedBox.shrink(),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
//                 title: const Text("Dashboard"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => DashboardPage(
//                         username: username.isNotEmpty ? username : '',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.warning, color: Colors.red),
//                 title: const Text("Emergency"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.help_outline,
//                   color: Color(0xFF1E1E24),
//                 ),
//                 title: const Text("Help & Support"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const HelpPage()),
//                   );
//                 },
//               ),
//               const Spacer(),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.red),
//                 title: const Text(
//                   "Logout",
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   await handleLogout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: pages[selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 20,
//               offset: const Offset(0, -4),
//             ),
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildBottomNavItem(0, Icons.home_rounded, "Home"),
//                 _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
//                 _buildMiddleEmergencyButton(context),
//                 _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
//                 _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMotivationCardsStream() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance
//           .collection('motivation_cards')
//           .where('isActive', isEqualTo: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return _buildSingleFallbackCard(
//             text:
//                 "Every day may not be good, but there is something good in every day.",
//             subText: "Take a deep breath and begin gently.",
//             emoji: "🌸",
//             colors: const [Color(0xFFEAEBFF), Color(0xFFF8ECFF)],
//           );
//         }

//         if (snapshot.hasError) {
//           return _buildSingleFallbackCard(
//             text:
//                 "You are stronger than you think, and brighter days are ahead.",
//             subText: "One small positive step is enough for today.",
//             emoji: "🙂",
//             colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
//           );
//         }

//         final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
//             snapshot.data?.docs.toList() ?? [];

//         docs.sort((a, b) {
//           final dynamic aRaw = a.data()['order'];
//           final dynamic bRaw = b.data()['order'];

//           final int aOrder = aRaw is int
//               ? aRaw
//               : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
//           final int bOrder = bRaw is int
//               ? bRaw
//               : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

//           return aOrder.compareTo(bOrder);
//         });

//         if (docs.isEmpty) {
//           return _buildSingleFallbackCard(
//             text:
//                 "Believe in yourself. You have the power to heal, grow, and shine.",
//             subText: "Your journey matters, even on slow days.",
//             emoji: "💛",
//             colors: const [Color(0xFFFFF1CC), Color(0xFFFFF7E8)],
//           );
//         }

//         if (_currentMotivationPage >= docs.length) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (mounted) {
//               setState(() {
//                 _currentMotivationPage = 0;
//               });
//             }
//           });
//         }

//         return Column(
//           children: [
//             SizedBox(
//               height: 190,
//               child: PageView.builder(
//                 controller: _motivationPageController,
//                 physics: const BouncingScrollPhysics(
//                   parent: PageScrollPhysics(),
//                 ),
//                 itemCount: docs.length,
//                 onPageChanged: (int page) {
//                   setState(() {
//                     _currentMotivationPage = page;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   final Map<String, dynamic> data = docs[index].data();

//                   final String quoteText =
//                       (data['text']?.toString().trim().isNotEmpty ?? false)
//                       ? data['text'].toString().trim()
//                       : "Stay strong, brighter days are ahead.";

//                   final String quoteEmoji =
//                       (data['icon']?.toString().trim().isNotEmpty ?? false)
//                       ? data['icon'].toString().trim()
//                       : "🙂";

//                   final int color1Value = _parseColorValue(
//                     data['color1'],
//                     0xFFEAEBFF,
//                   );
//                   final int color2Value = _parseColorValue(
//                     data['color2'],
//                     0xFFF3F4FF,
//                   );

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: _MotivationCard(
//                       text: quoteText,
//                       subText: "Take a deep breath. You've got this.",
//                       emoji: quoteEmoji,
//                       colors: [Color(color1Value), Color(color2Value)],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildPageIndicator(docs.length, _currentMotivationPage),
//           ],
//         );
//       },
//     );
//   }

//   int _parseColorValue(dynamic value, int fallback) {
//     if (value is int) return value;
//     if (value is String) {
//       final cleaned = value.replaceAll('#', '').trim();

//       if (cleaned.isEmpty) return fallback;

//       if (cleaned.length == 6) {
//         return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
//       }

//       if (cleaned.length == 8) {
//         return int.tryParse(cleaned, radix: 16) ?? fallback;
//       }
//     }
//     return fallback;
//   }

//   Widget _buildSingleFallbackCard({
//     required String text,
//     required String subText,
//     required String emoji,
//     required List<Color> colors,
//   }) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: SizedBox(
//             height: 190,
//             child: _MotivationCard(
//               text: text,
//               subText: subText,
//               emoji: emoji,
//               colors: colors,
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildPageIndicator(1, 0),
//       ],
//     );
//   }

//   Widget _buildPageIndicator(int count, int current) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(count, (index) {
//         final bool isSelected = index == current;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           margin: const EdgeInsets.symmetric(horizontal: 3),
//           height: 6,
//           width: isSelected ? 18 : 6,
//           decoration: BoxDecoration(
//             color: isSelected
//                 ? const Color(0xFF636AE8)
//                 : const Color(0xFFD1D1D6),
//             borderRadius: BorderRadius.circular(3),
//           ),
//         );
//       }),
//     );
//   }

//   Widget _buildBottomNavItem(int index, IconData icon, String label) {
//     final bool isSelected = selectedIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: isSelected
//                 ? const Color(0xFF636AE8)
//                 : const Color(0xFFA1A1A9),
//             size: 26,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected
//                   ? const Color(0xFF636AE8)
//                   : const Color(0xFFA1A1A9),
//               fontSize: 11,
//               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMiddleEmergencyButton(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const EmergencyPage()),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 2),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: const Color(0xFFFF4B6E),
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFFFF4B6E).withOpacity(0.3),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: const Icon(
//           Icons.phone_in_talk_rounded,
//           color: Colors.white,
//           size: 28,
//         ),
//       ),
//     );
//   }

//   void _showWellnessBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//       ),
//       builder: (bottomSheetContext) {
//         return Container(
//           padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Wellness Hub Options",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1E1E24),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Wrap(
//                 spacing: 16,
//                 runSpacing: 16,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 96,
//                     child: _FeatureRoundButton(
//                       icon: Icons.fitness_center_rounded,
//                       label: "Exercise",
//                       iconColor: const Color(0xFF4FA5FF),
//                       bgColor: const Color(0xFFEEF6FF),
//                       onTap: () {
//                         Navigator.pop(bottomSheetContext);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ExercisePage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 96,
//                     child: _FeatureRoundButton(
//                       icon: Icons.healing_rounded,
//                       label: "Healing",
//                       iconColor: const Color(0xFF8E59FF),
//                       bgColor: const Color(0xFFF4EEFF),
//                       onTap: () {
//                         Navigator.pop(bottomSheetContext);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const StressManagementPage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class _MotivationCard extends StatelessWidget {
//   final String text;
//   final String subText;
//   final String emoji;
//   final List<Color> colors;

//   const _MotivationCard({
//     required this.text,
//     required this.subText,
//     required this.emoji,
//     required this.colors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: LinearGradient(
//           colors: colors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             right: -20,
//             bottom: -20,
//             child: Opacity(
//               opacity: 0.08,
//               child: Icon(
//                 Icons.spa_rounded,
//                 size: 160,
//                 color: const Color(0xFF636AE8),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         text,
//                         style: const TextStyle(
//                           fontSize: 22,
//                           color: Color(0xFF1E1E24),
//                           height: 1.3,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         subText,
//                         style: const TextStyle(
//                           color: Color(0xFF7D7E87),
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 72,
//                   height: 72,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFFDE6A),
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0x55FFDE6A),
//                         blurRadius: 20,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(emoji, style: const TextStyle(fontSize: 38)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _FeatureRoundButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color iconColor;
//   final Color bgColor;
//   final VoidCallback onTap;

//   const _FeatureRoundButton({
//     required this.icon,
//     required this.label,
//     required this.iconColor,
//     required this.bgColor,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.015),
//               blurRadius: 10,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: bgColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(icon, color: iconColor, size: 24),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 label,
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: Color(0xFF1E1E24),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                   height: 1.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }import 'dart:convert';

import 'dart:convert';

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
import 'package:mentalwellapp/view/USER/healing_page.dart';
import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
import 'package:mentalwellapp/view/USER/selfcare_page.dart'
    hide kCard, kPrimary;
import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
import 'package:mentalwellapp/view/user_drawer/help_page.dart';

class UserHomeWrapper extends StatefulWidget {
  const UserHomeWrapper({super.key});

  @override
  State<UserHomeWrapper> createState() => _UserHomeWrapperState();
}

class _UserHomeWrapperState extends State<UserHomeWrapper>
    with WidgetsBindingObserver {
  User? firebaseUser;
  String username = "";
  String? profileImageBase64;

  int selectedIndex = 0;
  String selectedMood = "🙂";

  final ActivityController activityController = ActivityController();
  bool _hasLoggedResume = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _motivationPageController = PageController();
  int _currentMotivationPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    firebaseUser = FirebaseAuth.instance.currentUser;
    _fetchUserData();
    _logOpenActivity();
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
      _logResumeActivity().whenComplete(() {
        _hasLoggedResume = false;
      });
    }
  }

  Future<void> _fetchUserData() async {
    if (firebaseUser == null) return;

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        setState(() {
          username = data['name'] ?? "User";
          profileImageBase64 = data['profileImageBase64'];
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

      final data = doc.data()!;
      final userName = data['name'] ?? "User";

      await activityController.logActivity(
        userId: firebaseUser!.uid,
        userName: userName,
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

      final data = doc.data()!;
      final userName = data['name'] ?? "User";

      await activityController.logActivity(
        userId: firebaseUser!.uid,
        userName: userName,
        action: "resume_app",
      );
    } catch (e) {
      debugPrint("Error logging resume activity: $e");
    }
  }

  ImageProvider getProfileImage() {
    try {
      if (profileImageBase64 != null && profileImageBase64!.trim().isNotEmpty) {
        final cleanBase64 = profileImageBase64!
            .replaceAll('\n', '')
            .replaceAll(' ', '');

        final bytes = base64Decode(cleanBase64);
        return MemoryImage(bytes);
      }
    } catch (e) {
      debugPrint("Profile image decode error: $e");
    }
    return const AssetImage("assets/images/admin.png");
  }

  Future<void> handleLogout(BuildContext context) async {
    final loginController = LoginController();
    await FirebaseAuth.instance.signOut();
    await loginController.clearSharedPref();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  List<Widget> _buildPages() {
    return [
      _buildHomePage(),
      const ChatBotPage(),
      const EmergencyPage(),
      const UserProfilePage(),
    ];
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFF1E1E24),
                      size: 28,
                    ),
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: getProfileImage(),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFF34C759),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Hello ",
                        style: TextStyle(
                          color: Color(0xFF1E1E24),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        username.isNotEmpty ? username : "User",
                        style: const TextStyle(
                          color: Color(0xFF636AE8),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text("👋", style: TextStyle(fontSize: 26)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "How are you feeling today?",
                    style: TextStyle(
                      color: Color(0xFF8A8A93),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Motivation & Daily Check-in",
                    style: TextStyle(
                      color: Color(0xFF1E1E24),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Swipe",
                        style: TextStyle(
                          color: const Color(0xFF1E1E24).withOpacity(0.4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: const Color(0xFF1E1E24).withOpacity(0.4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _buildMotivationCardsStream(),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Quick Access Tools",
                style: TextStyle(
                  color: Color(0xFF1E1E24),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.88,
                children: [
                  _FeatureRoundButton(
                    icon: Icons.chat_bubble_rounded,
                    label: "Talk to Me",
                    iconColor: const Color(0xFF636AE8),
                    bgColor: const Color(0xFFEEF0FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChatBotPage()),
                      );
                    },
                  ),
                  _FeatureRoundButton(
                    icon: Icons.menu_book_rounded,
                    label: "Guide",
                    iconColor: const Color(0xFFFFB323),
                    bgColor: const Color(0xFFFFF7E6),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SpiritualWisdomApp(),
                        ),
                      );
                    },
                  ),
                  _FeatureRoundButton(
                    icon: Icons.people_alt_rounded,
                    label: "Relationship\nAdvice",
                    iconColor: const Color(0xFF8E59FF),
                    bgColor: const Color(0xFFF4EEFF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RelationshipAdvicePage(),
                        ),
                      );
                    },
                  ),
                  _FeatureRoundButton(
                    icon: Icons.shield_rounded,
                    label: "Expert Advice",
                    iconColor: const Color(0xFF4FA5FF),
                    bgColor: const Color(0xFFEEF6FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ExpertAdvicePage()),
                      );
                    },
                  ),
                  _FeatureRoundButton(
                    icon: Icons.fitness_center_rounded,
                    label: "Exercise",
                    iconColor: const Color(0xFF4FA5FF),
                    bgColor: const Color(0xFFEEF6FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ExercisePage()),
                      );
                    },
                  ),
                  _FeatureRoundButton(
                    icon: Icons.healing_rounded,
                    label: "Healing",
                    iconColor: const Color(0xFF8E59FF),
                    bgColor: const Color(0xFFF4EEFF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StressManagementPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF9FAFC),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF636AE8)),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: getProfileImage(),
                  ),
                ),
                accountName: Text(
                  username.isNotEmpty ? username : "Active User",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                accountEmail: const SizedBox.shrink(),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Color(0xFF1E1E24)),
                title: const Text("Dashboard"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DashboardPage(
                        username: username.isNotEmpty ? username : '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: const Text("Emergency"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmergencyPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  color: Color(0xFF1E1E24),
                ),
                title: const Text("Help & Support"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HelpPage()),
                  );
                },
              ),
              const Spacer(),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await handleLogout(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(0, Icons.home_rounded, "Home"),
                _buildBottomNavItem(1, Icons.chat_bubble_rounded, "Chat"),
                _buildMiddleEmergencyButton(context),
                _buildBottomNavItem(2, Icons.warning_rounded, "Emergency"),
                _buildBottomNavItem(3, Icons.person_rounded, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationCardsStream() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('motivation_cards')
          .where('isActive', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildSingleFallbackCard(
            text:
                "Every day may not be good, but there is something good in every day.",
            subText: "Take a deep breath and begin gently.",
            emoji: "🌸",
            colors: const [Color(0xFFEAEBFF), Color(0xFFF8ECFF)],
          );
        }

        if (snapshot.hasError) {
          return _buildSingleFallbackCard(
            text:
                "You are stronger than you think, and brighter days are ahead.",
            subText: "One small positive step is enough for today.",
            emoji: "🙂",
            colors: const [Color(0xFFEAEBFF), Color(0xFFF3F4FF)],
          );
        }

        final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
            snapshot.data?.docs.toList() ?? [];

        docs.sort((a, b) {
          final dynamic aRaw = a.data()['order'];
          final dynamic bRaw = b.data()['order'];

          final int aOrder = aRaw is int
              ? aRaw
              : int.tryParse(aRaw?.toString() ?? '') ?? 999999;
          final int bOrder = bRaw is int
              ? bRaw
              : int.tryParse(bRaw?.toString() ?? '') ?? 999999;

          return aOrder.compareTo(bOrder);
        });

        if (docs.isEmpty) {
          return _buildSingleFallbackCard(
            text:
                "Believe in yourself. You have the power to heal, grow, and shine.",
            subText: "Your journey matters, even on slow days.",
            emoji: "💛",
            colors: const [Color(0xFFFFF1CC), Color(0xFFFFF7E8)],
          );
        }

        if (_currentMotivationPage >= docs.length) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _currentMotivationPage = 0;
              });
            }
          });
        }

        return Column(
          children: [
            SizedBox(
              height: 190,
              child: PageView.builder(
                controller: _motivationPageController,
                physics: const BouncingScrollPhysics(
                  parent: PageScrollPhysics(),
                ),
                itemCount: docs.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentMotivationPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data = docs[index].data();

                  final String quoteText =
                      (data['text']?.toString().trim().isNotEmpty ?? false)
                      ? data['text'].toString().trim()
                      : "Stay strong, brighter days are ahead.";

                  final String quoteEmoji =
                      (data['icon']?.toString().trim().isNotEmpty ?? false)
                      ? data['icon'].toString().trim()
                      : "🙂";

                  final int color1Value = _parseColorValue(
                    data['color1'],
                    0xFFEAEBFF,
                  );
                  final int color2Value = _parseColorValue(
                    data['color2'],
                    0xFFF3F4FF,
                  );

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: _MotivationCard(
                      text: quoteText,
                      subText: "Take a deep breath. You've got this.",
                      emoji: quoteEmoji,
                      colors: [Color(color1Value), Color(color2Value)],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            _buildPageIndicator(docs.length, _currentMotivationPage),
          ],
        );
      },
    );
  }

  int _parseColorValue(dynamic value, int fallback) {
    if (value is int) return value;
    if (value is String) {
      final cleaned = value.replaceAll('#', '').trim();

      if (cleaned.isEmpty) return fallback;

      if (cleaned.length == 6) {
        return int.tryParse('FF$cleaned', radix: 16) ?? fallback;
      }

      if (cleaned.length == 8) {
        return int.tryParse(cleaned, radix: 16) ?? fallback;
      }
    }
    return fallback;
  }

  Widget _buildSingleFallbackCard({
    required String text,
    required String subText,
    required String emoji,
    required List<Color> colors,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: 190,
            child: _MotivationCard(
              text: text,
              subText: subText,
              emoji: emoji,
              colors: colors,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildPageIndicator(1, 0),
      ],
    );
  }

  Widget _buildPageIndicator(int count, int current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isSelected = index == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: isSelected ? 18 : 6,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF636AE8)
                : const Color(0xFFD1D1D6),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFF636AE8)
                : const Color(0xFFA1A1A9),
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF636AE8)
                  : const Color(0xFFA1A1A9),
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleEmergencyButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmergencyPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFF4B6E),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF4B6E).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.phone_in_talk_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  void _showWellnessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (bottomSheetContext) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Wellness Hub Options",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E24),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: 96,
                    child: _FeatureRoundButton(
                      icon: Icons.fitness_center_rounded,
                      label: "Exercise",
                      iconColor: const Color(0xFF4FA5FF),
                      bgColor: const Color(0xFFEEF6FF),
                      onTap: () {
                        Navigator.pop(bottomSheetContext);
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
                    width: 96,
                    child: _FeatureRoundButton(
                      icon: Icons.healing_rounded,
                      label: "Healing",
                      iconColor: const Color(0xFF8E59FF),
                      bgColor: const Color(0xFFF4EEFF),
                      onTap: () {
                        Navigator.pop(bottomSheetContext);
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
        );
      },
    );
  }
}

class _MotivationCard extends StatelessWidget {
  final String text;
  final String subText;
  final String emoji;
  final List<Color> colors;

  const _MotivationCard({
    required this.text,
    required this.subText,
    required this.emoji,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.08,
              child: Icon(
                Icons.spa_rounded,
                size: 160,
                color: const Color(0xFF636AE8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xFF1E1E24),
                          height: 1.3,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subText,
                        style: const TextStyle(
                          color: Color(0xFF7D7E87),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFDE6A),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x55FFDE6A),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 38)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureRoundButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;

  const _FeatureRoundButton({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.015),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF1E1E24),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
