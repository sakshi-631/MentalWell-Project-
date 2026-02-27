// // import 'package:flutter/material.dart';

// // class ReportsPage extends StatelessWidget {
// //   const ReportsPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;
// //     return SingleChildScrollView(
// //       padding: const EdgeInsets.all(16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Text("Reports & Analytics",
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 16),

// //           // User Activity Analytics
// //           Container(
// //             height: 220,
// //             decoration: BoxDecoration(
// //               color: Colors.green[50],
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: const Center(
// //               child: Text(
// //                   "📊 User Activity Chart Placeholder\nTrack daily, weekly, and monthly engagement trends"),
// //             ),
// //           ),
// //           const SizedBox(height: 16),

// //           // Content Analytics
// //           Container(
// //             height: 220,
// //             decoration: BoxDecoration(
// //               color: Colors.orange[50],
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: const Center(
// //               child: Text(
// //                   "📈 Content Engagement Chart Placeholder\nMonitor most popular content and user interaction"),
// //             ),
// //           ),
// //           const SizedBox(height: 16),

// //           // Summary Cards
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: _AnalyticsCard(
// //                     title: "Total Users", value: "1200", color: Colors.blue),
// //               ),
// //               const SizedBox(width: 16),
// //               Expanded(
// //                 child: _AnalyticsCard(
// //                     title: "Active Users Today",
// //                     value: "350",
// //                     color: Colors.green),
// //               ),
// //               const SizedBox(width: 16),
// //               Expanded(
// //                 child: _AnalyticsCard(
// //                     title: "Total SOS Requests", value: "5", color: Colors.red),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _AnalyticsCard extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   final Color color;

// //   const _AnalyticsCard(
// //       {required this.title, required this.value, required this.color});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
// //             const SizedBox(height: 10),
// //             Text(value,
// //                 style: const TextStyle(
// //                     fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:intl/intl.dart';

// class ReportsPage extends StatefulWidget {
//   const ReportsPage({super.key});

//   @override
//   State<ReportsPage> createState() => _ReportsPageState();
// }

// class _ReportsPageState extends State<ReportsPage> {
//   late final Stream<int> totalUsersStream;
//   late final Stream<int> activeTodayStream;
//   late final Stream<int> totalSosStream;
//   late final Stream<int> motivationCardsStream;
//   late final Stream<List<_MonthPoint>> monthlyActivityStream;
//   late final Stream<List<_RecentEvent>> recentSosStream;

//   @override
//   void initState() {
//     super.initState();

//     totalUsersStream = _countStream(
//       FirebaseFirestore.instance
//           .collection('users')
//           .where('accountType', isEqualTo: 'User'),
//     );

//     activeTodayStream = _countStream(
//       FirebaseFirestore.instance
//           .collection('users')
//           .where('accountType', isEqualTo: 'User')
//           .where(
//             'lastSeenAt',
//             isGreaterThanOrEqualTo: Timestamp.fromDate(_startOfToday()),
//           )
//           .where(
//             'lastSeenAt',
//             isLessThan: Timestamp.fromDate(_startOfTomorrow()),
//           ),
//     );

//     totalSosStream = _countStream(
//       FirebaseFirestore.instance.collection('sos_history'),
//     );

//     motivationCardsStream = _countStream(
//       FirebaseFirestore.instance.collection('motivation_cards'),
//     );

//     monthlyActivityStream = _monthlyActivityStream();

//     recentSosStream = FirebaseFirestore.instance
//         .collection('sos_history')
//         .orderBy('createdAt', descending: true)
//         .limit(5)
//         .snapshots()
//         .map((snapshot) {
//           return snapshot.docs.map((doc) {
//             final data = doc.data();
//             return _RecentEvent(
//               title: (data['userName'] ?? 'Unknown').toString(),
//               subtitle: (data['status'] ?? 'pending').toString(),
//               timeText: _formatDate(data['createdAt']),
//             );
//           }).toList();
//         });
//   }

//   Stream<int> _countStream(Query<Map<String, dynamic>> query) {
//     return query.snapshots().map((snapshot) => snapshot.size);
//   }

//   DateTime _startOfToday() {
//     final now = DateTime.now();
//     return DateTime(now.year, now.month, now.day);
//   }

//   DateTime _startOfTomorrow() {
//     return _startOfToday().add(const Duration(days: 1));
//   }

//   DateTime _startOfNextMonth(DateTime date) {
//     return DateTime(date.year, date.month + 1, 1);
//   }

//   DateTime? _parseDate(dynamic value) {
//     if (value is Timestamp) return value.toDate();
//     if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
//     return null;
//   }

//   String _formatDate(dynamic value) {
//     final dt = _parseDate(value);
//     if (dt == null) return '';
//     return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
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

//   Stream<List<_MonthPoint>> _monthlyActivityStream() {
//     final now = DateTime.now();
//     final months = List.generate(6, (index) {
//       final d = DateTime(now.year, now.month - 5 + index, 1);
//       return DateTime(d.year, d.month, 1);
//     });

//     return FirebaseFirestore.instance.collection('activities').snapshots().map((
//       snapshot,
//     ) {
//       final points = <_MonthPoint>[];

//       for (final monthStart in months) {
//         final monthEnd = _startOfNextMonth(monthStart);
//         int count = 0;

//         for (final doc in snapshot.docs) {
//           final data = doc.data();
//           final accountType = (data['accountType'] ?? '')
//               .toString()
//               .toLowerCase();
//           final role = (data['role'] ?? '').toString().toLowerCase();
//           final isAdmin = accountType == 'admin' || role == 'admin';
//           final dt = _parseDate(data['timestamp']);

//           if (!isAdmin &&
//               dt != null &&
//               !dt.isBefore(monthStart) &&
//               dt.isBefore(monthEnd)) {
//             count++;
//           }
//         }

//         points.add(
//           _MonthPoint(
//             label: _monthLabel(monthStart.month),
//             value: count.toDouble(),
//           ),
//         );
//       }

//       return points;
//     });
//   }

//   double _maxY(List<_MonthPoint> points) {
//     if (points.isEmpty) return 6;
//     final max = points.map((e) => e.value).reduce((a, b) => a > b ? a : b);
//     if (max <= 0) return 6;
//     if (max <= 5) return 6;
//     return (max + 2).ceilToDouble();
//   }

//   double _interval(double maxY) {
//     if (maxY <= 6) return 1;
//     if (maxY <= 12) return 2;
//     if (maxY <= 30) return 5;
//     return (maxY / 5).ceilToDouble();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isSmall = width < 600;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Reports & Analytics",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),

//           Wrap(
//             spacing: 16,
//             runSpacing: 16,
//             children: [
//               SizedBox(
//                 width: isSmall ? width : (width - 48) / 2,
//                 child: _KpiCard(
//                   title: "Total Users",
//                   icon: Icons.people_alt_rounded,
//                   color: Colors.blue,
//                   stream: totalUsersStream,
//                 ),
//               ),
//               SizedBox(
//                 width: isSmall ? width : (width - 48) / 2,
//                 child: _KpiCard(
//                   title: "Active Users Today",
//                   icon: Icons.bolt_rounded,
//                   color: Colors.green,
//                   stream: activeTodayStream,
//                 ),
//               ),
//               SizedBox(
//                 width: isSmall ? width : (width - 48) / 2,
//                 child: _KpiCard(
//                   title: "Total SOS Requests",
//                   icon: Icons.sos_rounded,
//                   color: Colors.red,
//                   stream: totalSosStream,
//                 ),
//               ),
//               SizedBox(
//                 width: isSmall ? width : (width - 48) / 2,
//                 child: _KpiCard(
//                   title: "Motivation Cards",
//                   icon: Icons.auto_awesome_rounded,
//                   color: Colors.purple,
//                   stream: motivationCardsStream,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),
//           const Text(
//             "User Activity Trend",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           Container(
//             height: 320,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: Colors.black12),
//             ),
//             child: StreamBuilder<List<_MonthPoint>>(
//               stream: monthlyActivityStream,
//               builder: (context, snapshot) {
//                 final points =
//                     snapshot.data ??
//                     const [
//                       _MonthPoint(label: 'Jan', value: 0),
//                       _MonthPoint(label: 'Feb', value: 0),
//                       _MonthPoint(label: 'Mar', value: 0),
//                       _MonthPoint(label: 'Apr', value: 0),
//                       _MonthPoint(label: 'May', value: 0),
//                       _MonthPoint(label: 'Jun', value: 0),
//                     ];

//                 final maxY = _maxY(points);
//                 final interval = _interval(maxY);

//                 return BarChart(
//                   BarChartData(
//                     minY: 0,
//                     maxY: maxY,
//                     alignment: BarChartAlignment.spaceAround,
//                     groupsSpace: isSmall ? 8 : 14,
//                     gridData: FlGridData(
//                       show: true,
//                       drawVerticalLine: false,
//                       horizontalInterval: interval,
//                       getDrawingHorizontalLine: (value) {
//                         return FlLine(
//                           color: Colors.grey.withOpacity(0.15),
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
//                           reservedSize: isSmall ? 28 : 34,
//                           interval: interval,
//                           getTitlesWidget: (value, meta) {
//                             return Text(
//                               value.toInt().toString(),
//                               style: const TextStyle(
//                                 fontSize: 10,
//                                 color: Colors.black54,
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
//                                 style: const TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     barGroups: List.generate(points.length, (index) {
//                       final point = points[index];
//                       return BarChartGroupData(
//                         x: index,
//                         barRods: [
//                           BarChartRodData(
//                             toY: point.value,
//                             width: isSmall ? 16 : 22,
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8),
//                             ),
//                             gradient: const LinearGradient(
//                               begin: Alignment.bottomCenter,
//                               end: Alignment.topCenter,
//                               colors: [Color(0xFF14B8A6), Color(0xFF0F766E)],
//                             ),
//                           ),
//                         ],
//                       );
//                     }),
//                   ),
//                 );
//               },
//             ),
//           ),

//           const SizedBox(height: 20),
//           const Text(
//             "Recent SOS Requests",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           StreamBuilder<List<_RecentEvent>>(
//             stream: recentSosStream,
//             builder: (context, snapshot) {
//               final items = snapshot.data ?? const [];
//               if (items.isEmpty) {
//                 return _EmptyCard(
//                   icon: Icons.inbox_outlined,
//                   title: "No recent SOS requests",
//                   subtitle: "Recent emergency activity will appear here.",
//                 );
//               }

//               return Column(
//                 children: items.map((item) {
//                   return Container(
//                     width: double.infinity,
//                     margin: const EdgeInsets.only(bottom: 12),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(color: Colors.black12),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.warning_rounded, color: Colors.red),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 item.title,
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 item.subtitle,
//                                 style: const TextStyle(fontSize: 13),
//                               ),
//                               if (item.timeText.isNotEmpty) ...[
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   item.timeText,
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _KpiCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Color color;
//   final Stream<int> stream;

//   const _KpiCard({
//     required this.title,
//     required this.icon,
//     required this.color,
//     required this.stream,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<int>(
//       stream: stream,
//       builder: (context, snapshot) {
//         final value = snapshot.data ?? 0;
//         return Card(
//           elevation: 3,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: color.withOpacity(0.12),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(icon, color: color),
//                 ),
//                 const SizedBox(width: 14),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         value.toString(),
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _EmptyCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;

//   const _EmptyCard({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.black12),
//       ),
//       child: Row(
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
//                 const SizedBox(height: 4),
//                 Text(subtitle),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MonthPoint {
//   final String label;
//   final double value;

//   const _MonthPoint({required this.label, required this.value});
// }

// class _RecentEvent {
//   final String title;
//   final String subtitle;
//   final String timeText;

//   const _RecentEvent({
//     required this.title,
//     required this.subtitle,
//     required this.timeText,
//   });
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  late final Stream<int> totalUsersStream;
  late final Stream<int> totalSosStream;
  late final Stream<List<_MonthPoint>> monthlyUsersActivityStream;
  late final Stream<List<_MonthPoint>> monthlySosActivityStream;
  late final Stream<List<_RecentEvent>> recentSosStream;

  @override
  void initState() {
    super.initState();

    totalUsersStream = _countStream(
      FirebaseFirestore.instance
          .collection('users')
          .where('accountType', isEqualTo: 'User'),
    );

    totalSosStream = _countStream(
      FirebaseFirestore.instance.collection('sos_history'),
    );

    monthlyUsersActivityStream = _monthlyUsersActivityStream();

    monthlySosActivityStream = _monthlySosActivityStream();

    recentSosStream = FirebaseFirestore.instance
        .collection('sos_history')
        .orderBy('createdAt', descending: true)
        .limit(5)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return _RecentEvent(
              title: (data['userName'] ?? 'Unknown').toString(),
              subtitle: (data['status'] ?? 'pending').toString(),
              timeText: _formatDate(data['createdAt']),
            );
          }).toList();
        });
  }

  Stream<int> _countStream(Query<Map<String, dynamic>> query) {
    return query.snapshots().map((snapshot) => snapshot.size);
  }

  DateTime _startOfNextMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 1);
  }

  DateTime? _parseDate(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
    return null;
  }

  String _formatDate(dynamic value) {
    final dt = _parseDate(value);
    if (dt == null) return '';
    return DateFormat('dd/MM/yyyy hh:mm a').format(dt.toLocal());
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

  Stream<List<_MonthPoint>> _monthlyUsersActivityStream() {
    final now = DateTime.now();
    final months = List.generate(6, (index) {
      final d = DateTime(now.year, now.month - 5 + index, 1);
      return DateTime(d.year, d.month, 1);
    });

    return FirebaseFirestore.instance.collection('users').snapshots().map((
      snapshot,
    ) {
      final points = <_MonthPoint>[];

      for (final monthStart in months) {
        final monthEnd = _startOfNextMonth(monthStart);
        int count = 0;

        for (final doc in snapshot.docs) {
          final data = doc.data();
          final accountType = (data['accountType'] ?? '')
              .toString()
              .toLowerCase();
          final dt = _parseDate(data['createdAt']);

          if (accountType == 'user' &&
              dt != null &&
              !dt.isBefore(monthStart) &&
              dt.isBefore(monthEnd)) {
            count++;
          }
        }

        points.add(
          _MonthPoint(
            label: _monthLabel(monthStart.month),
            value: count.toDouble(),
          ),
        );
      }

      return points;
    });
  }

  Stream<List<_MonthPoint>> _monthlySosActivityStream() {
    final now = DateTime.now();
    final months = List.generate(6, (index) {
      final d = DateTime(now.year, now.month - 5 + index, 1);
      return DateTime(d.year, d.month, 1);
    });

    return FirebaseFirestore.instance.collection('sos_history').snapshots().map(
      (snapshot) {
        final points = <_MonthPoint>[];

        for (final monthStart in months) {
          final monthEnd = _startOfNextMonth(monthStart);
          int count = 0;

          for (final doc in snapshot.docs) {
            final data = doc.data();
            final dt = _parseDate(data['createdAt']);

            if (dt != null &&
                !dt.isBefore(monthStart) &&
                dt.isBefore(monthEnd)) {
              count++;
            }
          }

          points.add(
            _MonthPoint(
              label: _monthLabel(monthStart.month),
              value: count.toDouble(),
            ),
          );
        }

        return points;
      },
    );
  }

  double _maxY(List<_MonthPoint> points) {
    if (points.isEmpty) return 6;
    final max = points.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    if (max <= 0) return 6;
    return (max + 2).ceilToDouble();
  }

  double _interval(double maxY) {
    if (maxY <= 6) return 1;
    if (maxY <= 12) return 2;
    if (maxY <= 30) return 5;
    return (maxY / 5).ceilToDouble();
  }

  Widget _buildBarChart(
    String title,
    List<_MonthPoint> points,
    Color color1,
    Color color2,
    IconData icon,
    bool isSmall,
  ) {
    final maxY = _maxY(points);
    final interval = _interval(maxY);

    return Container(
      height: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color1, size: 22),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: maxY,
                alignment: BarChartAlignment.spaceAround,
                groupsSpace: isSmall ? 8 : 14,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.15),
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
                      reservedSize: isSmall ? 28 : 34,
                      interval: interval,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
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
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(points.length, (index) {
                  final point = points[index];
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: point.value,
                        width: isSmall ? 16 : 22,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [color1, color2],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Reports & Analytics",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Compact KPI Box - Users and SOS side by side
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: StreamBuilder<int>(
                    stream: totalUsersStream,
                    builder: (context, snapshot) {
                      final value = snapshot.data ?? 0;
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF00A389).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF00A389).withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00A389).withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.people_alt_rounded,
                                    color: Color(0xFF00A389),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Total Users",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E2432),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              value.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF00A389),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StreamBuilder<int>(
                    stream: totalSosStream,
                    builder: (context, snapshot) {
                      final value = snapshot.data ?? 0;
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.red.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.sos_rounded,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Total SOS",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E2432),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              value.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "User Activity Trend",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          StreamBuilder<List<_MonthPoint>>(
            stream: monthlyUsersActivityStream,
            builder: (context, snapshot) {
              final points =
                  snapshot.data ??
                  const [
                    _MonthPoint(label: 'Jan', value: 0),
                    _MonthPoint(label: 'Feb', value: 0),
                    _MonthPoint(label: 'Mar', value: 0),
                    _MonthPoint(label: 'Apr', value: 0),
                    _MonthPoint(label: 'May', value: 0),
                    _MonthPoint(label: 'Jun', value: 0),
                  ];

              return _buildBarChart(
                "New Users (Last 6 Months)",
                points,
                Color(0xFF00A389),
                Color(0xFF00796B),
                Icons.people_alt_rounded,
                isSmall,
              );
            },
          ),

          const SizedBox(height: 20),
          const Text(
            "SOS Requests Trend",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          StreamBuilder<List<_MonthPoint>>(
            stream: monthlySosActivityStream,
            builder: (context, snapshot) {
              final points =
                  snapshot.data ??
                  const [
                    _MonthPoint(label: 'Jan', value: 0),
                    _MonthPoint(label: 'Feb', value: 0),
                    _MonthPoint(label: 'Mar', value: 0),
                    _MonthPoint(label: 'Apr', value: 0),
                    _MonthPoint(label: 'May', value: 0),
                    _MonthPoint(label: 'Jun', value: 0),
                  ];

              return _buildBarChart(
                "SOS Requests (Last 6 Months)",
                points,
                Colors.red,
                Colors.red.shade700,
                Icons.sos_rounded,
                isSmall,
              );
            },
          ),

          const SizedBox(height: 20),
          const Text(
            "Recent SOS Requests",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          StreamBuilder<List<_RecentEvent>>(
            stream: recentSosStream,
            builder: (context, snapshot) {
              final items = snapshot.data ?? const [];
              if (items.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.inbox_outlined, color: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No recent SOS requests",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Recent emergency activity will appear here.",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: items.map((item) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.subtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              if (item.timeText.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  item.timeText,
                                  style: const TextStyle(
                                    fontSize: 11,
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
        ],
      ),
    );
  }
}

class _MonthPoint {
  final String label;
  final double value;

  const _MonthPoint({required this.label, required this.value});
}

class _RecentEvent {
  final String title;
  final String subtitle;
  final String timeText;

  const _RecentEvent({
    required this.title,
    required this.subtitle,
    required this.timeText,
  });
}
