// // // // // // import 'package:flutter/material.dart';

// // // // // // class DashboardPage extends StatefulWidget {
// // // // // //   const DashboardPage({super.key, required String username});

// // // // // //   @override
// // // // // //   State<DashboardPage> createState() => _DashboardPageState();
// // // // // // }

// // // // // // class _DashboardPageState extends State<DashboardPage> {
// // // // // //   bool animateCharts = false;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // //       setState(() {
// // // // // //         animateCharts = true;
// // // // // //       });
// // // // // //     });
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final width = MediaQuery.of(context).size.width;
// // // // // //     final isWide = width > 500;

// // // // // //     final cards = [
// // // // // //       const _DashboardCard(
// // // // // //         title: "Total Users",
// // // // // //         value: "1200",
// // // // // //         icon: Icons.people,
// // // // // //       ),
// // // // // //       const _DashboardCard(
// // // // // //         title: "Active Today",
// // // // // //         value: "350",
// // // // // //         icon: Icons.bolt,
// // // // // //       ),
// // // // // //       const _DashboardCard(title: "SOS Requests", value: "5", icon: Icons.sos),
// // // // // //       const _DashboardCard(
// // // // // //         title: "Experts Online",
// // // // // //         value: "12",
// // // // // //         icon: Icons.medical_information,
// // // // // //       ),
// // // // // //     ];

// // // // // //     return Scaffold(
// // // // // //       drawer: Drawer(
// // // // // //         child: ListView(
// // // // // //           padding: EdgeInsets.zero,
// // // // // //           children: [
// // // // // //             const DrawerHeader(
// // // // // //               decoration: BoxDecoration(color: Colors.indigo),
// // // // // //               child: Text(
// // // // // //                 "Menu",
// // // // // //                 style: TextStyle(color: Colors.white, fontSize: 24),
// // // // // //               ),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               leading: const Icon(Icons.logout),
// // // // // //               title: const Text("Logout"),
// // // // // //               onTap: () {
// // // // // //                 Navigator.pop(context);
// // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                   const SnackBar(content: Text("Logged out successfully!")),
// // // // // //                 );
// // // // // //               },
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //       body: SingleChildScrollView(
// // // // // //         padding: const EdgeInsets.all(16),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               "Dashboard Overview",
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: width < 500 ? 18 : 24,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 16),

// // // // // //             // ---------------- Dashboard Cards: 2 per row (square) ----------------
// // // // // //             GridView.count(
// // // // // //               crossAxisCount: 2,
// // // // // //               shrinkWrap: true,
// // // // // //               physics: const NeverScrollableScrollPhysics(),
// // // // // //               crossAxisSpacing: 12,
// // // // // //               mainAxisSpacing: 12,
// // // // // //               childAspectRatio: 1, // square shape
// // // // // //               children: cards,
// // // // // //             ),

// // // // // //             const SizedBox(height: 30),

// // // // // //             // User Growth Chart
// // // // // //             Text(
// // // // // //               "User Growth",
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 8),
// // // // // //             Container(
// // // // // //               height: 220,
// // // // // //               padding: const EdgeInsets.all(12),
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: Colors.indigo[50],
// // // // // //                 borderRadius: BorderRadius.circular(12),
// // // // // //               ),
// // // // // //               child: Column(
// // // // // //                 children: [
// // // // // //                   Expanded(
// // // // // //                     child: Row(
// // // // // //                       crossAxisAlignment: CrossAxisAlignment.end,
// // // // // //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // //                       children: [
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 0.1 : 0,
// // // // // //                           label: "Jan",
// // // // // //                           color: Colors.blue,
// // // // // //                         ),
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 0.2 : 0,
// // // // // //                           label: "Feb",
// // // // // //                           color: Colors.green,
// // // // // //                         ),
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 0.4 : 0,
// // // // // //                           label: "Mar",
// // // // // //                           color: Colors.orange,
// // // // // //                         ),
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 0.6 : 0,
// // // // // //                           label: "Apr",
// // // // // //                           color: Colors.red,
// // // // // //                         ),
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 0.8 : 0,
// // // // // //                           label: "May",
// // // // // //                           color: Colors.purple,
// // // // // //                         ),
// // // // // //                         AnimatedBar(
// // // // // //                           heightFactor: animateCharts ? 1.0 : 0,
// // // // // //                           label: "Jun",
// // // // // //                           color: Colors.teal,
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 10),
// // // // // //                   const Text(
// // // // // //                     "Monthly User Growth",
// // // // // //                     style: TextStyle(fontSize: 14),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Mood Distribution
// // // // // //             Text(
// // // // // //               "Mood Distribution",
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 8),
// // // // // //             isWide
// // // // // //                 ? Row(
// // // // // //                     children: [
// // // // // //                       Expanded(child: _buildPieChart()),
// // // // // //                       const SizedBox(width: 16),
// // // // // //                       Expanded(child: _buildPieLegend()),
// // // // // //                     ],
// // // // // //                   )
// // // // // //                 : Column(
// // // // // //                     children: [
// // // // // //                       _buildPieChart(),
// // // // // //                       const SizedBox(height: 16),
// // // // // //                       _buildPieLegend(),
// // // // // //                     ],
// // // // // //                   ),

// // // // // //             const SizedBox(height: 30),

// // // // // //             // Quick Actions
// // // // // //             Text(
// // // // // //               "Quick Actions & Tips",
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: width < 500 ? 16 : 22,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 12),
// // // // // //             Container(
// // // // // //               padding: const EdgeInsets.all(16),
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: Colors.blue[50],
// // // // // //                 borderRadius: BorderRadius.circular(12),
// // // // // //               ),
// // // // // //               child: const Text(
// // // // // //                 "• Review recent SOS requests.\n"
// // // // // //                 "• Monitor top contributors.\n"
// // // // // //                 "• Check content flagged for review.\n"
// // // // // //                 "• Send notifications or alerts to active users.\n"
// // // // // //                 "• Track platform health and engagement metrics.",
// // // // // //                 style: TextStyle(fontSize: 14, height: 1.5),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildPieChart() {
// // // // // //     return Center(
// // // // // //       child: Stack(
// // // // // //         alignment: Alignment.center,
// // // // // //         children: [
// // // // // //           AnimatedPieSlice(
// // // // // //             color: Colors.green,
// // // // // //             percent: animateCharts ? 0.4 : 0,
// // // // // //           ),
// // // // // //           AnimatedPieSlice(
// // // // // //             color: Colors.orange,
// // // // // //             percent: animateCharts ? 0.25 : 0,
// // // // // //           ),
// // // // // //           AnimatedPieSlice(color: Colors.red, percent: animateCharts ? 0.2 : 0),
// // // // // //           AnimatedPieSlice(
// // // // // //             color: Colors.blue,
// // // // // //             percent: animateCharts ? 0.15 : 0,
// // // // // //           ),
// // // // // //           const Text("Mood\nDistribution", textAlign: TextAlign.center),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildPieLegend() {
// // // // // //     return Column(
// // // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //       children: const [
// // // // // //         _Legend(color: Colors.green, label: "Happy 40%"),
// // // // // //         _Legend(color: Colors.orange, label: "Sad 25%"),
// // // // // //         _Legend(color: Colors.red, label: "Anxious 20%"),
// // // // // //         _Legend(color: Colors.blue, label: "Neutral 15%"),
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ---------------- Dashboard Card ----------------
// // // // // // class _DashboardCard extends StatelessWidget {
// // // // // //   final String title;
// // // // // //   final String value;
// // // // // //   final IconData icon;

// // // // // //   const _DashboardCard({
// // // // // //     required this.title,
// // // // // //     required this.value,
// // // // // //     required this.icon,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final width = MediaQuery.of(context).size.width;
// // // // // //     return Card(
// // // // // //       elevation: 3,
// // // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // // //       child: Padding(
// // // // // //         padding: EdgeInsets.all(width < 500 ? 6 : 12),
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
// // // // // //             SizedBox(height: width < 500 ? 4 : 6),
// // // // // //             Text(
// // // // // //               value,
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //                 color: Colors.black,
// // // // // //               ),
// // // // // //             ),
// // // // // //             SizedBox(height: width < 500 ? 2 : 4),
// // // // // //             Text(title, style: TextStyle(fontSize: width < 500 ? 9 : 12)),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ---------------- Animated Bar ----------------
// // // // // // class AnimatedBar extends StatelessWidget {
// // // // // //   final double heightFactor;
// // // // // //   final String label;
// // // // // //   final Color color;

// // // // // //   const AnimatedBar({
// // // // // //     required this.heightFactor,
// // // // // //     required this.label,
// // // // // //     required this.color,
// // // // // //     super.key,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       mainAxisAlignment: MainAxisAlignment.end,
// // // // // //       children: [
// // // // // //         AnimatedContainer(
// // // // // //           duration: const Duration(seconds: 1),
// // // // // //           curve: Curves.easeOut,
// // // // // //           width: 20,
// // // // // //           height: 150 * heightFactor,
// // // // // //           color: color,
// // // // // //         ),
// // // // // //         const SizedBox(height: 6),
// // // // // //         Text(label, style: const TextStyle(fontSize: 12)),
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ---------------- Animated Pie Slice ----------------
// // // // // // class AnimatedPieSlice extends StatelessWidget {
// // // // // //   final Color color;
// // // // // //   final double percent;

// // // // // //   const AnimatedPieSlice({
// // // // // //     required this.color,
// // // // // //     required this.percent,
// // // // // //     super.key,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return TweenAnimationBuilder<double>(
// // // // // //       tween: Tween(begin: 0, end: percent),
// // // // // //       duration: const Duration(seconds: 1),
// // // // // //       builder: (context, value, child) {
// // // // // //         return Container(
// // // // // //           width: 150 * value,
// // // // // //           height: 150 * value,
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: color.withOpacity(0.7),
// // // // // //             shape: BoxShape.circle,
// // // // // //           ),
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // ---------------- Legend Widget ---------------
// // // // // // class _Legend extends StatelessWidget {
// // // // // //   final Color color;
// // // // // //   final String label;

// // // // // //   const _Legend({required this.color, required this.label});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Padding(
// // // // // //       padding: const EdgeInsets.symmetric(vertical: 4),
// // // // // //       child: Row(
// // // // // //         children: [
// // // // // //           Container(width: 16, height: 16, color: color),
// // // // // //           const SizedBox(width: 8),
// // // // // //           Text(label),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:mentalwellapp/controller/LoginController.dart';
// // // // // import 'package:mentalwellapp/view/LoginPage.dart';

// // // // // class DashboardPage extends StatefulWidget {
// // // // //   final String username;

// // // // //   const DashboardPage({super.key, required this.username});

// // // // //   @override
// // // // //   State<DashboardPage> createState() => _DashboardPageState();
// // // // // }

// // // // // class _DashboardPageState extends State<DashboardPage> {
// // // // //   bool animateCharts = false;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       if (mounted) {
// // // // //         setState(() {
// // // // //           animateCharts = true;
// // // // //         });
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   Future<void> _logout() async {
// // // // //     await FirebaseAuth.instance.signOut();
// // // // //     if (!mounted) return;
// // // // //     Navigator.pushAndRemoveUntil(
// // // // //       context,
// // // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // // //       (route) => false,
// // // // //     );
// // // // //   }

// // // // //   DateTime _startOfToday() {
// // // // //     final now = DateTime.now();
// // // // //     return DateTime(now.year, now.month, now.day);
// // // // //   }

// // // // //   DateTime _startOfNextMonth(DateTime date) {
// // // // //     return DateTime(date.year, date.month + 1, 1);
// // // // //   }

// // // // //   Stream<int> _collectionCountStream(String collectionName) {
// // // // //     return FirebaseFirestore.instance
// // // // //         .collection(collectionName)
// // // // //         .snapshots()
// // // // //         .map((snapshot) => snapshot.size);
// // // // //   }

// // // // //   Stream<int> _activeTodayCountStream() {
// // // // //     final start = _startOfToday();
// // // // //     final end = start.add(const Duration(days: 1));

// // // // //     return FirebaseFirestore.instance
// // // // //         .collection('users')
// // // // //         .where('lastSeenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
// // // // //         .where('lastSeenAt', isLessThan: Timestamp.fromDate(end))
// // // // //         .snapshots()
// // // // //         .map((snapshot) => snapshot.size);
// // // // //   }

// // // // //   Stream<int> _activeTodayFallbackCountStream() {
// // // // //     final todayKey =
// // // // //         "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";

// // // // //     return FirebaseFirestore.instance
// // // // //         .collection('activities')
// // // // //         .where('dateKey', isEqualTo: todayKey)
// // // // //         .snapshots()
// // // // //         .map(
// // // // //           (snapshot) =>
// // // // //               snapshot.docs.map((e) => e.data()['userId']).toSet().length,
// // // // //         );
// // // // //   }

// // // // //   Stream<QuerySnapshot<Map<String, dynamic>>> _latestSosQueryStream() {
// // // // //     return FirebaseFirestore.instance
// // // // //         .collection('sos_history')
// // // // //         .orderBy('createdAt', descending: true)
// // // // //         .limit(1)
// // // // //         .snapshots();
// // // // //   }

// // // // //   Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
// // // // //     final now = DateTime.now();
// // // // //     final months = List.generate(6, (index) {
// // // // //       final d = DateTime(now.year, now.month - 5 + index, 1);
// // // // //       return DateTime(d.year, d.month, 1);
// // // // //     });

// // // // //     return FirebaseFirestore.instance.collection('users').snapshots().map((
// // // // //       snapshot,
// // // // //     ) {
// // // // //       final points = <_ChartPoint>[];

// // // // //       for (final monthStart in months) {
// // // // //         final monthEnd = _startOfNextMonth(monthStart);
// // // // //         int count = 0;

// // // // //         for (final doc in snapshot.docs) {
// // // // //           final data = doc.data();
// // // // //           final dynamic createdAtRaw = data['termsAcceptedAt'];
// // // // //           DateTime? createdAt;

// // // // //           if (createdAtRaw is Timestamp) {
// // // // //             createdAt = createdAtRaw.toDate();
// // // // //           } else if (createdAtRaw is String) {
// // // // //             createdAt = DateTime.tryParse(createdAtRaw);
// // // // //           }

// // // // //           if (createdAt != null &&
// // // // //               !createdAt.isBefore(monthStart) &&
// // // // //               createdAt.isBefore(monthEnd)) {
// // // // //             count++;
// // // // //           }
// // // // //         }

// // // // //         points.add(
// // // // //           _ChartPoint(
// // // // //             label: _monthLabel(monthStart.month),
// // // // //             value: count.toDouble(),
// // // // //           ),
// // // // //         );
// // // // //       }

// // // // //       return points;
// // // // //     });
// // // // //   }

// // // // //   String _monthLabel(int month) {
// // // // //     const months = [
// // // // //       'Jan',
// // // // //       'Feb',
// // // // //       'Mar',
// // // // //       'Apr',
// // // // //       'May',
// // // // //       'Jun',
// // // // //       'Jul',
// // // // //       'Aug',
// // // // //       'Sep',
// // // // //       'Oct',
// // // // //       'Nov',
// // // // //       'Dec',
// // // // //     ];
// // // // //     return months[month - 1];
// // // // //   }

// // // // //   String _formatTimestamp(dynamic timestamp) {
// // // // //     if (timestamp is Timestamp) {
// // // // //       final dt = timestamp.toDate();
// // // // //       final day = dt.day.toString().padLeft(2, '0');
// // // // //       final month = dt.month.toString().padLeft(2, '0');
// // // // //       final year = dt.year;
// // // // //       final hour = dt.hour.toString().padLeft(2, '0');
// // // // //       final minute = dt.minute.toString().padLeft(2, '0');
// // // // //       return "$day/$month/$year $hour:$minute";
// // // // //     }
// // // // //     return "";
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final width = MediaQuery.of(context).size.width;
// // // // //     final isWide = width > 500;

// // // // //     return Scaffold(
// // // // //       backgroundColor: const Color(0xFFF9FAFC),
// // // // //       drawer: Drawer(
// // // // //         child: ListView(
// // // // //           padding: EdgeInsets.zero,
// // // // //           children: [
// // // // //             DrawerHeader(
// // // // //               decoration: const BoxDecoration(color: Colors.indigo),
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 mainAxisAlignment: MainAxisAlignment.end,
// // // // //                 children: [
// // // // //                   const Text(
// // // // //                     "Admin Menu",
// // // // //                     style: TextStyle(color: Colors.white, fontSize: 24),
// // // // //                   ),
// // // // //                   const SizedBox(height: 6),
// // // // //                   Text(
// // // // //                     widget.username.isNotEmpty ? widget.username : "Admin",
// // // // //                     style: const TextStyle(color: Colors.white70, fontSize: 14),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             ListTile(
// // // // //               leading: const Icon(Icons.logout),
// // // // //               title: const Text("Logout"),
// // // // //               onTap: () async {
// // // // //                 Navigator.pop(context);
// // // // //                 await _logout();
// // // // //               },
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Colors.white,
// // // // //         foregroundColor: Colors.black,
// // // // //         elevation: 0,
// // // // //         title: Text(
// // // // //           "Dashboard",
// // // // //           style: TextStyle(
// // // // //             fontSize: width < 500 ? 18 : 22,
// // // // //             fontWeight: FontWeight.bold,
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             Text(
// // // // //               "Dashboard Overview",
// // // // //               style: TextStyle(
// // // // //                 fontSize: width < 500 ? 18 : 24,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 16),
// // // // //             GridView.count(
// // // // //               crossAxisCount: 2,
// // // // //               shrinkWrap: true,
// // // // //               physics: const NeverScrollableScrollPhysics(),
// // // // //               crossAxisSpacing: 12,
// // // // //               mainAxisSpacing: 12,
// // // // //               childAspectRatio: 1,
// // // // //               children: [
// // // // //                 StreamBuilder<int>(
// // // // //                   stream: _collectionCountStream('users'),
// // // // //                   builder: (context, snapshot) {
// // // // //                     return _DashboardCard(
// // // // //                       title: "Total Users",
// // // // //                       value: snapshot.data?.toString() ?? "0",
// // // // //                       icon: Icons.people,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //                 StreamBuilder<int>(
// // // // //                   stream: _activeTodayCountStream(),
// // // // //                   builder: (context, snapshot) {
// // // // //                     return _DashboardCard(
// // // // //                       title: "Active Today",
// // // // //                       value: snapshot.data?.toString() ?? "0",
// // // // //                       icon: Icons.bolt,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //                 StreamBuilder<int>(
// // // // //                   stream: _collectionCountStream('sos_history'),
// // // // //                   builder: (context, snapshot) {
// // // // //                     return _DashboardCard(
// // // // //                       title: "SOS Requests",
// // // // //                       value: snapshot.data?.toString() ?? "0",
// // // // //                       icon: Icons.sos,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //                 StreamBuilder<int>(
// // // // //                   stream: _collectionCountStream('motivation_cards'),
// // // // //                   builder: (context, snapshot) {
// // // // //                     return _DashboardCard(
// // // // //                       title: "Motivational Cards",
// // // // //                       value: snapshot.data?.toString() ?? "0",
// // // // //                       icon: Icons.auto_awesome,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             const SizedBox(height: 24),
// // // // //             Text(
// // // // //               "Latest SOS Request",
// // // // //               style: TextStyle(
// // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // //               stream: _latestSosQueryStream(),
// // // // //               builder: (context, snapshot) {
// // // // //                 if (snapshot.hasError) {
// // // // //                   return _InfoCard(
// // // // //                     title: "Unable to load latest SOS request",
// // // // //                     subtitle: "Please check the Firestore fields.",
// // // // //                     icon: Icons.error_outline,
// // // // //                   );
// // // // //                 }

// // // // //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // // //                   return _InfoCard(
// // // // //                     title: "No SOS requests yet",
// // // // //                     subtitle: "Latest SOS preview will appear here.",
// // // // //                     icon: Icons.notifications_none,
// // // // //                   );
// // // // //                 }

// // // // //                 final doc = snapshot.data!.docs.first;
// // // // //                 final data = doc.data();

// // // // //                 final name = (data['userName'] ?? 'Unknown').toString();
// // // // //                 final doctor = (data['doctor'] ?? '').toString();
// // // // //                 final friend = (data['friend'] ?? '').toString();
// // // // //                 final location = (data['location'] ?? 'Location unavailable')
// // // // //                     .toString();
// // // // //                 final status = (data['status'] ?? 'pending').toString();
// // // // //                 final type = (data['type'] ?? '').toString();
// // // // //                 final timeText = _formatTimestamp(data['createdAt']);

// // // // //                 return Container(
// // // // //                   width: double.infinity,
// // // // //                   padding: const EdgeInsets.all(16),
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: Colors.red[50],
// // // // //                     borderRadius: BorderRadius.circular(14),
// // // // //                     border: Border.all(color: Colors.red.shade100),
// // // // //                   ),
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       Row(
// // // // //                         children: [
// // // // //                           const Icon(Icons.warning_rounded, color: Colors.red),
// // // // //                           const SizedBox(width: 8),
// // // // //                           Expanded(
// // // // //                             child: Text(
// // // // //                               name,
// // // // //                               style: const TextStyle(
// // // // //                                 fontWeight: FontWeight.bold,
// // // // //                                 fontSize: 16,
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                           Container(
// // // // //                             padding: const EdgeInsets.symmetric(
// // // // //                               horizontal: 10,
// // // // //                               vertical: 4,
// // // // //                             ),
// // // // //                             decoration: BoxDecoration(
// // // // //                               color: Colors.red.shade100,
// // // // //                               borderRadius: BorderRadius.circular(20),
// // // // //                             ),
// // // // //                             child: Text(
// // // // //                               status,
// // // // //                               style: const TextStyle(
// // // // //                                 fontSize: 12,
// // // // //                                 fontWeight: FontWeight.w600,
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                       const SizedBox(height: 10),
// // // // //                       Text(
// // // // //                         "Doctor: $doctor",
// // // // //                         style: const TextStyle(fontSize: 13),
// // // // //                       ),
// // // // //                       Text(
// // // // //                         "Friend: $friend",
// // // // //                         style: const TextStyle(fontSize: 13),
// // // // //                       ),
// // // // //                       Text("Type: $type", style: const TextStyle(fontSize: 13)),
// // // // //                       const SizedBox(height: 6),
// // // // //                       Text(
// // // // //                         location,
// // // // //                         maxLines: 2,
// // // // //                         overflow: TextOverflow.ellipsis,
// // // // //                         style: const TextStyle(fontSize: 14, height: 1.4),
// // // // //                       ),
// // // // //                       if (timeText.isNotEmpty) ...[
// // // // //                         const SizedBox(height: 8),
// // // // //                         Text(
// // // // //                           timeText,
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 12,
// // // // //                             color: Colors.black54,
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                       const SizedBox(height: 12),
// // // // //                       Align(
// // // // //                         alignment: Alignment.centerRight,
// // // // //                         child: TextButton(
// // // // //                           onPressed: () {},
// // // // //                           child: const Text("View all SOS"),
// // // // //                         ),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //             const SizedBox(height: 24),
// // // // //             Text(
// // // // //               "User Growth",
// // // // //               style: TextStyle(
// // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             Container(
// // // // //               height: 250,
// // // // //               padding: const EdgeInsets.all(16),
// // // // //               decoration: BoxDecoration(
// // // // //                 color: Colors.indigo[50],
// // // // //                 borderRadius: BorderRadius.circular(16),
// // // // //               ),
// // // // //               child: StreamBuilder<List<_ChartPoint>>(
// // // // //                 stream: _newUsersPerMonthStream(),
// // // // //                 builder: (context, snapshot) {
// // // // //                   final points =
// // // // //                       snapshot.data ??
// // // // //                       const [
// // // // //                         _ChartPoint(label: 'Jan', value: 0),
// // // // //                         _ChartPoint(label: 'Feb', value: 0),
// // // // //                         _ChartPoint(label: 'Mar', value: 0),
// // // // //                         _ChartPoint(label: 'Apr', value: 0),
// // // // //                         _ChartPoint(label: 'May', value: 0),
// // // // //                         _ChartPoint(label: 'Jun', value: 0),
// // // // //                       ];

// // // // //                   final maxValue = points.isEmpty
// // // // //                       ? 1.0
// // // // //                       : points
// // // // //                             .map((e) => e.value)
// // // // //                             .reduce((a, b) => a > b ? a : b);
// // // // //                   final safeMax = maxValue <= 0 ? 1.0 : maxValue;

// // // // //                   return Column(
// // // // //                     children: [
// // // // //                       Expanded(
// // // // //                         child: Row(
// // // // //                           crossAxisAlignment: CrossAxisAlignment.end,
// // // // //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                           children: points.map((p) {
// // // // //                             return Expanded(
// // // // //                               child: Padding(
// // // // //                                 padding: const EdgeInsets.symmetric(
// // // // //                                   horizontal: 4,
// // // // //                                 ),
// // // // //                                 child: Column(
// // // // //                                   mainAxisAlignment: MainAxisAlignment.end,
// // // // //                                   children: [
// // // // //                                     Text(
// // // // //                                       p.value.toInt().toString(),
// // // // //                                       style: const TextStyle(
// // // // //                                         fontSize: 12,
// // // // //                                         fontWeight: FontWeight.w600,
// // // // //                                       ),
// // // // //                                     ),
// // // // //                                     const SizedBox(height: 6),
// // // // //                                     AnimatedContainer(
// // // // //                                       duration: const Duration(
// // // // //                                         milliseconds: 900,
// // // // //                                       ),
// // // // //                                       curve: Curves.easeOutCubic,
// // // // //                                       width: 18,
// // // // //                                       height: animateCharts
// // // // //                                           ? (150 * (p.value / safeMax))
// // // // //                                           : 0,
// // // // //                                       decoration: BoxDecoration(
// // // // //                                         gradient: const LinearGradient(
// // // // //                                           colors: [
// // // // //                                             Color(0xFF636AE8),
// // // // //                                             Color(0xFF8E59FF),
// // // // //                                           ],
// // // // //                                           begin: Alignment.topCenter,
// // // // //                                           end: Alignment.bottomCenter,
// // // // //                                         ),
// // // // //                                         borderRadius: BorderRadius.circular(8),
// // // // //                                       ),
// // // // //                                     ),
// // // // //                                     const SizedBox(height: 8),
// // // // //                                     Text(
// // // // //                                       p.label,
// // // // //                                       style: const TextStyle(
// // // // //                                         fontSize: 12,
// // // // //                                         fontWeight: FontWeight.w500,
// // // // //                                       ),
// // // // //                                     ),
// // // // //                                   ],
// // // // //                                 ),
// // // // //                               ),
// // // // //                             );
// // // // //                           }).toList(),
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(height: 10),
// // // // //                       const Text(
// // // // //                         "New Users Per Month",
// // // // //                         style: TextStyle(
// // // // //                           fontSize: 14,
// // // // //                           fontWeight: FontWeight.w600,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ],
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 24),
// // // // //             Text(
// // // // //               "Recent Users",
// // // // //               style: TextStyle(
// // // // //                 fontSize: width < 500 ? 16 : 22,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 12),
// // // // //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // // //               stream: FirebaseFirestore.instance
// // // // //                   .collection('users')
// // // // //                   .orderBy('termsAcceptedAt', descending: true)
// // // // //                   .limit(1)
// // // // //                   .snapshots(),
// // // // //               builder: (context, snapshot) {
// // // // //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // // //                   return _InfoCard(
// // // // //                     title: "No recent users",
// // // // //                     subtitle: "Latest registered user will appear here.",
// // // // //                     icon: Icons.person_add_alt_1,
// // // // //                   );
// // // // //                 }

// // // // //                 final data = snapshot.data!.docs.first.data();
// // // // //                 final recentName = (data['name'] ?? 'Unknown').toString();
// // // // //                 final recentEmail = (data['email'] ?? '').toString();
// // // // //                 final recentMobile = (data['mobile'] ?? '').toString();
// // // // //                 final recentTime = (data['termsAcceptedAt'] ?? '').toString();

// // // // //                 return Container(
// // // // //                   width: double.infinity,
// // // // //                   padding: const EdgeInsets.all(16),
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: Colors.white,
// // // // //                     borderRadius: BorderRadius.circular(14),
// // // // //                     border: Border.all(color: Colors.black12),
// // // // //                   ),
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       Row(
// // // // //                         children: [
// // // // //                           const CircleAvatar(
// // // // //                             backgroundColor: Color(0xFF636AE8),
// // // // //                             child: Icon(Icons.person, color: Colors.white),
// // // // //                           ),
// // // // //                           const SizedBox(width: 12),
// // // // //                           Expanded(
// // // // //                             child: Column(
// // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                               children: [
// // // // //                                 Text(
// // // // //                                   recentName,
// // // // //                                   style: const TextStyle(
// // // // //                                     fontSize: 16,
// // // // //                                     fontWeight: FontWeight.bold,
// // // // //                                   ),
// // // // //                                 ),
// // // // //                                 if (recentEmail.isNotEmpty)
// // // // //                                   Text(
// // // // //                                     recentEmail,
// // // // //                                     style: const TextStyle(
// // // // //                                       fontSize: 13,
// // // // //                                       color: Colors.black54,
// // // // //                                     ),
// // // // //                                   ),
// // // // //                               ],
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                       if (recentMobile.isNotEmpty) ...[
// // // // //                         const SizedBox(height: 10),
// // // // //                         Text("Mobile: $recentMobile"),
// // // // //                       ],
// // // // //                       if (recentTime.isNotEmpty) ...[
// // // // //                         const SizedBox(height: 6),
// // // // //                         Text(
// // // // //                           "Joined: $recentTime",
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 12,
// // // // //                             color: Colors.black54,
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ],
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //             const SizedBox(height: 24),
// // // // //             Container(
// // // // //               padding: const EdgeInsets.all(16),
// // // // //               decoration: BoxDecoration(
// // // // //                 color: Colors.blue[50],
// // // // //                 borderRadius: BorderRadius.circular(14),
// // // // //               ),
// // // // //               child: const Text(
// // // // //                 "• Review recent SOS requests and respond to urgent cases quickly.\n"
// // // // //                 "• Monitor new user sign-ups and growth patterns.\n"
// // // // //                 "• Track live activity from the user app.\n"
// // // // //                 "• Keep motivational content fresh and active for engagement.",
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 14,
// // // // //                   height: 1.6,
// // // // //                   color: Color(0xFF1E1E24),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _DashboardCard extends StatelessWidget {
// // // // //   final String title;
// // // // //   final String value;
// // // // //   final IconData icon;

// // // // //   const _DashboardCard({
// // // // //     required this.title,
// // // // //     required this.value,
// // // // //     required this.icon,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final width = MediaQuery.of(context).size.width;
// // // // //     return Card(
// // // // //       elevation: 3,
// // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // //       child: Padding(
// // // // //         padding: EdgeInsets.all(width < 500 ? 6 : 12),
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
// // // // //             SizedBox(height: width < 500 ? 4 : 6),
// // // // //             Text(
// // // // //               value,
// // // // //               style: TextStyle(
// // // // //                 fontSize: width < 500 ? 14 : 18,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //                 color: Colors.black,
// // // // //               ),
// // // // //             ),
// // // // //             SizedBox(height: width < 500 ? 2 : 4),
// // // // //             Text(title, style: TextStyle(fontSize: width < 500 ? 9 : 12)),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _InfoCard extends StatelessWidget {
// // // // //   final String title;
// // // // //   final String? subtitle;
// // // // //   final IconData icon;

// // // // //   const _InfoCard({required this.title, this.subtitle, required this.icon});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       width: double.infinity,
// // // // //       padding: const EdgeInsets.all(16),
// // // // //       decoration: BoxDecoration(
// // // // //         color: Colors.white,
// // // // //         borderRadius: BorderRadius.circular(12),
// // // // //         border: Border.all(color: Colors.black12),
// // // // //       ),
// // // // //       child: Row(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: [
// // // // //           Icon(icon, color: Colors.indigo),
// // // // //           const SizedBox(width: 12),
// // // // //           Expanded(
// // // // //             child: Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   title,
// // // // //                   style: const TextStyle(fontWeight: FontWeight.bold),
// // // // //                 ),
// // // // //                 if (subtitle != null) ...[
// // // // //                   const SizedBox(height: 6),
// // // // //                   Text(
// // // // //                     subtitle!,
// // // // //                     style: const TextStyle(fontSize: 13, height: 1.4),
// // // // //                   ),
// // // // //                 ],
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _ChartPoint {
// // // // //   final String label;
// // // // //   final double value;

// // // // //   const _ChartPoint({required this.label, required this.value});
// // // // // }
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:intl/intl.dart';
// // // // import 'package:mentalwellapp/view/LoginPage.dart';

// // // // class DashboardPage extends StatefulWidget {
// // // //   final String username;

// // // //   const DashboardPage({super.key, required this.username});

// // // //   @override
// // // //   State<DashboardPage> createState() => _DashboardPageState();
// // // // }

// // // // class _DashboardPageState extends State<DashboardPage> {
// // // //   bool animateCharts = false;

// // // //   late final Stream<int> totalUsersStream;
// // // //   late final Stream<int> activeTodayStream;
// // // //   late final Stream<int> sosCountStream;
// // // //   late final Stream<int> motivationCountStream;
// // // //   late final Stream<QuerySnapshot<Map<String, dynamic>>> latestSosStream;
// // // //   late final Stream<QuerySnapshot<Map<String, dynamic>>> recentUsersStream;
// // // //   late final Stream<List<_RecentActivity>> recentActivitiesStream;
// // // //   late final Stream<List<_ChartPoint>> newUsersPerMonthStream;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();

// // // //     totalUsersStream = FirebaseFirestore.instance
// // // //         .collection('users')
// // // //         .where('accountType', isEqualTo: 'User')
// // // //         .snapshots()
// // // //         .map((snapshot) => snapshot.size);

// // // //     activeTodayStream = _activeTodayCountStream();

// // // //     sosCountStream = FirebaseFirestore.instance
// // // //         .collection('sos_history')
// // // //         .snapshots()
// // // //         .map((snapshot) => snapshot.size);

// // // //     motivationCountStream = FirebaseFirestore.instance
// // // //         .collection('motivation_cards')
// // // //         .snapshots()
// // // //         .map((snapshot) => snapshot.size);

// // // //     latestSosStream = FirebaseFirestore.instance
// // // //         .collection('sos_history')
// // // //         .orderBy('createdAt', descending: true)
// // // //         .limit(1)
// // // //         .snapshots();

// // // //     recentUsersStream = FirebaseFirestore.instance
// // // //         .collection('users')
// // // //         .where('accountType', isEqualTo: 'User')
// // // //         .orderBy('createdAt', descending: true)
// // // //         .limit(5)
// // // //         .snapshots();

// // // //     recentActivitiesStream = FirebaseFirestore.instance
// // // //         .collection('activities')
// // // //         .orderBy('timestamp', descending: true)
// // // //         .limit(10)
// // // //         .snapshots()
// // // //         .map((snapshot) {
// // // //           return snapshot.docs.map((doc) {
// // // //             final data = doc.data();
// // // //             return _RecentActivity(
// // // //               action: (data['action'] ?? '').toString(),
// // // //               userName: (data['userName'] ?? 'Unknown').toString(),
// // // //               dateText: _formatIndianDate(data['timestamp']),
// // // //             );
// // // //           }).toList();
// // // //         });

// // // //     newUsersPerMonthStream = _newUsersPerMonthStream();

// // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //       if (mounted) {
// // // //         setState(() => animateCharts = true);
// // // //       }
// // // //     });
// // // //   }

// // // //   Future<void> _logout() async {
// // // //     await FirebaseAuth.instance.signOut();
// // // //     if (!mounted) return;
// // // //     Navigator.pushAndRemoveUntil(
// // // //       context,
// // // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // // //       (route) => false,
// // // //     );
// // // //   }

// // // //   DateTime _startOfToday() {
// // // //     final now = DateTime.now();
// // // //     return DateTime(now.year, now.month, now.day);
// // // //   }

// // // //   DateTime _startOfNextMonth(DateTime date) {
// // // //     return DateTime(date.year, date.month + 1, 1);
// // // //   }

// // // //   DateTime? _parseDate(dynamic value) {
// // // //     if (value is Timestamp) return value.toDate();
// // // //     if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
// // // //     return null;
// // // //   }

// // // //   String _formatIndianDate(dynamic value) {
// // // //     final dt = _parseDate(value);
// // // //     if (dt == null) return "";
// // // //     return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
// // // //   }

// // // //   Stream<int> _activeTodayCountStream() {
// // // //     final start = _startOfToday();
// // // //     final end = start.add(const Duration(days: 1));

// // // //     return FirebaseFirestore.instance
// // // //         .collection('users')
// // // //         .where('accountType', isEqualTo: 'User')
// // // //         .where('lastSeenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
// // // //         .where('lastSeenAt', isLessThan: Timestamp.fromDate(end))
// // // //         .snapshots()
// // // //         .map((snapshot) => snapshot.size);
// // // //   }

// // // //   Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
// // // //     final now = DateTime.now();
// // // //     final months = List.generate(6, (index) {
// // // //       final d = DateTime(now.year, now.month - 5 + index, 1);
// // // //       return DateTime(d.year, d.month, 1);
// // // //     });

// // // //     return FirebaseFirestore.instance
// // // //         .collection('users')
// // // //         .where('accountType', isEqualTo: 'User')
// // // //         .snapshots()
// // // //         .map((snapshot) {
// // // //           final points = <_ChartPoint>[];

// // // //           for (final monthStart in months) {
// // // //             final monthEnd = _startOfNextMonth(monthStart);
// // // //             int count = 0;

// // // //             for (final doc in snapshot.docs) {
// // // //               final data = doc.data();
// // // //               final createdAt =
// // // //                   _parseDate(data['createdAt']) ??
// // // //                   _parseDate(data['termsAcceptedAt']);

// // // //               if (createdAt != null &&
// // // //                   !createdAt.isBefore(monthStart) &&
// // // //                   createdAt.isBefore(monthEnd)) {
// // // //                 count++;
// // // //               }
// // // //             }

// // // //             points.add(
// // // //               _ChartPoint(
// // // //                 label: _monthLabel(monthStart.month),
// // // //                 value: count.toDouble(),
// // // //               ),
// // // //             );
// // // //           }

// // // //           return points;
// // // //         });
// // // //   }

// // // //   String _monthLabel(int month) {
// // // //     const months = [
// // // //       'Jan',
// // // //       'Feb',
// // // //       'Mar',
// // // //       'Apr',
// // // //       'May',
// // // //       'Jun',
// // // //       'Jul',
// // // //       'Aug',
// // // //       'Sep',
// // // //       'Oct',
// // // //       'Nov',
// // // //       'Dec',
// // // //     ];
// // // //     return months[month - 1];
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final width = MediaQuery.of(context).size.width;

// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFF9FAFC),
// // // //       drawer: Drawer(
// // // //         child: ListView(
// // // //           padding: EdgeInsets.zero,
// // // //           children: [
// // // //             DrawerHeader(
// // // //               decoration: const BoxDecoration(color: Colors.indigo),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 mainAxisAlignment: MainAxisAlignment.end,
// // // //                 children: [
// // // //                   const Text(
// // // //                     "Admin Menu",
// // // //                     style: TextStyle(color: Colors.white, fontSize: 24),
// // // //                   ),
// // // //                   const SizedBox(height: 6),
// // // //                   Text(
// // // //                     widget.username.isNotEmpty ? widget.username : "Admin",
// // // //                     style: const TextStyle(color: Colors.white70, fontSize: 14),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             ListTile(
// // // //               leading: const Icon(Icons.logout),
// // // //               title: const Text("Logout"),
// // // //               onTap: () async {
// // // //                 Navigator.pop(context);
// // // //                 await _logout();
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         foregroundColor: Colors.black,
// // // //         elevation: 0,
// // // //         title: Text(
// // // //           "Dashboard",
// // // //           style: TextStyle(
// // // //             fontSize: width < 500 ? 18 : 22,
// // // //             fontWeight: FontWeight.bold,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               "Dashboard Overview",
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 18 : 24,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             GridView.count(
// // // //               crossAxisCount: 2,
// // // //               shrinkWrap: true,
// // // //               physics: const NeverScrollableScrollPhysics(),
// // // //               crossAxisSpacing: 12,
// // // //               mainAxisSpacing: 12,
// // // //               childAspectRatio: 1,
// // // //               children: [
// // // //                 StreamBuilder<int>(
// // // //                   stream: totalUsersStream,
// // // //                   builder: (context, snapshot) => _DashboardCard(
// // // //                     title: "Total Users",
// // // //                     value: snapshot.data?.toString() ?? "0",
// // // //                     icon: Icons.people,
// // // //                   ),
// // // //                 ),
// // // //                 StreamBuilder<int>(
// // // //                   stream: activeTodayStream,
// // // //                   builder: (context, snapshot) => _DashboardCard(
// // // //                     title: "Active Today",
// // // //                     value: snapshot.data?.toString() ?? "0",
// // // //                     icon: Icons.bolt,
// // // //                   ),
// // // //                 ),
// // // //                 StreamBuilder<int>(
// // // //                   stream: sosCountStream,
// // // //                   builder: (context, snapshot) => _DashboardCard(
// // // //                     title: "SOS Requests",
// // // //                     value: snapshot.data?.toString() ?? "0",
// // // //                     icon: Icons.sos,
// // // //                   ),
// // // //                 ),
// // // //                 StreamBuilder<int>(
// // // //                   stream: motivationCountStream,
// // // //                   builder: (context, snapshot) => _DashboardCard(
// // // //                     title: "Motivational Cards",
// // // //                     value: snapshot.data?.toString() ?? "0",
// // // //                     icon: Icons.auto_awesome,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             Text(
// // // //               "Latest SOS Request",
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 14 : 18,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // //               stream: latestSosStream,
// // // //               builder: (context, snapshot) {
// // // //                 if (snapshot.hasError) {
// // // //                   return _InfoCard(
// // // //                     title: "Unable to load latest SOS request",
// // // //                     subtitle: "Please check the Firestore fields.",
// // // //                     icon: Icons.error_outline,
// // // //                   );
// // // //                 }

// // // //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //                   return _InfoCard(
// // // //                     title: "No SOS requests yet",
// // // //                     subtitle: "Latest SOS preview will appear here.",
// // // //                     icon: Icons.notifications_none,
// // // //                   );
// // // //                 }

// // // //                 final data = snapshot.data!.docs.first.data();
// // // //                 return _buildLatestSosCard(
// // // //                   (data['userName'] ?? 'Unknown').toString(),
// // // //                   (data['doctor'] ?? '').toString(),
// // // //                   (data['friend'] ?? '').toString(),
// // // //                   (data['location'] ?? 'Location unavailable').toString(),
// // // //                   (data['status'] ?? 'pending').toString(),
// // // //                   (data['type'] ?? '').toString(),
// // // //                   _formatIndianDate(data['createdAt']),
// // // //                 );
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             Text(
// // // //               "Recent Users",
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 16 : 22,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // // //               stream: recentUsersStream,
// // // //               builder: (context, snapshot) {
// // // //                 if (snapshot.hasError) {
// // // //                   return _InfoCard(
// // // //                     title: "Unable to load recent users",
// // // //                     subtitle: "Check createdAt values and Firestore index.",
// // // //                     icon: Icons.error_outline,
// // // //                   );
// // // //                 }

// // // //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //                   return _InfoCard(
// // // //                     title: "No recent users",
// // // //                     subtitle: "Latest registered user will appear here.",
// // // //                     icon: Icons.person_add_alt_1,
// // // //                   );
// // // //                 }

// // // //                 return Column(
// // // //                   children: snapshot.data!.docs.map((doc) {
// // // //                     final data = doc.data();
// // // //                     final recentName = (data['name'] ?? 'Unknown').toString();
// // // //                     final recentEmail = (data['email'] ?? '').toString();
// // // //                     final recentMobile = (data['mobile'] ?? '').toString();
// // // //                     final recentTime = _formatIndianDate(
// // // //                       data['createdAt'] ?? data['termsAcceptedAt'],
// // // //                     );

// // // //                     return Container(
// // // //                       width: double.infinity,
// // // //                       margin: const EdgeInsets.only(bottom: 12),
// // // //                       padding: const EdgeInsets.all(16),
// // // //                       decoration: BoxDecoration(
// // // //                         color: Colors.white,
// // // //                         borderRadius: BorderRadius.circular(14),
// // // //                         border: Border.all(color: Colors.black12),
// // // //                       ),
// // // //                       child: Row(
// // // //                         children: [
// // // //                           const CircleAvatar(
// // // //                             backgroundColor: Color(0xFF636AE8),
// // // //                             child: Icon(Icons.person, color: Colors.white),
// // // //                           ),
// // // //                           const SizedBox(width: 12),
// // // //                           Expanded(
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 Text(
// // // //                                   recentName,
// // // //                                   style: const TextStyle(
// // // //                                     fontSize: 16,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                   ),
// // // //                                 ),
// // // //                                 if (recentEmail.isNotEmpty)
// // // //                                   Text(
// // // //                                     recentEmail,
// // // //                                     style: const TextStyle(
// // // //                                       fontSize: 13,
// // // //                                       color: Colors.black54,
// // // //                                     ),
// // // //                                   ),
// // // //                                 if (recentMobile.isNotEmpty) ...[
// // // //                                   const SizedBox(height: 4),
// // // //                                   Text(
// // // //                                     "Mobile: $recentMobile",
// // // //                                     style: const TextStyle(
// // // //                                       fontSize: 12,
// // // //                                       color: Colors.black54,
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                                 if (recentTime.isNotEmpty) ...[
// // // //                                   const SizedBox(height: 4),
// // // //                                   Text(
// // // //                                     "Joined: $recentTime",
// // // //                                     style: const TextStyle(
// // // //                                       fontSize: 12,
// // // //                                       color: Colors.black54,
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     );
// // // //                   }).toList(),
// // // //                 );
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             Text(
// // // //               "User Growth",
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 16 : 22,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             Container(
// // // //               height: 250,
// // // //               padding: const EdgeInsets.all(16),
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.indigo[50],
// // // //                 borderRadius: BorderRadius.circular(16),
// // // //               ),
// // // //               child: StreamBuilder<List<_ChartPoint>>(
// // // //                 stream: newUsersPerMonthStream,
// // // //                 builder: (context, snapshot) {
// // // //                   final points =
// // // //                       snapshot.data ??
// // // //                       const [
// // // //                         _ChartPoint(label: 'Jan', value: 0),
// // // //                         _ChartPoint(label: 'Feb', value: 0),
// // // //                         _ChartPoint(label: 'Mar', value: 0),
// // // //                         _ChartPoint(label: 'Apr', value: 0),
// // // //                         _ChartPoint(label: 'May', value: 0),
// // // //                         _ChartPoint(label: 'Jun', value: 0),
// // // //                       ];

// // // //                   final maxValue = points.isEmpty
// // // //                       ? 1.0
// // // //                       : points
// // // //                             .map((e) => e.value)
// // // //                             .reduce((a, b) => a > b ? a : b);
// // // //                   final safeMax = maxValue <= 0 ? 1.0 : maxValue;

// // // //                   return Column(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: Row(
// // // //                           crossAxisAlignment: CrossAxisAlignment.end,
// // // //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                           children: points.map((p) {
// // // //                             return Expanded(
// // // //                               child: Padding(
// // // //                                 padding: const EdgeInsets.symmetric(
// // // //                                   horizontal: 4,
// // // //                                 ),
// // // //                                 child: Column(
// // // //                                   mainAxisAlignment: MainAxisAlignment.end,
// // // //                                   children: [
// // // //                                     Text(
// // // //                                       p.value.toInt().toString(),
// // // //                                       style: const TextStyle(
// // // //                                         fontSize: 12,
// // // //                                         fontWeight: FontWeight.w600,
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(height: 6),
// // // //                                     AnimatedContainer(
// // // //                                       duration: const Duration(
// // // //                                         milliseconds: 900,
// // // //                                       ),
// // // //                                       curve: Curves.easeOutCubic,
// // // //                                       width: 18,
// // // //                                       height: animateCharts
// // // //                                           ? (150 * (p.value / safeMax))
// // // //                                           : 0,
// // // //                                       decoration: BoxDecoration(
// // // //                                         gradient: const LinearGradient(
// // // //                                           colors: [
// // // //                                             Color(0xFF636AE8),
// // // //                                             Color(0xFF8E59FF),
// // // //                                           ],
// // // //                                           begin: Alignment.topCenter,
// // // //                                           end: Alignment.bottomCenter,
// // // //                                         ),
// // // //                                         borderRadius: BorderRadius.circular(8),
// // // //                                       ),
// // // //                                     ),
// // // //                                     const SizedBox(height: 8),
// // // //                                     Text(
// // // //                                       p.label,
// // // //                                       style: const TextStyle(
// // // //                                         fontSize: 12,
// // // //                                         fontWeight: FontWeight.w500,
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ),
// // // //                             );
// // // //                           }).toList(),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 10),
// // // //                       const Text(
// // // //                         "New Users Per Month",
// // // //                         style: TextStyle(
// // // //                           fontSize: 14,
// // // //                           fontWeight: FontWeight.w600,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             Text(
// // // //               "Recent Activity",
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 16 : 22,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             StreamBuilder<List<_RecentActivity>>(
// // // //               stream: recentActivitiesStream,
// // // //               builder: (context, snapshot) {
// // // //                 final items = snapshot.data ?? const [];
// // // //                 if (items.isEmpty) {
// // // //                   return _InfoCard(
// // // //                     title: "No recent activity",
// // // //                     subtitle: "User activity will appear here.",
// // // //                     icon: Icons.timeline,
// // // //                   );
// // // //                 }

// // // //                 return Column(
// // // //                   children: items.map((item) {
// // // //                     return Container(
// // // //                       width: double.infinity,
// // // //                       margin: const EdgeInsets.only(bottom: 12),
// // // //                       padding: const EdgeInsets.all(16),
// // // //                       decoration: BoxDecoration(
// // // //                         color: Colors.white,
// // // //                         borderRadius: BorderRadius.circular(14),
// // // //                         border: Border.all(color: Colors.black12),
// // // //                       ),
// // // //                       child: Row(
// // // //                         children: [
// // // //                           const Icon(
// // // //                             Icons.person_pin_circle,
// // // //                             color: Colors.indigo,
// // // //                           ),
// // // //                           const SizedBox(width: 12),
// // // //                           Expanded(
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 Text(
// // // //                                   item.userName,
// // // //                                   style: const TextStyle(
// // // //                                     fontSize: 15,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                   ),
// // // //                                 ),
// // // //                                 const SizedBox(height: 4),
// // // //                                 Text(
// // // //                                   item.action,
// // // //                                   style: const TextStyle(
// // // //                                     fontSize: 13,
// // // //                                     color: Colors.black87,
// // // //                                   ),
// // // //                                 ),
// // // //                                 if (item.dateText.isNotEmpty) ...[
// // // //                                   const SizedBox(height: 4),
// // // //                                   Text(
// // // //                                     item.dateText,
// // // //                                     style: const TextStyle(
// // // //                                       fontSize: 12,
// // // //                                       color: Colors.black54,
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     );
// // // //                   }).toList(),
// // // //                 );
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildLatestSosCard(
// // // //     String name,
// // // //     String doctor,
// // // //     String friend,
// // // //     String location,
// // // //     String status,
// // // //     String type,
// // // //     String timeText,
// // // //   ) {
// // // //     return Container(
// // // //       width: double.infinity,
// // // //       padding: const EdgeInsets.all(16),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.red[50],
// // // //         borderRadius: BorderRadius.circular(14),
// // // //         border: Border.all(color: Colors.red.shade100),
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Row(
// // // //             children: [
// // // //               const Icon(Icons.warning_rounded, color: Colors.red),
// // // //               const SizedBox(width: 8),
// // // //               Expanded(
// // // //                 child: Text(
// // // //                   name,
// // // //                   style: const TextStyle(
// // // //                     fontWeight: FontWeight.bold,
// // // //                     fontSize: 16,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               Container(
// // // //                 padding: const EdgeInsets.symmetric(
// // // //                   horizontal: 10,
// // // //                   vertical: 4,
// // // //                 ),
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.red.shade100,
// // // //                   borderRadius: BorderRadius.circular(20),
// // // //                 ),
// // // //                 child: Text(
// // // //                   status,
// // // //                   style: const TextStyle(
// // // //                     fontSize: 12,
// // // //                     fontWeight: FontWeight.w600,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           const SizedBox(height: 10),
// // // //           Text("Doctor: $doctor", style: const TextStyle(fontSize: 13)),
// // // //           Text("Friend: $friend", style: const TextStyle(fontSize: 13)),
// // // //           Text("Type: $type", style: const TextStyle(fontSize: 13)),
// // // //           const SizedBox(height: 6),
// // // //           Text(
// // // //             location,
// // // //             maxLines: 2,
// // // //             overflow: TextOverflow.ellipsis,
// // // //             style: const TextStyle(fontSize: 14, height: 1.4),
// // // //           ),
// // // //           if (timeText.isNotEmpty) ...[
// // // //             const SizedBox(height: 8),
// // // //             Text(
// // // //               timeText,
// // // //               style: const TextStyle(fontSize: 12, color: Colors.black54),
// // // //             ),
// // // //           ],
// // // //           const SizedBox(height: 12),
// // // //           Align(
// // // //             alignment: Alignment.centerRight,
// // // //             child: TextButton(
// // // //               onPressed: () {},
// // // //               child: const Text("View all SOS"),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class _DashboardCard extends StatelessWidget {
// // // //   final String title;
// // // //   final String value;
// // // //   final IconData icon;

// // // //   const _DashboardCard({
// // // //     required this.title,
// // // //     required this.value,
// // // //     required this.icon,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final width = MediaQuery.of(context).size.width;
// // // //     return Card(
// // // //       elevation: 3,
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // //       child: Padding(
// // // //         padding: EdgeInsets.all(width < 500 ? 6 : 12),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
// // // //             SizedBox(height: width < 500 ? 4 : 6),
// // // //             Text(
// // // //               value,
// // // //               style: TextStyle(
// // // //                 fontSize: width < 500 ? 14 : 18,
// // // //                 fontWeight: FontWeight.bold,
// // // //                 color: Colors.black,
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: width < 500 ? 2 : 4),
// // // //             Text(title, style: TextStyle(fontSize: width < 500 ? 9 : 12)),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class _InfoCard extends StatelessWidget {
// // // //   final String title;
// // // //   final String? subtitle;
// // // //   final IconData icon;

// // // //   const _InfoCard({required this.title, this.subtitle, required this.icon});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Container(
// // // //       width: double.infinity,
// // // //       padding: const EdgeInsets.all(16),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(12),
// // // //         border: Border.all(color: Colors.black12),
// // // //       ),
// // // //       child: Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Icon(icon, color: Colors.indigo),
// // // //           const SizedBox(width: 12),
// // // //           Expanded(
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Text(
// // // //                   title,
// // // //                   style: const TextStyle(fontWeight: FontWeight.bold),
// // // //                 ),
// // // //                 if (subtitle != null) ...[
// // // //                   const SizedBox(height: 6),
// // // //                   Text(
// // // //                     subtitle!,
// // // //                     style: const TextStyle(fontSize: 13, height: 1.4),
// // // //                   ),
// // // //                 ],
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class _RecentActivity {
// // // //   final String action;
// // // //   final String userName;
// // // //   final String dateText;

// // // //   const _RecentActivity({
// // // //     required this.action,
// // // //     required this.userName,
// // // //     required this.dateText,
// // // //   });
// // // // }

// // // // class _ChartPoint {
// // // //   final String label;
// // // //   final double value;

// // // //   const _ChartPoint({required this.label, required this.value});
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:mentalwellapp/view/LoginPage.dart';

// // // class DashboardPage extends StatefulWidget {
// // //   final String username;

// // //   const DashboardPage({super.key, required this.username});

// // //   @override
// // //   State<DashboardPage> createState() => _DashboardPageState();
// // // }

// // // class _DashboardPageState extends State<DashboardPage> {
// // //   bool animateCharts = false;

// // //   late final Stream<int> totalUsersStream;
// // //   late final Stream<int> activeTodayStream;
// // //   late final Stream<int> sosCountStream;
// // //   late final Stream<int> motivationCountStream;
// // //   late final Stream<QuerySnapshot<Map<String, dynamic>>> latestSosStream;
// // //   late final Stream<List<_RecentActivity>> recentActivitiesStream;
// // //   late final Stream<List<_ChartPoint>> newUsersPerMonthStream;

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     totalUsersStream = FirebaseFirestore.instance
// // //         .collection('users')
// // //         .where('accountType', isEqualTo: 'User')
// // //         .snapshots()
// // //         .map((snapshot) => snapshot.size);

// // //     activeTodayStream = FirebaseFirestore.instance
// // //         .collection('users')
// // //         .where('accountType', isEqualTo: 'User')
// // //         .where(
// // //           'lastSeen',
// // //           isGreaterThanOrEqualTo: Timestamp.fromDate(_startOfToday()),
// // //         )
// // //         .where('lastSeen', isLessThan: Timestamp.fromDate(_startOfTomorrow()))
// // //         .snapshots()
// // //         .map((snapshot) => snapshot.size);

// // //     sosCountStream = FirebaseFirestore.instance
// // //         .collection('sos_history')
// // //         .snapshots()
// // //         .map((snapshot) => snapshot.size);

// // //     motivationCountStream = FirebaseFirestore.instance
// // //         .collection('motivation_cards')
// // //         .snapshots()
// // //         .map((snapshot) => snapshot.size);

// // //     latestSosStream = FirebaseFirestore.instance
// // //         .collection('sos_history')
// // //         .orderBy('createdAt', descending: true)
// // //         .limit(1)
// // //         .snapshots();

// // //     recentActivitiesStream = FirebaseFirestore.instance
// // //         .collection('activities')
// // //         .orderBy('timestamp', descending: true)
// // //         .limit(10)
// // //         .snapshots()
// // //         .map((snapshot) {
// // //           return snapshot.docs.map((doc) {
// // //             final data = doc.data();
// // //             return _RecentActivity(
// // //               action: (data['action'] ?? '').toString(),
// // //               userName: (data['userName'] ?? 'Unknown').toString(),
// // //               dateText: _formatIndianDate(data['timestamp']),
// // //             );
// // //           }).toList();
// // //         });

// // //     newUsersPerMonthStream = _newUsersPerMonthStream();

// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       if (mounted) {
// // //         setState(() => animateCharts = true);
// // //       }
// // //     });
// // //   }

// // //   Future<void> _logout() async {
// // //     await FirebaseAuth.instance.signOut();
// // //     if (!mounted) return;
// // //     Navigator.pushAndRemoveUntil(
// // //       context,
// // //       MaterialPageRoute(builder: (_) => const LoginPage()),
// // //       (route) => false,
// // //     );
// // //   }

// // //   DateTime _startOfToday() {
// // //     final now = DateTime.now();
// // //     return DateTime(now.year, now.month, now.day);
// // //   }

// // //   DateTime _startOfTomorrow() {
// // //     final today = _startOfToday();
// // //     return today.add(const Duration(days: 1));
// // //   }

// // //   DateTime _startOfNextMonth(DateTime date) {
// // //     return DateTime(date.year, date.month + 1, 1);
// // //   }

// // //   DateTime? _parseDate(dynamic value) {
// // //     if (value is Timestamp) return value.toDate();
// // //     if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
// // //     return null;
// // //   }

// // //   String _formatIndianDate(dynamic value) {
// // //     final dt = _parseDate(value);
// // //     if (dt == null) return "";
// // //     return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
// // //   }

// // //   Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
// // //     final now = DateTime.now();
// // //     final months = List.generate(6, (index) {
// // //       final d = DateTime(now.year, now.month - 5 + index, 1);
// // //       return DateTime(d.year, d.month, 1);
// // //     });

// // //     return FirebaseFirestore.instance
// // //         .collection('users')
// // //         .where('accountType', isEqualTo: 'User')
// // //         .snapshots()
// // //         .map((snapshot) {
// // //           final points = <_ChartPoint>[];

// // //           for (final monthStart in months) {
// // //             final monthEnd = _startOfNextMonth(monthStart);
// // //             int count = 0;

// // //             for (final doc in snapshot.docs) {
// // //               final data = doc.data();
// // //               final createdAt =
// // //                   _parseDate(data['createdAt']) ??
// // //                   _parseDate(data['termsAcceptedAt']);

// // //               if (createdAt != null &&
// // //                   !createdAt.isBefore(monthStart) &&
// // //                   createdAt.isBefore(monthEnd)) {
// // //                 count++;
// // //               }
// // //             }

// // //             points.add(
// // //               _ChartPoint(
// // //                 label: _monthLabel(monthStart.month),
// // //                 value: count.toDouble(),
// // //               ),
// // //             );
// // //           }

// // //           return points;
// // //         });
// // //   }

// // //   String _monthLabel(int month) {
// // //     const months = [
// // //       'Jan',
// // //       'Feb',
// // //       'Mar',
// // //       'Apr',
// // //       'May',
// // //       'Jun',
// // //       'Jul',
// // //       'Aug',
// // //       'Sep',
// // //       'Oct',
// // //       'Nov',
// // //       'Dec',
// // //     ];
// // //     return months[month - 1];
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final width = MediaQuery.of(context).size.width;

// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF9FAFC),
// // //       drawer: Drawer(
// // //         child: ListView(
// // //           padding: EdgeInsets.zero,
// // //           children: [
// // //             DrawerHeader(
// // //               decoration: const BoxDecoration(color: Colors.indigo),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 mainAxisAlignment: MainAxisAlignment.end,
// // //                 children: [
// // //                   const Text(
// // //                     "Admin Menu",
// // //                     style: TextStyle(color: Colors.white, fontSize: 24),
// // //                   ),
// // //                   const SizedBox(height: 6),
// // //                   Text(
// // //                     widget.username.isNotEmpty ? widget.username : "Admin",
// // //                     style: const TextStyle(color: Colors.white70, fontSize: 14),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.logout),
// // //               title: const Text("Logout"),
// // //               onTap: () async {
// // //                 Navigator.pop(context);
// // //                 await _logout();
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         foregroundColor: Colors.black,
// // //         elevation: 0,
// // //         title: Text(
// // //           "Dashboard",
// // //           style: TextStyle(
// // //             fontSize: width < 500 ? 18 : 22,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               "Dashboard Overview",
// // //               style: TextStyle(
// // //                 fontSize: width < 500 ? 18 : 24,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             GridView.count(
// // //               crossAxisCount: 2,
// // //               shrinkWrap: true,
// // //               physics: const NeverScrollableScrollPhysics(),
// // //               crossAxisSpacing: 12,
// // //               mainAxisSpacing: 12,
// // //               childAspectRatio: 1,
// // //               children: [
// // //                 StreamBuilder<int>(
// // //                   stream: totalUsersStream,
// // //                   builder: (context, snapshot) => _DashboardCard(
// // //                     title: "Total Users",
// // //                     value: snapshot.data?.toString() ?? "0",
// // //                     icon: Icons.people,
// // //                   ),
// // //                 ),
// // //                 StreamBuilder<int>(
// // //                   stream: activeTodayStream,
// // //                   builder: (context, snapshot) => _DashboardCard(
// // //                     title: "Active Today",
// // //                     value: snapshot.data?.toString() ?? "0",
// // //                     icon: Icons.bolt,
// // //                   ),
// // //                 ),
// // //                 StreamBuilder<int>(
// // //                   stream: sosCountStream,
// // //                   builder: (context, snapshot) => _DashboardCard(
// // //                     title: "SOS Requests",
// // //                     value: snapshot.data?.toString() ?? "0",
// // //                     icon: Icons.sos,
// // //                   ),
// // //                 ),
// // //                 StreamBuilder<int>(
// // //                   stream: motivationCountStream,
// // //                   builder: (context, snapshot) => _DashboardCard(
// // //                     title: "Motivational Cards",
// // //                     value: snapshot.data?.toString() ?? "0",
// // //                     icon: Icons.auto_awesome,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 24),
// // //             Text(
// // //               "Latest SOS Request",
// // //               style: TextStyle(
// // //                 fontSize: width < 500 ? 14 : 18,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// // //               stream: latestSosStream,
// // //               builder: (context, snapshot) {
// // //                 if (snapshot.hasError) {
// // //                   return _InfoCard(
// // //                     title: "Unable to load latest SOS request",
// // //                     subtitle: "Please check Firestore fields and index.",
// // //                     icon: Icons.error_outline,
// // //                   );
// // //                 }

// // //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // //                   return _InfoCard(
// // //                     title: "No SOS requests yet",
// // //                     subtitle: "Latest SOS preview will appear here.",
// // //                     icon: Icons.notifications_none,
// // //                   );
// // //                 }

// // //                 final data = snapshot.data!.docs.first.data();
// // //                 return _buildLatestSosCard(
// // //                   (data['userName'] ?? 'Unknown').toString(),
// // //                   (data['doctor'] ?? '').toString(),
// // //                   (data['friend'] ?? '').toString(),
// // //                   (data['location'] ?? 'Location unavailable').toString(),
// // //                   (data['status'] ?? 'pending').toString(),
// // //                   (data['type'] ?? '').toString(),
// // //                   _formatIndianDate(data['createdAt']),
// // //                 );
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             Text(
// // //               "User Growth",
// // //               style: TextStyle(
// // //                 fontSize: width < 500 ? 16 : 22,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             Container(
// // //               height: 250,
// // //               padding: const EdgeInsets.all(16),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.indigo[50],
// // //                 borderRadius: BorderRadius.circular(16),
// // //               ),
// // //               child: StreamBuilder<List<_ChartPoint>>(
// // //                 stream: newUsersPerMonthStream,
// // //                 builder: (context, snapshot) {
// // //                   final points =
// // //                       snapshot.data ??
// // //                       const [
// // //                         _ChartPoint(label: 'Jan', value: 0),
// // //                         _ChartPoint(label: 'Feb', value: 0),
// // //                         _ChartPoint(label: 'Mar', value: 0),
// // //                         _ChartPoint(label: 'Apr', value: 0),
// // //                         _ChartPoint(label: 'May', value: 0),
// // //                         _ChartPoint(label: 'Jun', value: 0),
// // //                       ];

// // //                   final maxValue = points.isEmpty
// // //                       ? 1.0
// // //                       : points
// // //                             .map((e) => e.value)
// // //                             .reduce((a, b) => a > b ? a : b);
// // //                   final safeMax = maxValue <= 0 ? 1.0 : maxValue;

// // //                   return Column(
// // //                     children: [
// // //                       Expanded(
// // //                         child: Row(
// // //                           crossAxisAlignment: CrossAxisAlignment.end,
// // //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                           children: points.map((p) {
// // //                             return Expanded(
// // //                               child: Padding(
// // //                                 padding: const EdgeInsets.symmetric(
// // //                                   horizontal: 4,
// // //                                 ),
// // //                                 child: Column(
// // //                                   mainAxisAlignment: MainAxisAlignment.end,
// // //                                   children: [
// // //                                     Text(
// // //                                       p.value.toInt().toString(),
// // //                                       style: const TextStyle(
// // //                                         fontSize: 12,
// // //                                         fontWeight: FontWeight.w600,
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(height: 6),
// // //                                     AnimatedContainer(
// // //                                       duration: const Duration(
// // //                                         milliseconds: 900,
// // //                                       ),
// // //                                       curve: Curves.easeOutCubic,
// // //                                       width: 18,
// // //                                       height: animateCharts
// // //                                           ? (150 * (p.value / safeMax))
// // //                                           : 0,
// // //                                       decoration: BoxDecoration(
// // //                                         gradient: const LinearGradient(
// // //                                           colors: [
// // //                                             Color(0xFF636AE8),
// // //                                             Color(0xFF8E59FF),
// // //                                           ],
// // //                                           begin: Alignment.topCenter,
// // //                                           end: Alignment.bottomCenter,
// // //                                         ),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(height: 8),
// // //                                     Text(
// // //                                       p.label,
// // //                                       style: const TextStyle(
// // //                                         fontSize: 12,
// // //                                         fontWeight: FontWeight.w500,
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ),
// // //                             );
// // //                           }).toList(),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 10),
// // //                       const Text(
// // //                         "New Users Per Month",
// // //                         style: TextStyle(
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.w600,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             const SizedBox(height: 24),
// // //             Text(
// // //               "Recent Activity",
// // //               style: TextStyle(
// // //                 fontSize: width < 500 ? 16 : 22,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             StreamBuilder<List<_RecentActivity>>(
// // //               stream: recentActivitiesStream,
// // //               builder: (context, snapshot) {
// // //                 final items = snapshot.data ?? const [];
// // //                 if (items.isEmpty) {
// // //                   return _InfoCard(
// // //                     title: "No recent activity",
// // //                     subtitle: "User activity will appear here.",
// // //                     icon: Icons.timeline,
// // //                   );
// // //                 }

// // //                 return Column(
// // //                   children: items.map((item) {
// // //                     return Container(
// // //                       width: double.infinity,
// // //                       margin: const EdgeInsets.only(bottom: 12),
// // //                       padding: const EdgeInsets.all(16),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.white,
// // //                         borderRadius: BorderRadius.circular(14),
// // //                         border: Border.all(color: Colors.black12),
// // //                       ),
// // //                       child: Row(
// // //                         children: [
// // //                           const Icon(
// // //                             Icons.person_pin_circle,
// // //                             color: Colors.indigo,
// // //                           ),
// // //                           const SizedBox(width: 12),
// // //                           Expanded(
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Text(
// // //                                   item.userName,
// // //                                   style: const TextStyle(
// // //                                     fontSize: 15,
// // //                                     fontWeight: FontWeight.bold,
// // //                                   ),
// // //                                 ),
// // //                                 const SizedBox(height: 4),
// // //                                 Text(
// // //                                   item.action,
// // //                                   style: const TextStyle(
// // //                                     fontSize: 13,
// // //                                     color: Colors.black87,
// // //                                   ),
// // //                                 ),
// // //                                 if (item.dateText.isNotEmpty) ...[
// // //                                   const SizedBox(height: 4),
// // //                                   Text(
// // //                                     item.dateText,
// // //                                     style: const TextStyle(
// // //                                       fontSize: 12,
// // //                                       color: Colors.black54,
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     );
// // //                   }).toList(),
// // //                 );
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildLatestSosCard(
// // //     String name,
// // //     String doctor,
// // //     String friend,
// // //     String location,
// // //     String status,
// // //     String type,
// // //     String timeText,
// // //   ) {
// // //     return Container(
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.red[50],
// // //         borderRadius: BorderRadius.circular(14),
// // //         border: Border.all(color: Colors.red.shade100),
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Row(
// // //             children: [
// // //               const Icon(Icons.warning_rounded, color: Colors.red),
// // //               const SizedBox(width: 8),
// // //               Expanded(
// // //                 child: Text(
// // //                   name,
// // //                   style: const TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 16,
// // //                   ),
// // //                 ),
// // //               ),
// // //               Container(
// // //                 padding: const EdgeInsets.symmetric(
// // //                   horizontal: 10,
// // //                   vertical: 4,
// // //                 ),
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.red.shade100,
// // //                   borderRadius: BorderRadius.circular(20),
// // //                 ),
// // //                 child: Text(
// // //                   status,
// // //                   style: const TextStyle(
// // //                     fontSize: 12,
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           const SizedBox(height: 10),
// // //           Text("Doctor: $doctor", style: const TextStyle(fontSize: 13)),
// // //           Text("Friend: $friend", style: const TextStyle(fontSize: 13)),
// // //           Text("Type: $type", style: const TextStyle(fontSize: 13)),
// // //           const SizedBox(height: 6),
// // //           Text(
// // //             location,
// // //             maxLines: 2,
// // //             overflow: TextOverflow.ellipsis,
// // //             style: const TextStyle(fontSize: 14, height: 1.4),
// // //           ),
// // //           if (timeText.isNotEmpty) ...[
// // //             const SizedBox(height: 8),
// // //             Text(
// // //               timeText,
// // //               style: const TextStyle(fontSize: 12, color: Colors.black54),
// // //             ),
// // //           ],
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _DashboardCard extends StatelessWidget {
// // //   final String title;
// // //   final String value;
// // //   final IconData icon;

// // //   const _DashboardCard({
// // //     required this.title,
// // //     required this.value,
// // //     required this.icon,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final width = MediaQuery.of(context).size.width;
// // //     return Card(
// // //       elevation: 3,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: EdgeInsets.all(width < 500 ? 6 : 12),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
// // //             SizedBox(height: width < 500 ? 4 : 6),
// // //             Text(
// // //               value,
// // //               style: TextStyle(
// // //                 fontSize: width < 500 ? 14 : 18,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.black,
// // //               ),
// // //             ),
// // //             SizedBox(height: width < 500 ? 2 : 4),
// // //             Text(title, style: TextStyle(fontSize: width < 500 ? 9 : 12)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _InfoCard extends StatelessWidget {
// // //   final String title;
// // //   final String? subtitle;
// // //   final IconData icon;

// // //   const _InfoCard({required this.title, this.subtitle, required this.icon});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.all(16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(12),
// // //         border: Border.all(color: Colors.black12),
// // //       ),
// // //       child: Row(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Icon(icon, color: Colors.indigo),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   title,
// // //                   style: const TextStyle(fontWeight: FontWeight.bold),
// // //                 ),
// // //                 if (subtitle != null) ...[
// // //                   const SizedBox(height: 6),
// // //                   Text(
// // //                     subtitle!,
// // //                     style: const TextStyle(fontSize: 13, height: 1.4),
// // //                   ),
// // //                 ],
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class _RecentActivity {
// // //   final String action;
// // //   final String userName;
// // //   final String dateText;

// // //   const _RecentActivity({
// // //     required this.action,
// // //     required this.userName,
// // //     required this.dateText,
// // //   });
// // // }

// // // class _ChartPoint {
// // //   final String label;
// // //   final double value;

// // //   const _ChartPoint({required this.label, required this.value});
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:mentalwellapp/view/LoginPage.dart';

// // class DashboardPage extends StatefulWidget {
// //   final String username;

// //   const DashboardPage({super.key, required this.username});

// //   @override
// //   State<DashboardPage> createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends State<DashboardPage> {
// //   bool animateCharts = false;

// //   late final Stream<int> totalUsersStream;
// //   late final Stream<int> activeTodayStream;
// //   late final Stream<int> sosCountStream;
// //   late final Stream<int> motivationCountStream;
// //   late final Stream<QuerySnapshot<Map<String, dynamic>>> latestSosStream;
// //   late final Stream<List<_RecentActivity>> recentActivitiesStream;
// //   late final Stream<List<_ChartPoint>> newUsersPerMonthStream;

// //   @override
// //   void initState() {
// //     super.initState();

// //     totalUsersStream = FirebaseFirestore.instance
// //         .collection('users')
// //         .where('accountType', isEqualTo: 'User')
// //         .snapshots()
// //         .map((snapshot) => snapshot.size);

// //     activeTodayStream = _activeTodayCountStream();

// //     sosCountStream = FirebaseFirestore.instance
// //         .collection('sos_history')
// //         .snapshots()
// //         .map((snapshot) => snapshot.size);

// //     motivationCountStream = FirebaseFirestore.instance
// //         .collection('motivation_cards')
// //         .snapshots()
// //         .map((snapshot) => snapshot.size);

// //     latestSosStream = FirebaseFirestore.instance
// //         .collection('sos_history')
// //         .orderBy('createdAt', descending: true)
// //         .limit(1)
// //         .snapshots();

// //     recentActivitiesStream = FirebaseFirestore.instance
// //         .collection('activities')
// //         .orderBy('timestamp', descending: true)
// //         .limit(10)
// //         .snapshots()
// //         .map((snapshot) {
// //           return snapshot.docs.map((doc) {
// //             final data = doc.data();
// //             return _RecentActivity(
// //               action: (data['action'] ?? '').toString(),
// //               userName: (data['userName'] ?? 'Unknown').toString(),
// //               dateText: _formatIndianDate(data['timestamp']),
// //             );
// //           }).toList();
// //         });

// //     newUsersPerMonthStream = _newUsersPerMonthStream();

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       if (mounted) {
// //         setState(() => animateCharts = true);
// //       }
// //     });
// //   }

// //   Future<void> _logout() async {
// //     await FirebaseAuth.instance.signOut();
// //     if (!mounted) return;
// //     Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(builder: (_) => const LoginPage()),
// //       (route) => false,
// //     );
// //   }

// //   DateTime _startOfToday() {
// //     final now = DateTime.now();
// //     return DateTime(now.year, now.month, now.day);
// //   }

// //   DateTime _startOfTomorrow() {
// //     final today = _startOfToday();
// //     return today.add(const Duration(days: 1));
// //   }

// //   DateTime _startOfNextMonth(DateTime date) {
// //     return DateTime(date.year, date.month + 1, 1);
// //   }

// //   DateTime? _parseDate(dynamic value) {
// //     if (value is Timestamp) return value.toDate();
// //     if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
// //     return null;
// //   }

// //   String _formatIndianDate(dynamic value) {
// //     final dt = _parseDate(value);
// //     if (dt == null) return "";
// //     return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
// //   }

// //   Stream<int> _activeTodayCountStream() {
// //     final start = _startOfToday();
// //     final end = _startOfTomorrow();

// //     return FirebaseFirestore.instance
// //         .collection('users')
// //         .where('accountType', isEqualTo: 'User')
// //         .where('lastSeenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
// //         .where('lastSeenAt', isLessThan: Timestamp.fromDate(end))
// //         .snapshots()
// //         .map((snapshot) => snapshot.size);
// //   }

// //   Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
// //     final now = DateTime.now();
// //     final months = List.generate(6, (index) {
// //       final d = DateTime(now.year, now.month - 5 + index, 1);
// //       return DateTime(d.year, d.month, 1);
// //     });

// //     return FirebaseFirestore.instance
// //         .collection('users')
// //         .where('accountType', isEqualTo: 'User')
// //         .snapshots()
// //         .map((snapshot) {
// //           final points = <_ChartPoint>[];

// //           for (final monthStart in months) {
// //             final monthEnd = _startOfNextMonth(monthStart);
// //             int count = 0;

// //             for (final doc in snapshot.docs) {
// //               final data = doc.data();
// //               final createdAt =
// //                   _parseDate(data['createdAt']) ??
// //                   _parseDate(data['termsAcceptedAt']);

// //               if (createdAt != null &&
// //                   !createdAt.isBefore(monthStart) &&
// //                   createdAt.isBefore(monthEnd)) {
// //                 count++;
// //               }
// //             }

// //             points.add(
// //               _ChartPoint(
// //                 label: _monthLabel(monthStart.month),
// //                 value: count.toDouble(),
// //               ),
// //             );
// //           }

// //           return points;
// //         });
// //   }

// //   String _monthLabel(int month) {
// //     const months = [
// //       'Jan',
// //       'Feb',
// //       'Mar',
// //       'Apr',
// //       'May',
// //       'Jun',
// //       'Jul',
// //       'Aug',
// //       'Sep',
// //       'Oct',
// //       'Nov',
// //       'Dec',
// //     ];
// //     return months[month - 1];
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF9FAFC),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: [
// //             DrawerHeader(
// //               decoration: const BoxDecoration(color: Colors.indigo),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: [
// //                   const Text(
// //                     "Admin Menu",
// //                     style: TextStyle(color: Colors.white, fontSize: 24),
// //                   ),
// //                   const SizedBox(height: 6),
// //                   Text(
// //                     widget.username.isNotEmpty ? widget.username : "Admin",
// //                     style: const TextStyle(color: Colors.white70, fontSize: 14),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text("Logout"),
// //               onTap: () async {
// //                 Navigator.pop(context);
// //                 await _logout();
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         foregroundColor: Colors.black,
// //         elevation: 0,
// //         title: Text(
// //           "Dashboard",
// //           style: TextStyle(
// //             fontSize: width < 500 ? 18 : 22,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               "Dashboard Overview",
// //               style: TextStyle(
// //                 fontSize: width < 500 ? 18 : 24,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             GridView.count(
// //               crossAxisCount: 2,
// //               shrinkWrap: true,
// //               physics: const NeverScrollableScrollPhysics(),
// //               crossAxisSpacing: 12,
// //               mainAxisSpacing: 12,
// //               childAspectRatio: 1,
// //               children: [
// //                 StreamBuilder<int>(
// //                   stream: totalUsersStream,
// //                   builder: (context, snapshot) => _DashboardCard(
// //                     title: "Total Users",
// //                     value: snapshot.data?.toString() ?? "0",
// //                     icon: Icons.people,
// //                   ),
// //                 ),
// //                 StreamBuilder<int>(
// //                   stream: activeTodayStream,
// //                   builder: (context, snapshot) {
// //                     if (snapshot.hasError) {
// //                       return _DashboardCard(
// //                         title: "Active Today",
// //                         value: "0",
// //                         icon: Icons.bolt,
// //                       );
// //                     }

// //                     if (snapshot.connectionState == ConnectionState.waiting) {
// //                       return _DashboardCard(
// //                         title: "Active Today",
// //                         value: "...",
// //                         icon: Icons.bolt,
// //                       );
// //                     }

// //                     return _DashboardCard(
// //                       title: "Active Today",
// //                       value: (snapshot.data ?? 0).toString(),
// //                       icon: Icons.bolt,
// //                     );
// //                   },
// //                 ),
// //                 StreamBuilder<int>(
// //                   stream: sosCountStream,
// //                   builder: (context, snapshot) => _DashboardCard(
// //                     title: "SOS Requests",
// //                     value: snapshot.data?.toString() ?? "0",
// //                     icon: Icons.sos,
// //                   ),
// //                 ),
// //                 StreamBuilder<int>(
// //                   stream: motivationCountStream,
// //                   builder: (context, snapshot) => _DashboardCard(
// //                     title: "Motivational Cards",
// //                     value: snapshot.data?.toString() ?? "0",
// //                     icon: Icons.auto_awesome,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 24),
// //             Text(
// //               "Latest SOS Request",
// //               style: TextStyle(
// //                 fontSize: width < 500 ? 14 : 18,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// //               stream: latestSosStream,
// //               builder: (context, snapshot) {
// //                 if (snapshot.hasError) {
// //                   return _InfoCard(
// //                     title: "Unable to load latest SOS request",
// //                     subtitle: "Please check Firestore fields and index.",
// //                     icon: Icons.error_outline,
// //                   );
// //                 }

// //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //                   return _InfoCard(
// //                     title: "No SOS requests yet",
// //                     subtitle: "Latest SOS preview will appear here.",
// //                     icon: Icons.notifications_none,
// //                   );
// //                 }

// //                 final data = snapshot.data!.docs.first.data();
// //                 return _buildLatestSosCard(
// //                   (data['userName'] ?? 'Unknown').toString(),
// //                   (data['doctor'] ?? '').toString(),
// //                   (data['friend'] ?? '').toString(),
// //                   (data['location'] ?? 'Location unavailable').toString(),
// //                   (data['status'] ?? 'pending').toString(),
// //                   (data['type'] ?? '').toString(),
// //                   _formatIndianDate(data['createdAt']),
// //                 );
// //               },
// //             ),
// //             const SizedBox(height: 24),
// //             Text(
// //               "User Growth",
// //               style: TextStyle(
// //                 fontSize: width < 500 ? 16 : 22,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             Container(
// //               height: 250,
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.indigo[50],
// //                 borderRadius: BorderRadius.circular(16),
// //               ),
// //               child: StreamBuilder<List<_ChartPoint>>(
// //                 stream: newUsersPerMonthStream,
// //                 builder: (context, snapshot) {
// //                   final points =
// //                       snapshot.data ??
// //                       const [
// //                         _ChartPoint(label: 'Jan', value: 0),
// //                         _ChartPoint(label: 'Feb', value: 0),
// //                         _ChartPoint(label: 'Mar', value: 0),
// //                         _ChartPoint(label: 'Apr', value: 0),
// //                         _ChartPoint(label: 'May', value: 0),
// //                         _ChartPoint(label: 'Jun', value: 0),
// //                       ];

// //                   final maxValue = points.isEmpty
// //                       ? 1.0
// //                       : points
// //                             .map((e) => e.value)
// //                             .reduce((a, b) => a > b ? a : b);
// //                   final safeMax = maxValue <= 0 ? 1.0 : maxValue;

// //                   return Column(
// //                     children: [
// //                       Expanded(
// //                         child: Row(
// //                           crossAxisAlignment: CrossAxisAlignment.end,
// //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                           children: points.map((p) {
// //                             return Expanded(
// //                               child: Padding(
// //                                 padding: const EdgeInsets.symmetric(
// //                                   horizontal: 4,
// //                                 ),
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.end,
// //                                   children: [
// //                                     Text(
// //                                       p.value.toInt().toString(),
// //                                       style: const TextStyle(
// //                                         fontSize: 12,
// //                                         fontWeight: FontWeight.w600,
// //                                       ),
// //                                     ),
// //                                     const SizedBox(height: 6),
// //                                     AnimatedContainer(
// //                                       duration: const Duration(
// //                                         milliseconds: 900,
// //                                       ),
// //                                       curve: Curves.easeOutCubic,
// //                                       width: 18,
// //                                       height: animateCharts
// //                                           ? (150 * (p.value / safeMax))
// //                                           : 0,
// //                                       decoration: BoxDecoration(
// //                                         gradient: const LinearGradient(
// //                                           colors: [
// //                                             Color(0xFF636AE8),
// //                                             Color(0xFF8E59FF),
// //                                           ],
// //                                           begin: Alignment.topCenter,
// //                                           end: Alignment.bottomCenter,
// //                                         ),
// //                                         borderRadius: BorderRadius.circular(8),
// //                                       ),
// //                                     ),
// //                                     const SizedBox(height: 8),
// //                                     Text(
// //                                       p.label,
// //                                       style: const TextStyle(
// //                                         fontSize: 12,
// //                                         fontWeight: FontWeight.w500,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             );
// //                           }).toList(),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 10),
// //                       const Text(
// //                         "New Users Per Month",
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                     ],
// //                   );
// //                 },
// //               ),
// //             ),
// //             const SizedBox(height: 24),
// //             Text(
// //               "Recent Activity",
// //               style: TextStyle(
// //                 fontSize: width < 500 ? 16 : 22,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             StreamBuilder<List<_RecentActivity>>(
// //               stream: recentActivitiesStream,
// //               builder: (context, snapshot) {
// //                 final items = snapshot.data ?? const [];
// //                 if (items.isEmpty) {
// //                   return _InfoCard(
// //                     title: "No recent activity",
// //                     subtitle: "User activity will appear here.",
// //                     icon: Icons.timeline,
// //                   );
// //                 }

// //                 return Column(
// //                   children: items.map((item) {
// //                     return Container(
// //                       width: double.infinity,
// //                       margin: const EdgeInsets.only(bottom: 12),
// //                       padding: const EdgeInsets.all(16),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(14),
// //                         border: Border.all(color: Colors.black12),
// //                       ),
// //                       child: Row(
// //                         children: [
// //                           const Icon(
// //                             Icons.person_pin_circle,
// //                             color: Colors.indigo,
// //                           ),
// //                           const SizedBox(width: 12),
// //                           Expanded(
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   item.userName,
// //                                   style: const TextStyle(
// //                                     fontSize: 15,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                                 const SizedBox(height: 4),
// //                                 Text(
// //                                   item.action,
// //                                   style: const TextStyle(
// //                                     fontSize: 13,
// //                                     color: Colors.black87,
// //                                   ),
// //                                 ),
// //                                 if (item.dateText.isNotEmpty) ...[
// //                                   const SizedBox(height: 4),
// //                                   Text(
// //                                     item.dateText,
// //                                     style: const TextStyle(
// //                                       fontSize: 12,
// //                                       color: Colors.black54,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   }).toList(),
// //                 );
// //               },
// //             ),
// //             const SizedBox(height: 24),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildLatestSosCard(
// //     String name,
// //     String doctor,
// //     String friend,
// //     String location,
// //     String status,
// //     String type,
// //     String timeText,
// //   ) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.red[50],
// //         borderRadius: BorderRadius.circular(14),
// //         border: Border.all(color: Colors.red.shade100),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               const Icon(Icons.warning_rounded, color: Colors.red),
// //               const SizedBox(width: 8),
// //               Expanded(
// //                 child: Text(
// //                   name,
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 16,
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 10,
// //                   vertical: 4,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: Colors.red.shade100,
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Text(
// //                   status,
// //                   style: const TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           Text("Doctor: $doctor", style: const TextStyle(fontSize: 13)),
// //           Text("Friend: $friend", style: const TextStyle(fontSize: 13)),
// //           Text("Type: $type", style: const TextStyle(fontSize: 13)),
// //           const SizedBox(height: 6),
// //           Text(
// //             location,
// //             maxLines: 2,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(fontSize: 14, height: 1.4),
// //           ),
// //           if (timeText.isNotEmpty) ...[
// //             const SizedBox(height: 8),
// //             Text(
// //               timeText,
// //               style: const TextStyle(fontSize: 12, color: Colors.black54),
// //             ),
// //           ],
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _DashboardCard extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   final IconData icon;

// //   const _DashboardCard({
// //     required this.title,
// //     required this.value,
// //     required this.icon,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;

// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: EdgeInsets.all(width < 500 ? 6 : 12),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
// //             SizedBox(height: width < 500 ? 4 : 6),
// //             Text(
// //               value,
// //               style: TextStyle(
// //                 fontSize: width < 500 ? 14 : 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: width < 500 ? 2 : 4),
// //             Text(
// //               title,
// //               textAlign: TextAlign.center,
// //               style: TextStyle(fontSize: width < 500 ? 9 : 12),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _InfoCard extends StatelessWidget {
// //   final String title;
// //   final String? subtitle;
// //   final IconData icon;

// //   const _InfoCard({required this.title, this.subtitle, required this.icon});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(color: Colors.black12),
// //       ),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Icon(icon, color: Colors.indigo),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: const TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //                 if (subtitle != null) ...[
// //                   const SizedBox(height: 6),
// //                   Text(
// //                     subtitle!,
// //                     style: const TextStyle(fontSize: 13, height: 1.4),
// //                   ),
// //                 ],
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _RecentActivity {
// //   final String action;
// //   final String userName;
// //   final String dateText;

// //   const _RecentActivity({
// //     required this.action,
// //     required this.userName,
// //     required this.dateText,
// //   });
// // }

// // class _ChartPoint {
// //   final String label;
// //   final double value;

// //   const _ChartPoint({required this.label, required this.value});
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mentalwellapp/view/LoginPage.dart';

// class DashboardPage extends StatefulWidget {
//   final String username;

//   const DashboardPage({super.key, required this.username});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   bool animateCharts = false;

//   late final Stream<int> totalUsersStream;
//   late final Stream<int> activeTodayStream;
//   late final Stream<int> sosCountStream;
//   late final Stream<int> motivationCountStream;
//   late final Stream<QuerySnapshot<Map<String, dynamic>>> latestSosStream;
//   late final Stream<List<_RecentActivity>> recentActivitiesStream;
//   late final Stream<List<_ChartPoint>> newUsersPerMonthStream;

//   @override
//   void initState() {
//     super.initState();

//     totalUsersStream = FirebaseFirestore.instance
//         .collection('users')
//         .where('accountType', isEqualTo: 'User')
//         .snapshots()
//         .map((snapshot) => snapshot.size);

//     activeTodayStream = _activeTodayCountStream();

//     sosCountStream = FirebaseFirestore.instance
//         .collection('sos_history')
//         .snapshots()
//         .map((snapshot) => snapshot.size);

//     motivationCountStream = FirebaseFirestore.instance
//         .collection('motivation_cards')
//         .snapshots()
//         .map((snapshot) => snapshot.size);

//     latestSosStream = FirebaseFirestore.instance
//         .collection('sos_history')
//         .orderBy('createdAt', descending: true)
//         .limit(1)
//         .snapshots();

//     recentActivitiesStream = FirebaseFirestore.instance
//         .collection('activities')
//         .orderBy('timestamp', descending: true)
//         .limit(10)
//         .snapshots()
//         .map((snapshot) {
//           return snapshot.docs.map((doc) {
//             final data = doc.data();
//             return _RecentActivity(
//               action: (data['action'] ?? '').toString(),
//               userName: (data['userName'] ?? 'Unknown').toString(),
//               dateText: _formatIndianDate(data['timestamp']),
//             );
//           }).toList();
//         });

//     newUsersPerMonthStream = _newUsersPerMonthStream();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         setState(() => animateCharts = true);
//       }
//     });
//   }

//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (!mounted) return;
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginPage()),
//       (route) => false,
//     );
//   }

//   DateTime _startOfToday() {
//     final now = DateTime.now();
//     return DateTime(now.year, now.month, now.day);
//   }

//   DateTime _startOfTomorrow() {
//     final today = _startOfToday();
//     return today.add(const Duration(days: 1));
//   }

//   DateTime _startOfNextMonth(DateTime date) {
//     return DateTime(date.year, date.month + 1, 1);
//   }

//   DateTime? _parseDate(dynamic value) {
//     if (value is Timestamp) return value.toDate();
//     if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
//     return null;
//   }

//   String _formatIndianDate(dynamic value) {
//     final dt = _parseDate(value);
//     if (dt == null) return "";
//     return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
//   }

//   Stream<int> _activeTodayCountStream() {
//     final start = _startOfToday();
//     final end = _startOfTomorrow();

//     return FirebaseFirestore.instance
//         .collection('users')
//         .where('accountType', isEqualTo: 'User')
//         .where('lastSeenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
//         .where('lastSeenAt', isLessThan: Timestamp.fromDate(end))
//         .snapshots()
//         .map((snapshot) => snapshot.size);
//   }

//   Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
//     final now = DateTime.now();
//     final months = List.generate(6, (index) {
//       final d = DateTime(now.year, now.month - 5 + index, 1);
//       return DateTime(d.year, d.month, 1);
//     });

//     return FirebaseFirestore.instance
//         .collection('users')
//         .where('accountType', isEqualTo: 'User')
//         .snapshots()
//         .map((snapshot) {
//           final points = <_ChartPoint>[];

//           for (final monthStart in months) {
//             final monthEnd = _startOfNextMonth(monthStart);
//             int count = 0;

//             for (final doc in snapshot.docs) {
//               final data = doc.data();
//               final createdAt =
//                   _parseDate(data['createdAt']) ??
//                   _parseDate(data['termsAcceptedAt']);

//               if (createdAt != null &&
//                   !createdAt.isBefore(monthStart) &&
//                   createdAt.isBefore(monthEnd)) {
//                 count++;
//               }
//             }

//             points.add(
//               _ChartPoint(
//                 label: _monthLabel(monthStart.month),
//                 value: count.toDouble(),
//               ),
//             );
//           }

//           return points;
//         });
//   }

//   String _monthLabel(int month) {
//     const months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return months[month - 1];
//   }

//   double _chartMaxY(List<_ChartPoint> points) {
//     if (points.isEmpty) return 6;
//     final max = points.map((e) => e.value).reduce((a, b) => a > b ? a : b);
//     if (max <= 0) return 6;
//     if (max <= 5) return 6;
//     return (max + 2).ceilToDouble();
//   }

//   double _chartInterval(double maxY) {
//     if (maxY <= 6) return 1;
//     if (maxY <= 12) return 2;
//     if (maxY <= 30) return 5;
//     return (maxY / 5).ceilToDouble();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isSmall = width < 500;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFC),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.indigo),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text(
//                     "Admin Menu",
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     widget.username.isNotEmpty ? widget.username : "Admin",
//                     style: const TextStyle(color: Colors.white70, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text("Logout"),
//               onTap: () async {
//                 Navigator.pop(context);
//                 await _logout();
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         title: Text(
//           "Dashboard",
//           style: TextStyle(
//             fontSize: isSmall ? 18 : 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Dashboard Overview",
//               style: TextStyle(
//                 fontSize: isSmall ? 18 : 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//               childAspectRatio: 1,
//               children: [
//                 StreamBuilder<int>(
//                   stream: totalUsersStream,
//                   builder: (context, snapshot) => _DashboardCard(
//                     title: "Total Users",
//                     value: snapshot.data?.toString() ?? "0",
//                     icon: Icons.people,
//                   ),
//                 ),
//                 StreamBuilder<int>(
//                   stream: activeTodayStream,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return _DashboardCard(
//                         title: "Active Today",
//                         value: "0",
//                         icon: Icons.bolt,
//                       );
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return _DashboardCard(
//                         title: "Active Today",
//                         value: "...",
//                         icon: Icons.bolt,
//                       );
//                     }

//                     return _DashboardCard(
//                       title: "Active Today",
//                       value: (snapshot.data ?? 0).toString(),
//                       icon: Icons.bolt,
//                     );
//                   },
//                 ),
//                 StreamBuilder<int>(
//                   stream: sosCountStream,
//                   builder: (context, snapshot) => _DashboardCard(
//                     title: "SOS Requests",
//                     value: snapshot.data?.toString() ?? "0",
//                     icon: Icons.sos,
//                   ),
//                 ),
//                 StreamBuilder<int>(
//                   stream: motivationCountStream,
//                   builder: (context, snapshot) => _DashboardCard(
//                     title: "Motivational Cards",
//                     value: snapshot.data?.toString() ?? "0",
//                     icon: Icons.auto_awesome,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             Text(
//               "Latest SOS Request",
//               style: TextStyle(
//                 fontSize: isSmall ? 14 : 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               stream: latestSosStream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return _InfoCard(
//                     title: "Unable to load latest SOS request",
//                     subtitle: "Please check Firestore fields and index.",
//                     icon: Icons.error_outline,
//                   );
//                 }

//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return _InfoCard(
//                     title: "No SOS requests yet",
//                     subtitle: "Latest SOS preview will appear here.",
//                     icon: Icons.notifications_none,
//                   );
//                 }

//                 final data = snapshot.data!.docs.first.data();
//                 return _buildLatestSosCard(
//                   (data['userName'] ?? 'Unknown').toString(),
//                   (data['doctor'] ?? '').toString(),
//                   (data['friend'] ?? '').toString(),
//                   (data['location'] ?? 'Location unavailable').toString(),
//                   (data['status'] ?? 'pending').toString(),
//                   (data['type'] ?? '').toString(),
//                   _formatIndianDate(data['createdAt']),
//                 );
//               },
//             ),
//             const SizedBox(height: 24),
//             Text(
//               "User Growth",
//               style: TextStyle(
//                 fontSize: isSmall ? 16 : 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildUserGrowthChart(isSmall),
//             const SizedBox(height: 24),
//             Text(
//               "Recent Activity",
//               style: TextStyle(
//                 fontSize: isSmall ? 16 : 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 12),
//             StreamBuilder<List<_RecentActivity>>(
//               stream: recentActivitiesStream,
//               builder: (context, snapshot) {
//                 final items = snapshot.data ?? const [];
//                 if (items.isEmpty) {
//                   return _InfoCard(
//                     title: "No recent activity",
//                     subtitle: "User activity will appear here.",
//                     icon: Icons.timeline,
//                   );
//                 }

//                 return Column(
//                   children: items.map((item) {
//                     return Container(
//                       width: double.infinity,
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(14),
//                         border: Border.all(color: Colors.black12),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.person_pin_circle,
//                             color: Colors.indigo,
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.userName,
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   item.action,
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 if (item.dateText.isNotEmpty) ...[
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     item.dateText,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ],
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildUserGrowthChart(bool isSmall) {
//     return Container(
//       height: isSmall ? 300 : 340,
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: Colors.black12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 14,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: StreamBuilder<List<_ChartPoint>>(
//         stream: newUsersPerMonthStream,
//         builder: (context, snapshot) {
//           final points =
//               snapshot.data ??
//               const [
//                 _ChartPoint(label: 'Jan', value: 0),
//                 _ChartPoint(label: 'Feb', value: 0),
//                 _ChartPoint(label: 'Mar', value: 0),
//                 _ChartPoint(label: 'Apr', value: 0),
//                 _ChartPoint(label: 'May', value: 0),
//                 _ChartPoint(label: 'Jun', value: 0),
//               ];

//           final maxY = _chartMaxY(points);
//           final interval = _chartInterval(maxY);

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.indigo.withOpacity(0.08),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Icon(
//                       Icons.bar_chart_rounded,
//                       color: Colors.indigo,
//                       size: 20,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   const Expanded(
//                     child: Text(
//                       "New Users Per Month",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 18),
//               Expanded(
//                 child: BarChart(
//                   BarChartData(
//                     minY: 0,
//                     maxY: maxY,
//                     alignment: BarChartAlignment.spaceAround,
//                     groupsSpace: isSmall ? 8 : 14,
//                     barTouchData: BarTouchData(
//                       enabled: true,
//                       handleBuiltInTouches: true,
//                       touchTooltipData: BarTouchTooltipData(
//                         tooltipRoundedRadius: 12,
//                         tooltipMargin: 8,
//                         fitInsideHorizontally: true,
//                         fitInsideVertically: true,
//                         getTooltipColor: (_) => Colors.indigo.shade400,
//                         getTooltipItem: (group, groupIndex, rod, rodIndex) {
//                           final index = group.x.toInt();
//                           final month = index >= 0 && index < points.length
//                               ? points[index].label
//                               : '';
//                           return BarTooltipItem(
//                             '$month\n${rod.toY.toInt()} users',
//                             const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               height: 1.4,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     gridData: FlGridData(
//                       show: true,
//                       drawVerticalLine: false,
//                       horizontalInterval: interval,
//                       getDrawingHorizontalLine: (value) {
//                         return FlLine(
//                           color: Colors.grey.withOpacity(0.16),
//                           strokeWidth: 1,
//                         );
//                       },
//                     ),
//                     borderData: FlBorderData(show: false),
//                     titlesData: FlTitlesData(
//                       topTitles: const AxisTitles(
//                         sideTitles: SideTitles(showTitles: false),
//                       ),
//                       rightTitles: const AxisTitles(
//                         sideTitles: SideTitles(showTitles: false),
//                       ),
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: isSmall ? 26 : 32,
//                           interval: interval,
//                           getTitlesWidget: (value, meta) {
//                             return Padding(
//                               padding: const EdgeInsets.only(right: 6),
//                               child: Text(
//                                 value.toInt().toString(),
//                                 style: TextStyle(
//                                   fontSize: isSmall ? 9 : 10,
//                                   color: Colors.black54,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 28,
//                           getTitlesWidget: (value, meta) {
//                             final index = value.toInt();
//                             if (index < 0 || index >= points.length) {
//                               return const SizedBox.shrink();
//                             }

//                             return Padding(
//                               padding: const EdgeInsets.only(top: 8),
//                               child: Text(
//                                 points[index].label,
//                                 style: TextStyle(
//                                   fontSize: isSmall ? 10 : 11,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     barGroups: List.generate(points.length, (index) {
//                       final point = points[index];
//                       final isLatestBar = index == points.length - 1;

//                       return BarChartGroupData(
//                         x: index,
//                         barRods: [
//                           BarChartRodData(
//                             toY: animateCharts ? point.value : 0,
//                             width: isSmall ? 16 : 22,
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8),
//                             ),
//                             gradient: LinearGradient(
//                               begin: Alignment.bottomCenter,
//                               end: Alignment.topCenter,
//                               colors: isLatestBar
//                                   ? const [Color(0xFF4F46E5), Color(0xFF7C3AED)]
//                                   : const [
//                                       Color(0xFF818CF8),
//                                       Color(0xFFA78BFA),
//                                     ],
//                             ),
//                             backDrawRodData: BackgroundBarChartRodData(
//                               show: true,
//                               toY: maxY,
//                               color: const Color(0xFFF1F3F8),
//                             ),
//                           ),
//                         ],
//                       );
//                     }),
//                   ),
//                   swapAnimationDuration: const Duration(milliseconds: 800),
//                   swapAnimationCurve: Curves.easeOutCubic,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildLatestSosCard(
//     String name,
//     String doctor,
//     String friend,
//     String location,
//     String status,
//     String type,
//     String timeText,
//   ) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.red[50],
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.red.shade100),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Icon(Icons.warning_rounded, color: Colors.red),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.red.shade100,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   status,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text("Doctor: $doctor", style: const TextStyle(fontSize: 13)),
//           Text("Friend: $friend", style: const TextStyle(fontSize: 13)),
//           Text("Type: $type", style: const TextStyle(fontSize: 13)),
//           const SizedBox(height: 6),
//           Text(
//             location,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(fontSize: 14, height: 1.4),
//           ),
//           if (timeText.isNotEmpty) ...[
//             const SizedBox(height: 8),
//             Text(
//               timeText,
//               style: const TextStyle(fontSize: 12, color: Colors.black54),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// class _DashboardCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;

//   const _DashboardCard({
//     required this.title,
//     required this.value,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Card(
//       elevation: 3,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       child: Padding(
//         padding: EdgeInsets.all(width < 500 ? 8 : 12),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
//             SizedBox(height: width < 500 ? 6 : 8),
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: width < 500 ? 16 : 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: width < 500 ? 4 : 6),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: width < 500 ? 10 : 12,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _InfoCard extends StatelessWidget {
//   final String title;
//   final String? subtitle;
//   final IconData icon;

//   const _InfoCard({required this.title, this.subtitle, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.black12),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: Colors.indigo),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 if (subtitle != null) ...[
//                   const SizedBox(height: 6),
//                   Text(
//                     subtitle!,
//                     style: const TextStyle(fontSize: 13, height: 1.4),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _RecentActivity {
//   final String action;
//   final String userName;
//   final String dateText;

//   const _RecentActivity({
//     required this.action,
//     required this.userName,
//     required this.dateText,
//   });
// }

// class _ChartPoint {
//   final String label;
//   final double value;

//   const _ChartPoint({required this.label, required this.value});
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentalwellapp/view/LoginPage.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool animateCharts = false;

  late final Stream<int> totalUsersStream;
  late final Stream<int> activeTodayStream;
  late final Stream<int> sosCountStream;
  late final Stream<int> motivationCountStream;
  late final Stream<QuerySnapshot<Map<String, dynamic>>> latestSosStream;
  late final Stream<List<_RecentActivity>> recentActivitiesStream;
  late final Stream<List<_ChartPoint>> newUsersPerMonthStream;

  @override
  void initState() {
    super.initState();

    totalUsersStream = FirebaseFirestore.instance
        .collection('users')
        .where('accountType', isEqualTo: 'User')
        .snapshots()
        .map((snapshot) => snapshot.size);

    activeTodayStream = _activeTodayCountStream();

    sosCountStream = FirebaseFirestore.instance
        .collection('sos_history')
        .snapshots()
        .map((snapshot) => snapshot.size);

    motivationCountStream = FirebaseFirestore.instance
        .collection('motivation_cards')
        .snapshots()
        .map((snapshot) => snapshot.size);

    latestSosStream = FirebaseFirestore.instance
        .collection('sos_history')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots();

    recentActivitiesStream = FirebaseFirestore.instance
        .collection('activities')
        .orderBy('timestamp', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .where((doc) {
                final data = doc.data();
                final accountType = (data['accountType'] ?? '')
                    .toString()
                    .toLowerCase();
                final role = (data['role'] ?? '').toString().toLowerCase();
                final isAdmin = accountType == 'admin' || role == 'admin';
                return !isAdmin;
              })
              .map((doc) {
                final data = doc.data();
                return _RecentActivity(
                  action: (data['action'] ?? '').toString(),
                  userName: (data['userName'] ?? 'Unknown').toString(),
                  dateText: _formatIndianDate(data['timestamp']),
                );
              })
              .toList();
        });

    newUsersPerMonthStream = _newUsersPerMonthStream();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => animateCharts = true);
      }
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  DateTime _startOfToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  DateTime _startOfTomorrow() {
    final today = _startOfToday();
    return today.add(const Duration(days: 1));
  }

  DateTime _startOfNextMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 1);
  }

  DateTime? _parseDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
    return null;
  }

  String _formatIndianDate(dynamic value) {
    final dt = _parseDate(value);
    if (dt == null) return "";
    return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
  }

  Stream<int> _activeTodayCountStream() {
    final start = _startOfToday();
    final end = _startOfTomorrow();

    return FirebaseFirestore.instance
        .collection('users')
        .where('accountType', isEqualTo: 'User')
        .where('lastSeenAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('lastSeenAt', isLessThan: Timestamp.fromDate(end))
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<List<_ChartPoint>> _newUsersPerMonthStream() {
    final now = DateTime.now();
    final months = List.generate(6, (index) {
      final d = DateTime(now.year, now.month - 5 + index, 1);
      return DateTime(d.year, d.month, 1);
    });

    return FirebaseFirestore.instance
        .collection('users')
        .where('accountType', isEqualTo: 'User')
        .snapshots()
        .map((snapshot) {
          final points = <_ChartPoint>[];

          for (final monthStart in months) {
            final monthEnd = _startOfNextMonth(monthStart);
            int count = 0;

            for (final doc in snapshot.docs) {
              final data = doc.data();
              final createdAt =
                  _parseDate(data['createdAt']) ??
                  _parseDate(data['termsAcceptedAt']);

              if (createdAt != null &&
                  !createdAt.isBefore(monthStart) &&
                  createdAt.isBefore(monthEnd)) {
                count++;
              }
            }

            points.add(
              _ChartPoint(
                label: _monthLabel(monthStart.month),
                value: count.toDouble(),
              ),
            );
          }

          return points;
        });
  }

  String _monthLabel(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  double _chartMaxY(List<_ChartPoint> points) {
    if (points.isEmpty) return 6;
    final max = points.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    if (max <= 0) return 6;
    if (max <= 5) return 6;
    return (max + 2).ceilToDouble();
  }

  double _chartInterval(double maxY) {
    if (maxY <= 6) return 1;
    if (maxY <= 12) return 2;
    if (maxY <= 30) return 5;
    return (maxY / 5).ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 500;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.indigo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Admin Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.username.isNotEmpty ? widget.username : "Admin",
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                Navigator.pop(context);
                await _logout();
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Dashboard Overview",
            //   style: TextStyle(
            //     fontSize: isSmall ? 18 : 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              children: [
                StreamBuilder<int>(
                  stream: totalUsersStream,
                  builder: (context, snapshot) => _DashboardCard(
                    title: "Total Users",
                    value: snapshot.data?.toString() ?? "0",
                    icon: Icons.people,
                  ),
                ),
                StreamBuilder<int>(
                  stream: activeTodayStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return _DashboardCard(
                        title: "Active Today",
                        value: "0",
                        icon: Icons.bolt,
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return _DashboardCard(
                        title: "Active Today",
                        value: "...",
                        icon: Icons.bolt,
                      );
                    }

                    return _DashboardCard(
                      title: "Active Today",
                      value: (snapshot.data ?? 0).toString(),
                      icon: Icons.bolt,
                    );
                  },
                ),
                StreamBuilder<int>(
                  stream: sosCountStream,
                  builder: (context, snapshot) => _DashboardCard(
                    title: "SOS Requests",
                    value: snapshot.data?.toString() ?? "0",
                    icon: Icons.sos,
                  ),
                ),
                StreamBuilder<int>(
                  stream: motivationCountStream,
                  builder: (context, snapshot) => _DashboardCard(
                    title: "Motivational Cards",
                    value: snapshot.data?.toString() ?? "0",
                    icon: Icons.auto_awesome,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "Latest SOS Request",
              style: TextStyle(
                fontSize: isSmall ? 14 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: latestSosStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return _InfoCard(
                    title: "Unable to load latest SOS request",
                    subtitle: "Please check Firestore fields and index.",
                    icon: Icons.error_outline,
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return _InfoCard(
                    title: "No SOS requests yet",
                    subtitle: "Latest SOS preview will appear here.",
                    icon: Icons.notifications_none,
                  );
                }

                final data = snapshot.data!.docs.first.data();
                return _buildLatestSosCard(
                  (data['userName'] ?? 'Unknown').toString(),
                  (data['doctor'] ?? '').toString(),
                  (data['friend'] ?? '').toString(),
                  (data['location'] ?? 'Location unavailable').toString(),
                  (data['status'] ?? 'pending').toString(),
                  (data['type'] ?? '').toString(),
                  _formatIndianDate(data['createdAt']),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              "User Growth",
              style: TextStyle(
                fontSize: isSmall ? 16 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildUserGrowthChart(isSmall),
            const SizedBox(height: 24),
            Text(
              "Recent Activity",
              style: TextStyle(
                fontSize: isSmall ? 16 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            StreamBuilder<List<_RecentActivity>>(
              stream: recentActivitiesStream,
              builder: (context, snapshot) {
                final items = snapshot.data ?? const [];
                if (items.isEmpty) {
                  return _InfoCard(
                    title: "No recent activity",
                    subtitle: "User activity will appear here.",
                    icon: Icons.timeline,
                  );
                }

                return Column(
                  children: items.map((item) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_pin_circle,
                            color: Colors.indigo,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.userName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.action,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (item.dateText.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    item.dateText,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildUserGrowthChart(bool isSmall) {
    return Container(
      height: isSmall ? 300 : 340,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: StreamBuilder<List<_ChartPoint>>(
        stream: newUsersPerMonthStream,
        builder: (context, snapshot) {
          final points =
              snapshot.data ??
              const [
                _ChartPoint(label: 'Jan', value: 0),
                _ChartPoint(label: 'Feb', value: 0),
                _ChartPoint(label: 'Mar', value: 0),
                _ChartPoint(label: 'Apr', value: 0),
                _ChartPoint(label: 'May', value: 0),
                _ChartPoint(label: 'Jun', value: 0),
              ];

          final maxY = _chartMaxY(points);
          final interval = _chartInterval(maxY);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.indigo,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "New Users Per Month",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: BarChart(
                  BarChartData(
                    minY: 0,
                    maxY: maxY,
                    alignment: BarChartAlignment.spaceAround,
                    groupsSpace: isSmall ? 8 : 14,
                    barTouchData: BarTouchData(
                      enabled: true,
                      handleBuiltInTouches: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipRoundedRadius: 12,
                        tooltipMargin: 8,
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        getTooltipColor: (_) => Colors.indigo.shade400,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final index = group.x.toInt();
                          final month = index >= 0 && index < points.length
                              ? points[index].label
                              : '';
                          return BarTooltipItem(
                            '$month\n${rod.toY.toInt()} users',
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          );
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: interval,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.16),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: isSmall ? 26 : 32,
                          interval: interval,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  fontSize: isSmall ? 9 : 10,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= points.length) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                points[index].label,
                                style: TextStyle(
                                  fontSize: isSmall ? 10 : 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: List.generate(points.length, (index) {
                      final point = points[index];
                      final isLatestBar = index == points.length - 1;

                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: animateCharts ? point.value : 0,
                            width: isSmall ? 16 : 22,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: isLatestBar
                                  ? const [Color(0xFF4F46E5), Color(0xFF7C3AED)]
                                  : const [
                                      Color(0xFF818CF8),
                                      Color(0xFFA78BFA),
                                    ],
                            ),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: maxY,
                              color: const Color(0xFFF1F3F8),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 800),
                  swapAnimationCurve: Curves.easeOutCubic,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLatestSosCard(
    String name,
    String doctor,
    String friend,
    String location,
    String status,
    String type,
    String timeText,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_rounded, color: Colors.red),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text("Doctor: $doctor", style: const TextStyle(fontSize: 13)),
          Text("Friend: $friend", style: const TextStyle(fontSize: 13)),
          Text("Type: $type", style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 6),
          Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
          if (timeText.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              timeText,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(width < 500 ? 8 : 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
            SizedBox(height: width < 500 ? 6 : 8),
            Text(
              value,
              style: TextStyle(
                fontSize: width < 500 ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: width < 500 ? 4 : 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width < 500 ? 10 : 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const _InfoCard({required this.title, this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    subtitle!,
                    style: const TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentActivity {
  final String action;
  final String userName;
  final String dateText;

  const _RecentActivity({
    required this.action,
    required this.userName,
    required this.dateText,
  });
}

class _ChartPoint {
  final String label;
  final double value;

  const _ChartPoint({required this.label, required this.value});
}
