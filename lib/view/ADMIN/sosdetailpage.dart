// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';

// // // // class SOSDetailPage extends StatelessWidget {
// // // //   final Map<String, dynamic> data;

// // // //   const SOSDetailPage({super.key, required this.data});

// // // //   Future<void> updateStatus(String docId) async {
// // // //     await FirebaseFirestore.instance
// // // //         .collection('sos_history')
// // // //         .doc(docId)
// // // //         .update({"status": "resolved"});
// // // //   }

// // // //   Future<void> callNumber(String number) async {
// // // //     if (number.isEmpty) return;
// // // //     final uri = Uri(scheme: "tel", path: number);
// // // //     await launchUrl(uri);
// // // //   }

// // // //   Future<void> openLocation(String url) async {
// // // //     if (url.isEmpty) return;
// // // //     final uri = Uri.parse(url);
// // // //     await launchUrl(uri, mode: LaunchMode.externalApplication);
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final docId = data['docId'] ?? ""; // optional if you store it

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text("SOS Details"),
// // // //         backgroundColor: Colors.red,
// // // //       ),

// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               "User: ${data['userName'] ?? ''}",
// // // //               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // //             ),

// // // //             const SizedBox(height: 10),

// // // //             Text("Type: ${data['type']}"),
// // // //             Text("Status: ${data['status']}"),

// // // //             const SizedBox(height: 20),

// // // //             // ================= LOCATION =================
// // // //             ElevatedButton.icon(
// // // //               onPressed: () => openLocation(data['location'] ?? ""),
// // // //               icon: const Icon(Icons.map),
// // // //               label: const Text("Open Live Location"),
// // // //             ),

// // // //             const SizedBox(height: 10),

// // // //             // ================= CALL BUTTONS =================
// // // //             ElevatedButton.icon(
// // // //               onPressed: () => callNumber(data['doctor']),
// // // //               icon: const Icon(Icons.call),
// // // //               label: const Text("Call Doctor"),
// // // //             ),

// // // //             ElevatedButton.icon(
// // // //               onPressed: () => callNumber(data['friend']),
// // // //               icon: const Icon(Icons.call),
// // // //               label: const Text("Call Friend"),
// // // //             ),

// // // //             const Spacer(),

// // // //             // ================= RESOLVE BUTTON =================
// // // //             SizedBox(
// // // //               width: double.infinity,
// // // //               child: ElevatedButton(
// // // //                 onPressed: data['status'] == "resolved"
// // // //                     ? null
// // // //                     : () async {
// // // //                         await FirebaseFirestore.instance
// // // //                             .collection('sos_history')
// // // //                             .doc(data['docId'])
// // // //                             .update({"status": "resolved"});

// // // //                         Navigator.pop(context);
// // // //                       },
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   backgroundColor: Colors.green,
// // // //                   padding: const EdgeInsets.all(14),
// // // //                 ),
// // // //                 child: const Text(
// // // //                   "Mark as Resolved",
// // // //                   style: TextStyle(fontSize: 16),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class SOSDetailPage extends StatelessWidget {
// // //   final Map<String, dynamic> data;

// // //   const SOSDetailPage({super.key, required this.data});

// // //   // ================= CALL =================
// // //   Future<void> callNumber(String number) async {
// // //     if (number.isEmpty) return;
// // //     final uri = Uri(scheme: "tel", path: number);
// // //     await launchUrl(uri);
// // //   }

// // //   // ================= LOCATION =================
// // //   Future<void> openLocation(String url) async {
// // //     if (url.isEmpty) return;
// // //     final uri = Uri.parse(url);
// // //     await launchUrl(uri, mode: LaunchMode.externalApplication);
// // //   }

// // //   // ================= UPDATE STATUS =================
// // //   Future<void> markResolved(BuildContext context, String docId) async {
// // //     try {
// // //       await FirebaseFirestore.instance
// // //           .collection('sos_history')
// // //           .doc(docId)
// // //           .update({"status": "resolved"});

// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(const SnackBar(content: Text("SOS marked as resolved")));

// // //       Navigator.pop(context);
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text("Error: $e")));
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final String sosId = data['docId'] ?? data['id'] ?? "";

// // //     final String userId = data['userId'] ?? "";

// // //     return Scaffold(
// // //       backgroundColor: Colors.grey[100],

// // //       appBar: AppBar(
// // //         title: const Text("SOS Details"),
// // //         backgroundColor: Colors.red,
// // //         elevation: 0,
// // //       ),

// // //       body: FutureBuilder<DocumentSnapshot>(
// // //         future: FirebaseFirestore.instance
// // //             .collection('users')
// // //             .doc(userId)
// // //             .get(),
// // //         builder: (context, snapshot) {
// // //           final userData = snapshot.data?.data() as Map<String, dynamic>?;

// // //           return SingleChildScrollView(
// // //             padding: const EdgeInsets.all(16),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 // ================= SOS CARD =================
// // //                 Card(
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(16),
// // //                   ),
// // //                   elevation: 3,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.all(16),
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         const Text(
// // //                           "🚨 SOS ALERT",
// // //                           style: TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 10),
// // //                         Text("Type: ${data['type'] ?? ''}"),
// // //                         Text("Status: ${data['status'] ?? ''}"),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),

// // //                 const SizedBox(height: 15),

// // //                 // ================= USER DETAILS =================
// // //                 Card(
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(16),
// // //                   ),
// // //                   elevation: 3,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.all(16),
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         const Text(
// // //                           "👤 User Details",
// // //                           style: TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                         const Divider(),

// // //                         Text("Name: ${userData?['name'] ?? 'N/A'}"),
// // //                         Text("Email: ${userData?['email'] ?? 'N/A'}"),
// // //                         Text("Mobile: ${userData?['mobile'] ?? 'N/A'}"),
// // //                         Text("Address: ${userData?['address'] ?? 'N/A'}"),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),

// // //                 const SizedBox(height: 15),

// // //                 // ================= ACTION BUTTONS =================
// // //                 Card(
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(16),
// // //                   ),
// // //                   elevation: 3,
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.all(16),
// // //                     child: Column(
// // //                       children: [
// // //                         ElevatedButton.icon(
// // //                           onPressed: () => openLocation(data['location'] ?? ""),
// // //                           icon: const Icon(Icons.map),
// // //                           label: const Text("Open Live Location"),
// // //                           style: ElevatedButton.styleFrom(
// // //                             minimumSize: const Size(double.infinity, 45),
// // //                           ),
// // //                         ),

// // //                         const SizedBox(height: 10),

// // //                         ElevatedButton.icon(
// // //                           onPressed: () => callNumber(data['doctor'] ?? ""),
// // //                           icon: const Icon(Icons.medical_services),
// // //                           label: const Text("Call Doctor"),
// // //                           style: ElevatedButton.styleFrom(
// // //                             minimumSize: const Size(double.infinity, 45),
// // //                           ),
// // //                         ),

// // //                         const SizedBox(height: 10),

// // //                         ElevatedButton.icon(
// // //                           onPressed: () => callNumber(data['friend'] ?? ""),
// // //                           icon: const Icon(Icons.call),
// // //                           label: const Text("Call Friend"),
// // //                           style: ElevatedButton.styleFrom(
// // //                             minimumSize: const Size(double.infinity, 45),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),

// // //                 const SizedBox(height: 20),

// // //                 // ================= RESOLVE BUTTON =================
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   child: ElevatedButton(
// // //                     onPressed: data['status'] == "resolved"
// // //                         ? null
// // //                         : () => markResolved(context, sosId),
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: Colors.green,
// // //                       padding: const EdgeInsets.all(14),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                     ),
// // //                     child: const Text(
// // //                       "Mark as Resolved",
// // //                       style: TextStyle(fontSize: 16),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const SOSDetailPage({super.key, required this.data});

  // ================= CALL =================
  Future<void> callNumber(String number) async {
    if (number.isEmpty) return;
    final uri = Uri(scheme: "tel", path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  // ================= LOCATION =================
  Future<void> openLocation(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // ================= UPDATE STATUS =================
  Future<void> markResolved(BuildContext context, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('sos_history')
          .doc(docId)
          .update({"status": "resolved"});

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("SOS marked as resolved")));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Widget _buildGradientCard({
    required Widget child,
    required Color gradientStart,
    required Color gradientEnd,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildWhiteCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildIconPlaceholder({required IconData icon, required Color color}) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }

  Widget _buildTile({
    required String label,
    required String value,
    IconData? icon,
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null && iconColor != null)
            _buildIconPlaceholder(icon: icon, color: iconColor)
          else
            const SizedBox(height: 56, width: 56),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
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

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String sosId = data['docId'] ?? data['id'] ?? "";
    final String userId = data['userId'] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      appBar: AppBar(
        title: Text(
          "SOS Details",
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color(0xFF00A389),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get(),
        builder: (context, snapshot) {
          final userData = snapshot.data?.data() as Map<String, dynamic>?;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= USER DETAILS CARD =================
                _buildWhiteCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildIconPlaceholder(
                              icon: Icons.person_outline_rounded,
                              color: const Color(0xFF6C63FF),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "👤 User Details",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E2432),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 230, 227, 227),
                          height: 6,
                        ),
                        _buildTile(
                          label: "Name",
                          value: userData?['name'] ?? 'N/A',
                          icon: Icons.person_outline_rounded,
                          iconColor: const Color(0xFF5B8DEF),
                        ),
                        _buildTile(
                          label: "Email",
                          value: userData?['email'] ?? 'N/A',
                          icon: Icons.mail_outline_rounded,
                          iconColor: const Color(0xFF00A389),
                        ),
                        _buildTile(
                          label: "Mobile",
                          value: userData?['mobile'] ?? 'N/A',
                          icon: Icons.call_outlined,
                          iconColor: const Color(0xFFFF6B6B),
                        ),
                        _buildTile(
                          label: "Address",
                          value: userData?['address'] ?? 'N/A',
                          icon: Icons.location_on_outlined,
                          iconColor: const Color(0xFF7E57C2),
                        ),
                      ],
                    ),
                  ),
                ),

                // ================= ACTION BUTTONS CARD =================
                _buildWhiteCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildIconPlaceholder(
                              icon: Icons.security_rounded,
                              color: const Color(0xFF6C63FF),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "🛟 Emergency Actions",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E2432),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildActionButton(
                          label: "Open Live Location",
                          icon: Icons.map_rounded,
                          onPressed: () => openLocation(data['location'] ?? ""),
                          color: const Color(0xFF5B8DEF),
                        ),
                        const SizedBox(height: 10),
                        _buildActionButton(
                          label: "Call Doctor",
                          icon: Icons.medical_services_rounded,
                          onPressed: () => callNumber(data['doctor'] ?? ""),
                          color: const Color(0xFFFF6B6B),
                        ),
                        const SizedBox(height: 10),
                        _buildActionButton(
                          label: "Call Friend",
                          icon: Icons.call_rounded,
                          onPressed: () => callNumber(data['friend'] ?? ""),
                          color: const Color(0xFF00A389),
                        ),
                      ],
                    ),
                  ),
                ),

                // ================= RESOLVE BUTTON =================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: data['status'] == "resolved"
                        ? null
                        : () => markResolved(context, sosId),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: data['status'] == "resolved"
                          ? Colors.grey
                          : Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          data['status'] == "resolved"
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          data['status'] == "resolved"
                              ? "✓ Resolved"
                              : "Mark as Resolved",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SOSDetailPage extends StatelessWidget {
//   final Map<String, dynamic> data;

//   const SOSDetailPage({super.key, required this.data});

//   // ================= CALL =================
//   Future<void> callNumber(String number) async {
//     if (number.isEmpty) return;
//     final uri = Uri(scheme: "tel", path: number);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     }
//   }

//   // ================= LOCATION =================
//   Future<void> openLocation(String url) async {
//     if (url.isEmpty) return;
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }

//   // ================= UPDATE STATUS =================
//   Future<void> markResolved(BuildContext context, String docId) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('sos_history')
//           .doc(docId)
//           .update({"status": "resolved"});

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("SOS marked as resolved")));

//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }

//   Widget _buildWhiteCard({required Widget child}) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }

//   Widget _buildIconPlaceholder({required IconData icon, required Color color}) {
//     return Container(
//       height: 48,
//       width: 48,
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.12),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(icon, color: color, size: 24),
//     );
//   }

//   Widget _buildTile({
//     required String label,
//     required String value,
//     IconData? icon,
//     Color? iconColor,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (icon != null && iconColor != null)
//             _buildIconPlaceholder(icon: icon, color: iconColor)
//           else
//             const SizedBox(height: 48, width: 48),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Colors.grey.shade600,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   value,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey.shade800,
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

//   Widget _buildActionButton({
//     required String label,
//     required IconData icon,
//     required VoidCallback onPressed,
//     required Color color,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 18),
//       label: Text(
//         label,
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         foregroundColor: Colors.white,
//         minimumSize: const Size(double.infinity, 44),
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 0,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String sosId = data['docId'] ?? data['id'] ?? "";
//     final String userId = data['userId'] ?? "";

//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6FB),
//       appBar: AppBar(
//         title: const Text(
//           "SOS Details",
//           style: TextStyle(fontWeight: FontWeight.w700),
//         ),
//         backgroundColor: Colors.teal,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance
//             .collection('users')
//             .doc(userId)
//             .get(),
//         builder: (context, snapshot) {
//           final userData = snapshot.data?.data() as Map<String, dynamic>?;

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ================= USER DETAILS CARD =================
//                 _buildWhiteCard(
//                   child: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             _buildIconPlaceholder(
//                               icon: Icons.person_outline_rounded,
//                               color: Colors.teal,
//                             ),
//                             const SizedBox(width: 12),
//                             const Text(
//                               "User Details",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w800,
//                                 color: Color(0xFF1E2432),
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 4,
//                                 horizontal: 8,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: data['status'] == 'resolved'
//                                     ? Colors.teal.withOpacity(0.12)
//                                     : Colors.red.withOpacity(0.12),
//                                 borderRadius: BorderRadius.circular(6),
//                                 border: Border.all(
//                                   color: data['status'] == 'resolved'
//                                       ? Colors.teal
//                                       : Colors.red,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Text(
//                                 data['status'] == 'resolved'
//                                     ? 'RESOLVED'
//                                     : 'PENDING',
//                                 style: TextStyle(
//                                   color: data['status'] == 'resolved'
//                                       ? Colors.teal
//                                       : Colors.red,
//                                   fontSize: 9,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Divider(
//                           color: Color.fromARGB(255, 226, 224, 224),
//                           height: 20,
//                         ),
//                         _buildTile(
//                           label: "Name",
//                           value: userData?['name'] ?? 'N/A',
//                           icon: Icons.person_outline_rounded,
//                           iconColor: Colors.teal,
//                         ),
//                         _buildTile(
//                           label: "Email",
//                           value: userData?['email'] ?? 'N/A',
//                           icon: Icons.mail_outline_rounded,
//                           iconColor: Colors.teal,
//                         ),
//                         _buildTile(
//                           label: "Mobile",
//                           value: userData?['mobile'] ?? 'N/A',
//                           icon: Icons.call_outlined,
//                           iconColor: Colors.teal,
//                         ),
//                         _buildTile(
//                           label: "Address",
//                           value: userData?['address'] ?? 'N/A',
//                           icon: Icons.location_on_outlined,
//                           iconColor: Colors.teal,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // ================= EMERGENCY ACTIONS CARD =================
//                 _buildWhiteCard(
//                   child: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             _buildIconPlaceholder(
//                               icon: Icons.security_rounded,
//                               color: Colors.teal,
//                             ),
//                             const SizedBox(width: 12),
//                             const Text(
//                               "Emergency Actions",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w800,
//                                 color: Color(0xFF1E2432),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         _buildActionButton(
//                           label: "Open Live Location",
//                           icon: Icons.map_rounded,
//                           onPressed: () => openLocation(data['location'] ?? ""),
//                           color: Colors.teal,
//                         ),
//                         const SizedBox(height: 10),
//                         _buildActionButton(
//                           label: "Call Doctor",
//                           icon: Icons.medical_services_rounded,
//                           onPressed: () => callNumber(data['doctor'] ?? ""),
//                           color: Colors.teal.shade700,
//                         ),
//                         const SizedBox(height: 10),
//                         _buildActionButton(
//                           label: "Call Friend",
//                           icon: Icons.call_rounded,
//                           onPressed: () => callNumber(data['friend'] ?? ""),
//                           color: Colors.teal.shade600,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // ================= RESOLVE BUTTON =================
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: data['status'] == 'resolved'
//                         ? null
//                         : () => markResolved(context, sosId),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: data['status'] == 'resolved'
//                           ? Colors.grey.shade400
//                           : Colors.teal,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.all(14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           data['status'] == 'resolved'
//                               ? Icons.check_circle
//                               : Icons.check_circle_outline,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           data['status'] == 'resolved'
//                               ? 'Resolved'
//                               : 'Mark as Resolved',
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
