import 'package:flutter/material.dart';

class UserBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final BuildContext parentContext;

  const UserBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color.fromARGB(255, 219, 201, 175); // brown
    const Color inactiveColor = Colors.grey;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 🏠 Home
            IconButton(
              icon: Icon(
                Icons.home,
                size: 28,
                color: selectedIndex == 0 ? activeColor : inactiveColor,
              ),
              onPressed: () => onTabSelected(0),
            ),

            // 👤 Profile
            IconButton(
              icon: Icon(
                Icons.person,
                size: 28,
                color: selectedIndex == 1 ? activeColor : inactiveColor,
              ),
              onPressed: () => onTabSelected(1),
            ),
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// class UserBottomNavBar extends StatelessWidget {
//   final BuildContext parentContext;
//   final int selectedIndex;
//   final Function(int) onTabSelected;

//   const UserBottomNavBar({
//     super.key,
//     required this.parentContext,
//     this.selectedIndex = 0,
//     required this.onTabSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: const Color(0xFFD7BFAE), // Light brown (matches drawer)
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildAnimatedIcon(
//             icon: Icons.home,
//             index: 0,
//             selectedIndex: selectedIndex,
//             onTap: () {
//               onTabSelected(0);
//               Navigator.pushReplacement(
//                 parentContext,
//                 MaterialPageRoute(
//                   builder: (_) => const UserHomeWrapper(username: 'Sakshi'),
//                 ),
//               );
//             },
//           ),
//           _buildAnimatedIcon(
//             icon: Icons.explore,
//             index: 1,
//             selectedIndex: selectedIndex,
//             onTap: () {
//               onTabSelected(1);
//               Navigator.pushReplacement(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const ExplorePage()),
//               );
//             },
//           ),
//           const SizedBox(width: 40), // Space for FAB
//           _buildAnimatedIcon(
//             icon: Icons.book,
//             index: 2,
//             selectedIndex: selectedIndex,
//             onTap: () {
//               onTabSelected(2);
//               Navigator.pushReplacement(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const NotificationsPage()),
//               );
//             },
//           ),
//           _buildAnimatedIcon(
//             icon: Icons.person,
//             index: 3,
//             selectedIndex: selectedIndex,
//             onTap: () {
//               onTabSelected(3);
//               Navigator.pushReplacement(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const UserProfilePage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method for animated icon
//   Widget _buildAnimatedIcon({
//     required IconData icon,
//     required int index,
//     required int selectedIndex,
//     required VoidCallback onTap,
//   }) {
//     bool isSelected = selectedIndex == index;
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeInOut,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? const Color(0xFFE3CFC1).withOpacity(0.3)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: AnimatedScale(
//           scale: isSelected ? 1.3 : 1.0, // ✅ scale animation
//           duration: const Duration(milliseconds: 250),
//           curve: Curves.easeInOut,
//           child: Icon(
//             icon,
//             color: isSelected ? const Color(0xFF6B4C3B) : Colors.grey,
//             size: 28,
//           ),
//         ),
//       ),
//     );
//   }
// }









// // import 'package:flutter/material.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
// // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// // class UserBottomNavBar extends StatelessWidget {
// //   final BuildContext parentContext;
// //   final int selectedIndex;

// //   const UserBottomNavBar({
// //     super.key,
// //     required this.parentContext,
// //     this.selectedIndex = 0, required Null Function(dynamic index) onTabSelected,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return BottomAppBar(
// //       shape: const CircularNotchedRectangle(),
// //       notchMargin: 8,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //         children: [
// //           IconButton(
// //             icon: const Icon(Icons.home),
// //             color: selectedIndex == 0 ? Colors.deepPurple : Colors.grey,
// //             onPressed: () {
// //               Navigator.pushReplacement(
// //                 parentContext,
// //                 MaterialPageRoute(
// //                   builder: (_) => const UserHomeWrapper(username: 'Sakshi'),
// //                 ),
// //               );
// //             },
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.explore),
// //             color: selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
// //             onPressed: () {
// //               Navigator.pushReplacement(
// //                 parentContext,
// //                 MaterialPageRoute(builder: (_) => const ExplorePage()),
// //               );
// //             },
// //           ),
// //           const SizedBox(width: 40), // Space for FAB
// //           IconButton(
// //             icon: const Icon(Icons.book),
// //             color: selectedIndex == 2 ? Colors.deepPurple : Colors.grey,
// //             onPressed: () {
// //               Navigator.pushReplacement(
// //                 parentContext,
// //                 MaterialPageRoute(builder: (_) => const NotificationsPage()),
// //               );
// //             },
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.person),
// //             color: selectedIndex == 3 ? Colors.deepPurple : Colors.grey,
// //             onPressed: () {
// //               Navigator.pushReplacement(
// //                 parentContext,
// //                 MaterialPageRoute(builder: (_) => const UserProfilePage()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

