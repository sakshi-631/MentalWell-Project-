// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:intl/intl.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:mentalwellapp/view/ADMIN/sosdetailpage.dart';

// // class SOSPage extends StatelessWidget {
// //   const SOSPage({super.key});

// //   // ================= LOGIC (UNCHANGED) =================
// //   String formatTime(dynamic timestamp) {
// //     if (timestamp == null || timestamp is! Timestamp) {
// //       return "Just now";
// //     }
// //     return DateFormat('dd MMM yyyy • hh:mm a').format(timestamp.toDate());
// //   }

// //   void openMap(String url) async {
// //     if (url.isEmpty) return;
// //     final uri = Uri.parse(url);
// //     await launchUrl(uri, mode: LaunchMode.externalApplication);
// //   }

// //   Timestamp? safeTs(dynamic value) {
// //     if (value is Timestamp) return value;
// //     return null;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF8F9FA), // Light professional grey
// //       body: CustomScrollView(
// //         slivers: [
// //           // Professional App Bar
// //           SliverAppBar(
// //             expandedHeight: 120.0,
// //             floating: false,
// //             pinned: true,
// //             backgroundColor: const Color(0xFFD32F2F),
// //             flexibleSpace: FlexibleSpaceBar(
// //               titlePadding: const EdgeInsetsDirectional.only(
// //                 start: 16,
// //                 bottom: 16,
// //               ),
// //               title: const Text(
// //                 "SOS Dashboard",
// //                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
// //               ),
// //               background: Container(
// //                 decoration: const BoxDecoration(
// //                   gradient: LinearGradient(
// //                     colors: [Color(0xFFB71C1C), Color(0xFFD32F2F)],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),

// //           // Main List Content
// //           StreamBuilder<QuerySnapshot>(
// //             stream: FirebaseFirestore.instance
// //                 .collection('sos_history')
// //                 .snapshots(),
// //             builder: (context, snapshot) {
// //               if (snapshot.hasError) {
// //                 return SliverFillRemaining(
// //                   child: Center(child: Text("Error: ${snapshot.error}")),
// //                 );
// //               }

// //               if (!snapshot.hasData) {
// //                 return const SliverFillRemaining(
// //                   child: Center(
// //                     child: CircularProgressIndicator(color: Colors.red),
// //                   ),
// //                 );
// //               }

// //               var docs = snapshot.data!.docs;

// //               // MANUAL SORT (UNCHANGED)
// //               docs.sort((a, b) {
// //                 final aTime = safeTs(a['createdAt']);
// //                 final bTime = safeTs(b['createdAt']);
// //                 if (aTime == null || bTime == null) return 0;
// //                 return bTime.compareTo(aTime);
// //               });

// //               if (docs.isEmpty) {
// //                 return const SliverFillRemaining(
// //                   child: Center(child: Text("No active alerts at this time.")),
// //                 );
// //               }

// //               return SliverPadding(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 14,
// //                   vertical: 16,
// //                 ),
// //                 sliver: SliverList(
// //                   delegate: SliverChildBuilderDelegate((context, index) {
// //                     final data = docs[index].data() as Map<String, dynamic>;
// //                     return _buildSOSCard(context, data);
// //                   }, childCount: docs.length),
// //                 ),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ================= UI COMPONENT: SOS CARD =================
// //   Widget _buildSOSCard(BuildContext context, Map<String, dynamic> data) {
// //     final status = (data['status'] ?? "pending").toString().toLowerCase();
// //     final location = data['location'] ?? "";
// //     final timestamp = safeTs(data['createdAt']);

// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 10,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Material(
// //         color: Colors.transparent,
// //         child: InkWell(
// //           borderRadius: BorderRadius.circular(16),
// //           onTap: () => Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (_) => SOSDetailPage(data: data)),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Top Row: User & Status
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Expanded(
// //                       child: Row(
// //                         children: [
// //                           const CircleAvatar(
// //                             backgroundColor: Color(0xFFFFEBEE),
// //                             child: Icon(Icons.person, color: Colors.red),
// //                           ),
// //                           const SizedBox(width: 12),
// //                           Expanded(
// //                             child: Text(
// //                               data['userName'] ?? "Unknown User",
// //                               style: const TextStyle(
// //                                 fontSize: 17,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Color(0xFF2D3436),
// //                               ),
// //                               overflow: TextOverflow.ellipsis,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     _buildStatusChip(status),
// //                   ],
// //                 ),

// //                 const Divider(height: 24, thickness: 0.8),

// //                 // Middle Section: Details
// //                 Row(
// //                   children: [
// //                     const Icon(
// //                       Icons.error_outline,
// //                       size: 18,
// //                       color: Colors.grey,
// //                     ),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       "Type: ",
// //                       style: TextStyle(
// //                         color: Colors.grey[600],
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                     Text(
// //                       (data['type'] ?? "Emergency").toString().toUpperCase(),
// //                       style: const TextStyle(
// //                         fontWeight: FontWeight.w600,
// //                         color: Colors.red,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Row(
// //                   children: [
// //                     const Icon(Icons.access_time, size: 18, color: Colors.grey),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       formatTime(timestamp),
// //                       style: TextStyle(color: Colors.grey[700], fontSize: 13),
// //                     ),
// //                   ],
// //                 ),

// //                 // Contacts if available
// //                 if (data['doctor'] != null || data['friend'] != null) ...[
// //                   const SizedBox(height: 8),
// //                   Row(
// //                     children: [
// //                       const Icon(
// //                         Icons.contact_phone_outlined,
// //                         size: 18,
// //                         color: Colors.grey,
// //                       ),
// //                       const SizedBox(width: 8),
// //                       Text(
// //                         data['doctor'] != null
// //                             ? "Dr. ${data['doctor']}"
// //                             : "Friend: ${data['friend']}",
// //                         style: TextStyle(
// //                           color: Colors.blueGrey[800],
// //                           fontSize: 13,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],

// //                 // Footer Row: Location Link
// //                 if (location.isNotEmpty) ...[
// //                   const SizedBox(height: 12),
// //                   InkWell(
// //                     onTap: () => openMap(location),
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(
// //                         vertical: 8,
// //                         horizontal: 12,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: Colors.blue.withOpacity(0.08),
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                       child: const Row(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           Icon(
// //                             Icons.map_outlined,
// //                             size: 16,
// //                             color: Colors.blue,
// //                           ),
// //                           SizedBox(width: 6),
// //                           Text(
// //                             "Track Real-time Location",
// //                             style: TextStyle(
// //                               color: Colors.blue,
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 12,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // ================= UI COMPONENT: STATUS CHIP =================
// //   Widget _buildStatusChip(String status) {
// //     final bool isResolved = status == "resolved";
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //       decoration: BoxDecoration(
// //         color: isResolved ? const Color(0xFFE8F5E9) : const Color(0xFFFFF3E0),
// //         borderRadius: BorderRadius.circular(20),
// //         border: Border.all(
// //           color: isResolved ? Colors.green.shade300 : Colors.orange.shade300,
// //           width: 1,
// //         ),
// //       ),
// //       child: Text(
// //         status.toUpperCase(),
// //         style: TextStyle(
// //           color: isResolved ? Colors.green[800] : Colors.orange[900],
// //           fontSize: 10,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 0.5,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mentalwellapp/view/ADMIN/sosdetailpage.dart';

// class SOSPage extends StatelessWidget {
//   const SOSPage({super.key});

//   String formatTime(dynamic timestamp) {
//     if (timestamp == null || timestamp is! Timestamp) {
//       return "Just now";
//     }
//     return DateFormat('dd MMM yyyy • hh:mm a').format(timestamp.toDate());
//   }

//   void openMap(String url) async {
//     if (url.isEmpty) return;
//     final uri = Uri.parse(url);
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   }

//   Timestamp? safeTs(dynamic value) {
//     if (value is Timestamp) return value;
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       body: CustomScrollView(
//         slivers: [
//           // SliverAppBar(
//           //   expandedHeight: 120.0,
//           //   floating: false,
//           //   pinned: true,
//           //   backgroundColor: const Color(0xFFD32F2F),
//           //   flexibleSpace: FlexibleSpaceBar(
//           //     titlePadding: const EdgeInsetsDirectional.only(
//           //       start: 16,
//           //       bottom: 16,
//           //     ),
//           //     title: const Text(
//           //       "SOS Dashboard",
//           //       style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
//           //     ),
//           //     background: Container(
//           //       decoration: const BoxDecoration(
//           //         gradient: LinearGradient(
//           //           colors: [Color(0xFFB71C1C), Color(0xFFD32F2F)],
//           //           begin: Alignment.topLeft,
//           //           end: Alignment.bottomRight,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//             stream: FirebaseFirestore.instance
//                 .collection('sos_history')
//                 .orderBy('createdAt', descending: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return SliverFillRemaining(
//                   child: Center(child: Text("Error: ${snapshot.error}")),
//                 );
//               }

//               if (!snapshot.hasData) {
//                 return const SliverFillRemaining(
//                   child: Center(
//                     child: CircularProgressIndicator(color: Colors.red),
//                   ),
//                 );
//               }

//               final docs = snapshot.data!.docs;

//               if (docs.isEmpty) {
//                 return const SliverFillRemaining(
//                   child: Center(child: Text("No active alerts at this time.")),
//                 );
//               }

//               return SliverPadding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 14,
//                   vertical: 16,
//                 ),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate((context, index) {
//                     final doc = docs[index];
//                     final data = doc.data();
//                     final item = {...data, 'docId': doc.id};
//                     return _buildSOSCard(context, item);
//                   }, childCount: docs.length),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSOSCard(BuildContext context, Map<String, dynamic> data) {
//     final status = (data['status'] ?? "pending").toString().toLowerCase();
//     final location = data['location'] ?? "";
//     final timestamp = safeTs(data['createdAt']);

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => SOSDetailPage(data: data)),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             backgroundColor: Color(0xFFFFEBEE),
//                             child: Icon(Icons.person, color: Colors.red),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Text(
//                               data['userName'] ?? "Unknown User",
//                               style: const TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF2D3436),
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     _buildStatusChip(status),
//                   ],
//                 ),
//                 const Divider(height: 24, thickness: 0.8),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.error_outline,
//                       size: 18,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       "Type: ",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       (data['type'] ?? "Emergency").toString().toUpperCase(),
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(Icons.access_time, size: 18, color: Colors.grey),
//                     const SizedBox(width: 8),
//                     Text(
//                       formatTime(timestamp),
//                       style: TextStyle(color: Colors.grey[700], fontSize: 13),
//                     ),
//                   ],
//                 ),
//                 if (data['doctor'] != null || data['friend'] != null) ...[
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.contact_phone_outlined,
//                         size: 18,
//                         color: Colors.grey,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         data['doctor'] != null
//                             ? "Dr. ${data['doctor']}"
//                             : "Friend: ${data['friend']}",
//                         style: TextStyle(
//                           color: Colors.blueGrey[800],
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//                 if (location.isNotEmpty) ...[
//                   const SizedBox(height: 12),
//                   InkWell(
//                     onTap: () => openMap(location),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8,
//                         horizontal: 12,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.withOpacity(0.08),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.map_outlined,
//                             size: 16,
//                             color: Colors.blue,
//                           ),
//                           SizedBox(width: 6),
//                           Text(
//                             "Track Real-time Location",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatusChip(String status) {
//     final bool isResolved = status == "resolved";
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: isResolved ? const Color(0xFFE8F5E9) : const Color(0xFFFFF3E0),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: isResolved ? Colors.green.shade300 : Colors.orange.shade300,
//           width: 1,
//         ),
//       ),
//       child: Text(
//         status.toUpperCase(),
//         style: TextStyle(
//           color: isResolved ? Colors.green[800] : Colors.orange[900],
//           fontSize: 10,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.5,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mentalwellapp/view/ADMIN/sosdetailpage.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  String formatTime(dynamic timestamp) {
    if (timestamp == null || timestamp is! Timestamp) {
      return "Just now";
    }
    return DateFormat('dd MMM • hh:mm a').format(timestamp.toDate());
  }

  void openMap(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Timestamp? safeTs(dynamic value) {
    if (value is Timestamp) return value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: const Text(
          "SOS Dashboard",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFFD32F2F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('sos_history')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text('Error: ${snapshot.error}'),
                ],
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
            );
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No active alerts at this time.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data();
              final item = {...data, 'docId': doc.id};
              return _buildSOSCard(context, item);
            },
          );
        },
      ),
    );
  }

  Widget _buildSOSCard(BuildContext context, Map<String, dynamic> data) {
    final status = (data['status'] ?? "pending").toString().toLowerCase();
    final location = data['location'] ?? "";
    final timestamp = safeTs(data['createdAt']);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SOSDetailPage(data: data)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.sos_rounded,
                        color: Colors.red,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['userName'] ?? "Unknown User",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E2432),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              formatTime(timestamp),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildStatusChip(status),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        (data['type'] ?? "Emergency").toString().toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (data['doctor'] != null || data['friend'] != null) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        data['doctor'] != null
                            ? "Dr. ${data['doctor']}"
                            : "Friend: ${data['friend']}",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                if (location.isNotEmpty) ...[
                  InkWell(
                    onTap: () => openMap(location),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5B8DEF).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF5B8DEF).withOpacity(0.3),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.map_rounded,
                            size: 16,
                            color: Color(0xFF5B8DEF),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Track Location",
                            style: TextStyle(
                              color: Color(0xFF5B8DEF),
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    final bool isResolved = status == "resolved";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isResolved
            ? const Color(0xFF00A389).withOpacity(0.12)
            : const Color(0xFFD32F2F).withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isResolved ? const Color(0xFF00A389) : const Color(0xFFD32F2F),
          width: 1,
        ),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: isResolved ? const Color(0xFF00A389) : const Color(0xFFD32F2F),
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
