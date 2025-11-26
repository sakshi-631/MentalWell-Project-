
// import 'package:flutter/material.dart';

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
import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      "icon": Icons.water_drop,
      "title": "Stay Hydrated 💧",
      "message": "Drink 1 glass of water right now!",
      "time": "2 min ago",
      "read": false,
    },
    {
      "icon": Icons.self_improvement,
      "title": "Take a Break 🌿",
      "message": "5 minutes meditation can refresh your mind.",
      "time": "10 min ago",
      "read": false,
    },
    {
      "icon": Icons.star,
      "title": "Keep Going ✨",
      "message": "You’re doing amazing, Sak!",
      "time": "1 hour ago",
      "read": true,
    },
    {
      "icon": Icons.bedtime,
      "title": "Sleep Reminder 😴",
      "message": "Time to wind down and relax for better sleep.",
      "time": "Today, 9:00 PM",
      "read": false,
    },
    {
      "icon": Icons.local_fire_department,
      "title": "Streak 🔥",
      "message": "You maintained a 7-day self-care streak. Keep it up!",
      "time": "Yesterday",
      "read": true,
    },
    {
      "icon": Icons.tips_and_updates,
      "title": "App Tip 💡",
      "message": "Try journaling daily for a calmer mind.",
      "time": "2 days ago",
      "read": false,
    },
  ];

  Future<void> _refreshNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _notifications.insert(
        0,
        {
          "icon": Icons.new_releases,
          "title": "New Update 🚀",
          "message": "Dark mode is now available in Settings!",
          "time": "Just now",
          "read": false,
        },
      );
    });
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]["read"] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: "Mark all as read",
            onPressed: () {
              setState(() {
                for (var n in _notifications) {
                  n["read"] = true;
                }
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final item = _notifications[index];
            return GestureDetector(
              onTap: () => _markAsRead(index),
              child: _NotificationCard(
                icon: item["icon"],
                title: item["title"],
                message: item["message"],
                time: item["time"],
                read: item["read"],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: UserBottomNavBar(
        parentContext: context,
        onTabSelected: (index) {
          // Optional: You can handle tab switching here if needed
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final bool read;

  const _NotificationCard({
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.read,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          child: Icon(icon, color: Colors.deepPurple),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: read ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            color: read ? Colors.grey : Colors.black87,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            if (!read)
              const Icon(Icons.circle, color: Colors.deepPurple, size: 10),
          ],
        ),
      ),
    );
  }
}
