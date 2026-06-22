// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MotivationCardHistoryPage extends StatelessWidget {
//   const MotivationCardHistoryPage({super.key});

//   String _formatDate(DateTime? dateTime) {
//     if (dateTime == null) return 'No date';
//     final day = dateTime.day.toString().padLeft(2, '0');
//     final month = dateTime.month.toString().padLeft(2, '0');
//     final year = dateTime.year.toString();
//     final hour = dateTime.hour.toString().padLeft(2, '0');
//     final minute = dateTime.minute.toString().padLeft(2, '0');
//     return '$day/$month/$year  $hour:$minute';
//   }

//   Color _getActionColor(String action) {
//     switch (action.toLowerCase()) {
//       case 'created':
//         return Colors.green;
//       case 'updated':
//         return Colors.blue;
//       case 'activated':
//         return Colors.teal;
//       case 'deactivated':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   IconData _getActionIcon(String action) {
//     switch (action.toLowerCase()) {
//       case 'created':
//         return Icons.add_circle;
//       case 'updated':
//         return Icons.edit;
//       case 'activated':
//         return Icons.visibility;
//       case 'deactivated':
//         return Icons.visibility_off;
//       default:
//         return Icons.history;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final stream = FirebaseFirestore.instance
//         .collection('motivation_card_history')
//         .orderBy('changedAt', descending: true)
//         .snapshots();

//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: stream,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final docs = snapshot.data?.docs ?? [];

//           if (docs.isEmpty) {
//             return const Center(
//               child: Text(
//                 'No history found',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//             );
//           }

//           return ListView.separated(
//             padding: const EdgeInsets.all(16),
//             itemCount: docs.length,
//             separatorBuilder: (_, __) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               final data = docs[index].data();

//               final action = (data['action'] ?? 'unknown').toString();
//               final oldText = (data['oldText'] ?? '').toString();
//               final newText = (data['newText'] ?? '').toString();
//               final changedBy = (data['changedBy'] ?? 'unknown').toString();
//               final cardId = (data['cardId'] ?? '').toString();

//               final Timestamp? changedAtTs = data['changedAt'] as Timestamp?;
//               final DateTime? changedAt = changedAtTs?.toDate();

//               final actionColor = _getActionColor(action);

//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(18),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.06),
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(14),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: actionColor.withOpacity(0.15),
//                             child: Icon(
//                               _getActionIcon(action),
//                               color: actionColor,
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Text(
//                               action.toUpperCase(),
//                               style: TextStyle(
//                                 color: actionColor,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             _formatDate(changedAt),
//                             style: const TextStyle(
//                               color: Colors.black54,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       if (cardId.isNotEmpty) ...[
//                         Text(
//                           'Card ID: $cardId',
//                           style: const TextStyle(
//                             fontSize: 13,
//                             color: Colors.black87,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                       ],
//                       Text(
//                         'Changed By: $changedBy',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       if (oldText.isNotEmpty) ...[
//                         const Text(
//                           'Old Text',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           oldText,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                       if (newText.isNotEmpty) ...[
//                         const Text(
//                           'New Text',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           newText,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MotivationCardHistoryPage extends StatelessWidget {
  const MotivationCardHistoryPage({super.key});

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'No date';
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year  $hour:$minute';
  }

  Color _getActionColor(String action) {
    switch (action.toLowerCase()) {
      case 'created':
        return const Color.fromARGB(255, 62, 117, 214); // blue
      case 'updated':
        return const Color.fromARGB(255, 116, 44, 198); // blue
      case 'activated':
        return const Color.fromARGB(255, 9, 136, 26); // green
      case 'deactivated':
        return const Color.fromARGB(255, 221, 73, 73); // red
      default:
        return Colors.grey;
    }
  }

  IconData _getActionIcon(String action) {
    switch (action.toLowerCase()) {
      case 'created':
        return Icons.add_circle;
      case 'updated':
        return Icons.edit;
      case 'activated':
        return Icons.visibility;
      case 'deactivated':
        return Icons.visibility_off;
      default:
        return Icons.history;
    }
  }

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance
        .collection('motivation_card_history')
        .orderBy('changedAt', descending: true)
        .snapshots();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
            );
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No history found',
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
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            itemCount: docs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final data = docs[index].data();

              final action = (data['action'] ?? 'unknown').toString();
              final oldText = (data['oldText'] ?? '').toString();
              final newText = (data['newText'] ?? '').toString();
              final cardId = (data['cardId'] ?? '').toString();

              final Timestamp? changedAtTs = data['changedAt'] as Timestamp?;
              final DateTime? changedAt = changedAtTs?.toDate();

              final actionColor = _getActionColor(action);

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: actionColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _getActionIcon(action),
                            color: actionColor,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          action.toUpperCase(),
                          style: TextStyle(
                            color: actionColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _formatDate(changedAt),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Card ID: ${cardId}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (oldText.isNotEmpty) ...[
                      Text(
                        'Old',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          oldText,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade800,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                    if (newText.isNotEmpty) ...[
                      Text(
                        'New',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: actionColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: actionColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          newText,
                          style: TextStyle(
                            fontSize: 12,
                            color: actionColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
