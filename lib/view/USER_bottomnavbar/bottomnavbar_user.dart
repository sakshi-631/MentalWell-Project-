// // // import 'package:flutter/material.dart';

// // // class UserBottomNavBar extends StatelessWidget {
// // //   final int selectedIndex;
// // //   final Function(int) onTabSelected;
// // //   final BuildContext parentContext;

// // //   const UserBottomNavBar({
// // //     super.key,
// // //     required this.selectedIndex,
// // //     required this.onTabSelected,
// // //     required this.parentContext,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     const Color activeColor = Color.fromARGB(255, 219, 201, 175); // brown
// // //     const Color inactiveColor = Colors.grey;

// // //     return BottomAppBar(
// // //       shape: const CircularNotchedRectangle(),
// // //       notchMargin: 8,
// // //       child: SizedBox(
// // //         height: 65,
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //           children: [
// // //             // 🏠 Home
// // //             IconButton(
// // //               icon: Icon(
// // //                 Icons.home,
// // //                 size: 28,
// // //                 color: selectedIndex == 0 ? activeColor : inactiveColor,
// // //               ),
// // //               onPressed: () => onTabSelected(0),
// // //             ),

// // //             // 👤 Profile
// // //             IconButton(
// // //               icon: Icon(
// // //                 Icons.person,
// // //                 size: 28,
// // //                 color: selectedIndex == 1 ? activeColor : inactiveColor,
// // //               ),
// // //               onPressed: () => onTabSelected(1),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
// // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // // import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// // // // class UserBottomNavBar extends StatelessWidget {
// // // //   final BuildContext parentContext;
// // // //   final int selectedIndex;
// // // //   final Function(int) onTabSelected;

// // // //   const UserBottomNavBar({
// // // //     super.key,
// // // //     required this.parentContext,
// // // //     this.selectedIndex = 0,
// // // //     required this.onTabSelected,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BottomAppBar(
// // // //       color: const Color(0xFFD7BFAE), // Light brown (matches drawer)
// // // //       shape: const CircularNotchedRectangle(),
// // // //       notchMargin: 8,
// // // //       child: Row(
// // // //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //         children: [
// // // //           _buildAnimatedIcon(
// // // //             icon: Icons.home,
// // // //             index: 0,
// // // //             selectedIndex: selectedIndex,
// // // //             onTap: () {
// // // //               onTabSelected(0);
// // // //               Navigator.pushReplacement(
// // // //                 parentContext,
// // // //                 MaterialPageRoute(
// // // //                   builder: (_) => const UserHomeWrapper(username: 'Sakshi'),
// // // //                 ),
// // // //               );
// // // //             },
// // // //           ),
// // // //           _buildAnimatedIcon(
// // // //             icon: Icons.explore,
// // // //             index: 1,
// // // //             selectedIndex: selectedIndex,
// // // //             onTap: () {
// // // //               onTabSelected(1);
// // // //               Navigator.pushReplacement(
// // // //                 parentContext,
// // // //                 MaterialPageRoute(builder: (_) => const ExplorePage()),
// // // //               );
// // // //             },
// // // //           ),
// // // //           const SizedBox(width: 40), // Space for FAB
// // // //           _buildAnimatedIcon(
// // // //             icon: Icons.book,
// // // //             index: 2,
// // // //             selectedIndex: selectedIndex,
// // // //             onTap: () {
// // // //               onTabSelected(2);
// // // //               Navigator.pushReplacement(
// // // //                 parentContext,
// // // //                 MaterialPageRoute(builder: (_) => const NotificationsPage()),
// // // //               );
// // // //             },
// // // //           ),
// // // //           _buildAnimatedIcon(
// // // //             icon: Icons.person,
// // // //             index: 3,
// // // //             selectedIndex: selectedIndex,
// // // //             onTap: () {
// // // //               onTabSelected(3);
// // // //               Navigator.pushReplacement(
// // // //                 parentContext,
// // // //                 MaterialPageRoute(builder: (_) => const UserProfilePage()),
// // // //               );
// // // //             },
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   // Helper method for animated icon
// // // //   Widget _buildAnimatedIcon({
// // // //     required IconData icon,
// // // //     required int index,
// // // //     required int selectedIndex,
// // // //     required VoidCallback onTap,
// // // //   }) {
// // // //     bool isSelected = selectedIndex == index;
// // // //     return GestureDetector(
// // // //       onTap: onTap,
// // // //       child: AnimatedContainer(
// // // //         duration: const Duration(milliseconds: 250),
// // // //         curve: Curves.easeInOut,
// // // //         padding: const EdgeInsets.all(8),
// // // //         decoration: BoxDecoration(
// // // //           color: isSelected
// // // //               ? const Color(0xFFE3CFC1).withOpacity(0.3)
// // // //               : Colors.transparent,
// // // //           borderRadius: BorderRadius.circular(12),
// // // //         ),
// // // //         child: AnimatedScale(
// // // //           scale: isSelected ? 1.3 : 1.0, // ✅ scale animation
// // // //           duration: const Duration(milliseconds: 250),
// // // //           curve: Curves.easeInOut,
// // // //           child: Icon(
// // // //             icon,
// // // //             color: isSelected ? const Color(0xFF6B4C3B) : Colors.grey,
// // // //             size: 28,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/ExplorePage.dart';
// // // // // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';
// // // // // import 'package:mentalwellapp/view/user_drawer/notifications_page.dart';

// // // // // class UserBottomNavBar extends StatelessWidget {
// // // // //   final BuildContext parentContext;
// // // // //   final int selectedIndex;

// // // // //   const UserBottomNavBar({
// // // // //     super.key,
// // // // //     required this.parentContext,
// // // // //     this.selectedIndex = 0, required Null Function(dynamic index) onTabSelected,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BottomAppBar(
// // // // //       shape: const CircularNotchedRectangle(),
// // // // //       notchMargin: 8,
// // // // //       child: Row(
// // // // //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //         children: [
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.home),
// // // // //             color: selectedIndex == 0 ? Colors.deepPurple : Colors.grey,
// // // // //             onPressed: () {
// // // // //               Navigator.pushReplacement(
// // // // //                 parentContext,
// // // // //                 MaterialPageRoute(
// // // // //                   builder: (_) => const UserHomeWrapper(username: 'Sakshi'),
// // // // //                 ),
// // // // //               );
// // // // //             },
// // // // //           ),
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.explore),
// // // // //             color: selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
// // // // //             onPressed: () {
// // // // //               Navigator.pushReplacement(
// // // // //                 parentContext,
// // // // //                 MaterialPageRoute(builder: (_) => const ExplorePage()),
// // // // //               );
// // // // //             },
// // // // //           ),
// // // // //           const SizedBox(width: 40), // Space for FAB
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.book),
// // // // //             color: selectedIndex == 2 ? Colors.deepPurple : Colors.grey,
// // // // //             onPressed: () {
// // // // //               Navigator.pushReplacement(
// // // // //                 parentContext,
// // // // //                 MaterialPageRoute(builder: (_) => const NotificationsPage()),
// // // // //               );
// // // // //             },
// // // // //           ),
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.person),
// // // // //             color: selectedIndex == 3 ? Colors.deepPurple : Colors.grey,
// // // // //             onPressed: () {
// // // // //               Navigator.pushReplacement(
// // // // //                 parentContext,
// // // // //                 MaterialPageRoute(builder: (_) => const UserProfilePage()),
// // // // //               );
// // // // //             },
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// // import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

// // class UserBottomNavBar extends StatelessWidget {
// //   final int selectedIndex;

// //   const UserBottomNavBar({super.key, required this.selectedIndex});

// //   String _getUserName() {
// //     final user = FirebaseAuth.instance.currentUser;

// //     // fallback logic (safe for all users)
// //     return user?.displayName ?? user?.email?.split('@')[0] ?? "User";
// //   }

// //   void _navigate(BuildContext context, int index) {
// //     final userName = _getUserName();

// //     Widget page;

// //     switch (index) {
// //       case 0:
// //         // ✅ Home (NO username error anymore)
// //         page = const UserHomeWrapper();
// //         break;

// //       case 1:
// //         // Profile page
// //         page = const UserProfilePage();
// //         break;

// //       default:
// //         page = const UserHomeWrapper();
// //     }

// //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     const Color activeColor = Color.fromARGB(255, 219, 201, 175);
// //     const Color inactiveColor = Colors.grey;

// //     return BottomAppBar(
// //       shape: const CircularNotchedRectangle(),
// //       notchMargin: 8,
// //       child: SizedBox(
// //         height: 65,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             // 🏠 Home
// //             IconButton(
// //               icon: Icon(
// //                 Icons.home,
// //                 size: 28,
// //                 color: selectedIndex == 0 ? activeColor : inactiveColor,
// //               ),
// //               onPressed: () => _navigate(context, 0),
// //             ),

// //             // 👤 Profile
// //             IconButton(
// //               icon: Icon(
// //                 Icons.person,
// //                 size: 28,
// //                 color: selectedIndex == 1 ? activeColor : inactiveColor,
// //               ),
// //               onPressed: () => _navigate(context, 1),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mentalwellapp/view/USER/UserHomePage.dart';
// import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
// import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
// import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

// class UserBottomNavBar extends StatelessWidget {
//   final int selectedIndex;

//   const UserBottomNavBar({super.key, required this.selectedIndex});

//   String _getUserName() {
//     final user = FirebaseAuth.instance.currentUser;
//     return user?.displayName ?? user?.email?.split('@')[0] ?? "User";
//   }

//   void _navigate(BuildContext context, int index) {
//     Widget page;

//     switch (index) {
//       case 0:
//         page = const UserHomeWrapper();
//         break;
//       case 3:
//         page = const UserProfilePage();
//         break;
//       default:
//         page = const UserHomeWrapper();
//     }

//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color activeColor = Color.fromARGB(255, 219, 201, 175);
//     const Color inactiveColor = Colors.grey;

//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: SizedBox(
//         height: 65,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             // 🏠 Home (index 0)
//             IconButton(
//               icon: Icon(
//                 Icons.home,
//                 size: 28,
//                 color: selectedIndex == 0 ? activeColor : inactiveColor,
//               ),
//               onPressed: () => _navigate(context, 0),
//             ),

//             // 💬 Chatbot (index 1)
//             IconButton(
//               icon: Icon(
//                 Icons.chat_bubble_outline,
//                 size: 28,
//                 color: selectedIndex == 1 ? activeColor : inactiveColor,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const ChatBotPage()),
//                 );
//               },
//             ),

//             // Emergency FAB floats in the middle (not in this Row)

//             // 👤 Profile (index 3)
//             IconButton(
//               icon: Icon(
//                 Icons.person,
//                 size: 28,
//                 color: selectedIndex == 3 ? activeColor : inactiveColor,
//               ),
//               onPressed: () => _navigate(context, 3),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentalwellapp/view/USER/UserHomePage.dart';
import 'package:mentalwellapp/view/USER/ChatBotPage.dart';
import 'package:mentalwellapp/view/user_drawer/emergency_page.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/UserProfilePage.dart';

class UserBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const UserBottomNavBar({super.key, required this.selectedIndex});

  String _getUserName() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.displayName ?? user?.email?.split('@')[0] ?? "User";
  }

  void _navigate(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const UserHomeWrapper();
        break;
      case 3:
        page = const UserProfilePage();
        break;
      default:
        page = const UserHomeWrapper();
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color.fromARGB(255, 219, 201, 175);
    const Color inactiveColor = Colors.grey;
    const Color emergencyColor = Color(0xFFFF6B6B);
    const Color chatbotColor = Color(0xFFA7B8F6);

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 248, 245),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 🏠 Home (index 0)
              _AnimatedNavButton(
                icon: Icons.home_rounded,
                label: 'Home',
                isActive: selectedIndex == 0,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () => _navigate(context, 0),
              ),

              // 💬 Chatbot (index 1)
              _AnimatedNavButton(
                icon: Icons.chat_bubble_rounded,
                label: 'Chat',
                isActive: selectedIndex == 1,
                activeColor: chatbotColor,
                inactiveColor: inactiveColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatBotPage()),
                  );
                },
              ),

              // 🚨 Emergency (index 2)
              _AnimatedNavButton(
                icon: Icons.warning_rounded,
                label: 'Emergency',
                isActive: selectedIndex == 2,
                activeColor: emergencyColor,
                inactiveColor: inactiveColor,
                isEmergency: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmergencyPage()),
                  );
                },
              ),

              // 👤 Profile (index 3)
              _AnimatedNavButton(
                icon: Icons.person_rounded,
                label: 'Profile',
                isActive: selectedIndex == 3,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () => _navigate(context, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Animated Navigation Button Widget
class _AnimatedNavButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;
  final bool isEmergency;

  const _AnimatedNavButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
    this.isEmergency = false,
  });

  @override
  State<_AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<_AnimatedNavButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _indicatorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _indicatorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future.delayed(const Duration(milliseconds: 200), () {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon with indicator
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Animated indicator circle
                    AnimatedOpacity(
                      opacity: widget.isActive ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: widget.activeColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Main icon button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: widget.isActive
                            ? widget.activeColor.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: widget.isActive
                            ? Border.all(
                                color: widget.activeColor.withOpacity(0.3),
                                width: 2,
                              )
                            : null,
                      ),
                      child: Icon(
                        widget.icon,
                        size: widget.isEmergency && widget.isActive ? 30 : 26,
                        color: widget.isActive
                            ? widget.activeColor
                            : widget.inactiveColor,
                      ),
                    ),

                    // Emergency pulse animation
                    if (widget.isEmergency && widget.isActive)
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.8, end: 1.2),
                        duration: const Duration(milliseconds: 600),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: widget.activeColor.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),

                // Label text with animation
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 4),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: widget.isActive ? 12 : 11,
                      fontWeight: widget.isActive
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: widget.isActive
                          ? widget.activeColor
                          : widget.inactiveColor.withOpacity(0.7),
                    ),
                    child: Text(widget.label),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
