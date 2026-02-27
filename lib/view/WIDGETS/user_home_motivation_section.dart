// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mentalwellapp/model/MotivationCardModel.dart';

// class UserHomeMotivationSection extends StatelessWidget {
//   const UserHomeMotivationSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 180,
//       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance
//             .collection('motivation_cards')
//             .where('isActive', isEqualTo: true)
//             .orderBy('order')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final docs = snapshot.data?.docs ?? [];

//           if (docs.isEmpty) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(22),
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFAE70B8), Color(0xFFE040FB)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   "No motivation cards yet",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             );
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final card = MotivationCardModel.fromMap(
//                 docs[index].data(),
//                 docs[index].id,
//               );

//               return _MotivationCard(
//                 text: card.text,
//                 icon: card.icon,
//                 colors: [Color(card.color1), Color(card.color2)],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class _MotivationCard extends StatelessWidget {
//   final String text;
//   final String icon;
//   final List<Color> colors;

//   const _MotivationCard({
//     required this.text,
//     required this.icon,
//     required this.colors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       margin: const EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: LinearGradient(
//           colors: colors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: colors.last.withOpacity(0.4),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.white.withOpacity(0.25),
//               child: Text(icon, style: const TextStyle(fontSize: 28)),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentalwellapp/model/MotivationCardModel.dart';

class UserHomeMotivationSection extends StatelessWidget {
  const UserHomeMotivationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('motivation_cards')
            .where('isActive', isEqualTo: true)
            .snapshots(), // removed orderBy temporarily
        builder: (context, snapshot) {
          debugPrint("Motivation snapshot state: ${snapshot.connectionState}");

          if (snapshot.hasError) {
            debugPrint("Motivation cards error: ${snapshot.error}");
            return Center(
              child: Text(
                "Error loading cards: ${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];
          debugPrint("Motivation cards docs count: ${docs.length}");

          final cards = docs
              .map((doc) => MotivationCardModel.fromMap(doc.data(), doc.id))
              .toList();

          cards.sort((a, b) => a.order.compareTo(b.order));

          if (cards.isEmpty) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [Color(0xFFAE70B8), Color(0xFFE040FB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  "No motivation cards yet",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];

              return _MotivationCard(
                text: card.text,
                icon: card.icon,
                colors: [Color(card.color1), Color(card.color2)],
              );
            },
          );
        },
      ),
    );
  }
}

class _MotivationCard extends StatelessWidget {
  final String text;
  final String icon;
  final List<Color> colors;

  const _MotivationCard({
    required this.text,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white.withOpacity(0.25),
              child: Text(icon, style: const TextStyle(fontSize: 28)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
