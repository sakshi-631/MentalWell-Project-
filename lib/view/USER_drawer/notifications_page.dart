// // import 'package:flutter/material.dart';

// // class NotificationsPage extends StatefulWidget {
// //   const NotificationsPage({super.key});

// //   @override
// //   State<NotificationsPage> createState() => _NotificationsPageState();
// // }

// // class _NotificationsPageState extends State<NotificationsPage> {
// //   final List<Map<String, dynamic>> _notifications = [
// //     {
// //       "icon": Icons.water_drop,
// //       "title": "Stay Hydrated 💧",
// //       "message": "Drink 1 glass of water right now!",
// //       "time": "2 min ago",
// //       "read": false,
// //     },
// //     {
// //       "icon": Icons.self_improvement,
// //       "title": "Take a Break 🌿",
// //       "message": "5 minutes meditation can refresh your mind.",
// //       "time": "10 min ago",
// //       "read": false,
// //     },
// //     {
// //       "icon": Icons.star,
// //       "title": "Keep Going ✨",
// //       "message": "You’re doing amazing, Sak!",
// //       "time": "1 hour ago",
// //       "read": true,
// //     },
// //     {
// //       "icon": Icons.bedtime,
// //       "title": "Sleep Reminder 😴",
// //       "message": "Time to wind down and relax for better sleep.",
// //       "time": "Today, 9:00 PM",
// //       "read": false,
// //     },
// //     {
// //       "icon": Icons.local_fire_department,
// //       "title": "Streak 🔥",
// //       "message": "You maintained a 7-day self-care streak. Keep it up!",
// //       "time": "Yesterday",
// //       "read": true,
// //     },
// //     {
// //       "icon": Icons.tips_and_updates,
// //       "title": "App Tip 💡",
// //       "message": "Try journaling daily for a calmer mind.",
// //       "time": "2 days ago",
// //       "read": false,
// //     },
// //   ];

// //   Future<void> _refreshNotifications() async {
// //     await Future.delayed(const Duration(seconds: 1));
// //     setState(() {
// //       _notifications.insert(
// //         0,
// //         {
// //           "icon": Icons.new_releases,
// //           "title": "New Update 🚀",
// //           "message": "Dark mode is now available in Settings!",
// //           "time": "Just now",
// //           "read": false,
// //         },
// //       );
// //     });
// //   }

// //   void _markAsRead(int index) {
// //     setState(() {
// //       _notifications[index]["read"] = true;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Notifications"),
// //         backgroundColor: Colors.deepPurple,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.done_all),
// //             tooltip: "Mark all as read",
// //             onPressed: () {
// //               setState(() {
// //                 for (var n in _notifications) {
// //                   n["read"] = true;
// //                 }
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //       body: RefreshIndicator(
// //         onRefresh: _refreshNotifications,
// //         child: ListView.builder(
// //           padding: const EdgeInsets.all(16),
// //           itemCount: _notifications.length,
// //           itemBuilder: (context, index) {
// //             final item = _notifications[index];
// //             return GestureDetector(
// //               onTap: () => _markAsRead(index),
// //               child: _NotificationCard(
// //                 icon: item["icon"],
// //                 title: item["title"],
// //                 message: item["message"],
// //                 time: item["time"],
// //                 read: item["read"],
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _NotificationCard extends StatelessWidget {
// //   final IconData icon;
// //   final String title;
// //   final String message;
// //   final String time;
// //   final bool read;

// //   const _NotificationCard({
// //     required this.icon,
// //     required this.title,
// //     required this.message,
// //     required this.time,
// //     required this.read,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 14),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //       elevation: 3,
// //       child: ListTile(
// //         leading: CircleAvatar(
// //           backgroundColor: Colors.deepPurple.withOpacity(0.1),
// //           child: Icon(icon, color: Colors.deepPurple),
// //         ),
// //         title: Text(
// //           title,
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: read ? Colors.grey : Colors.black,
// //           ),
// //         ),
// //         subtitle: Text(
// //           message,
// //           style: TextStyle(
// //             color: read ? Colors.grey : Colors.black87,
// //           ),
// //         ),
// //         trailing: Column(
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
// //             if (!read)
// //               const Icon(Icons.circle, color: Colors.deepPurple, size: 10),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';

// class NotificationsPage extends StatefulWidget {
//   const NotificationsPage({super.key});

//   @override
//   State<NotificationsPage> createState() => _NotificationsPageState();
// }

// class _NotificationsPageState extends State<NotificationsPage> {
//   final List<Map<String, dynamic>> _notifications = [
//     {
//       "icon": Icons.water_drop,
//       "title": "Stay Hydrated 💧",
//       "message": "Drink 1 glass of water right now!",
//       "time": "2 min ago",
//       "read": false,
//     },
//     {
//       "icon": Icons.self_improvement,
//       "title": "Take a Break 🌿",
//       "message": "5 minutes meditation can refresh your mind.",
//       "time": "10 min ago",
//       "read": false,
//     },
//     {
//       "icon": Icons.star,
//       "title": "Keep Going ✨",
//       "message": "You’re doing amazing, Sak!",
//       "time": "1 hour ago",
//       "read": true,
//     },
//     {
//       "icon": Icons.bedtime,
//       "title": "Sleep Reminder 😴",
//       "message": "Time to wind down and relax for better sleep.",
//       "time": "Today, 9:00 PM",
//       "read": false,
//     },
//     {
//       "icon": Icons.local_fire_department,
//       "title": "Streak 🔥",
//       "message": "You maintained a 7-day self-care streak. Keep it up!",
//       "time": "Yesterday",
//       "read": true,
//     },
//     {
//       "icon": Icons.tips_and_updates,
//       "title": "App Tip 💡",
//       "message": "Try journaling daily for a calmer mind.",
//       "time": "2 days ago",
//       "read": false,
//     },
//   ];

//   Future<void> _refreshNotifications() async {
//     await Future.delayed(const Duration(seconds: 1));
//     setState(() {
//       _notifications.insert(
//         0,
//         {
//           "icon": Icons.new_releases,
//           "title": "New Update 🚀",
//           "message": "Dark mode is now available in Settings!",
//           "time": "Just now",
//           "read": false,
//         },
//       );
//     });
//   }

//   void _markAsRead(int index) {
//     setState(() {
//       _notifications[index]["read"] = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Notifications"),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.done_all),
//             tooltip: "Mark all as read",
//             onPressed: () {
//               setState(() {
//                 for (var n in _notifications) {
//                   n["read"] = true;
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refreshNotifications,
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: _notifications.length,
//           itemBuilder: (context, index) {
//             final item = _notifications[index];
//             return GestureDetector(
//               onTap: () => _markAsRead(index),
//               child: _NotificationCard(
//                 icon: item["icon"],
//                 title: item["title"],
//                 message: item["message"],
//                 time: item["time"],
//                 read: item["read"],
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: UserBottomNavBar(
//         parentContext: context,
//         onTabSelected: (index) {
//           // Optional: You can handle tab switching here if needed
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

// class _NotificationCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String message;
//   final String time;
//   final bool read;

//   const _NotificationCard({
//     required this.icon,
//     required this.title,
//     required this.message,
//     required this.time,
//     required this.read,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 14),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 3,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.deepPurple.withOpacity(0.1),
//           child: Icon(icon, color: Colors.deepPurple),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: read ? Colors.grey : Colors.black,
//           ),
//         ),
//         subtitle: Text(
//           message,
//           style: TextStyle(
//             color: read ? Colors.grey : Colors.black87,
//           ),
//         ),
//         trailing: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//             if (!read)
//               const Icon(Icons.circle, color: Colors.deepPurple, size: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  void _callNumber(String number) async {
    final Uri callUri = Uri(scheme: "tel", path: number);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("$feature coming soon 🚀")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Emergency"),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 🚨 SOS Emergency Button
          Center(
            child: GestureDetector(
              onTap: () {
                _callNumber("108");
                _showComingSoon(context, "SOS alerts to friends & family");
              },
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "SOS",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ⚡ Quick Access Section
          const Text(
            "Quick Contacts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildQuickCard(
                context,
                icon: Icons.local_hospital,
                label: "Ambulance",
                color: Colors.red,
                number: "108",
              ),
              _buildQuickCard(
                context,
                icon: Icons.local_police,
                label: "Police",
                color: Colors.indigo,
                number: "100",
              ),
              _buildQuickCard(
                context,
                icon: Icons.medical_services,
                label: "Doctor",
                color: Colors.green,
                number: "9876501234",
              ),
              _buildQuickCard(
                context,
                icon: Icons.people,
                label: "Best Friend",
                color: Colors.orange,
                number: "9876543210",
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 🌍 Additional Features
          const Text(
            "More Safety Features",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildFeatureCard(
            context,
            icon: Icons.map,
            title: "Share Live Location",
            subtitle: "Send your real-time location to trusted contacts",
            color: Colors.blue,
            onTap: () => _showComingSoon(context, "Location Sharing"),
          ),
          _buildFeatureCard(
            context,
            icon: Icons.message,
            title: "Send Panic SMS",
            subtitle: "Automatically alert friends with a quick SMS",
            color: Colors.purple,
            onTap: () => _showComingSoon(context, "Panic SMS"),
          ),
          _buildFeatureCard(
            context,
            icon: Icons.contacts,
            title: "Add More Trusted Contacts",
            subtitle: "Keep your emergency circle updated",
            color: Colors.teal,
            onTap: () => _showComingSoon(context, "Manage Contacts"),
          ),
        ],
      ),
    );
  }

  // 🔘 Quick Access Card (Grid Style)
  Widget _buildQuickCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required String number,
  }) {
    return InkWell(
      onTap: () => _callNumber(number),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, color: color),
            ),
          ],
        ),
      ),
    );
  }

  // 📌 Feature Card
  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
