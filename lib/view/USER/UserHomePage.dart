import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
import 'package:mentalwellapp/view/USER/exercise_page.dart';
import 'package:mentalwellapp/view/USER/expert_advice.dart';
import 'package:mentalwellapp/view/USER/guide_page.dart';
import 'package:mentalwellapp/view/USER/healing_page.dart';
import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
import 'package:mentalwellapp/view/USER/selfcare_page.dart';
import 'package:mentalwellapp/view/USER/sleep_page.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
import 'package:mentalwellapp/view/user_drawer/help_page.dart';
import 'package:mentalwellapp/view/WIDGETS/constants.dart';
import 'package:mentalwellapp/controller/LoginController.dart';

class UserHomeWrapper extends StatefulWidget {
  const UserHomeWrapper({super.key});

  @override
  State<UserHomeWrapper> createState() => _UserHomeWrapperState();
}

class _UserHomeWrapperState extends State<UserHomeWrapper> {
  User? firebaseUser;
  String username = "";
  String? profileImageBase64;

  int selectedIndex = 0;
  String selectedMood = "🙂";

  @override
  void initState() {
    super.initState();
    firebaseUser = FirebaseAuth.instance.currentUser;
    _fetchUserData();
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
      print("Error fetching user data: $e");
    }
  }

  // ImageProvider getProfileImage() {
  //   if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
  //     final bytes = base64Decode(profileImageBase64!);
  //     return MemoryImage(bytes);
  //   } else {
  //     return const AssetImage("assets/images/default_user.png");
  //   }
  // }

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
      print("Profile image decode error: $e");
    }

    // ✅ CORRECT fallback
    return const AssetImage("assets/default_profile.jpg");
  }

  Future<void> handleLogout(BuildContext context) async {
    final loginController = LoginController();

    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Clear saved login data
    await loginController.clearSharedPref();

    // Navigate back to LoginPage
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  children: const [
                    _MotivationCard(
                      text:
                          "Believe in yourself 🌟\nMagic happens when you try.",
                      icon: "🙂",
                      colors: [
                        Color.fromARGB(255, 174, 112, 184),
                        Color(0xFFE040FB),
                      ],
                    ),
                    _MotivationCard(
                      text:
                          "Every day is a fresh start ✨\nSmile and shine today.",
                      icon: "🌸",
                      colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
                    ),
                    _MotivationCard(
                      text:
                          "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
                      icon: "🌞",
                      colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
                    ),
                    _MotivationCard(
                      text:
                          "Stay calm, stay positive 🌈\nInner peace is power.",
                      icon: "🧘",
                      colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                    ),
                    _MotivationCard(
                      text: "Push yourself 💪\nBecause no one else will.",
                      icon: "🔥",
                      colors: [Color(0xFFF44336), Color(0xFFE57373)],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _FeatureRoundButton(
                      icon: Icons.chat_bubble_rounded,
                      label: "  Talk to Me  ",
                      color: const Color(0xFFA7B8F6),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChatBotPage(),
                          ),
                        );
                      },
                    ),
                    _FeatureRoundButton(
                      icon: Icons.health_and_safety,
                      label: "  Wellness Hub  ",
                      color: const Color(0xFFF6A7C1),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              child: Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  _FeatureRoundButton(
                                    icon: Icons.spa,
                                    label: "  Self-Care  ",
                                    color: const Color(0xFFF6A7C1),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const SelfCarePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  _FeatureRoundButton(
                                    icon: Icons.fitness_center,
                                    label: "  Exercise  ",
                                    color: const Color(0xFFF6A7C1),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const ExercisePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  _FeatureRoundButton(
                                    icon: Icons.healing,
                                    label: "  Healing  ",
                                    color: const Color(0xFFF6A7C1),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const HealingPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  _FeatureRoundButton(
                                    icon: Icons.bedtime,
                                    label: "  Sleep  ",
                                    color: const Color(0xFFF6A7C1),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const SleepRelaxationPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    _FeatureRoundButton(
                      icon: Icons.menu_book_rounded,
                      label: "  Guide  ",
                      color: const Color(0xFF6DD47E),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const GuidePage()),
                        );
                      },
                    ),
                    _FeatureRoundButton(
                      icon: Icons.mood,
                      label: "  Mood Tracker  ",
                      color: const Color(0xFFFFCE70),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MoodTrackerPage(),
                          ),
                        );
                      },
                    ),
                    _FeatureRoundButton(
                      icon: Icons.favorite,
                      label: "  Relationship Advice  ",
                      color: const Color(0xFF6DD47E),
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
                      icon: Icons.psychology,
                      label: "  Expert Advice  ",
                      color: const Color(0xFFA7B8F6),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ExpertAdvicePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const Center(child: Text("Explore Page")),
      const Center(child: Text("Book Page")),
      const Center(child: Text("Profile Page")),
    ];

    return Scaffold(
      backgroundColor: kCard,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 201, 175),
        iconTheme: const IconThemeData(color: kDark),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $username",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              "How are you feeling today?",
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(radius: 18, backgroundImage: getProfileImage()),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: kCard,
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: kPrimary),
                currentAccountPicture: CircleAvatar(
                  radius: 30,
                  backgroundImage: getProfileImage(),
                ),
                accountName: Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                accountEmail: const Text("Active User"),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: kDark),
                title: const Text("Dashboard"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DashboardPage(username: ''),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: kDark),
                title: const Text("Notifications"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: const Text("Emergency"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmergencyPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline, color: kDark),
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
                  Navigator.pop(context); // Close drawer
                  await handleLogout(context); // Logout
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.orange,
              child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "How are you feeling?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            children: [
                              _MoodEmoji(
                                emoji: "🙂",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "🙂"),
                              ),
                              _MoodEmoji(
                                emoji: "😢",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "😢"),
                              ),
                              _MoodEmoji(
                                emoji: "😡",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "😡"),
                              ),
                              _MoodEmoji(
                                emoji: "😴",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "😴"),
                              ),
                              _MoodEmoji(
                                emoji: "😍",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "😍"),
                              ),
                              _MoodEmoji(
                                emoji: "😌",
                                label: "",
                                onTap: () =>
                                    setState(() => selectedMood = "😌"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: UserBottomNavBar(
        selectedIndex: selectedIndex,
        parentContext: context,
        onTabSelected: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}

// --- Helper Widgets ---
class _MoodEmoji extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const _MoodEmoji({
    required this.emoji,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class _MotivationCard extends StatelessWidget {
  final String text;
  final String icon;
  final List<Color> colors;

  const _MotivationCard({
    required this.text,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white.withOpacity(0.25),
              child: Text(icon, style: const TextStyle(fontSize: 28)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRoundButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _FeatureRoundButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// import 'package:mentalwellapp/view/USER/exercise_page.dart';
// import 'package:mentalwellapp/view/USER/expert_advice.dart';
// import 'package:mentalwellapp/view/USER/guide_page.dart';
// import 'package:mentalwellapp/view/USER/healing_page.dart';
// import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// import 'package:mentalwellapp/view/USER/nutrition_page.dart';
// import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// import 'package:mentalwellapp/view/USER/selfcare_page.dart';
// import 'package:mentalwellapp/view/USER/sleep_page.dart';
// import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';

// class UserHomeWrapper extends StatefulWidget {
//   final String username;
//   const UserHomeWrapper({super.key, required this.username});

//   @override
//   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// }

// class _UserHomeWrapperState extends State<UserHomeWrapper> {
//   User? firebaseUser; // ✅ Firebase user object

//   int selectedIndex = 0;
//   String selectedMood = "🙂";

//   @override
//   void initState() {
//     super.initState();
//     firebaseUser =
//         FirebaseAuth.instance.currentUser; // ✅ Get current logged-in user
//   }

//   Future<void> handleLogout(BuildContext context) async {
//     final loginController = LoginController();

//     // Sign out from Firebase
//     await FirebaseAuth.instance.signOut();

//     // Clear saved login data
//     await loginController.clearSharedPref();

//     // Navigate back to LoginPage
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginPage()),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 180,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                   children: const [
//                     _MotivationCard(
//                       text:
//                           "Believe in yourself 🌟\nMagic happens when you try.",
//                       icon: "🙂",
//                       colors: [
//                         Color.fromARGB(255, 174, 112, 184),
//                         Color(0xFFE040FB),
//                       ],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Every day is a fresh start ✨\nSmile and shine today.",
//                       icon: "🌸",
//                       colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
//                       icon: "🌞",
//                       colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Stay calm, stay positive 🌈\nInner peace is power.",
//                       icon: "🧘",
//                       colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
//                     ),
//                     _MotivationCard(
//                       text: "Push yourself 💪\nBecause no one else will.",
//                       icon: "🔥",
//                       colors: [Color(0xFFF44336), Color(0xFFE57373)],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//                 child: Wrap(
//                   spacing: 16,
//                   runSpacing: 16,
//                   children: [
//                     _FeatureRoundButton(
//                       icon: Icons.chat_bubble_rounded,
//                       label: "  Talk to Me  ",
//                       color: const Color(0xFFA7B8F6),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ChatBotPage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.health_and_safety,
//                       label: "  Wellness Hub  ",
//                       color: const Color(0xFFF6A7C1),
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) {
//                             return Container(
//                               padding: const EdgeInsets.all(16),
//                               child: Wrap(
//                                 spacing: 16,
//                                 runSpacing: 16,
//                                 children: [
//                                   _FeatureRoundButton(
//                                     icon: Icons.spa,
//                                     label: "  Self-Care  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const SelfCarePage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.fitness_center,
//                                     label: "  Exercise  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const ExercisePage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.healing,
//                                     label: "  Healing  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const HealingPage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.bedtime,
//                                     label: "  Sleep  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) =>
//                                               const SleepRelaxationPage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.menu_book_rounded,
//                       label: "  Guide  ",
//                       color: const Color(0xFF6DD47E),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => const GuidePage()),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.mood,
//                       label: "  Mood Tracker  ",
//                       color: const Color(0xFFFFCE70),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const MoodTrackerPage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.favorite,
//                       label: "  Relationship Advice  ",
//                       color: const Color(0xFF6DD47E),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const RelationshipAdvicePage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.psychology,
//                       label: "  Expert Advice  ",
//                       color: const Color(0xFFA7B8F6),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ExpertAdvicePage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       const Center(child: Text("Explore Page")),
//       const Center(child: Text("Book Page")),
//       const Center(child: Text("Profile Page")),
//     ];

//     return Scaffold(
//       backgroundColor: kCard,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 219, 201, 175),
//         iconTheme: const IconThemeData(color: kDark),
//         centerTitle: false,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Hello ${firebaseUser?.displayName ?? widget.username}",
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const Text(
//               "How are you feeling today?",
//               style: TextStyle(color: Colors.black54, fontSize: 13),
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: firebaseUser?.photoURL != null
//                   ? NetworkImage(firebaseUser!.photoURL!)
//                   : const AssetImage("assets/images/default_user.png")
//                         as ImageProvider,
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         backgroundColor: kCard,
//         child: SafeArea(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 decoration: const BoxDecoration(color: kPrimary),
//                 currentAccountPicture: const CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.person, size: 40, color: kPrimary),
//                 ),
//                 accountName: Text(
//                   firebaseUser?.displayName ?? widget.username,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 accountEmail: const Text("Active User"),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.dashboard, color: kDark),
//                 title: const Text("Dashboard"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const DashboardPage(username: "Sakshi"),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.notifications, color: kDark),
//                 title: const Text("Notifications"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const NotificationsPage(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.warning, color: Colors.red),
//                 title: const Text("Emergency"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.help_outline, color: kDark),
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
//                   Navigator.pop(context); // Close drawer
//                   await handleLogout(context); // Logout
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: pages[selectedIndex],
//       floatingActionButton: selectedIndex == 0
//           ? FloatingActionButton(
//               backgroundColor: Colors.orange,
//               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(20),
//                     ),
//                   ),
//                   builder: (context) {
//                     return Container(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Text(
//                             "How are you feeling?",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Wrap(
//                             spacing: 16,
//                             runSpacing: 12,
//                             children: [
//                               _MoodEmoji(
//                                 emoji: "🙂",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "🙂"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😢",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😢"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😡",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😡"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😴",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😴"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😍",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😍"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😌",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😌"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             )
//           : null,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: UserBottomNavBar(
//         selectedIndex: selectedIndex,
//         parentContext: context,
//         onTabSelected: (index) {
//           setState(() => selectedIndex = index);
//         },
//       ),
//     );
//   }
// }

// // --- Helper Widgets ---
// class _MoodEmoji extends StatelessWidget {
//   final String emoji;
//   final String label;
//   final VoidCallback onTap;

//   const _MoodEmoji({
//     required this.emoji,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap();
//         Navigator.pop(context);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(emoji, style: const TextStyle(fontSize: 32)),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }

// class _MotivationCard extends StatelessWidget {
//   final String text;
//   final String icon;
//   final List<Color> colors;

//   const _MotivationCard({
//     required this.text,
//     required this.icon,
//     required this.colors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       margin: const EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: colors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: colors.last.withOpacity(0.4),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.white.withOpacity(0.25),
//               child: Text(icon, style: const TextStyle(fontSize: 28)),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FeatureRoundButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _FeatureRoundButton({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(22),
//       child: Container(
//         width: 150,
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.6),
//           borderRadius: BorderRadius.circular(22),
//         ),
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 28,
//               backgroundColor: color,
//               child: Icon(icon, color: Colors.white, size: 26),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// import 'package:mentalwellapp/view/USER/exercise_page.dart';
// import 'package:mentalwellapp/view/USER/expert_advice.dart';
// import 'package:mentalwellapp/view/USER/guide_page.dart';
// import 'package:mentalwellapp/view/USER/healing_page.dart';
// import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// import 'package:mentalwellapp/view/USER/nutrition_page.dart';
// import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// import 'package:mentalwellapp/view/USER/selfcare_page.dart';
// import 'package:mentalwellapp/view/USER/sleep_page.dart';
// import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';

// class UserHomeWrapper extends StatefulWidget {
//   final String username;
//   const UserHomeWrapper({super.key, required this.username});

//   @override
//   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// }

// class _UserHomeWrapperState extends State<UserHomeWrapper> {
//   Future<void> handleLogout(BuildContext context) async {
//     final loginController = LoginController();

//     // Sign out from Firebase
//     await FirebaseAuth.instance.signOut();

//     // Clear saved login data
//     await loginController.clearSharedPref();



//     // Navigate back to LoginPage
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginPage()),
//       (route) => false,
//     );
//   }

//   int selectedIndex = 0;
//   String selectedMood = "🙂";

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 180,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                   children: const [
//                     _MotivationCard(
//                       text:
//                           "Believe in yourself 🌟\nMagic happens when you try.",
//                       icon: "🙂",
//                       colors: [
//                         Color.fromARGB(255, 174, 112, 184),
//                         Color(0xFFE040FB),
//                       ],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Every day is a fresh start ✨\nSmile and shine today.",
//                       icon: "🌸",
//                       colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
//                       icon: "🌞",
//                       colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
//                     ),
//                     _MotivationCard(
//                       text:
//                           "Stay calm, stay positive 🌈\nInner peace is power.",
//                       icon: "🧘",
//                       colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
//                     ),
//                     _MotivationCard(
//                       text: "Push yourself 💪\nBecause no one else will.",
//                       icon: "🔥",
//                       colors: [Color(0xFFF44336), Color(0xFFE57373)],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//                 child: Wrap(
//                   spacing: 16,
//                   runSpacing: 16,
//                   children: [
//                     _FeatureRoundButton(
//                       icon: Icons.chat_bubble_rounded,
//                       label: "  Talk to Me  ",
//                       color: const Color(0xFFA7B8F6),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ChatBotPage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.health_and_safety,
//                       label: "  Wellness Hub  ",
//                       color: const Color(0xFFF6A7C1),
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) {
//                             return Container(
//                               padding: const EdgeInsets.all(16),
//                               child: Wrap(
//                                 spacing: 16,
//                                 runSpacing: 16,
//                                 children: [
//                                   _FeatureRoundButton(
//                                     icon: Icons.spa,
//                                     label: "  Self-Care  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const SelfCarePage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.fitness_center,
//                                     label: "  Exercise  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const ExercisePage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.healing,
//                                     label: "  Healing  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => const HealingPage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                   _FeatureRoundButton(
//                                     icon: Icons.bedtime,
//                                     label: "  Sleep  ",
//                                     color: const Color(0xFFF6A7C1),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) =>
//                                               const SleepRelaxationPage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.menu_book_rounded,
//                       label: "  Guide  ",
//                       color: const Color(0xFF6DD47E),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => const GuidePage()),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.mood,
//                       label: "  Mood Tracker  ",
//                       color: const Color(0xFFFFCE70),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const MoodTrackerPage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.favorite,
//                       label: "  Relationship Advice  ",
//                       color: const Color(0xFF6DD47E),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const RelationshipAdvicePage(),
//                           ),
//                         );
//                       },
//                     ),
//                     _FeatureRoundButton(
//                       icon: Icons.psychology,
//                       label: "  Expert Advice  ",
//                       color: const Color(0xFFA7B8F6),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ExpertAdvicePage(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       const Center(child: Text("Explore Page")),
//       const Center(child: Text("Book Page")),
//       const Center(child: Text("Profile Page")),
//     ];

//     return Scaffold(
//       backgroundColor: kCard,
//       // appBar: AppBar(
//       //   backgroundColor: const Color.fromARGB(255, 219, 201, 175),
//       //   iconTheme: const IconThemeData(color: kDark),
//       //   title: const Text(
//       //     "MentalWell",
//       //     style: TextStyle(
//       //       color: Colors.black,
//       //       fontWeight: FontWeight.bold,
//       //       fontSize: 25,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       // ),

//       appBar: AppBar(
//   backgroundColor: const Color.fromARGB(255, 219, 201, 175),
//   iconTheme: const IconThemeData(color: kDark),
//   centerTitle: false,
//   title: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "Hello ${firebaseUser?.displayName ?? widget.username}",
//         style: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//       const Text(
//         "How are you feeling today?",
//         style: TextStyle(color: Colors.black54, fontSize: 13),
//       ),
//     ],
//   ),
//   actions: [
//     Padding(
//       padding: const EdgeInsets.only(right: 12),
//       child: CircleAvatar(
//         radius: 18,
//         backgroundImage: firebaseUser?.photoURL != null
//             ? NetworkImage(firebaseUser!.photoURL!)
//             : const AssetImage("assets/images/default_user.png") as ImageProvider,
//       ),
//     ),
//   ],
// ),

//       drawer: Drawer(
//         backgroundColor: kCard,
//         child: SafeArea(
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 decoration: const BoxDecoration(color: kPrimary),
//                 currentAccountPicture: const CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.person, size: 40, color: kPrimary),
//                 ),
//                 accountName: Text(
//                   widget.username,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 accountEmail: const Text("Active User"),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.dashboard, color: kDark),
//                 title: const Text("Dashboard"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const DashboardPage(username: "Sakshi"),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.notifications, color: kDark),
//                 title: const Text("Notifications"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const NotificationsPage(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.warning, color: Colors.red),
//                 title: const Text("Emergency"),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.help_outline, color: kDark),
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
//               //               ListTile(
//               //                 leading: const Icon(Icons.logout, color: Colors.red),
//               //                 title:
//               //                     const Text("Logout", style: TextStyle(color: Colors.red)),

//               // onTap: () {
//               //   Navigator.pop(context); // Close the drawer first
//               //   Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
//               //     MaterialPageRoute(builder: (context) => const LoginPage()),
//               //     (route) => false,
//               //   );
//               // },

//               //               ),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.red),
//                 title: const Text(
//                   "Logout",
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onTap: () async {
//                   Navigator.pop(context); // Close the drawer first
//                   await handleLogout(context); // Then logout
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: pages[selectedIndex],
//       floatingActionButton: selectedIndex == 0
//           ? FloatingActionButton(
//               backgroundColor: Colors.orange,
//               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(20),
//                     ),
//                   ),
//                   builder: (context) {
//                     return Container(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Text(
//                             "How are you feeling?",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Wrap(
//                             spacing: 16,
//                             runSpacing: 12,
//                             children: [
//                               _MoodEmoji(
//                                 emoji: "🙂",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "🙂"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😢",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😢"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😡",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😡"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😴",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😴"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😍",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😍"),
//                               ),
//                               _MoodEmoji(
//                                 emoji: "😌",
//                                 label: "",
//                                 onTap: () =>
//                                     setState(() => selectedMood = "😌"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             )
//           : null,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: UserBottomNavBar(
//         selectedIndex: selectedIndex,
//         parentContext: context,
//         onTabSelected: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// // --- Helper Widgets ---
// class _MoodEmoji extends StatelessWidget {
//   final String emoji;
//   final String label;
//   final VoidCallback onTap;

//   const _MoodEmoji({
//     required this.emoji,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap();
//         Navigator.pop(context);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(emoji, style: const TextStyle(fontSize: 32)),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }

// class _MotivationCard extends StatelessWidget {
//   final String text;
//   final String icon;
//   final List<Color> colors;

//   const _MotivationCard({
//     required this.text,
//     required this.icon,
//     required this.colors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       margin: const EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: colors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: colors.last.withOpacity(0.4),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.white.withOpacity(0.25),
//               child: Text(icon, style: const TextStyle(fontSize: 28)),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FeatureRoundButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _FeatureRoundButton({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(22),
//       child: Container(
//         width: 150, // ✅ Increased width for better spacing
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.6),
//           borderRadius: BorderRadius.circular(22),
//         ),
//         padding: const EdgeInsets.all(20), // ✅ Increased padding
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 28, // ✅ Slightly larger icon
//               backgroundColor: color,
//               child: Icon(icon, color: Colors.white, size: 26),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15,
//               ), // ✅ Bigger text
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// // // import 'package:flutter/material.dart';
// // // import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// // // import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';
// // // import 'package:mentalwellapp/view/USER/exercise_page.dart';
// // // import 'package:mentalwellapp/view/USER/expert_advice.dart';
// // // import 'package:mentalwellapp/view/USER/guide_page.dart';
// // // import 'package:mentalwellapp/view/USER/healing_page.dart';
// // // import 'package:mentalwellapp/view/USER/moodtracker_page.dart';
// // // import 'package:mentalwellapp/view/USER/nutrition_page.dart';
// // // import 'package:mentalwellapp/view/USER/relationshipadvice_page.dart';
// // // import 'package:mentalwellapp/view/USER/selfcare_page.dart';
// // // import 'package:mentalwellapp/view/USER/sleep_page.dart';
// // // import 'package:mentalwellapp/view/USER/stresschallenges_page.dart';
// // // import 'package:mentalwellapp/view/WIDGETS/constants.dart';
// // // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // // import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// // // import 'package:mentalwellapp/view/user_drawer/help_page.dart';
// // // import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// // // /// Wrapper to manage BottomNavBar & page switching
// // // class UserHomeWrapper extends StatefulWidget {
// // //   final String username;
// // //   const UserHomeWrapper({super.key, required this.username});

// // //   @override
// // //   State<UserHomeWrapper> createState() => _UserHomeWrapperState();
// // // }

// // // class _UserHomeWrapperState extends State<UserHomeWrapper> {
// // //   int selectedIndex = 0;

// // //   // Floating mood selection only on Home tab
// // //   String selectedMood = "🙂";

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Pages for bottom navbar (just body content, no Scaffold here)
// // //     final List<Widget> pages = [
// // //       // Home page content
// // //       SafeArea(
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               SizedBox(
// // //                 height: 180,
// // //                 child: ListView(
// // //                   scrollDirection: Axis.horizontal,
// // //                   physics: const BouncingScrollPhysics(),
// // //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //                   children: const [
// // //                     _MotivationCard(
// // //                       text: "Believe in yourself 🌟\nMagic happens when you try.",
// // //                       icon: "🙂",
// // //                       colors: [
// // //                         Color.fromARGB(255, 174, 112, 184),
// // //                         Color(0xFFE040FB)
// // //                       ],
// // //                     ),
// // //                     _MotivationCard(
// // //                       text: "Every day is a fresh start ✨\nSmile and shine today.",
// // //                       icon: "🌸",
// // //                       colors: [Color(0xFF00BCD4), Color(0xFF4DD0E1)],
// // //                     ),
// // //                     _MotivationCard(
// // //                       text: "Zindagi ek safar hai suhana 🚴‍♀️\nKal kya hoga kisne jaana.",
// // //                       icon: "🌞",
// // //                       colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
// // //                     ),
// // //                     _MotivationCard(
// // //                       text: "Stay calm, stay positive 🌈\nInner peace is power.",
// // //                       icon: "🧘",
// // //                       colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
// // //                     ),
// // //                     _MotivationCard(
// // //                       text: "Push yourself 💪\nBecause no one else will.",
// // //                       icon: "🔥",
// // //                       colors: [Color(0xFFF44336), Color(0xFFE57373)],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// // //                 child: Wrap(
// // //                   spacing: 14,
// // //                   runSpacing: 14,
// // //                   children: [
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.chat_bubble_rounded,
// // //                       label: "Talk to Me",
// // //                       color: const Color(0xFFA7B8F6),
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(builder: (_) => const ChatBotPage()),
// // //                         );
// // //                       },
// // //                     ),
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.health_and_safety,
// // //                       label: "Wellness Hub",
// // //                       color: const Color(0xFFF6A7C1),
// // //                       onTap: () {
// // //                         showModalBottomSheet(
// // //                           context: context,
// // //                           shape: const RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // //                           ),
// // //                           builder: (context) {
// // //                             return Container(
// // //                               padding: const EdgeInsets.all(16),
// // //                               child: Wrap(
// // //                                 spacing: 14,
// // //                                 runSpacing: 14,
// // //                                 children: [
// // //                                   _FeatureRoundButton(
// // //                                     icon: Icons.spa,
// // //                                     label: "Self-Care",
// // //                                     color: const Color(0xFFF6A7C1),
// // //                                     onTap: () {
// // //                                       Navigator.push(
// // //                                         context,
// // //                                         MaterialPageRoute(builder: (_) => const SelfCarePage()),
// // //                                       );
// // //                                     },
// // //                                   ),
// // //                                   _FeatureRoundButton(
// // //                                     icon: Icons.fitness_center,
// // //                                     label: "Exercise",
// // //                                     color: const Color(0xFFF6A7C1),
// // //                                     onTap: () {
// // //                                       Navigator.push(
// // //                                         context,
// // //                                         MaterialPageRoute(builder: (_) => const ExercisePage()),
// // //                                       );
// // //                                     },
// // //                                   ),
// // //                                   _FeatureRoundButton(
// // //                                     icon: Icons.healing,
// // //                                     label: "Healing",
// // //                                     color: const Color(0xFFF6A7C1),
// // //                                     onTap: () {
// // //                                       Navigator.push(
// // //                                         context,
// // //                                         MaterialPageRoute(builder: (_) => const HealingPage()),
// // //                                       );
// // //                                     },
// // //                                   ),
// // //                                   _FeatureRoundButton(
// // //                                     icon: Icons.bedtime,
// // //                                     label: "Sleep",
// // //                                     color: const Color(0xFFF6A7C1),
// // //                                     onTap: () {
// // //                                       Navigator.push(
// // //                                         context,
// // //                                         MaterialPageRoute(builder: (_) => const SleepRelaxationPage()),
// // //                                       );
// // //                                     },
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             );
// // //                           },
// // //                         );
// // //                       },
// // //                     ),
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.menu_book_rounded,
// // //                       label: "Guide",
// // //                       color: const Color(0xFF6DD47E),
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(builder: (_) => const GuidePage()),
// // //                         );
// // //                       },
// // //                     ),
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.mood,
// // //                       label: "Mood Tracker",
// // //                       color: const Color(0xFFFFCE70),
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(builder: (_) => const MoodTrackerPage()),
// // //                         );
// // //                       },
// // //                     ),
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.favorite,
// // //                       label: "Relationship Advice",
// // //                       color: const Color(0xFF6DD47E),
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(builder: (_) => const RelationshipAdvicePage()),
// // //                         );
// // //                       },
// // //                     ),
// // //                     _FeatureRoundButton(
// // //                       icon: Icons.psychology,
// // //                       label: "Expert Advice",
// // //                       color: const Color(0xFFA7B8F6),
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(builder: (_) => const ExpertAdvicePage()),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       // Explore tab placeholder
// // //       const Center(child: Text("Explore Page")),
// // //       // Book tab placeholder
// // //       const Center(child: Text("Book Page")),
// // //       // Profile tab placeholder
// // //       const Center(child: Text("Profile Page")),
// // //     ];

// // //     return Scaffold(
// // //       backgroundColor: kCard,
// // //       appBar: AppBar(
// // //         backgroundColor: kPrimary,
// // //         iconTheme: const IconThemeData(color: kDark),
// // //         title: const Text(
// // //           "MentalWell",
// // //           style: TextStyle(
// // //             color: Colors.white,
// // //             fontWeight: FontWeight.bold,
// // //             fontSize: 20,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       drawer: Drawer(
// // //         backgroundColor: kCard,
// // //         child: SafeArea(
// // //           child: Column(
// // //             children: [
// // //               UserAccountsDrawerHeader(
// // //                 decoration: const BoxDecoration(color: kPrimary),
// // //                 currentAccountPicture: const CircleAvatar(
// // //                   radius: 30,
// // //                   backgroundColor: Colors.white,
// // //                   child: Icon(Icons.person, size: 40, color: kPrimary),
// // //                 ),
// // //                 accountName: Text(
// // //                   widget.username,
// // //                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// // //                 ),
// // //                 accountEmail: const Text("Active User"),
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.dashboard, color: kDark),
// // //                 title: const Text("Dashboard"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const DashboardPage(username: "Sakshi"),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.notifications, color: kDark),
// // //                 title: const Text("Notifications"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(builder: (_) => const NotificationsPage()),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.warning, color: Colors.red),
// // //                 title: const Text("Emergency"),
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(builder: (_) => const EmergencyPage()),
// // //                   );
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.help_outline, color: kDark),
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
// // //                 title: const Text("Logout", style: TextStyle(color: Colors.red)),
// // //                 onTap: () {
// // //                   Navigator.popUntil(context, (route) => route.isFirst);
// // //                 },
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       body: pages[selectedIndex],
// // //       floatingActionButton: selectedIndex == 0
// // //           ? FloatingActionButton(
// // //               backgroundColor: Colors.orange,
// // //               child: Text(selectedMood, style: const TextStyle(fontSize: 22)),
// // //               onPressed: () {
// // //                 showModalBottomSheet(
// // //                   context: context,
// // //                   shape: const RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // //                   ),
// // //                   builder: (context) {
// // //                     return Container(
// // //                       padding: const EdgeInsets.all(20),
// // //                       child: Column(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           const Text(
// // //                             "How are you feeling?",
// // //                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                           ),
// // //                           const SizedBox(height: 16),
// // //                           Wrap(
// // //                             spacing: 16,
// // //                             runSpacing: 12,
// // //                             children: [
// // //                               _MoodEmoji(emoji: "🙂", label: "", onTap: () => setState(() => selectedMood = "🙂")),
// // //                               _MoodEmoji(emoji: "😢", label: "", onTap: () => setState(() => selectedMood = "😢")),
// // //                               _MoodEmoji(emoji: "😡", label: "", onTap: () => setState(() => selectedMood = "😡")),
// // //                               _MoodEmoji(emoji: "😴", label: "", onTap: () => setState(() => selectedMood = "😴")),
// // //                               _MoodEmoji(emoji: "😍", label: "", onTap: () => setState(() => selectedMood = "😍")),
// // //                               _MoodEmoji(emoji: "😌", label: "", onTap: () => setState(() => selectedMood = "😌")),
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     );
// // //                   },
// // //                 );
// // //               },
// // //             )
// // //           : null,
// // //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// // //       bottomNavigationBar: UserBottomNavBar(
// // //         selectedIndex: selectedIndex,
// // //          parentContext: context,
// // //         onTabSelected: (index) {
// // //           setState(() {
// // //             selectedIndex = index;
// // //           });
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // // // --- Other helper classes remain unchanged ---
// // // class _MoodEmoji extends StatelessWidget {
// // //   final String emoji;
// // //   final String label;
// // //   final VoidCallback onTap;

// // //   const _MoodEmoji({required this.emoji, required this.label, required this.onTap});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         onTap();
// // //         Navigator.pop(context);
// // //       },
// // //       child: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           Text(emoji, style: const TextStyle(fontSize: 32)),
// // //           const SizedBox(height: 4),
// // //           Text(label, style: const TextStyle(fontSize: 14)),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _MotivationCard extends StatelessWidget {
// // //   final String text;
// // //   final String icon;
// // //   final List<Color> colors;

// // //   const _MotivationCard({required this.text, required this.icon, required this.colors});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       width: 280,
// // //       margin: const EdgeInsets.only(right: 16),
// // //       decoration: BoxDecoration(
// // //         borderRadius: BorderRadius.circular(22),
// // //         gradient: LinearGradient(
// // //           colors: colors,
// // //           begin: Alignment.topLeft,
// // //           end: Alignment.bottomRight,
// // //         ),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: colors.last.withOpacity(0.4),
// // //             blurRadius: 8,
// // //             offset: const Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(20.0),
// // //         child: Row(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             CircleAvatar(
// // //               radius: 32,
// // //               backgroundColor: Colors.white.withOpacity(0.25),
// // //               child: Text(icon, style: const TextStyle(fontSize: 28)),
// // //             ),
// // //             const SizedBox(width: 16),
// // //             Expanded(
// // //               child: Text(
// // //                 text,
// // //                 style: const TextStyle(
// // //                   color: Colors.white,
// // //                   fontSize: 17,
// // //                   fontWeight: FontWeight.w600,
// // //                   height: 1.4,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _FeatureRoundButton extends StatelessWidget {
// // //   final IconData icon;
// // //   final String label;
// // //   final Color color;
// // //   final VoidCallback onTap;

// // //   const _FeatureRoundButton({required this.icon, required this.label, required this.color, required this.onTap});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return InkWell(
// // //       onTap: onTap,
// // //       borderRadius: BorderRadius.circular(20),
// // //       child: Container(
// // //         decoration: BoxDecoration(
// // //           color: color.withOpacity(0.5),
// // //           borderRadius: BorderRadius.circular(20),
// // //         ),
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             CircleAvatar(
// // //               backgroundColor: color,
// // //               child: Icon(icon, color: Colors.white),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
















