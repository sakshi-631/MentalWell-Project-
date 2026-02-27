// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';

// // // // class UserProfilePage extends StatefulWidget {
// // // //   const UserProfilePage({super.key});

// // // //   @override
// // // //   State<UserProfilePage> createState() => _UserProfilePageState();
// // // // }

// // // // class _UserProfilePageState extends State<UserProfilePage> {
// // // //   Map<String, dynamic>? userData;
// // // //   Map<String, dynamic>? lastSOS;
// // // //   int totalSOS = 0;
// // // //   bool isLoading = true;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchAllData();
// // // //   }

// // // //   // ================= FETCH ALL DATA =================
// // // //   Future<void> fetchAllData() async {
// // // //     final user = FirebaseAuth.instance.currentUser;

// // // //     if (user == null) {
// // // //       setState(() => isLoading = false);
// // // //       return;
// // // //     }

// // // //     try {
// // // //       final userDoc = await FirebaseFirestore.instance
// // // //           .collection("users")
// // // //           .doc(user.uid)
// // // //           .get();

// // // //       final sosSnapshot = await FirebaseFirestore.instance
// // // //           .collection("sos_history")
// // // //           .where("userId", isEqualTo: user.uid)
// // // //           .orderBy("createdAt", descending: true)
// // // //           .get();

// // // //       if (!mounted) return;

// // // //       setState(() {
// // // //         userData = userDoc.data() ?? {};
// // // //         totalSOS = sosSnapshot.docs.length;

// // // //         lastSOS = sosSnapshot.docs.isNotEmpty
// // // //             ? sosSnapshot.docs.first.data()
// // // //             : null;

// // // //         isLoading = false;
// // // //       });
// // // //     } catch (e) {
// // // //       debugPrint("Error fetching profile: $e");

// // // //       if (mounted) {
// // // //         setState(() => isLoading = false);
// // // //       }
// // // //     }
// // // //   }

// // // //   // ================= CALL =================
// // // //   Future<void> callNumber(String? number) async {
// // // //     if (number == null || number.trim().isEmpty) return;

// // // //     final uri = Uri(scheme: "tel", path: number);

// // // //     try {
// // // //       if (await canLaunchUrl(uri)) {
// // // //         await launchUrl(uri);
// // // //       }
// // // //     } catch (e) {
// // // //       debugPrint("Call error: $e");
// // // //     }
// // // //   }

// // // //   // ================= FORMAT DATE =================
// // // //   String formatDate(String? date) {
// // // //     if (date == null || date.isEmpty) return "Not set";

// // // //     try {
// // // //       final parsed = DateTime.parse(date).toLocal();
// // // //       return "${parsed.day}/${parsed.month}/${parsed.year}";
// // // //     } catch (_) {
// // // //       return date;
// // // //     }
// // // //   }

// // // //   String formatDateTime(String? date) {
// // // //     if (date == null || date.isEmpty) return "Not set";

// // // //     try {
// // // //       final parsed = DateTime.parse(date).toLocal();
// // // //       return "${parsed.day}/${parsed.month}/${parsed.year}  "
// // // //           "${parsed.hour.toString().padLeft(2, '0')}:"
// // // //           "${parsed.minute.toString().padLeft(2, '0')}";
// // // //     } catch (_) {
// // // //       return date;
// // // //     }
// // // //   }

// // // //   // ================= UI =================
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     if (isLoading) {
// // // //       return const Scaffold(body: Center(child: CircularProgressIndicator()));
// // // //     }

// // // //     final user = userData ?? {};

// // // //     return Scaffold(
// // // //       backgroundColor: Colors.grey.shade100,
// // // //       appBar: AppBar(title: const Text("User Profile")),
// // // //       body: RefreshIndicator(
// // // //         onRefresh: fetchAllData, // 🔄 pull to refresh
// // // //         child: SingleChildScrollView(
// // // //           physics: const AlwaysScrollableScrollPhysics(),
// // // //           padding: const EdgeInsets.all(16),
// // // //           child: Column(
// // // //             children: [
// // // //               // ================= BASIC INFO =================
// // // //               _buildCard(
// // // //                 title: "👤 BASIC INFO",
// // // //                 children: [
// // // //                   _row("Name", user["name"]),
// // // //                   _row("Email", user["email"]),
// // // //                   _row("Mobile", user["mobile"]),
// // // //                   _row("Address", user["address"]),
// // // //                   _row("DOB", formatDate(user["dob"])),
// // // //                 ],
// // // //               ),

// // // //               // ================= EMERGENCY CONTACTS =================
// // // //               _buildCard(
// // // //                 title: "🚨 EMERGENCY CONTACTS",
// // // //                 children: [
// // // //                   _row("Doctor", user["doctorName"]),
// // // //                   _row("Doctor No", user["doctorNumber"]),
// // // //                   _row("Friend", user["friendName"]),
// // // //                   _row("Friend No", user["friendNumber"]),

// // // //                   const SizedBox(height: 10),

// // // //                   Row(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: ElevatedButton(
// // // //                           onPressed: () => callNumber(user["doctorNumber"]),
// // // //                           child: const Text("Call Doctor"),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(width: 10),
// // // //                       Expanded(
// // // //                         child: ElevatedButton(
// // // //                           onPressed: () => callNumber(user["friendNumber"]),
// // // //                           child: const Text("Call Friend"),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),

// // // //               // ================= EMERGENCY ACTIVITY =================
// // // //               _buildCard(
// // // //                 title: "🚨 EMERGENCY ACTIVITY",
// // // //                 children: [
// // // //                   const Text(
// // // //                     "🔥 Last SOS:",
// // // //                     style: TextStyle(fontWeight: FontWeight.bold),
// // // //                   ),
// // // //                   _row("Status", lastSOS?["status"]),
// // // //                   _row("Time", formatDateTime(lastSOS?["createdAtLocal"])),
// // // //                   _row("Location", lastSOS?["location"]),

// // // //                   const SizedBox(height: 10),

// // // //                   const Text(
// // // //                     "📜 SOS History",
// // // //                     style: TextStyle(fontWeight: FontWeight.bold),
// // // //                   ),
// // // //                   Text("Total SOS: $totalSOS"),
// // // //                 ],
// // // //               ),

// // // //               // ================= ACCOUNT INSIGHTS =================
// // // //               _buildCard(
// // // //                 title: "📊 ACCOUNT INSIGHTS",
// // // //                 children: [
// // // //                   _row(
// // // //                     "Account Created",
// // // //                     formatDateTime(user["termsAcceptedAt"]),
// // // //                   ),
// // // //                   _row("Total SOS", totalSOS.toString()),
// // // //                   _row("Emergency Frequency", _getFrequency(totalSOS)),
// // // //                   _row("Last Login", "Not tracked yet"),
// // // //                 ],
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ================= FREQUENCY LOGIC =================
// // // //   String _getFrequency(int count) {
// // // //     if (count == 0) return "No emergencies";
// // // //     if (count < 3) return "Low";
// // // //     if (count < 6) return "Medium";
// // // //     return "High";
// // // //   }

// // // //   // ================= CARD UI =================
// // // //   Widget _buildCard({required String title, required List<Widget> children}) {
// // // //     return Card(
// // // //       margin: const EdgeInsets.only(bottom: 15),
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(14),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               title,
// // // //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const Divider(),
// // // //             ...children,
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ================= ROW UI =================
// // // //   Widget _row(String label, dynamic value) {
// // // //     final displayValue = (value == null || value.toString().trim().isEmpty)
// // // //         ? "Not set"
// // // //         : value.toString();

// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 4),
// // // //       child: Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Text("$label: ", style: const TextStyle(fontWeight: FontWeight.w600)),
// // // //           Expanded(child: Text(displayValue)),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class UserProfilePage extends StatefulWidget {
// // //   const UserProfilePage({super.key});

// // //   @override
// // //   State<UserProfilePage> createState() => _UserProfilePageState();
// // // }

// // // class _UserProfilePageState extends State<UserProfilePage> {
// // //   Map<String, dynamic>? userData;
// // //   Map<String, dynamic>? lastSOS;
// // //   int totalSOS = 0;
// // //   bool isLoading = true;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchAllData();
// // //   }

// // //   Future<void> fetchAllData() async {
// // //     final currentUser = FirebaseAuth.instance.currentUser;

// // //     if (currentUser == null) {
// // //       setState(() => isLoading = false);
// // //       return;
// // //     }

// // //     try {
// // //       final userDoc = await FirebaseFirestore.instance
// // //           .collection("users")
// // //           .doc(currentUser.uid)
// // //           .get();

// // //       final sosSnapshot = await FirebaseFirestore.instance
// // //           .collection("sos_history")
// // //           .where("userId", isEqualTo: currentUser.uid)
// // //           .orderBy("createdAt", descending: true)
// // //           .get();

// // //       if (!mounted) return;

// // //       setState(() {
// // //         userData = userDoc.data() ?? {};
// // //         totalSOS = sosSnapshot.docs.length;
// // //         lastSOS = sosSnapshot.docs.isNotEmpty
// // //             ? sosSnapshot.docs.first.data()
// // //             : null;
// // //         isLoading = false;
// // //       });
// // //     } catch (e) {
// // //       debugPrint("Error fetching profile: $e");
// // //       if (mounted) {
// // //         setState(() => isLoading = false);
// // //       }
// // //     }
// // //   }

// // //   Future<void> callNumber(String? number) async {
// // //     if (number == null || number.trim().isEmpty) return;

// // //     final uri = Uri(scheme: "tel", path: number.trim());

// // //     try {
// // //       if (await canLaunchUrl(uri)) {
// // //         await launchUrl(uri);
// // //       }
// // //     } catch (e) {
// // //       debugPrint("Call error: $e");
// // //     }
// // //   }

// // //   String formatDate(String? date) {
// // //     if (date == null || date.trim().isEmpty) return "Not set";

// // //     try {
// // //       final parsed = DateTime.parse(date).toLocal();
// // //       return "${parsed.day}/${parsed.month}/${parsed.year}";
// // //     } catch (_) {
// // //       return date;
// // //     }
// // //   }

// // //   String formatDateTime(String? date) {
// // //     if (date == null || date.trim().isEmpty) return "Not set";

// // //     try {
// // //       final parsed = DateTime.parse(date).toLocal();
// // //       return "${parsed.day}/${parsed.month}/${parsed.year}  ${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}";
// // //     } catch (_) {
// // //       return date;
// // //     }
// // //   }

// // //   String getDisplayValue(dynamic value, {String fallback = "Not set"}) {
// // //     if (value == null) return fallback;
// // //     final text = value.toString().trim();
// // //     if (text.isEmpty) return fallback;
// // //     return text;
// // //   }

// // //   String getInitials(String name) {
// // //     if (name.trim().isEmpty) return "U";
// // //     final parts = name.trim().split(" ");
// // //     if (parts.length == 1) {
// // //       return parts.first[0].toUpperCase();
// // //     }
// // //     return (parts[0][0] + parts[1][0]).toUpperCase();
// // //   }

// // //   int getContactsAdded(Map<String, dynamic> user) {
// // //     int count = 0;
// // //     if (getDisplayValue(user["doctorName"], fallback: "").isNotEmpty &&
// // //         getDisplayValue(user["doctorNumber"], fallback: "").isNotEmpty) {
// // //       count++;
// // //     }
// // //     if (getDisplayValue(user["friendName"], fallback: "").isNotEmpty &&
// // //         getDisplayValue(user["friendNumber"], fallback: "").isNotEmpty) {
// // //       count++;
// // //     }
// // //     return count;
// // //   }

// // //   int getProfileCompletion(Map<String, dynamic> user) {
// // //     final fields = [
// // //       user["name"],
// // //       user["email"],
// // //       user["mobile"],
// // //       user["dob"],
// // //       user["address"],
// // //       user["doctorName"],
// // //       user["doctorNumber"],
// // //       user["friendName"],
// // //       user["friendNumber"],
// // //     ];

// // //     int filled = fields
// // //         .where((field) => field != null && field.toString().trim().isNotEmpty)
// // //         .length;

// // //     return ((filled / fields.length) * 100).round();
// // //   }

// // //   void logout() async {
// // //     await FirebaseAuth.instance.signOut();
// // //     if (!mounted) return;
// // //     Navigator.pop(context);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (isLoading) {
// // //       return const Scaffold(body: Center(child: CircularProgressIndicator()));
// // //     }

// // //     final user = userData ?? {};
// // //     final firebaseUser = FirebaseAuth.instance.currentUser;

// // //     final name = getDisplayValue(user["name"], fallback: "User");
// // //     final email = getDisplayValue(user["email"]);
// // //     final mobile = getDisplayValue(user["mobile"]);
// // //     final dob = formatDate(user["dob"]);
// // //     final address = getDisplayValue(user["address"]);
// // //     final profileImage = getDisplayValue(user["profileImage"], fallback: "");
// // //     final doctorName = getDisplayValue(user["doctorName"]);
// // //     final doctorNumber = getDisplayValue(user["doctorNumber"]);
// // //     final friendName = getDisplayValue(user["friendName"]);
// // //     final friendNumber = getDisplayValue(user["friendNumber"]);
// // //     final accountType = getDisplayValue(user["accountType"], fallback: "User");

// // //     final bool emailVerified = firebaseUser?.emailVerified ?? false;
// // //     final bool mobileVerified = user["mobileVerified"] == true;
// // //     final bool termsAccepted = user["termsAccepted"] == true;

// // //     final int contactsAdded = getContactsAdded(user);
// // //     final int profileCompletion = getProfileCompletion(user);

// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF6F7FB),
// // //       appBar: AppBar(
// // //         elevation: 0,
// // //         backgroundColor: Colors.white,
// // //         foregroundColor: Colors.black87,
// // //         title: const Text(
// // //           "User Profile",
// // //           style: TextStyle(fontWeight: FontWeight.w700),
// // //         ),
// // //       ),
// // //       body: RefreshIndicator(
// // //         onRefresh: fetchAllData,
// // //         child: SingleChildScrollView(
// // //           physics: const AlwaysScrollableScrollPhysics(),
// // //           padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               _buildHeaderCard(
// // //                 name: name,
// // //                 subtitle: "MentalWell Member",
// // //                 imageUrl: profileImage,
// // //               ),
// // //               const SizedBox(height: 18),

// // //               _buildSectionTitle("About Me"),
// // //               _buildAboutCard(user),

// // //               _buildSectionTitle("Personal Information"),
// // //               _buildInfoCard(
// // //                 children: [
// // //                   _profileTile("Name", name, Icons.person_outline),
// // //                   _profileTile("Email", email, Icons.email_outlined),
// // //                   _profileTile("Phone", mobile, Icons.call_outlined),
// // //                   _profileTile("DOB", dob, Icons.cake_outlined),
// // //                   _profileTile("Address", address, Icons.location_on_outlined),
// // //                 ],
// // //               ),

// // //               _buildSectionTitle("Emergency Support Network"),
// // //               Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: _buildContactCard(
// // //                       title: "Doctor",
// // //                       name: doctorName,
// // //                       number: doctorNumber,
// // //                       icon: Icons.local_hospital_outlined,
// // //                       color: const Color(0xFFEF5350),
// // //                       onCall: () => callNumber(
// // //                         doctorNumber == "Not set" ? null : doctorNumber,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 12),
// // //                   Expanded(
// // //                     child: _buildContactCard(
// // //                       title: "Friend",
// // //                       name: friendName,
// // //                       number: friendNumber,
// // //                       icon: Icons.people_outline,
// // //                       color: const Color(0xFF5C6BC0),
// // //                       onCall: () => callNumber(
// // //                         friendNumber == "Not set" ? null : friendNumber,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),

// // //               _buildSectionTitle("Safety Summary"),
// // //               _buildInfoCard(
// // //                 children: [
// // //                   _summaryRow(
// // //                     "Contacts Added",
// // //                     "$contactsAdded / 2",
// // //                     Icons.group_add_outlined,
// // //                     const Color(0xFF00897B),
// // //                   ),
// // //                   _summaryRow(
// // //                     "Profile Completion",
// // //                     "$profileCompletion%",
// // //                     Icons.pie_chart_outline,
// // //                     const Color(0xFF8E24AA),
// // //                   ),
// // //                   _summaryRow(
// // //                     "Total SOS",
// // //                     totalSOS.toString(),
// // //                     Icons.warning_amber_rounded,
// // //                     const Color(0xFFF57C00),
// // //                   ),
// // //                   _summaryRow(
// // //                     "Last SOS",
// // //                     formatDateTime(lastSOS?["createdAtLocal"]),
// // //                     Icons.history,
// // //                     const Color(0xFF3949AB),
// // //                   ),
// // //                 ],
// // //               ),

// // //               _buildSectionTitle("Account Information"),
// // //               _buildInfoCard(
// // //                 children: [
// // //                   _statusTile(
// // //                     "Email Verified",
// // //                     emailVerified,
// // //                     trueText: "Verified",
// // //                     falseText: "Not verified",
// // //                   ),
// // //                   _statusTile(
// // //                     "Mobile Verified",
// // //                     mobileVerified,
// // //                     trueText: "Verified",
// // //                     falseText: "Not verified",
// // //                   ),
// // //                   _statusTile(
// // //                     "Terms Accepted",
// // //                     termsAccepted,
// // //                     trueText: "Accepted",
// // //                     falseText: "Pending",
// // //                   ),
// // //                   _profileTile(
// // //                     "Account Type",
// // //                     accountType,
// // //                     Icons.verified_user_outlined,
// // //                   ),
// // //                   _profileTile(
// // //                     "Account Created",
// // //                     formatDateTime(user["termsAcceptedAt"]),
// // //                     Icons.calendar_today_outlined,
// // //                   ),
// // //                 ],
// // //               ),

// // //               const SizedBox(height: 22),

// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: ElevatedButton.icon(
// // //                   onPressed: () {
// // //                     // TODO: Navigate to edit profile page
// // //                   },
// // //                   icon: const Icon(Icons.edit_outlined),
// // //                   label: const Text("Edit Profile"),
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: const Color(0xFF6C63FF),
// // //                     foregroundColor: Colors.white,
// // //                     padding: const EdgeInsets.symmetric(vertical: 14),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(14),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: OutlinedButton.icon(
// // //                   onPressed: logout,
// // //                   icon: const Icon(Icons.logout),
// // //                   label: const Text("Logout"),
// // //                   style: OutlinedButton.styleFrom(
// // //                     foregroundColor: Colors.redAccent,
// // //                     side: const BorderSide(color: Colors.redAccent),
// // //                     padding: const EdgeInsets.symmetric(vertical: 14),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(14),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildHeaderCard({
// // //     required String name,
// // //     required String subtitle,
// // //     required String imageUrl,
// // //   }) {
// // //     final hasImage = imageUrl.isNotEmpty && imageUrl != "Not set";

// // //     return Container(
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.all(18),
// // //       decoration: BoxDecoration(
// // //         gradient: const LinearGradient(
// // //           colors: [Color(0xFF6C63FF), Color(0xFF8E85FF)],
// // //           begin: Alignment.topLeft,
// // //           end: Alignment.bottomRight,
// // //         ),
// // //         borderRadius: BorderRadius.circular(24),
// // //       ),
// // //       child: Row(
// // //         children: [
// // //           CircleAvatar(
// // //             radius: 34,
// // //             backgroundColor: Colors.white.withOpacity(0.22),
// // //             backgroundImage: hasImage ? NetworkImage(imageUrl) : null,
// // //             child: hasImage
// // //                 ? null
// // //                 : Text(
// // //                     getInitials(name),
// // //                     style: const TextStyle(
// // //                       fontSize: 22,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //           ),
// // //           const SizedBox(width: 14),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   "Hello ${name[0].toUpperCase()}${name.substring(1)} 👋",
// // //                   style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 22,
// // //                     fontWeight: FontWeight.w700,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 4),
// // //                 Text(
// // //                   subtitle,
// // //                   style: TextStyle(
// // //                     color: Colors.white.withOpacity(0.9),
// // //                     fontSize: 14,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSectionTitle(String title) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(top: 20, bottom: 10),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             title,
// // //             style: const TextStyle(
// // //               fontSize: 17,
// // //               fontWeight: FontWeight.w700,
// // //               color: Colors.black87,
// // //             ),
// // //           ),
// // //           const SizedBox(height: 8),
// // //           Container(
// // //             height: 1,
// // //             width: double.infinity,
// // //             color: Colors.grey.shade300,
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildAboutCard(Map<String, dynamic> user) {
// // //     final name = getDisplayValue(user["name"], fallback: "User");
// // //     final accountType = getDisplayValue(user["accountType"], fallback: "User");
// // //     final address = getDisplayValue(user["address"]);

// // //     return _buildInfoCard(
// // //       children: [
// // //         Text(
// // //           "$name is a MentalWell $accountType from $address.",
// // //           style: const TextStyle(
// // //             fontSize: 14.5,
// // //             color: Colors.black87,
// // //             height: 1.5,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildInfoCard({required List<Widget> children}) {
// // //     return Container(
// // //       width: double.infinity,
// // //       margin: const EdgeInsets.only(bottom: 2),
// // //       padding: const EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(18),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.04),
// // //             blurRadius: 10,
// // //             offset: const Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(children: children),
// // //     );
// // //   }

// // //   Widget _profileTile(String title, String value, IconData icon) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 9),
// // //       child: Row(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   title,
// // //                   style: TextStyle(
// // //                     fontSize: 12.5,
// // //                     color: Colors.grey.shade600,
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 3),
// // //                 Text(
// // //                   value,
// // //                   style: const TextStyle(
// // //                     fontSize: 14.5,
// // //                     color: Colors.black87,
// // //                     fontWeight: FontWeight.w500,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildContactCard({
// // //     required String title,
// // //     required String name,
// // //     required String number,
// // //     required IconData icon,
// // //     required Color color,
// // //     required VoidCallback onCall,
// // //   }) {
// // //     final canCall = number != "Not set";

// // //     return Container(
// // //       padding: const EdgeInsets.all(14),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(18),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.04),
// // //             blurRadius: 10,
// // //             offset: const Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           CircleAvatar(
// // //             radius: 24,
// // //             backgroundColor: color.withOpacity(0.12),
// // //             child: Icon(icon, color: color),
// // //           ),
// // //           const SizedBox(height: 10),
// // //           Text(
// // //             title,
// // //             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
// // //           ),
// // //           const SizedBox(height: 6),
// // //           Text(
// // //             name,
// // //             textAlign: TextAlign.center,
// // //             style: TextStyle(
// // //               fontSize: 13,
// // //               color: Colors.grey.shade700,
// // //               fontWeight: FontWeight.w500,
// // //             ),
// // //           ),
// // //           const SizedBox(height: 4),
// // //           Text(
// // //             number,
// // //             textAlign: TextAlign.center,
// // //             style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
// // //           ),
// // //           const SizedBox(height: 12),
// // //           SizedBox(
// // //             width: double.infinity,
// // //             child: ElevatedButton(
// // //               onPressed: canCall ? onCall : null,
// // //               style: ElevatedButton.styleFrom(
// // //                 backgroundColor: color,
// // //                 disabledBackgroundColor: Colors.grey.shade300,
// // //                 foregroundColor: Colors.white,
// // //                 elevation: 0,
// // //                 padding: const EdgeInsets.symmetric(vertical: 10),
// // //                 shape: RoundedRectangleBorder(
// // //                   borderRadius: BorderRadius.circular(12),
// // //                 ),
// // //               ),
// // //               child: Text(canCall ? "Call" : "Not Added"),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _summaryRow(String title, String value, IconData icon, Color color) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 9),
// // //       child: Row(
// // //         children: [
// // //           CircleAvatar(
// // //             radius: 18,
// // //             backgroundColor: color.withOpacity(0.12),
// // //             child: Icon(icon, color: color, size: 18),
// // //           ),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Text(
// // //               title,
// // //               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
// // //             ),
// // //           ),
// // //           Text(
// // //             value,
// // //             style: const TextStyle(
// // //               fontSize: 13.5,
// // //               color: Colors.black87,
// // //               fontWeight: FontWeight.w500,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _statusTile(
// // //     String title,
// // //     bool status, {
// // //     required String trueText,
// // //     required String falseText,
// // //   }) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 9),
// // //       child: Row(
// // //         children: [
// // //           Icon(
// // //             status ? Icons.check_circle : Icons.cancel,
// // //             color: status ? Colors.green : Colors.redAccent,
// // //             size: 20,
// // //           ),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Text(
// // //               title,
// // //               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
// // //             ),
// // //           ),
// // //           Text(
// // //             status ? trueText : falseText,
// // //             style: TextStyle(
// // //               fontSize: 13.5,
// // //               fontWeight: FontWeight.w600,
// // //               color: status ? Colors.green : Colors.redAccent,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // // TODO: replace with your actual login page import
// // // import 'login_page.dart';

// // class UserProfilePage extends StatefulWidget {
// //   const UserProfilePage({super.key});

// //   @override
// //   State<UserProfilePage> createState() => _UserProfilePageState();
// // }

// // class _UserProfilePageState extends State<UserProfilePage> {
// //   bool emailVerified = false;
// //   bool isAuthLoading = true;
// //   int totalSOS = 0;
// //   Map<String, dynamic>? lastSOS;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadAuthState();
// //     _listenToSOS();
// //   }

// //   Future<void> _loadAuthState() async {
// //     try {
// //       await FirebaseAuth.instance.currentUser?.reload();
// //       final refreshedUser = FirebaseAuth.instance.currentUser;

// //       if (!mounted) return;

// //       setState(() {
// //         emailVerified = refreshedUser?.emailVerified ?? false;
// //         isAuthLoading = false;
// //       });
// //     } catch (e) {
// //       debugPrint("Auth reload error: $e");
// //       if (!mounted) return;
// //       setState(() => isAuthLoading = false);
// //     }
// //   }

// //   void _listenToSOS() {
// //     final currentUser = FirebaseAuth.instance.currentUser;
// //     if (currentUser == null) return;

// //     FirebaseFirestore.instance
// //         .collection("sos_history")
// //         .where("userId", isEqualTo: currentUser.uid)
// //         .orderBy("createdAt", descending: true)
// //         .snapshots()
// //         .listen(
// //           (snapshot) {
// //             if (!mounted) return;

// //             setState(() {
// //               totalSOS = snapshot.docs.length;
// //               lastSOS = snapshot.docs.isNotEmpty
// //                   ? snapshot.docs.first.data()
// //                   : null;
// //             });
// //           },
// //           onError: (e) {
// //             debugPrint("SOS stream error: $e");
// //           },
// //         );
// //   }

// //   Future<void> callNumber(String? number) async {
// //     if (number == null || number.trim().isEmpty) return;

// //     final uri = Uri(scheme: "tel", path: number.trim());

// //     try {
// //       if (await canLaunchUrl(uri)) {
// //         await launchUrl(uri);
// //       }
// //     } catch (e) {
// //       debugPrint("Call error: $e");
// //     }
// //   }

// //   String formatDate(dynamic date) {
// //     if (date == null) return "Not set";

// //     try {
// //       if (date is Timestamp) {
// //         final d = date.toDate().toLocal();
// //         return "${d.day}/${d.month}/${d.year}";
// //       }

// //       if (date is DateTime) {
// //         final d = date.toLocal();
// //         return "${d.day}/${d.month}/${d.year}";
// //       }

// //       if (date is String) {
// //         if (date.trim().isEmpty) return "Not set";

// //         try {
// //           final d = DateTime.parse(date).toLocal();
// //           return "${d.day}/${d.month}/${d.year}";
// //         } catch (_) {
// //           return date;
// //         }
// //       }

// //       return "Not set";
// //     } catch (_) {
// //       return "Not set";
// //     }
// //   }

// //   String formatDateTime(dynamic date) {
// //     if (date == null) return "Not set";

// //     try {
// //       if (date is Timestamp) {
// //         final d = date.toDate().toLocal();
// //         return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
// //       }

// //       if (date is DateTime) {
// //         final d = date.toLocal();
// //         return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
// //       }

// //       if (date is String) {
// //         if (date.trim().isEmpty) return "Not set";

// //         try {
// //           final d = DateTime.parse(date).toLocal();
// //           return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
// //         } catch (_) {
// //           return date;
// //         }
// //       }

// //       return "Not set";
// //     } catch (_) {
// //       return "Not set";
// //     }
// //   }

// //   String getDisplayValue(dynamic value, {String fallback = "Not set"}) {
// //     if (value == null) return fallback;
// //     final text = value.toString().trim();
// //     if (text.isEmpty) return fallback;
// //     return text;
// //   }

// //   String getSafeGreetingName(String name) {
// //     final trimmed = name.trim();
// //     if (trimmed.isEmpty) return "User";

// //     return trimmed
// //         .split(" ")
// //         .map((word) {
// //           if (word.isEmpty) return "";
// //           return word[0].toUpperCase() + word.substring(1);
// //         })
// //         .join(" ");
// //   }

// //   String getInitials(String name) {
// //     final trimmed = name.trim();
// //     if (trimmed.isEmpty) return "U";

// //     final parts = trimmed.split(" ").where((e) => e.isNotEmpty).toList();
// //     if (parts.isEmpty) return "U";
// //     if (parts.length == 1) return parts.first[0].toUpperCase();

// //     return (parts[0][0] + parts[1][0]).toUpperCase();
// //   }

// //   int getContactsAdded(Map<String, dynamic> user) {
// //     int count = 0;

// //     final doctorName = getDisplayValue(user["doctorName"], fallback: "");
// //     final doctorNumber = getDisplayValue(user["doctorNumber"], fallback: "");
// //     final friendName = getDisplayValue(user["friendName"], fallback: "");
// //     final friendNumber = getDisplayValue(user["friendNumber"], fallback: "");

// //     if (doctorName.isNotEmpty && doctorNumber.isNotEmpty) count++;
// //     if (friendName.isNotEmpty && friendNumber.isNotEmpty) count++;

// //     return count;
// //   }

// //   int getProfileCompletion(Map<String, dynamic> user) {
// //     final fields = [
// //       user["name"],
// //       user["email"],
// //       user["mobile"],
// //       user["dob"],
// //       user["address"],
// //       user["doctorName"],
// //       user["doctorNumber"],
// //       user["friendName"],
// //       user["friendNumber"],
// //     ];

// //     final filled = fields.where((field) {
// //       if (field == null) return false;
// //       if (field is String) return field.trim().isNotEmpty;
// //       return true;
// //     }).length;

// //     return ((filled / fields.length) * 100).round();
// //   }

// //   String getEmergencyFrequency(int count) {
// //     if (count == 0) return "No emergencies";
// //     if (count < 3) return "Low";
// //     if (count < 6) return "Medium";
// //     return "High";
// //   }

// //   Future<void> logout() async {
// //     try {
// //       await FirebaseAuth.instance.signOut();

// //       if (!mounted) return;

// //       // Replace LoginPage with your actual login page
// //       // Navigator.pushAndRemoveUntil(
// //       //   context,
// //       //   MaterialPageRoute(builder: (_) => const LoginPage()),
// //       //   (route) => false,
// //       // );

// //       Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
// //     } catch (e) {
// //       debugPrint("Logout error: $e");
// //     }
// //   }

// //   void onEditProfile() {
// //     // TODO: navigate to your real edit page
// //     // Example:
// //     // Navigator.push(
// //     //   context,
// //     //   MaterialPageRoute(builder: (_) => const EditProfilePage()),
// //     // );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final currentUser = FirebaseAuth.instance.currentUser;

// //     if (currentUser == null) {
// //       return const Scaffold(body: Center(child: Text("User not logged in")));
// //     }

// //     return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
// //       stream: FirebaseFirestore.instance
// //           .collection("users")
// //           .doc(currentUser.uid)
// //           .snapshots(),
// //       builder: (context, userSnapshot) {
// //         if (userSnapshot.connectionState == ConnectionState.waiting ||
// //             isAuthLoading) {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         }

// //         if (userSnapshot.hasError) {
// //           return Scaffold(
// //             appBar: AppBar(title: const Text("User Profile")),
// //             body: Center(
// //               child: Text(
// //                 "Failed to load profile.\n${userSnapshot.error}",
// //                 textAlign: TextAlign.center,
// //               ),
// //             ),
// //           );
// //         }

// //         final user = userSnapshot.data?.data() ?? {};

// //         final name = getDisplayValue(user["name"], fallback: "User");
// //         final safeName = getSafeGreetingName(name);
// //         final email = getDisplayValue(user["email"]);
// //         final mobile = getDisplayValue(user["mobile"]);
// //         final dob = formatDate(user["dob"]);
// //         final address = getDisplayValue(user["address"]);
// //         final doctorName = getDisplayValue(user["doctorName"]);
// //         final doctorNumber = getDisplayValue(user["doctorNumber"]);
// //         final friendName = getDisplayValue(user["friendName"]);
// //         final friendNumber = getDisplayValue(user["friendNumber"]);
// //         final accountType = getDisplayValue(
// //           user["accountType"],
// //           fallback: "User",
// //         );
// //         final mobileVerified = user["mobileVerified"] == true;
// //         final accountCreated = formatDateTime(user["termsAcceptedAt"]);
// //         final contactsAdded = getContactsAdded(user);
// //         final profileCompletion = getProfileCompletion(user);

// //         return Scaffold(
// //           backgroundColor: const Color(0xFFF6F7FB),
// //           appBar: AppBar(
// //             elevation: 0,
// //             backgroundColor: Colors.white,
// //             foregroundColor: Colors.black87,
// //             title: const Text(
// //               "User Profile",
// //               style: TextStyle(fontWeight: FontWeight.w700),
// //             ),
// //           ),
// //           body: RefreshIndicator(
// //             onRefresh: _loadAuthState,
// //             child: SingleChildScrollView(
// //               physics: const AlwaysScrollableScrollPhysics(),
// //               padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   _buildHeaderCard(
// //                     name: safeName,
// //                     subtitle: "MentalWell Member",
// //                   ),
// //                   const SizedBox(height: 18),

// //                   _buildSectionTitle("Personal Information"),
// //                   _buildInfoCard(
// //                     children: [
// //                       _profileTile("Name", safeName, Icons.person_outline),
// //                       _profileTile("Email", email, Icons.email_outlined),
// //                       _profileTile("Phone", mobile, Icons.call_outlined),
// //                       _profileTile("DOB", dob, Icons.cake_outlined),
// //                       _profileTile(
// //                         "Address",
// //                         address,
// //                         Icons.location_on_outlined,
// //                       ),
// //                     ],
// //                   ),

// //                   _buildSectionTitle("Emergency Support Network"),
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: _buildContactCard(
// //                           title: "Doctor",
// //                           name: doctorName,
// //                           number: doctorNumber,
// //                           icon: Icons.local_hospital_outlined,
// //                           color: const Color(0xFFEF5350),
// //                           onCall: () => callNumber(
// //                             doctorNumber == "Not set" ? null : doctorNumber,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 12),
// //                       Expanded(
// //                         child: _buildContactCard(
// //                           title: "Friend",
// //                           name: friendName,
// //                           number: friendNumber,
// //                           icon: Icons.people_outline,
// //                           color: const Color(0xFF5C6BC0),
// //                           onCall: () => callNumber(
// //                             friendNumber == "Not set" ? null : friendNumber,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),

// //                   _buildSectionTitle("Safety Summary"),
// //                   _buildInfoCard(
// //                     children: [
// //                       _summaryRow(
// //                         "Contacts Added",
// //                         "$contactsAdded / 2",
// //                         Icons.group_add_outlined,
// //                         const Color(0xFF00897B),
// //                       ),
// //                       _summaryRow(
// //                         "Profile Completion",
// //                         "$profileCompletion%",
// //                         Icons.pie_chart_outline,
// //                         const Color(0xFF8E24AA),
// //                       ),
// //                       _summaryRow(
// //                         "Total SOS",
// //                         totalSOS.toString(),
// //                         Icons.warning_amber_rounded,
// //                         const Color(0xFFF57C00),
// //                       ),
// //                       _summaryRow(
// //                         "Emergency Frequency",
// //                         getEmergencyFrequency(totalSOS),
// //                         Icons.shield_outlined,
// //                         const Color(0xFF3949AB),
// //                       ),
// //                       _summaryRow(
// //                         "Last SOS",
// //                         lastSOS == null
// //                             ? "No SOS yet"
// //                             : formatDateTime(
// //                                 lastSOS?["createdAtLocal"] ??
// //                                     lastSOS?["createdAt"],
// //                               ),
// //                         Icons.history,
// //                         const Color(0xFF00838F),
// //                       ),
// //                     ],
// //                   ),

// //                   _buildSectionTitle("Account Information"),
// //                   _buildInfoCard(
// //                     children: [
// //                       _statusTile(
// //                         "Email Verified",
// //                         emailVerified,
// //                         trueText: "Verified",
// //                         falseText: "Not verified",
// //                       ),
// //                       _statusTile(
// //                         "Mobile Verified",
// //                         mobileVerified,
// //                         trueText: "Verified",
// //                         falseText: "Not verified",
// //                       ),
// //                       _profileTile(
// //                         "Account Type",
// //                         accountType,
// //                         Icons.verified_user_outlined,
// //                       ),
// //                       _profileTile(
// //                         "Account Created",
// //                         accountCreated,
// //                         Icons.calendar_today_outlined,
// //                       ),
// //                     ],
// //                   ),

// //                   const SizedBox(height: 22),

// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton.icon(
// //                       onPressed: onEditProfile,
// //                       icon: const Icon(Icons.edit_outlined),
// //                       label: const Text("Edit Profile"),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFF6C63FF),
// //                         foregroundColor: Colors.white,
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(14),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: OutlinedButton.icon(
// //                       onPressed: logout,
// //                       icon: const Icon(Icons.logout),
// //                       label: const Text("Logout"),
// //                       style: OutlinedButton.styleFrom(
// //                         foregroundColor: Colors.redAccent,
// //                         side: const BorderSide(color: Colors.redAccent),
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(14),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildHeaderCard({required String name, required String subtitle}) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(18),
// //       decoration: BoxDecoration(
// //         gradient: const LinearGradient(
// //           colors: [Color(0xFF6C63FF), Color(0xFF8E85FF)],
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),
// //         borderRadius: BorderRadius.circular(24),
// //       ),
// //       child: Row(
// //         children: [
// //           CircleAvatar(
// //             radius: 34,
// //             backgroundColor: Colors.white.withOpacity(0.22),
// //             child: Text(
// //               getInitials(name),
// //               style: const TextStyle(
// //                 fontSize: 22,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 14),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   "Hello $name 👋",
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 22,
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Text(
// //                   subtitle,
// //                   style: TextStyle(
// //                     color: Colors.white.withOpacity(0.9),
// //                     fontSize: 14,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 20, bottom: 10),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(
// //               fontSize: 17,
// //               fontWeight: FontWeight.w700,
// //               color: Colors.black87,
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Container(
// //             height: 1,
// //             width: double.infinity,
// //             color: Colors.grey.shade300,
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildInfoCard({required List<Widget> children}) {
// //     return Container(
// //       width: double.infinity,
// //       margin: const EdgeInsets.only(bottom: 2),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(18),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.04),
// //             blurRadius: 10,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(children: children),
// //     );
// //   }

// //   Widget _profileTile(String title, String value, IconData icon) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 9),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: TextStyle(
// //                     fontSize: 12.5,
// //                     color: Colors.grey.shade600,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 3),
// //                 Text(
// //                   value,
// //                   style: const TextStyle(
// //                     fontSize: 14.5,
// //                     color: Colors.black87,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildContactCard({
// //     required String title,
// //     required String name,
// //     required String number,
// //     required IconData icon,
// //     required Color color,
// //     required VoidCallback onCall,
// //   }) {
// //     final canCall = number != "Not set";

// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(18),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.04),
// //             blurRadius: 10,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           CircleAvatar(
// //             radius: 24,
// //             backgroundColor: color.withOpacity(0.12),
// //             child: Icon(icon, color: color),
// //           ),
// //           const SizedBox(height: 10),
// //           Text(
// //             title,
// //             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
// //           ),
// //           const SizedBox(height: 6),
// //           Text(
// //             name,
// //             textAlign: TextAlign.center,
// //             style: TextStyle(
// //               fontSize: 13,
// //               color: Colors.grey.shade700,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             number,
// //             textAlign: TextAlign.center,
// //             style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
// //           ),
// //           const SizedBox(height: 12),
// //           SizedBox(
// //             width: double.infinity,
// //             child: ElevatedButton(
// //               onPressed: canCall ? onCall : null,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: color,
// //                 disabledBackgroundColor: Colors.grey.shade300,
// //                 foregroundColor: Colors.white,
// //                 elevation: 0,
// //                 padding: const EdgeInsets.symmetric(vertical: 10),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //               ),
// //               child: Text(canCall ? "Call" : "Not Added"),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _summaryRow(String title, String value, IconData icon, Color color) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 9),
// //       child: Row(
// //         children: [
// //           CircleAvatar(
// //             radius: 18,
// //             backgroundColor: color.withOpacity(0.12),
// //             child: Icon(icon, color: color, size: 18),
// //           ),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Text(
// //               title,
// //               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
// //             ),
// //           ),
// //           Flexible(
// //             child: Text(
// //               value,
// //               textAlign: TextAlign.end,
// //               style: const TextStyle(
// //                 fontSize: 13.5,
// //                 color: Colors.black87,
// //                 fontWeight: FontWeight.w500,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _statusTile(
// //     String title,
// //     bool status, {
// //     required String trueText,
// //     required String falseText,
// //   }) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 9),
// //       child: Row(
// //         children: [
// //           Icon(
// //             status ? Icons.check_circle : Icons.cancel,
// //             color: status ? Colors.green : Colors.redAccent,
// //             size: 20,
// //           ),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Text(
// //               title,
// //               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
// //             ),
// //           ),
// //           Text(
// //             status ? trueText : falseText,
// //             style: TextStyle(
// //               fontSize: 13.5,
// //               fontWeight: FontWeight.w600,
// //               color: status ? Colors.green : Colors.redAccent,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// // TODO: replace with your actual login page import
// // import 'login_page.dart';

// class UserProfilePage extends StatefulWidget {
//   const UserProfilePage({super.key});

//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   bool emailVerified = false;
//   bool isAuthLoading = true;
//   Map<String, dynamic>? lastSOS;

//   @override
//   void initState() {
//     super.initState();
//     _loadAuthState();
//     _listenToLastSOS();
//   }

//   Future<void> _loadAuthState() async {
//     try {
//       await FirebaseAuth.instance.currentUser?.reload();
//       final refreshedUser = FirebaseAuth.instance.currentUser;

//       if (!mounted) return;

//       setState(() {
//         emailVerified = refreshedUser?.emailVerified ?? false;
//         isAuthLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Auth reload error: $e");
//       if (!mounted) return;
//       setState(() => isAuthLoading = false);
//     }
//   }

//   void _listenToLastSOS() {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) return;

//     FirebaseFirestore.instance
//         .collection("sos_history")
//         .where("userId", isEqualTo: currentUser.uid)
//         .orderBy("createdAt", descending: true)
//         .limit(1)
//         .snapshots()
//         .listen(
//           (snapshot) {
//             if (!mounted) return;

//             setState(() {
//               lastSOS = snapshot.docs.isNotEmpty
//                   ? snapshot.docs.first.data()
//                   : null;
//             });
//           },
//           onError: (e) {
//             debugPrint("SOS stream error: $e");
//           },
//         );
//   }

//   Future<void> callNumber(String? number) async {
//     if (number == null || number.trim().isEmpty) return;

//     final uri = Uri(scheme: "tel", path: number.trim());

//     try {
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri);
//       }
//     } catch (e) {
//       debugPrint("Call error: $e");
//     }
//   }

//   String formatDate(dynamic date) {
//     if (date == null) return "Not set";

//     try {
//       if (date is Timestamp) {
//         final d = date.toDate().toLocal();
//         return "${d.day}/${d.month}/${d.year}";
//       }

//       if (date is DateTime) {
//         final d = date.toLocal();
//         return "${d.day}/${d.month}/${d.year}";
//       }

//       if (date is String) {
//         if (date.trim().isEmpty) return "Not set";

//         try {
//           final d = DateTime.parse(date).toLocal();
//           return "${d.day}/${d.month}/${d.year}";
//         } catch (_) {
//           return date;
//         }
//       }

//       return "Not set";
//     } catch (_) {
//       return "Not set";
//     }
//   }

//   String formatDateTime(dynamic date) {
//     if (date == null) return "Not set";

//     try {
//       if (date is Timestamp) {
//         final d = date.toDate().toLocal();
//         return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
//       }

//       if (date is DateTime) {
//         final d = date.toLocal();
//         return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
//       }

//       if (date is String) {
//         if (date.trim().isEmpty) return "Not set";

//         try {
//           final d = DateTime.parse(date).toLocal();
//           return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
//         } catch (_) {
//           return date;
//         }
//       }

//       return "Not set";
//     } catch (_) {
//       return "Not set";
//     }
//   }

//   String getDisplayValue(dynamic value, {String fallback = "Not set"}) {
//     if (value == null) return fallback;
//     final text = value.toString().trim();
//     if (text.isEmpty) return fallback;
//     return text;
//   }

//   String getSafeGreetingName(String name) {
//     final trimmed = name.trim();
//     if (trimmed.isEmpty) return "User";

//     return trimmed
//         .split(" ")
//         .map((word) {
//           if (word.isEmpty) return "";
//           return word[0].toUpperCase() + word.substring(1);
//         })
//         .join(" ");
//   }

//   String getInitials(String name) {
//     final trimmed = name.trim();
//     if (trimmed.isEmpty) return "U";

//     final parts = trimmed.split(" ").where((e) => e.isNotEmpty).toList();
//     if (parts.isEmpty) return "U";
//     if (parts.length == 1) return parts.first[0].toUpperCase();

//     return (parts[0][0] + parts[1][0]).toUpperCase();
//   }

//   int getContactsAdded(Map<String, dynamic> user) {
//     int count = 0;

//     final doctorName = getDisplayValue(user["doctorName"], fallback: "");
//     final doctorNumber = getDisplayValue(user["doctorNumber"], fallback: "");
//     final friendName = getDisplayValue(user["friendName"], fallback: "");
//     final friendNumber = getDisplayValue(user["friendNumber"], fallback: "");

//     if (doctorName.isNotEmpty && doctorNumber.isNotEmpty) count++;
//     if (friendName.isNotEmpty && friendNumber.isNotEmpty) count++;

//     return count;
//   }

//   int getProfileCompletion(Map<String, dynamic> user) {
//     final fields = [
//       user["name"],
//       user["email"],
//       user["mobile"],
//       user["dob"],
//       user["address"],
//       user["doctorName"],
//       user["doctorNumber"],
//       user["friendName"],
//       user["friendNumber"],
//     ];

//     final filled = fields.where((field) {
//       if (field == null) return false;
//       if (field is String) return field.trim().isNotEmpty;
//       return true;
//     }).length;

//     return ((filled / fields.length) * 100).round();
//   }

//   Future<void> logout() async {
//     try {
//       await FirebaseAuth.instance.signOut();

//       if (!mounted) return;

//       Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
//     } catch (e) {
//       debugPrint("Logout error: $e");
//     }
//   }

//   void onEditProfile() {
//     // TODO: navigate to your real edit page
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       return const Scaffold(body: Center(child: Text("User not logged in")));
//     }

//     return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance
//           .collection("users")
//           .doc(currentUser.uid)
//           .snapshots(),
//       builder: (context, userSnapshot) {
//         if (userSnapshot.connectionState == ConnectionState.waiting ||
//             isAuthLoading) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (userSnapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(title: const Text("User Profile")),
//             body: Center(
//               child: Text(
//                 "Failed to load profile.\n${userSnapshot.error}",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         }

//         final user = userSnapshot.data?.data() ?? {};

//         final name = getDisplayValue(user["name"], fallback: "User");
//         final safeName = getSafeGreetingName(name);
//         final email = getDisplayValue(user["email"]);
//         final mobile = getDisplayValue(user["mobile"]);
//         final dob = formatDate(user["dob"]);
//         final address = getDisplayValue(user["address"]);
//         final doctorName = getDisplayValue(user["doctorName"]);
//         final doctorNumber = getDisplayValue(user["doctorNumber"]);
//         final friendName = getDisplayValue(user["friendName"]);
//         final friendNumber = getDisplayValue(user["friendNumber"]);
//         final mobileVerified = user["mobileVerified"] == true;
//         final accountCreated = formatDateTime(user["termsAcceptedAt"]);
//         final contactsAdded = getContactsAdded(user);
//         final profileCompletion = getProfileCompletion(user);

//         return Scaffold(
//           backgroundColor: const Color(0xFFF4F6FB),
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: const Color(0xFFF4F6FB),
//             foregroundColor: Colors.black87,
//             centerTitle: true,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new_rounded),
//               onPressed: () => Navigator.pop(context),
//             ),
//             title: const Text(
//               "Profile",
//               style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
//             ),
//           ),
//           body: RefreshIndicator(
//             onRefresh: _loadAuthState,
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildHeaderCard(
//                     name: safeName,
//                     subtitle: "MentalWell Member",
//                   ),
//                   const SizedBox(height: 22),

//                   _buildSectionTitle("Personal Information"),
//                   _buildMainCard(
//                     children: [
//                       _profileTile(
//                         "Name",
//                         safeName,
//                         Icons.person_outline_rounded,
//                       ),
//                       _profileTile("Email", email, Icons.mail_outline_rounded),
//                       _profileTile("Phone", mobile, Icons.call_outlined),
//                       _profileTile("Date of Birth", dob, Icons.cake_outlined),
//                       _profileTile(
//                         "Address",
//                         address,
//                         Icons.location_on_outlined,
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   _buildSectionTitle("Emergency Support Network"),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildContactCard(
//                           title: "Doctor",
//                           name: doctorName,
//                           number: doctorNumber,
//                           icon: Icons.local_hospital_outlined,
//                           topColor: const Color(0xFFFF6B6B),
//                           onCall: () => callNumber(
//                             doctorNumber == "Not set" ? null : doctorNumber,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: _buildContactCard(
//                           title: "Friend",
//                           name: friendName,
//                           number: friendNumber,
//                           icon: Icons.favorite_border_rounded,
//                           topColor: const Color(0xFF5B8DEF),
//                           onCall: () => callNumber(
//                             friendNumber == "Not set" ? null : friendNumber,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   _buildSectionTitle("Safety Summary"),
//                   _buildMainCard(
//                     children: [
//                       _summaryRow(
//                         "Contacts Added",
//                         "$contactsAdded / 2",
//                         Icons.people_outline_rounded,
//                         const Color(0xFF00A389),
//                       ),
//                       _summaryRow(
//                         "Profile Completion",
//                         "$profileCompletion%",
//                         Icons.donut_small_rounded,
//                         const Color(0xFF7E57C2),
//                       ),
//                       _summaryRow(
//                         "Last SOS",
//                         lastSOS == null
//                             ? "No SOS yet"
//                             : formatDateTime(
//                                 lastSOS?["createdAtLocal"] ??
//                                     lastSOS?["createdAt"],
//                               ),
//                         Icons.history_toggle_off_rounded,
//                         const Color(0xFFFF9800),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   _buildSectionTitle("Account Information"),
//                   _buildMainCard(
//                     children: [
//                       _statusTile(
//                         "Email Verified",
//                         emailVerified,
//                         trueText: "Verified",
//                         falseText: "Not verified",
//                       ),
//                       _statusTile(
//                         "Mobile Verified",
//                         mobileVerified,
//                         trueText: "Verified",
//                         falseText: "Not verified",
//                       ),
//                       _profileTile(
//                         "Account Created",
//                         accountCreated,
//                         Icons.calendar_month_outlined,
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 28),

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       onPressed: onEditProfile,
//                       icon: const Icon(Icons.edit_outlined),
//                       label: const Text("Edit Profile"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF6C63FF),
//                         foregroundColor: Colors.white,
//                         elevation: 0,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         textStyle: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton.icon(
//                       onPressed: logout,
//                       icon: const Icon(Icons.logout_rounded),
//                       label: const Text("Logout"),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: const Color(0xFFE53935),
//                         side: const BorderSide(color: Color(0xFFFFCDD2)),
//                         backgroundColor: Colors.white,
//                         elevation: 0,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         textStyle: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeaderCard({required String name, required String subtitle}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF6C63FF), Color(0xFF8E85FF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF6C63FF).withOpacity(0.22),
//             blurRadius: 22,
//             offset: const Offset(0, 12),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 68,
//             width: 68,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.18),
//               borderRadius: BorderRadius.circular(22),
//               border: Border.all(color: Colors.white.withOpacity(0.25)),
//             ),
//             child: Center(
//               child: Text(
//                 getInitials(name),
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hello, $name 👋",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.92),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 2, bottom: 10),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.w800,
//           color: Color(0xFF1E2432),
//         ),
//       ),
//     );
//   }

//   Widget _buildMainCard({required List<Widget> children}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.045),
//             blurRadius: 18,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(children: children),
//     );
//   }

//   Widget _profileTile(String title, String value, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 38,
//             width: 38,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF1F3FF),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 12.5,
//                     color: Colors.grey.shade600,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     color: Color(0xFF1E2432),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactCard({
//     required String title,
//     required String name,
//     required String number,
//     required IconData icon,
//     required Color topColor,
//     required VoidCallback onCall,
//   }) {
//     final canCall = number != "Not set";

//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.045),
//             blurRadius: 18,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 52,
//             width: 52,
//             decoration: BoxDecoration(
//               color: topColor.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Icon(icon, color: topColor, size: 26),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 15.5,
//               fontWeight: FontWeight.w800,
//               color: Color(0xFF1E2432),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             name,
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 13.5,
//               color: Colors.grey.shade800,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             number,
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
//           ),
//           const SizedBox(height: 14),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton.icon(
//               onPressed: canCall ? onCall : null,
//               icon: const Icon(Icons.call_outlined, size: 18),
//               label: Text(canCall ? "Call Now" : "Not Added"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: topColor,
//                 disabledBackgroundColor: Colors.grey.shade300,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 padding: const EdgeInsets.symmetric(vertical: 11),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 textStyle: const TextStyle(
//                   fontSize: 13.5,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _summaryRow(String title, String value, IconData icon, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             height: 38,
//             width: 38,
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: color, size: 20),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14.5,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF1E2432),
//               ),
//             ),
//           ),
//           Flexible(
//             child: Text(
//               value,
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 fontSize: 13.5,
//                 color: Colors.grey.shade700,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _statusTile(
//     String title,
//     bool status, {
//     required String trueText,
//     required String falseText,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             height: 38,
//             width: 38,
//             decoration: BoxDecoration(
//               color: status
//                   ? Colors.green.withOpacity(0.12)
//                   : Colors.redAccent.withOpacity(0.12),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(
//               status ? Icons.check_circle : Icons.cancel_outlined,
//               color: status ? Colors.green : Colors.redAccent,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14.5,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF1E2432),
//               ),
//             ),
//           ),
//           Text(
//             status ? trueText : falseText,
//             style: TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w700,
//               color: status ? Colors.green : Colors.redAccent,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/LoginPage.dart';
import 'package:mentalwellapp/view/logoutbutton.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool emailVerified = false;
  bool isAuthLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      setState(() {
        emailVerified = refreshedUser?.emailVerified ?? false;
        isAuthLoading = false;
      });
    } catch (e) {
      debugPrint("Auth reload error: $e");
      if (!mounted) return;
      setState(() => isAuthLoading = false);
    }
  }

  Future<void> callNumber(String? number) async {
    if (number == null || number.trim().isEmpty) return;

    final uri = Uri(scheme: "tel", path: number.trim());

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint("Call error: $e");
    }
  }

  String formatDate(dynamic date) {
    if (date == null) return "Not set";

    try {
      if (date is Timestamp) {
        final d = date.toDate().toLocal();
        return "${d.day}/${d.month}/${d.year}";
      }

      if (date is DateTime) {
        final d = date.toLocal();
        return "${d.day}/${d.month}/${d.year}";
      }

      if (date is String) {
        if (date.trim().isEmpty) return "Not set";

        try {
          final d = DateTime.parse(date).toLocal();
          return "${d.day}/${d.month}/${d.year}";
        } catch (_) {
          return date;
        }
      }

      return "Not set";
    } catch (_) {
      return "Not set";
    }
  }

  String formatDateTime(dynamic date) {
    if (date == null) return "Not set";

    try {
      if (date is Timestamp) {
        final d = date.toDate().toLocal();
        return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
      }

      if (date is DateTime) {
        final d = date.toLocal();
        return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
      }

      if (date is String) {
        if (date.trim().isEmpty) return "Not set";

        try {
          final d = DateTime.parse(date).toLocal();
          return "${d.day}/${d.month}/${d.year}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
        } catch (_) {
          return date;
        }
      }

      return "Not set";
    } catch (_) {
      return "Not set";
    }
  }

  String getDisplayValue(dynamic value, {String fallback = "Not set"}) {
    if (value == null) return fallback;
    final text = value.toString().trim();
    if (text.isEmpty) return fallback;
    return text;
  }

  String getSafeGreetingName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return "User";

    return trimmed
        .split(" ")
        .map((word) {
          if (word.isEmpty) return "";
          return word[0].toUpperCase() + word.substring(1);
        })
        .join(" ");
  }

  String getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return "U";

    final parts = trimmed.split(" ").where((e) => e.isNotEmpty).toList();
    if (parts.isEmpty) return "U";
    if (parts.length == 1) return parts.first[0].toUpperCase();

    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  int getContactsAdded(Map<String, dynamic> user) {
    int count = 0;

    final doctorName = getDisplayValue(user["doctorName"], fallback: "");
    final doctorNumber = getDisplayValue(user["doctorNumber"], fallback: "");
    final friendName = getDisplayValue(user["friendName"], fallback: "");
    final friendNumber = getDisplayValue(user["friendNumber"], fallback: "");

    if (doctorName.isNotEmpty && doctorNumber.isNotEmpty) count++;
    if (friendName.isNotEmpty && friendNumber.isNotEmpty) count++;

    return count;
  }

  int getProfileCompletion(Map<String, dynamic> user) {
    final fields = [
      user["name"],
      user["email"],
      user["mobile"],
      user["dob"],
      user["address"],
      user["doctorName"],
      user["doctorNumber"],
      user["friendName"],
      user["friendNumber"],
    ];

    final filled = fields.where((field) {
      if (field == null) return false;
      if (field is String) return field.trim().isNotEmpty;
      return true;
    }).length;

    return ((filled / fields.length) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Scaffold(body: Center(child: Text("User not logged in")));
    }

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .snapshots(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting ||
            isAuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (userSnapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text("Profile")),
            body: Center(
              child: Text(
                "Failed to load profile.\n${userSnapshot.error}",
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final user = userSnapshot.data?.data() ?? {};

        final name = getDisplayValue(user["name"], fallback: "User");
        final safeName = getSafeGreetingName(name);
        final email = getDisplayValue(user["email"]);
        final mobile = getDisplayValue(user["mobile"]);
        final dob = formatDate(user["dob"]);
        final address = getDisplayValue(user["address"]);
        final doctorName = getDisplayValue(user["doctorName"]);
        final doctorNumber = getDisplayValue(user["doctorNumber"]);
        final friendName = getDisplayValue(user["friendName"]);
        final friendNumber = getDisplayValue(user["friendNumber"]);
        final mobileVerified = user["mobileVerified"] == true;
        final accountCreated = formatDateTime(user["termsAcceptedAt"]);
        final contactsAdded = getContactsAdded(user);
        final profileCompletion = getProfileCompletion(user);

        return Scaffold(
          backgroundColor: const Color(0xFFF4F6FB),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFF4F6FB),
            foregroundColor: Colors.black87,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _loadAuthState,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderCard(
                    name: safeName,
                    subtitle: "MentalWell Member",
                  ),
                  const SizedBox(height: 22),

                  _buildSectionTitle("Personal Information"),
                  _buildMainCard(
                    children: [
                      _profileTile(
                        "Name",
                        safeName,
                        Icons.person_outline_rounded,
                      ),
                      _profileTile("Email", email, Icons.mail_outline_rounded),
                      _profileTile("Phone", mobile, Icons.call_outlined),
                      _profileTile("Date of Birth", dob, Icons.cake_outlined),
                      _profileTile(
                        "Address",
                        address,
                        Icons.location_on_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _buildSectionTitle("Emergency Support Network"),
                  Row(
                    children: [
                      Expanded(
                        child: _buildContactCard(
                          title: "Doctor",
                          name: doctorName,
                          number: doctorNumber,
                          icon: Icons.local_hospital_outlined,
                          topColor: const Color(0xFFFF6B6B),
                          onCall: () => callNumber(
                            doctorNumber == "Not set" ? null : doctorNumber,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildContactCard(
                          title: "Friend",
                          name: friendName,
                          number: friendNumber,
                          icon: Icons.favorite_border_rounded,
                          topColor: const Color(0xFF5B8DEF),
                          onCall: () => callNumber(
                            friendNumber == "Not set" ? null : friendNumber,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _buildSectionTitle("Safety Summary"),
                  _buildMainCard(
                    children: [
                      _summaryRow(
                        "Contacts Added",
                        "$contactsAdded / 2",
                        Icons.people_outline_rounded,
                        const Color(0xFF00A389),
                      ),
                      _summaryRow(
                        "Profile Completion",
                        "$profileCompletion%",
                        Icons.donut_small_rounded,
                        const Color(0xFF7E57C2),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _buildSectionTitle("Account Information"),
                  _buildMainCard(
                    children: [
                      _statusTile(
                        "Email Verified",
                        emailVerified,
                        trueText: "Verified",
                        falseText: "Not verified",
                      ),
                      _statusTile(
                        "Mobile Verified",
                        mobileVerified,
                        trueText: "Verified",
                        falseText: "Not verified",
                      ),
                      _profileTile(
                        "Account Created",
                        accountCreated,
                        Icons.calendar_month_outlined,
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await handleLogout(context);
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text("Logout"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFE53935),
                        side: const BorderSide(color: Color(0xFFFFCDD2)),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderCard({required String name, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8E85FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.22),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: Center(
              child: Text(
                getInitials(name),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, $name 👋",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.92),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1E2432),
        ),
      ),
    );
  }

  Widget _buildMainCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _profileTile(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1E2432),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required String title,
    required String name,
    required String number,
    required IconData icon,
    required Color topColor,
    required VoidCallback onCall,
  }) {
    final canCall = number != "Not set";

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: topColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: topColor, size: 26),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E2432),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            number,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canCall ? onCall : null,
              icon: const Icon(Icons.call_outlined, size: 18),
              label: Text(canCall ? "Call Now" : "Not Added"),
              style: ElevatedButton.styleFrom(
                backgroundColor: topColor,
                disabledBackgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E2432),
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusTile(
    String title,
    bool status, {
    required String trueText,
    required String falseText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: status
                  ? Colors.green.withOpacity(0.12)
                  : Colors.redAccent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              status ? Icons.check_circle : Icons.cancel_outlined,
              color: status ? Colors.green : Colors.redAccent,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E2432),
              ),
            ),
          ),
          Text(
            status ? trueText : falseText,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: status ? Colors.green : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
