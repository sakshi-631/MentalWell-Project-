// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/view/ADMIN/contentmanagement_page.dart';
// // import 'package:mentalwellapp/view/ADMIN/reports_page.dart';
// // import 'package:mentalwellapp/view/ADMIN/settings_page.dart';
// // import 'package:mentalwellapp/view/ADMIN/sos_page.dart';
// // import 'package:mentalwellapp/view/ADMIN/usermanagement_page.dart';
// // import 'package:mentalwellapp/view/user_drawer/dashboard.dart';
// // import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// // class AdminHomePage extends StatefulWidget {
// //   final String username;
// //   final String? name;
// //   final String? email;
// //   final File? profileImage;

// //   const AdminHomePage({
// //     super.key,
// //     required this.username,
// //     this.name,
// //     this.email,
// //     this.profileImage,
// //   });

// //   @override
// //   State<AdminHomePage> createState() => _AdminHomePageState();
// // }

// // class _AdminHomePageState extends State<AdminHomePage> {
// //   int _selectedIndex = 0;

// //   final List<String> _drawerTitles = [
// //     "Dashboard",
// //     "User Management",
// //     "Content Management",
// //     "SOS & Emergency",
// //     "Reports & Analytics",
// //     "Notifications",
// //     "Settings",
// //   ];

// //   final List<IconData> _drawerIcons = [
// //     Icons.dashboard,
// //     Icons.people,
// //     Icons.content_paste,
// //     Icons.sos,
// //     Icons.bar_chart,
// //     Icons.notifications,
// //     Icons.settings,
// //   ];

// //   final List<Widget> _pages = const [
// //     DashboardPage(username: '',),
// //     UserManagementPage(),
// //     ContentManagementPage(),
// //     SOSPage(),
// //     ReportsPage(),
// //     NotificationsPage(),
// //     SettingsPage(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(_drawerTitles[_selectedIndex]),
// //         backgroundColor: Colors.teal,
// //         actions: [
// //           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
// //           IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
// //         ],
// //       ),
// //       drawer: width < 800 ? Drawer(child: _buildDrawer(width)) : null,
// //       body: Row(
// //         children: [
// //           if (width >= 800) SizedBox(width: 240, child: _buildDrawer(width)),
// //           Expanded(child: _pages[_selectedIndex]),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildDrawer(double width) {
// //     return Container(
// //       color: Colors.white,
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: [
// //           UserAccountsDrawerHeader(
// //             accountName: Text(widget.name ?? "Admin"),
// //             accountEmail: Text(widget.email ?? "admin@example.com"),
// //             currentAccountPicture: CircleAvatar(
// //               backgroundColor: Colors.white,
// //               backgroundImage: widget.profileImage != null
// //                   ? FileImage(widget.profileImage!)
// //                   : null,
// //               child: widget.profileImage == null
// //                   ? Icon(Icons.admin_panel_settings, size: 40, color: Colors.teal)
// //                   : null,
// //             ),
// //             decoration: const BoxDecoration(color: Colors.teal),
// //           ),
// //           for (int i = 0; i < _drawerTitles.length; i++)
// //             ListTile(
// //               leading: Icon(_drawerIcons[i],
// //                   color: _selectedIndex == i ? Colors.teal : Colors.black54),
// //               title: Text(
// //                 _drawerTitles[i],
// //                 style: TextStyle(
// //                   fontWeight:
// //                       _selectedIndex == i ? FontWeight.bold : FontWeight.normal,
// //                   color: _selectedIndex == i ? Colors.teal : Colors.black87,
// //                 ),
// //               ),
// //               selected: _selectedIndex == i,
// //               onTap: () {
// //                 setState(() => _selectedIndex = i);
// //                 if (MediaQuery.of(context).size.width < 800) Navigator.pop(context);
// //               },
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/ADMIN/contentmanagement_page.dart';
// import 'package:mentalwellapp/view/ADMIN/dashboard_page.dart';
// import 'package:mentalwellapp/view/ADMIN/motivation_card_history_page.dart';
// import 'package:mentalwellapp/view/ADMIN/motivation_card_page.dart';
// import 'package:mentalwellapp/view/ADMIN/notification_page.dart';
// import 'package:mentalwellapp/view/ADMIN/reports_page.dart';
// import 'package:mentalwellapp/view/ADMIN/settings_page.dart';
// import 'package:mentalwellapp/view/ADMIN/sos_page.dart';
// import 'package:mentalwellapp/view/ADMIN/usermanagement_page.dart';
// import 'package:mentalwellapp/view/LoginPage.dart'; // ✅ Import LoginPage
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mentalwellapp/controller/LoginController.dart';

// class AdminHomePage extends StatefulWidget {
//   final String username;
//   final String? name;
//   final String? email;
//   final File? profileImage;

//   const AdminHomePage({
//     super.key,
//     required this.username,
//     this.name,
//     this.email,
//     this.profileImage,
//   });

//   @override
//   State<AdminHomePage> createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHomePage> {
//   int _selectedIndex = 0;
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

//   final List<String> _drawerTitles = [
//     "Dashboard",
//     "User Management",
//     "Content Management",
//     "SOS & Emergency",
//     "Reports & Analytics",
//     "Motivation Cards",
//     "Cards History",
//   ];

//   final List<IconData> _drawerIcons = [
//     Icons.dashboard,
//     Icons.people,
//     Icons.content_paste,
//     Icons.sos,
//     Icons.bar_chart,
//     Icons.notifications,
//     Icons.settings,
//   ];

//   final List<Widget> _pages = const [
//     DashboardPage(username: ''),
//     UserManagementPage(),
//     ContentManagementPage(),
//     SOSPage(),
//     ReportsPage(),
//     MotivationCardAdminPage(),
//     MotivationCardHistoryPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_drawerTitles[_selectedIndex]),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
//         ],
//       ),
//       drawer: width < 800 ? Drawer(child: _buildDrawer(width)) : null,
//       body: Row(
//         children: [
//           if (width >= 800) SizedBox(width: 240, child: _buildDrawer(width)),
//           Expanded(child: _pages[_selectedIndex]),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawer(double width) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(widget.name ?? "Admin"),
//             accountEmail: Text(widget.email ?? "admin@gmail.com"),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               backgroundImage: widget.profileImage != null
//                   ? FileImage(widget.profileImage!)
//                   : null,
//               child: widget.profileImage == null
//                   ? const Icon(
//                       Icons.admin_panel_settings,
//                       size: 40,
//                       color: Colors.teal,
//                     )
//                   : null,
//             ),
//             decoration: const BoxDecoration(color: Colors.teal),
//           ),

//           // Drawer Items
//           Expanded(
//             child: ListView.builder(
//               itemCount: _drawerTitles.length,
//               itemBuilder: (context, i) {
//                 return ListTile(
//                   leading: Icon(
//                     _drawerIcons[i],
//                     color: _selectedIndex == i ? Colors.teal : Colors.black54,
//                   ),
//                   title: Text(
//                     _drawerTitles[i],
//                     style: TextStyle(
//                       fontWeight: _selectedIndex == i
//                           ? FontWeight.bold
//                           : FontWeight.normal,
//                       color: _selectedIndex == i ? Colors.teal : Colors.black87,
//                     ),
//                   ),
//                   selected: _selectedIndex == i,
//                   onTap: () {
//                     setState(() => _selectedIndex = i);
//                     if (MediaQuery.of(context).size.width < 800) {
//                       Navigator.pop(context);
//                     }
//                   },
//                 );
//               },
//             ),
//           ),

//           // ✅ Logout Button (Added at bottom)
//           const Divider(height: 1),

//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.red),
//             title: const Text("Logout", style: TextStyle(color: Colors.red)),
//             onTap: () async {
//               Navigator.pop(context); // Close the drawer first
//               await handleLogout(context); // Then logout
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/ADMIN/dashboard_page.dart';
import 'package:mentalwellapp/view/ADMIN/motivation_card_history_page.dart';
import 'package:mentalwellapp/view/ADMIN/motivation_card_page.dart';
import 'package:mentalwellapp/view/ADMIN/reports_page.dart';
import 'package:mentalwellapp/view/ADMIN/sos_page.dart';
import 'package:mentalwellapp/view/ADMIN/usermanagement_page.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentalwellapp/controller/LoginController.dart';

class AdminHomePage extends StatefulWidget {
  final String username;
  final String? name;
  final String? email;
  final File? profileImage;

  const AdminHomePage({
    super.key,
    required this.username,
    this.name,
    this.email,
    this.profileImage,
  });

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;

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

  final List<String> _drawerTitles = [
    "Dashboard",
    "User Management",
    "SOS & Emergency",
    "Motivation Cards",
    "Cards History",
    "Reports & Analytics",
  ];

  final List<IconData> _drawerIcons = [
    Icons.dashboard_rounded,
    Icons.people_alt_rounded,
    Icons.sos_rounded,
    Icons.auto_awesome_rounded,
    Icons.history_rounded,
    Icons.bar_chart_rounded,
  ];

  final List<Widget> _pages = const [
    DashboardPage(username: ''),
    UserManagementPage(),
    SOSPage(),
    MotivationCardAdminPage(),
    MotivationCardHistoryPage(),
    ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentEmail =
        FirebaseAuth.instance.currentUser?.email ??
        widget.email ??
        "admin@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: Text(_drawerTitles[_selectedIndex]),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: width < 800,
        actions: const [],
      ),
      drawer: width < 800
          ? Drawer(child: _buildDrawer(width, currentEmail))
          : null,
      body: Row(
        children: [
          if (width >= 800)
            SizedBox(width: 260, child: _buildDrawer(width, currentEmail)),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  Widget _buildDrawer(double width, String currentEmail) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 56, 16, 20),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: widget.profileImage != null
                      ? FileImage(widget.profileImage!)
                      : const AssetImage('assets/admin.png') as ImageProvider,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name ?? "Admin",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentEmail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: _drawerTitles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 2),
              itemBuilder: (context, i) {
                final selected = _selectedIndex == i;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: selected
                        ? Colors.teal.withOpacity(0.10)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      leading: Icon(
                        _drawerIcons[i],
                        color: selected ? Colors.teal : Colors.black54,
                      ),
                      title: Text(
                        _drawerTitles[i],
                        style: TextStyle(
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: selected ? Colors.teal : Colors.black87,
                        ),
                      ),
                      selected: selected,
                      onTap: () {
                        setState(() => _selectedIndex = i);
                        if (MediaQuery.of(context).size.width < 800) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              tileColor: Colors.red.withOpacity(0.06),
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                await handleLogout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
