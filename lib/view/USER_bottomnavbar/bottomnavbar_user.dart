// // import 'package:flutter/material.dart';

// // class UserBottomNavBar extends StatelessWidget {
// //   final Function(int)? onTabSelected;
// //   final int selectedIndex;

// //   const UserBottomNavBar({
// //     super.key,
// //     this.onTabSelected,
// //     this.selectedIndex = 0,
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
// //             icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.deepPurple : Colors.grey),
// //             onPressed: () {
// //               if (onTabSelected != null) onTabSelected!(0);
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.explore, color: selectedIndex == 1 ? Colors.deepPurple : Colors.grey),
// //             onPressed: () {
// //               if (onTabSelected != null) onTabSelected!(1);
// //             },
// //           ),
// //           const SizedBox(width: 40), // space for FAB
// //           IconButton(
// //             icon: Icon(Icons.book, color: selectedIndex == 2 ? Colors.deepPurple : Colors.grey),
// //             onPressed: () {
// //               if (onTabSelected != null) onTabSelected!(2);
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.person, color: selectedIndex == 3 ? Colors.deepPurple : Colors.grey),
// //             onPressed: () {
// //               if (onTabSelected != null) onTabSelected!(3);
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }















// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// class UserBottomNavBar extends StatelessWidget {
//   final BuildContext parentContext;

//   const UserBottomNavBar({super.key, required this.parentContext, required int selectedIndex});

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.home),
//             color: Colors.deepPurple,
//             onPressed: () {
//               Navigator.pushReplacement(
//                 parentContext,
//                 MaterialPageRoute(
//                   builder: (_) => const UserHomeWrapper(username: '',),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.explore),
//             color: Colors.grey,
//             onPressed: () {
//               Navigator.push(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const ExplorePage()),
//               );
//             },
//           ),
//           const SizedBox(width: 40), // Space for FAB
//           IconButton(
//             icon: const Icon(Icons.book),
//             color: Colors.grey,
//             onPressed: () {
//               Navigator.push(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const NotificationsPage()),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.person),
//             color: Colors.grey,
//             onPressed: () {
//               Navigator.push(
//                 parentContext,
//                 MaterialPageRoute(builder: (_) => const UserProfilePage()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }












import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

class UserBottomNavBar extends StatelessWidget {
  final BuildContext parentContext;
  final int selectedIndex;

  const UserBottomNavBar({
    super.key,
    required this.parentContext,
    this.selectedIndex = 0, required Null Function(dynamic index) onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            color: selectedIndex == 0 ? Colors.deepPurple : Colors.grey,
            onPressed: () {
              Navigator.pushReplacement(
                parentContext,
                MaterialPageRoute(
                  builder: (_) => const UserHomeWrapper(username: 'Sakshi'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.explore),
            color: selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
            onPressed: () {
              Navigator.pushReplacement(
                parentContext,
                MaterialPageRoute(builder: (_) => const ExplorePage()),
              );
            },
          ),
          const SizedBox(width: 40), // Space for FAB
          IconButton(
            icon: const Icon(Icons.book),
            color: selectedIndex == 2 ? Colors.deepPurple : Colors.grey,
            onPressed: () {
              Navigator.pushReplacement(
                parentContext,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: selectedIndex == 3 ? Colors.deepPurple : Colors.grey,
            onPressed: () {
              Navigator.pushReplacement(
                parentContext,
                MaterialPageRoute(builder: (_) => const UserProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

