// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:url_launcher/url_launcher.dart';

// // // // // class EmergencyPage extends StatelessWidget {
// // // // //   const EmergencyPage({super.key});

// // // // //   void _callNumber(String number) async {
// // // // //     final Uri callUri = Uri(scheme: "tel", path: number);
// // // // //     if (await canLaunchUrl(callUri)) {
// // // // //       await launchUrl(callUri);
// // // // //     }
// // // // //   }

// // // // //   void _showComingSoon(BuildContext context, String feature) {
// // // // //     ScaffoldMessenger.of(
// // // // //       context,
// // // // //     ).showSnackBar(SnackBar(content: Text("$feature coming soon 🚀")));
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.grey.shade100,
// // // // //       appBar: AppBar(
// // // // //         title: const Text("Emergency"),
// // // // //         backgroundColor: Colors.red,
// // // // //         centerTitle: true,
// // // // //         elevation: 4,
// // // // //         shape: const RoundedRectangleBorder(
// // // // //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
// // // // //         ),
// // // // //       ),
// // // // //       body: ListView(
// // // // //         padding: const EdgeInsets.all(20),
// // // // //         children: [
// // // // //           // 🚨 SOS Emergency Button
// // // // //           Center(
// // // // //             child: GestureDetector(
// // // // //               onTap: () {
// // // // //                 _callNumber("108");
// // // // //                 _showComingSoon(context, "SOS alerts to friends & family");
// // // // //               },
// // // // //               child: Container(
// // // // //                 height: 140,
// // // // //                 width: 140,
// // // // //                 decoration: BoxDecoration(
// // // // //                   gradient: const LinearGradient(
// // // // //                     colors: [Colors.red, Colors.redAccent],
// // // // //                     begin: Alignment.topLeft,
// // // // //                     end: Alignment.bottomRight,
// // // // //                   ),
// // // // //                   shape: BoxShape.circle,
// // // // //                   boxShadow: [
// // // // //                     BoxShadow(
// // // // //                       color: Colors.red.withOpacity(0.4),
// // // // //                       blurRadius: 20,
// // // // //                       spreadRadius: 5,
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //                 child: const Center(
// // // // //                   child: Text(
// // // // //                     "SOS",
// // // // //                     style: TextStyle(
// // // // //                       fontSize: 32,
// // // // //                       color: Colors.white,
// // // // //                       fontWeight: FontWeight.bold,
// // // // //                       letterSpacing: 2,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 30),

// // // // //           // ⚡ Quick Access Section
// // // // //           const Text(
// // // // //             "Quick Contacts",
// // // // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //           ),
// // // // //           const SizedBox(height: 15),
// // // // //           GridView.count(
// // // // //             shrinkWrap: true,
// // // // //             physics: const NeverScrollableScrollPhysics(),
// // // // //             crossAxisCount: 2,
// // // // //             mainAxisSpacing: 16,
// // // // //             crossAxisSpacing: 16,
// // // // //             children: [
// // // // //               _buildQuickCard(
// // // // //                 context,
// // // // //                 icon: Icons.local_hospital,
// // // // //                 label: "Ambulance",
// // // // //                 color: Colors.red,
// // // // //                 number: "108",
// // // // //               ),
// // // // //               _buildQuickCard(
// // // // //                 context,
// // // // //                 icon: Icons.local_police,
// // // // //                 label: "Police",
// // // // //                 color: Colors.indigo,
// // // // //                 number: "100",
// // // // //               ),
// // // // //               _buildQuickCard(
// // // // //                 context,
// // // // //                 icon: Icons.medical_services,
// // // // //                 label: "Doctor",
// // // // //                 color: Colors.green,
// // // // //                 number: "9876501234",
// // // // //               ),
// // // // //               _buildQuickCard(
// // // // //                 context,
// // // // //                 icon: Icons.people,
// // // // //                 label: "Best Friend",
// // // // //                 color: Colors.orange,
// // // // //                 number: "9876543210",
// // // // //               ),
// // // // //             ],
// // // // //           ),

// // // // //           const SizedBox(height: 30),

// // // // //           // 🌍 Additional Features
// // // // //           const Text(
// // // // //             "More Safety Features",
// // // // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //           ),
// // // // //           const SizedBox(height: 15),
// // // // //           _buildFeatureCard(
// // // // //             context,
// // // // //             icon: Icons.map,
// // // // //             title: "Share Live Location",
// // // // //             subtitle: "Send your real-time location to trusted contacts",
// // // // //             color: Colors.blue,
// // // // //             onTap: () => _showComingSoon(context, "Location Sharing"),
// // // // //           ),
// // // // //           _buildFeatureCard(
// // // // //             context,
// // // // //             icon: Icons.message,
// // // // //             title: "Send Panic SMS",
// // // // //             subtitle: "Automatically alert friends with a quick SMS",
// // // // //             color: Colors.purple,
// // // // //             onTap: () => _showComingSoon(context, "Panic SMS"),
// // // // //           ),
// // // // //           _buildFeatureCard(
// // // // //             context,
// // // // //             icon: Icons.contacts,
// // // // //             title: "Add More Trusted Contacts",
// // // // //             subtitle: "Keep your emergency circle updated",
// // // // //             color: Colors.teal,
// // // // //             onTap: () => _showComingSoon(context, "Manage Contacts"),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // 🔘 Quick Access Card (Grid Style)
// // // // //   Widget _buildQuickCard(
// // // // //     BuildContext context, {
// // // // //     required IconData icon,
// // // // //     required String label,
// // // // //     required Color color,
// // // // //     required String number,
// // // // //   }) {
// // // // //     return InkWell(
// // // // //       onTap: () => _callNumber(number),
// // // // //       borderRadius: BorderRadius.circular(20),
// // // // //       child: Container(
// // // // //         decoration: BoxDecoration(
// // // // //           color: Colors.white,
// // // // //           borderRadius: BorderRadius.circular(20),
// // // // //           boxShadow: [
// // // // //             BoxShadow(
// // // // //               color: color.withOpacity(0.2),
// // // // //               blurRadius: 8,
// // // // //               offset: const Offset(0, 4),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             CircleAvatar(
// // // // //               backgroundColor: color.withOpacity(0.1),
// // // // //               child: Icon(icon, color: color, size: 30),
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             Text(
// // // // //               label,
// // // // //               style: TextStyle(fontWeight: FontWeight.w600, color: color),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // 📌 Feature Card
// // // // //   Widget _buildFeatureCard(
// // // // //     BuildContext context, {
// // // // //     required IconData icon,
// // // // //     required String title,
// // // // //     required String subtitle,
// // // // //     required Color color,
// // // // //     required VoidCallback onTap,
// // // // //   }) {
// // // // //     return Card(
// // // // //       margin: const EdgeInsets.only(bottom: 16),
// // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// // // // //       elevation: 3,
// // // // //       child: ListTile(
// // // // //         leading: CircleAvatar(
// // // // //           backgroundColor: color.withOpacity(0.1),
// // // // //           child: Icon(icon, color: color),
// // // // //         ),
// // // // //         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// // // // //         subtitle: Text(subtitle),
// // // // //         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// // // // //         onTap: onTap,
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _QuickActionButton extends StatelessWidget {
// // // // //   final IconData icon;
// // // // //   final String label;
// // // // //   final Color color;
// // // // //   final VoidCallback onTap;

// // // // //   const _QuickActionButton({
// // // // //     required this.icon,
// // // // //     required this.label,
// // // // //     required this.color,
// // // // //     required this.onTap,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return GestureDetector(
// // // // //       onTap: onTap,
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Container(
// // // // //             padding: const EdgeInsets.all(18),
// // // // //             decoration: BoxDecoration(
// // // // //               color: color.withOpacity(0.15),
// // // // //               shape: BoxShape.circle,
// // // // //             ),
// // // // //             child: Icon(icon, color: color, size: 28),
// // // // //           ),
// // // // //           const SizedBox(height: 8),
// // // // //           Text(
// // // // //             label,
// // // // //             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:geolocator/geolocator.dart';

// // // // class EmergencyPage extends StatefulWidget {
// // // //   const EmergencyPage({super.key});

// // // //   @override
// // // //   State<EmergencyPage> createState() => _EmergencyPageState();
// // // // }

// // // // class _EmergencyPageState extends State<EmergencyPage> {
// // // //   Map<String, dynamic>? userData;
// // // //   bool isLoading = true;

// // // //   String? currentSOSId;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchUserData();
// // // //   }

// // // //   // 🔥 FETCH USER DATA
// // // //   Future<void> fetchUserData() async {
// // // //     try {
// // // //       final user = FirebaseAuth.instance.currentUser;

// // // //       if (user == null) {
// // // //         setState(() => isLoading = false);
// // // //         return;
// // // //       }

// // // //       final doc = await FirebaseFirestore.instance
// // // //           .collection('users')
// // // //           .doc(user.uid)
// // // //           .get();

// // // //       final data = doc.data();

// // // //       bool isValid =
// // // //           doc.exists &&
// // // //           data != null &&
// // // //           data['doctor'] != null &&
// // // //           data['friend'] != null &&
// // // //           data['doctor'].toString().trim().isNotEmpty &&
// // // //           data['friend'].toString().trim().isNotEmpty;

// // // //       if (isValid) {
// // // //         setState(() {
// // // //           userData = data;
// // // //           isLoading = false;
// // // //         });
// // // //       } else {
// // // //         setState(() => isLoading = false);

// // // //         Future.delayed(Duration.zero, () {
// // // //           if (mounted) showSetupDialog();
// // // //         });
// // // //       }
// // // //     } catch (e) {
// // // //       setState(() => isLoading = false);
// // // //       ScaffoldMessenger.of(
// // // //         context,
// // // //       ).showSnackBar(const SnackBar(content: Text("Error loading data")));
// // // //     }
// // // //   }

// // // //   // 🔥 LOCATION
// // // //   Future<String> getLocationLink() async {
// // // //     try {
// // // //       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // // //       if (!serviceEnabled) return "Location unavailable";

// // // //       LocationPermission permission = await Geolocator.checkPermission();

// // // //       if (permission == LocationPermission.denied) {
// // // //         permission = await Geolocator.requestPermission();
// // // //       }

// // // //       if (permission == LocationPermission.denied ||
// // // //           permission == LocationPermission.deniedForever) {
// // // //         return "Permission denied";
// // // //       }

// // // //       Position pos = await Geolocator.getCurrentPosition();

// // // //       return "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
// // // //     } catch (e) {
// // // //       return "Location error";
// // // //     }
// // // //   }

// // // //   // 🔥 SAVE SOS (ADMIN USE)
// // // //   Future<void> saveSOS(String type) async {
// // // //     try {
// // // //       final user = FirebaseAuth.instance.currentUser;
// // // //       if (user == null) return;

// // // //       final userDoc = await FirebaseFirestore.instance
// // // //           .collection('users')
// // // //           .doc(user.uid)
// // // //           .get();

// // // //       final data = userDoc.data();

// // // //       final location = await getLocationLink();

// // // //       final docRef = await FirebaseFirestore.instance
// // // //           .collection('sos_history')
// // // //           .add({
// // // //             "userId": user.uid,
// // // //             "userName": data?['name'] ?? "Unknown",
// // // //             "doctor": data?['doctor'] ?? "",
// // // //             "friend": data?['friend'] ?? "",
// // // //             "type": type,
// // // //             "location": location,
// // // //             "status": "pending",
// // // //             "adminMessage": "",
// // // //             "createdAt": FieldValue.serverTimestamp(),
// // // //           });

// // // //       currentSOSId = docRef.id;

// // // //       listenToAdminResponse();
// // // //     } catch (e) {
// // // //       debugPrint("SOS Save Error: $e");
// // // //     }
// // // //   }

// // // //   // 🔔 LISTEN ADMIN RESPONSE
// // // //   void listenToAdminResponse() {
// // // //     if (currentSOSId == null) return;

// // // //     FirebaseFirestore.instance
// // // //         .collection('sos_history')
// // // //         .doc(currentSOSId)
// // // //         .snapshots()
// // // //         .listen((doc) {
// // // //           if (!doc.exists) return;

// // // //           final data = doc.data();

// // // //           String message = data?['adminMessage'] ?? "";
// // // //           String status = data?['status'] ?? "";

// // // //           if (message.isNotEmpty) {
// // // //             ScaffoldMessenger.of(
// // // //               context,
// // // //             ).showSnackBar(SnackBar(content: Text("Admin: $message")));
// // // //           }

// // // //           if (status == "resolved") {
// // // //             ScaffoldMessenger.of(
// // // //               context,
// // // //             ).showSnackBar(const SnackBar(content: Text("✅ Help resolved")));
// // // //           }
// // // //         });
// // // //   }

// // // //   // 📩 SEND SMS
// // // //   Future<void> sendPanicSMS() async {
// // // //     final doctor = userData?['doctor'];
// // // //     final friend = userData?['friend'];

// // // //     if (doctor == null || friend == null) return;

// // // //     final location = await getLocationLink();

// // // //     final message = "🚨 EMERGENCY! I need help.\nLocation: $location";

// // // //     final Uri smsUri = Uri.parse(
// // // //       "sms:$doctor,$friend?body=${Uri.encodeComponent(message)}",
// // // //     );

// // // //     await launchUrl(smsUri);
// // // //   }

// // // //   // 📞 CALL
// // // //   Future<void> _callNumber(String number) async {
// // // //     final Uri callUri = Uri(scheme: "tel", path: number);
// // // //     await launchUrl(callUri);
// // // //   }

// // // //   // 📝 SETUP / EDIT CONTACTS
// // // //   void showSetupDialog() {
// // // //     final doctorController = TextEditingController(
// // // //       text: userData?['doctor'] ?? '',
// // // //     );
// // // //     final friendController = TextEditingController(
// // // //       text: userData?['friend'] ?? '',
// // // //     );

// // // //     showDialog(
// // // //       context: context,
// // // //       barrierDismissible: false,
// // // //       builder: (context) {
// // // //         return AlertDialog(
// // // //           title: const Text("Setup Emergency Info"),
// // // //           content: Column(
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             children: [
// // // //               TextField(
// // // //                 controller: doctorController,
// // // //                 keyboardType: TextInputType.phone,
// // // //                 decoration: const InputDecoration(labelText: "Doctor Number"),
// // // //               ),
// // // //               TextField(
// // // //                 controller: friendController,
// // // //                 keyboardType: TextInputType.phone,
// // // //                 decoration: const InputDecoration(
// // // //                   labelText: "Best Friend Number",
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           actions: [
// // // //             ElevatedButton(
// // // //               onPressed: () async {
// // // //                 final doctor = doctorController.text.trim();
// // // //                 final friend = friendController.text.trim();

// // // //                 if (doctor.isEmpty || friend.isEmpty) return;

// // // //                 final user = FirebaseAuth.instance.currentUser;

// // // //                 await FirebaseFirestore.instance
// // // //                     .collection('users')
// // // //                     .doc(user!.uid)
// // // //                     .set({
// // // //                       "doctor": doctor,
// // // //                       "friend": friend,
// // // //                     }, SetOptions(merge: true));

// // // //                 Navigator.pop(context);
// // // //                 fetchUserData();
// // // //               },
// // // //               child: const Text("Save"),
// // // //             ),
// // // //           ],
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     if (isLoading) {
// // // //       return const Scaffold(body: Center(child: CircularProgressIndicator()));
// // // //     }

// // // //     return Scaffold(
// // // //       backgroundColor: Colors.grey.shade100,
// // // //       appBar: AppBar(
// // // //         title: const Text("Emergency"),
// // // //         backgroundColor: Colors.red,
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: ListView(
// // // //         padding: const EdgeInsets.all(20),
// // // //         children: [
// // // //           // 🚨 SOS BUTTON
// // // //           Center(
// // // //             child: GestureDetector(
// // // //               onTap: () async {
// // // //                 await saveSOS("both");
// // // //                 await _callNumber("108");
// // // //                 await sendPanicSMS();
// // // //               },
// // // //               child: Container(
// // // //                 height: 140,
// // // //                 width: 140,
// // // //                 decoration: const BoxDecoration(
// // // //                   color: Colors.red,
// // // //                   shape: BoxShape.circle,
// // // //                 ),
// // // //                 child: const Center(
// // // //                   child: Text(
// // // //                     "SOS",
// // // //                     style: TextStyle(
// // // //                       fontSize: 32,
// // // //                       color: Colors.white,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),

// // // //           const SizedBox(height: 30),

// // // //           const Text(
// // // //             "Quick Contacts",
// // // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //           ),

// // // //           const SizedBox(height: 15),

// // // //           GridView.count(
// // // //             shrinkWrap: true,
// // // //             physics: const NeverScrollableScrollPhysics(),
// // // //             crossAxisCount: 2,
// // // //             children: [
// // // //               _buildQuickCard(
// // // //                 icon: Icons.local_hospital,
// // // //                 label: "Ambulance",
// // // //                 color: Colors.red,
// // // //                 number: "108",
// // // //               ),
// // // //               _buildQuickCard(
// // // //                 icon: Icons.local_police,
// // // //                 label: "Police",
// // // //                 color: Colors.indigo,
// // // //                 number: "100",
// // // //               ),
// // // //               _buildQuickCard(
// // // //                 icon: Icons.medical_services,
// // // //                 label: "Doctor",
// // // //                 color: Colors.green,
// // // //                 number: userData?['doctor'] ?? "",
// // // //               ),
// // // //               _buildQuickCard(
// // // //                 icon: Icons.people,
// // // //                 label: "Friend",
// // // //                 color: Colors.orange,
// // // //                 number: userData?['friend'] ?? "",
// // // //               ),
// // // //             ],
// // // //           ),

// // // //           const SizedBox(height: 30),

// // // //           _buildFeatureCard(
// // // //             icon: Icons.map,
// // // //             title: "Share Live Location",
// // // //             subtitle: "Send location via SMS",
// // // //             color: Colors.blue,
// // // //             onTap: sendPanicSMS,
// // // //           ),
// // // //           _buildFeatureCard(
// // // //             icon: Icons.message,
// // // //             title: "Send Panic SMS",
// // // //             subtitle: "Alert contacts instantly",
// // // //             color: Colors.purple,
// // // //             onTap: sendPanicSMS,
// // // //           ),
// // // //           _buildFeatureCard(
// // // //             icon: Icons.contacts,
// // // //             title: "Edit Contacts",
// // // //             subtitle: "Update emergency contacts",
// // // //             color: Colors.teal,
// // // //             onTap: showSetupDialog,
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildQuickCard({
// // // //     required IconData icon,
// // // //     required String label,
// // // //     required Color color,
// // // //     required String number,
// // // //   }) {
// // // //     return InkWell(
// // // //       onTap: number.isEmpty ? null : () => _callNumber(number),
// // // //       child: Card(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Icon(icon, color: color),
// // // //             const SizedBox(height: 10),
// // // //             Text(label),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildFeatureCard({
// // // //     required IconData icon,
// // // //     required String title,
// // // //     required String subtitle,
// // // //     required Color color,
// // // //     required VoidCallback onTap,
// // // //   }) {
// // // //     return Card(
// // // //       child: ListTile(
// // // //         leading: Icon(icon, color: color),
// // // //         title: Text(title),
// // // //         subtitle: Text(subtitle),
// // // //         onTap: onTap,
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:geolocator/geolocator.dart';

// // // class EmergencyPage extends StatefulWidget {
// // //   const EmergencyPage({super.key});

// // //   @override
// // //   State<EmergencyPage> createState() => _EmergencyPageState();
// // // }

// // // class _EmergencyPageState extends State<EmergencyPage>
// // //     with SingleTickerProviderStateMixin {
// // //   Map<String, dynamic>? userData;
// // //   bool isLoading = true;
// // //   String? currentSOSId;

// // //   late AnimationController _controller;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchUserData();

// // //     _controller = AnimationController(
// // //       vsync: this,
// // //       duration: const Duration(seconds: 1),
// // //       lowerBound: 0.9,
// // //       upperBound: 1.05,
// // //     )..repeat(reverse: true);
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }

// // //   // ================= FETCH USER =================
// // //   Future<void> fetchUserData() async {
// // //     try {
// // //       final user = FirebaseAuth.instance.currentUser;

// // //       if (user == null) {
// // //         setState(() => isLoading = false);
// // //         return;
// // //       }

// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .get();

// // //       final data = doc.data();

// // //       bool isValid =
// // //           doc.exists &&
// // //           data != null &&
// // //           data['doctorNumber'] != null &&
// // //           data['friendNumber'] != null;

// // //       if (isValid) {
// // //         setState(() {
// // //           userData = data;
// // //           isLoading = false;
// // //         });
// // //       } else {
// // //         setState(() => isLoading = false);
// // //         Future.delayed(Duration.zero, () {
// // //           if (mounted) showSetupDialog();
// // //         });
// // //       }
// // //     } catch (e) {
// // //       setState(() => isLoading = false);
// // //     }
// // //   }

// // //   // ================= LOCATION =================
// // //   Future<String> getLocationLink() async {
// // //     try {
// // //       Position pos = await Geolocator.getCurrentPosition();
// // //       return "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
// // //     } catch (e) {
// // //       return "Location unavailable";
// // //     }
// // //   }

// // //   // ================= SOS SAVE =================
// // //   Future<void> saveSOS(String type) async {
// // //     final user = FirebaseAuth.instance.currentUser;
// // //     if (user == null) return;

// // //     final data = userData ?? {};
// // //     final location = await getLocationLink();

// // //     final docRef = await FirebaseFirestore.instance
// // //         .collection('sos_history')
// // //         .add({
// // //           "userId": user.uid,
// // //           "userName": data['name'] ?? "User",
// // //           "doctor": data['doctorNumber'],
// // //           "friend": data['friendNumber'],
// // //           "type": type,
// // //           "location": location,
// // //           "status": "pending",
// // //           "createdAt": FieldValue.serverTimestamp(),
// // //         });

// // //     currentSOSId = docRef.id;
// // //   }

// // //   // ================= SMS =================
// // //   Future<void> sendPanicSMS() async {
// // //     final doctor = userData?['doctorNumber'];
// // //     final friend = userData?['friendNumber'];

// // //     final location = await getLocationLink();

// // //     final message =
// // //         "🚨 EMERGENCY ALERT!\nI need immediate help.\nLocation: $location";

// // //     final Uri smsUri = Uri.parse(
// // //       "sms:$doctor,$friend?body=${Uri.encodeComponent(message)}",
// // //     );

// // //     await launchUrl(smsUri);
// // //   }

// // //   // ================= CALL =================
// // //   Future<void> _callNumber(String number) async {
// // //     final Uri callUri = Uri(scheme: "tel", path: number);
// // //     await launchUrl(callUri);
// // //   }

// // //   // ================= SETUP =================
// // //   void showSetupDialog() {
// // //     final doctorName = TextEditingController();
// // //     final doctorNumber = TextEditingController();
// // //     final friendName = TextEditingController();
// // //     final friendNumber = TextEditingController();

// // //     showDialog(
// // //       context: context,
// // //       barrierDismissible: false,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: const Text("Setup Emergency Contacts"),
// // //           content: SingleChildScrollView(
// // //             child: Column(
// // //               children: [
// // //                 const Text(
// // //                   "These contacts will be used during emergency situations. "
// // //                   "On pressing SOS, they will receive your location and alert message.",
// // //                   style: TextStyle(fontSize: 13, color: Colors.grey),
// // //                 ),
// // //                 const SizedBox(height: 15),

// // //                 TextField(
// // //                   controller: doctorName,
// // //                   decoration: const InputDecoration(labelText: "Doctor Name"),
// // //                 ),
// // //                 TextField(
// // //                   controller: doctorNumber,
// // //                   keyboardType: TextInputType.phone,
// // //                   decoration: const InputDecoration(labelText: "Doctor Number"),
// // //                 ),

// // //                 const SizedBox(height: 10),

// // //                 TextField(
// // //                   controller: friendName,
// // //                   decoration: const InputDecoration(
// // //                     labelText: "Best Friend Name",
// // //                   ),
// // //                 ),
// // //                 TextField(
// // //                   controller: friendNumber,
// // //                   keyboardType: TextInputType.phone,
// // //                   decoration: const InputDecoration(
// // //                     labelText: "Best Friend Number",
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           actions: [
// // //             ElevatedButton(
// // //               onPressed: () async {
// // //                 final user = FirebaseAuth.instance.currentUser;

// // //                 await FirebaseFirestore.instance
// // //                     .collection('users')
// // //                     .doc(user!.uid)
// // //                     .set({
// // //                       "doctorName": doctorName.text,
// // //                       "doctorNumber": doctorNumber.text,
// // //                       "friendName": friendName.text,
// // //                       "friendNumber": friendNumber.text,
// // //                     }, SetOptions(merge: true));

// // //                 Navigator.pop(context);
// // //                 fetchUserData();
// // //               },
// // //               child: const Text("Save"),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   // ================= UI =================
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (isLoading) {
// // //       return const Scaffold(body: Center(child: CircularProgressIndicator()));
// // //     }

// // //     return Scaffold(
// // //       backgroundColor: Colors.grey.shade100,
// // //       appBar: AppBar(
// // //         title: const Text("Emergency"),
// // //         backgroundColor: Colors.red,
// // //         centerTitle: true,
// // //       ),
// // //       body: ListView(
// // //         padding: const EdgeInsets.all(20),
// // //         children: [
// // //           // ===== AWARENESS SECTION =====
// // //           Card(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(12),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: const [
// // //                   Text(
// // //                     "How this works",
// // //                     style: TextStyle(fontWeight: FontWeight.bold),
// // //                   ),
// // //                   SizedBox(height: 6),
// // //                   Text(
// // //                     "• Tap SOS to instantly call ambulance (108)\n"
// // //                     "• Your emergency contacts receive SMS with your location\n"
// // //                     "• You can also directly call Police, Doctor or Friend\n"
// // //                     "• Keep your contacts updated for quick help",
// // //                     style: TextStyle(fontSize: 13),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),

// // //           const SizedBox(height: 20),

// // //           // ===== SOS BUTTON =====
// // //           Center(
// // //             child: ScaleTransition(
// // //               scale: _controller,
// // //               child: GestureDetector(
// // //                 onTap: () async {
// // //                   await saveSOS("both");
// // //                   await _callNumber("108");
// // //                   await sendPanicSMS();
// // //                 },
// // //                 child: Container(
// // //                   height: 120,
// // //                   width: 120,
// // //                   decoration: const BoxDecoration(
// // //                     color: Colors.red,
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   child: const Center(
// // //                     child: Text(
// // //                       "SOS",
// // //                       style: TextStyle(
// // //                         fontSize: 28,
// // //                         color: Colors.white,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),

// // //           const SizedBox(height: 25),

// // //           const Text(
// // //             "Quick Contacts",
// // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //           ),

// // //           const SizedBox(height: 15),

// // //           GridView.count(
// // //             shrinkWrap: true,
// // //             physics: const NeverScrollableScrollPhysics(),
// // //             crossAxisCount: 2,
// // //             children: [
// // //               _buildQuickCard(
// // //                 Icons.local_hospital,
// // //                 "Ambulance",
// // //                 Colors.red,
// // //                 "108",
// // //               ),
// // //               _buildQuickCard(
// // //                 Icons.local_police,
// // //                 "Police",
// // //                 Colors.indigo,
// // //                 "100",
// // //               ),
// // //               _buildQuickCard(
// // //                 Icons.medical_services,
// // //                 userData?['doctorName'] ?? "Doctor",
// // //                 Colors.green,
// // //                 userData?['doctorNumber'] ?? "",
// // //               ),
// // //               _buildQuickCard(
// // //                 Icons.people,
// // //                 userData?['friendName'] ?? "Friend",
// // //                 Colors.orange,
// // //                 userData?['friendNumber'] ?? "",
// // //               ),
// // //             ],
// // //           ),

// // //           const SizedBox(height: 25),

// // //           _buildFeatureCard(
// // //             Icons.map,
// // //             "Share Live Location",
// // //             "Send location via SMS",
// // //             Colors.blue,
// // //             sendPanicSMS,
// // //           ),
// // //           _buildFeatureCard(
// // //             Icons.message,
// // //             "Send Panic SMS",
// // //             "Alert contacts instantly",
// // //             Colors.purple,
// // //             sendPanicSMS,
// // //           ),
// // //           _buildFeatureCard(
// // //             Icons.contacts,
// // //             "Edit Contacts",
// // //             "Update emergency contacts",
// // //             Colors.teal,
// // //             showSetupDialog,
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildQuickCard(
// // //     IconData icon,
// // //     String label,
// // //     Color color,
// // //     String number,
// // //   ) {
// // //     return InkWell(
// // //       onTap: number.isEmpty ? null : () => _callNumber(number),
// // //       child: Card(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Icon(icon, color: color, size: 28),
// // //             const SizedBox(height: 8),
// // //             Text(label),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFeatureCard(
// // //     IconData icon,
// // //     String title,
// // //     String subtitle,
// // //     Color color,
// // //     VoidCallback onTap,
// // //   ) {
// // //     return Card(
// // //       child: ListTile(
// // //         leading: Icon(icon, color: color),
// // //         title: Text(title),
// // //         subtitle: Text(subtitle),
// // //         onTap: onTap,
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:intl/intl.dart';

// // class EmergencyPage extends StatefulWidget {
// //   const EmergencyPage({super.key});

// //   @override
// //   State<EmergencyPage> createState() => _EmergencyPageState();
// // }

// // class _EmergencyPageState extends State<EmergencyPage> {
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   int _sosTapCount = 0;
// //   bool _isAlarmPlaying = false;

// //   Map<String, String> contacts = {
// //     "Doctor": "9876501234",
// //     "Best Friend": "9876543210",
// //     "Family": "9123456789",
// //     "Police": "100",
// //     "Ambulance": "108",
// //     "Girl Helpline": "1091",
// //   };

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   void _toggleAlarm() async {
// //     if (_isAlarmPlaying) {
// //       await _audioPlayer.stop();
// //     } else {
// //       debugPrint("Playing Alarm...");
// //       // await _audioPlayer.play(AssetSource('siren.mp3'));
// //     }
// //     setState(() => _isAlarmPlaying = !_isAlarmPlaying);
// //   }

// //   Future<void> _triggerSOS(String helpMessage) async {
// //     try {
// //       Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high,
// //       );

// //       await FirebaseFirestore.instance.collection('sos_history').add({
// //         'username': 'User_123',
// //         'timestamp': FieldValue.serverTimestamp(),
// //         'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
// //         'time': DateFormat('HH:mm:ss').format(DateTime.now()),
// //         'location': {'lat': position.latitude, 'lng': position.longitude},
// //         'help_message': helpMessage,
// //         'contacts_alerted': contacts,
// //         'status': 'Urgent',
// //       });

// //       if (mounted) {
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(const SnackBar(content: Text("SOS Sent Successfully!")));
// //       }
// //     } catch (e) {
// //       debugPrint("SOS Error: $e");
// //     }
// //   }

// //   void _handleSOSClick() {
// //     setState(() => _sosTapCount++);
// //     if (_sosTapCount >= 3) {
// //       _sosTapCount = 0;
// //       _showHelpMessageDialog();
// //     }
// //   }

// //   void _showHelpMessageDialog() {
// //     TextEditingController controller = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text("Describe Emergency"),
// //         content: TextField(
// //           controller: controller,
// //           decoration: const InputDecoration(
// //             hintText: "E.g. Accident near MG Road",
// //           ),
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               _triggerSOS(controller.text);
// //               Navigator.pop(context);
// //             },
// //             child: const Text("SEND SOS"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _editContact(String key) {
// //     TextEditingController controller = TextEditingController(
// //       text: contacts[key],
// //     );

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text("Edit $key"),
// //         content: TextField(
// //           controller: controller,
// //           keyboardType: TextInputType.phone,
// //           decoration: const InputDecoration(labelText: "Phone Number"),
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text("Cancel"),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               setState(() {
// //                 contacts[key] = controller.text;
// //               });
// //               Navigator.pop(context);
// //             },
// //             child: const Text("Save"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text("Safety Shield"),
// //         backgroundColor: Colors.redAccent,
// //         actions: [
// //           IconButton(
// //             icon: Icon(_isAlarmPlaying ? Icons.volume_up : Icons.volume_off),
// //             onPressed: _toggleAlarm,
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           children: [
// //             Container(
// //               padding: const EdgeInsets.all(15),
// //               decoration: BoxDecoration(
// //                 color: Colors.red.shade50,
// //                 borderRadius: BorderRadius.circular(12),
// //                 border: Border.all(color: Colors.red.shade200),
// //               ),
// //               child: const Row(
// //                 children: [
// //                   Icon(Icons.info_outline, color: Colors.red),
// //                   SizedBox(width: 10),
// //                   Expanded(
// //                     child: Text(
// //                       "Tap SOS 3 times to send emergency alert with location.",
// //                       style: TextStyle(fontSize: 13),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 30),

// //             GestureDetector(
// //               onTap: _handleSOSClick,
// //               child: Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   Container(
// //                     height: 160,
// //                     width: 160,
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.red.withOpacity(0.1),
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 130,
// //                     width: 130,
// //                     decoration: const BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       gradient: LinearGradient(
// //                         colors: [Colors.red, Colors.redAccent],
// //                       ),
// //                       boxShadow: [
// //                         BoxShadow(color: Colors.black26, blurRadius: 10),
// //                       ],
// //                     ),
// //                     child: const Center(
// //                       child: Text(
// //                         "SOS",
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 30,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 40),

// //             const Text(
// //               "Emergency Contacts",
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),

// //             const SizedBox(height: 10),

// //             GridView.count(
// //               shrinkWrap: true,
// //               physics: const NeverScrollableScrollPhysics(),
// //               crossAxisCount: 2,
// //               childAspectRatio: 1.3,
// //               crossAxisSpacing: 10,
// //               mainAxisSpacing: 10,
// //               children: [
// //                 _buildContactCard(
// //                   "Doctor",
// //                   Icons.medical_services,
// //                   Colors.green,
// //                 ),
// //                 _buildContactCard("Best Friend", Icons.star, Colors.orange),
// //                 _buildContactCard("Family", Icons.family_restroom, Colors.blue),
// //                 _buildContactCard("Girl Helpline", Icons.woman, Colors.purple),
// //               ],
// //             ),

// //             const SizedBox(height: 30),

// //             const Text(
// //               "Public Services",
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),

// //             _buildPublicTile("Police", "100", Icons.local_police),
// //             _buildPublicTile("Ambulance", "108", Icons.local_hospital),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildContactCard(String title, IconData icon, Color color) {
// //     final number = contacts[title] ?? "Not Set";

// //     return Container(
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Align(
// //             alignment: Alignment.topRight,
// //             child: IconButton(
// //               icon: const Icon(Icons.edit, size: 16),
// //               onPressed: () => _editContact(title),
// //             ),
// //           ),
// //           Icon(icon, color: color, size: 30),
// //           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// //           Text(number, style: const TextStyle(fontSize: 12)),
// //           TextButton(
// //             onPressed: () {
// //               launchUrl(Uri(scheme: 'tel', path: number));
// //             },
// //             child: const Text("CALL NOW"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPublicTile(String title, String num, IconData icon) {
// //     return ListTile(
// //       leading: Icon(icon, color: Colors.red),
// //       title: Text(title),
// //       subtitle: Text(num),
// //       trailing: const Icon(Icons.call, color: Colors.green),
// //       onTap: () {
// //         launchUrl(Uri(scheme: 'tel', path: num));
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:intl/intl.dart';

// class EmergencyPage extends StatefulWidget {
//   const EmergencyPage({super.key});

//   @override
//   State<EmergencyPage> createState() => _EmergencyPageState();
// }

// class _EmergencyPageState extends State<EmergencyPage> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   int _sosTapCount = 0;
//   bool _isAlarmPlaying = false;

//   Map<String, String> contacts = {
//     "Doctor": "9876501234",
//     "Best Friend": "9876543210",
//     "Family": "9123456789",
//     "Police": "100",
//     "Ambulance": "108",
//     "Girl Helpline": "1091",
//   };

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   void _toggleAlarm() async {
//     if (_isAlarmPlaying) {
//       await _audioPlayer.stop();
//     } else {
//       debugPrint("Playing Alarm...");
//       // await _audioPlayer.play(AssetSource('siren.mp3'));
//     }
//     setState(() => _isAlarmPlaying = !_isAlarmPlaying);
//   }

//   Future<void> _triggerSOS(String helpMessage) async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       await FirebaseFirestore.instance.collection('sos_history').add({
//         'username': 'User_123',
//         'timestamp': FieldValue.serverTimestamp(),
//         'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
//         'time': DateFormat('HH:mm:ss').format(DateTime.now()),
//         'location': {'lat': position.latitude, 'lng': position.longitude},
//         'help_message': helpMessage,
//         'contacts_alerted': contacts,
//         'status': 'Urgent',
//       });

//       if (mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text("SOS Sent Successfully!")));
//       }
//     } catch (e) {
//       debugPrint("SOS Error: $e");
//     }
//   }

//   void _handleSOSClick() {
//     setState(() => _sosTapCount++);
//     if (_sosTapCount >= 3) {
//       _sosTapCount = 0;
//       _showHelpMessageDialog();
//     }
//   }

//   void _showHelpMessageDialog() {
//     TextEditingController controller = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Describe Emergency"),
//         content: TextField(
//           controller: controller,
//           decoration: const InputDecoration(
//             hintText: "E.g. Accident near MG Road",
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               _triggerSOS(controller.text);
//               Navigator.pop(context);
//             },
//             child: const Text("SEND SOS"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _editContact(String key) {
//     TextEditingController controller = TextEditingController(
//       text: contacts[key],
//     );

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Edit $key"),
//         content: TextField(
//           controller: controller,
//           keyboardType: TextInputType.phone,
//           decoration: const InputDecoration(labelText: "Phone Number"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 contacts[key] = controller.text;
//               });
//               Navigator.pop(context);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showComingSoon(BuildContext context, String feature) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("$feature coming soon 🚀")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Safety Shield"),
//         backgroundColor: Colors.redAccent,
//         actions: [
//           IconButton(
//             icon: Icon(_isAlarmPlaying ? Icons.volume_up : Icons.volume_off),
//             onPressed: _toggleAlarm,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Info banner
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.red.shade50,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.red.shade200),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(Icons.info_outline, color: Colors.red),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       "Tap SOS 3 times to send emergency alert with location.",
//                       style: TextStyle(fontSize: 13),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             // SOS BUTTON
//             GestureDetector(
//               onTap: _handleSOSClick,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: 160,
//                     width: 160,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.red.withOpacity(0.1),
//                     ),
//                   ),
//                   Container(
//                     height: 130,
//                     width: 130,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Colors.red, Colors.redAccent],
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "SOS",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             const Text(
//               "Emergency Contacts",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 10),

//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               childAspectRatio: 1.3,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               children: [
//                 _buildContactCard(
//                   "Doctor",
//                   Icons.medical_services,
//                   Colors.green,
//                 ),
//                 _buildContactCard("Best Friend", Icons.star, Colors.orange),
//                 _buildContactCard("Family", Icons.family_restroom, Colors.blue),
//                 _buildContactCard("Girl Helpline", Icons.woman, Colors.purple),
//               ],
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "Quick Emergency Actions",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 10),

//             _buildQuickCard(
//               context,
//               icon: Icons.local_hospital,
//               label: "Ambulance",
//               color: Colors.red,
//               number: "108",
//             ),

//             _buildQuickCard(
//               context,
//               icon: Icons.local_police,
//               label: "Police",
//               color: Colors.indigo,
//               number: "100",
//             ),

//             const SizedBox(height: 25),

//             const Text(
//               "More Safety Features",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 15),

//             _buildFeatureCard(
//               context,
//               icon: Icons.map,
//               title: "Share Live Location",
//               subtitle: "Send your real-time location to trusted contacts",
//               color: Colors.blue,
//               onTap: () => _showComingSoon(context, "Location Sharing"),
//             ),

//             _buildFeatureCard(
//               context,
//               icon: Icons.message,
//               title: "Send Panic SMS",
//               subtitle: "Automatically alert friends with a quick SMS",
//               color: Colors.purple,
//               onTap: () => _showComingSoon(context, "Panic SMS"),
//             ),

//             _buildFeatureCard(
//               context,
//               icon: Icons.contacts,
//               title: "Add More Trusted Contacts",
//               subtitle: "Keep your emergency circle updated",
//               color: Colors.teal,
//               onTap: () => _showComingSoon(context, "Manage Contacts"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildContactCard(String title, IconData icon, Color color) {
//     final number = contacts[title] ?? "Not Set";

//     return Container(
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: IconButton(
//               icon: const Icon(Icons.edit, size: 16),
//               onPressed: () => _editContact(title),
//             ),
//           ),
//           Icon(icon, color: color, size: 30),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//           Text(number, style: const TextStyle(fontSize: 12)),
//           TextButton(
//             onPressed: () {
//               launchUrl(Uri(scheme: 'tel', path: number));
//             },
//             child: const Text("CALL NOW"),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickCard(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required Color color,
//     required String number,
//   }) {
//     return Card(
//       color: color.withOpacity(0.1),
//       child: ListTile(
//         leading: Icon(icon, color: color, size: 30),
//         title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(number),
//         trailing: const Icon(Icons.call, color: Colors.green),
//         onTap: () {
//           launchUrl(Uri(scheme: 'tel', path: number));
//         },
//       ),
//     );
//   }

//   Widget _buildFeatureCard(
//     BuildContext context, {
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       child: ListTile(
//         leading: Icon(icon, color: color, size: 30),
//         title: Text(title),
//         subtitle: Text(subtitle),
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic>? userData;
  bool isLoading = true;
  String? currentSOSId;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    fetchUserData();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.9,
      upperBound: 1.05,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ================= FETCH USER =================
  Future<void> fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        setState(() => isLoading = false);
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final data = doc.data();

      bool isValid =
          doc.exists &&
          data != null &&
          data['doctorNumber'] != null &&
          data['friendNumber'] != null;

      if (isValid) {
        setState(() {
          userData = data;
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        Future.delayed(Duration.zero, () {
          if (mounted) showSetupDialog();
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  // ================= LOCATION =================
  Future<String> getLocationLink() async {
    try {
      Position pos = await Geolocator.getCurrentPosition();
      return "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
    } catch (e) {
      return "Location unavailable";
    }
  }

  // ================= SOS SAVE =================
  Future<void> saveSOS(String type) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final data = userData ?? {};
    final location = await getLocationLink();

    final docRef = FirebaseFirestore.instance.collection('sos_history').doc();

    await docRef.set({
      "docId": docRef.id, // ✅ already available
      "userId": user.uid,
      "userName": data['name'] ?? "User",
      "doctor": data['doctorNumber'],
      "friend": data['friendNumber'],
      "type": type,
      "location": location,
      "status": "pending",
      "createdAt": FieldValue.serverTimestamp(),
      "createdAtLocal": DateTime.now().toIso8601String(),
    });

    currentSOSId = docRef.id;
  }

  // ================= SMS =================
  Future<void> sendPanicSMS() async {
    final doctor = userData?['doctorNumber'];
    final friend = userData?['friendNumber'];

    final location = await getLocationLink();

    final message =
        "🚨 EMERGENCY ALERT!\nI need immediate help.\nLocation: $location";

    final Uri smsUri = Uri.parse(
      "sms:$doctor,$friend?body=${Uri.encodeComponent(message)}",
    );

    await launchUrl(smsUri);
  }

  // ================= CALL =================
  Future<void> _callNumber(String number) async {
    final Uri callUri = Uri(scheme: "tel", path: number);
    await launchUrl(callUri);
  }

  // ================= SETUP =================
  void showSetupDialog() {
    final doctorName = TextEditingController();
    final doctorNumber = TextEditingController();
    final friendName = TextEditingController();
    final friendNumber = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Setup Emergency Contacts"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "These contacts will be used during emergency situations. "
                  "On pressing SOS, they will receive your location and alert message.",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: doctorName,
                  decoration: const InputDecoration(labelText: "Doctor Name"),
                ),
                TextField(
                  controller: doctorNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Doctor Number"),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: friendName,
                  decoration: const InputDecoration(
                    labelText: "Best Friend Name",
                  ),
                ),
                TextField(
                  controller: friendNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Best Friend Number",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .set({
                      "doctorName": doctorName.text,
                      "doctorNumber": doctorNumber.text,
                      "friendName": friendName.text,
                      "friendNumber": friendNumber.text,
                    }, SetOptions(merge: true));

                Navigator.pop(context);
                fetchUserData();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Emergency"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ===== AWARENESS SECTION =====
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "How this works",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "• Tap SOS to instantly call ambulance (108)\n"
                    "• Your emergency contacts receive SMS with your location\n"
                    "• You can also directly call Police, Doctor or Friend\n"
                    "• Keep your contacts updated for quick help",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ===== SOS BUTTON =====
          Center(
            child: ScaleTransition(
              scale: _controller,
              child: GestureDetector(
                onTap: () async {
                  await saveSOS("both");
                  await _callNumber("108");
                  await sendPanicSMS();
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "SOS",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Quick Contacts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              _buildQuickCard(
                Icons.local_hospital,
                "Ambulance",
                Colors.red,
                "108",
              ),
              _buildQuickCard(
                Icons.local_police,
                "Police",
                Colors.indigo,
                "100",
              ),
              _buildQuickCard(
                Icons.medical_services,
                userData?['doctorName'] ?? "Doctor",
                Colors.green,
                userData?['doctorNumber'] ?? "",
              ),
              _buildQuickCard(
                Icons.people,
                userData?['friendName'] ?? "Friend",
                Colors.orange,
                userData?['friendNumber'] ?? "",
              ),
            ],
          ),

          const SizedBox(height: 25),

          _buildFeatureCard(
            Icons.map,
            "Share Live Location",
            "Send location via SMS",
            Colors.blue,
            sendPanicSMS,
          ),
          _buildFeatureCard(
            Icons.message,
            "Send Panic SMS",
            "Alert contacts instantly",
            Colors.purple,
            sendPanicSMS,
          ),
          _buildFeatureCard(
            Icons.contacts,
            "Edit Contacts",
            "Update emergency contacts",
            Colors.teal,
            showSetupDialog,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCard(
    IconData icon,
    String label,
    Color color,
    String number,
  ) {
    return InkWell(
      onTap: number.isEmpty ? null : () => _callNumber(number),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
