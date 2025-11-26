import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/USER_bottomnavbar/bottomnavbar_user.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "User Profile Page Content Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: UserBottomNavBar(parentContext: context, onTabSelected: (index) {  },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
