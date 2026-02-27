// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // class UserManagementPage extends StatelessWidget {
// // // //   const UserManagementPage({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return SingleChildScrollView(
// // // //       padding: const EdgeInsets.all(16),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           const Text(
// // // //             "User Management",
// // // //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // //           ),
// // // //           const SizedBox(height: 16),

// // // //           // Search bar (UI only – logic can be added later)
// // // //           TextField(
// // // //             decoration: InputDecoration(
// // // //               hintText: "Search users...",
// // // //               prefixIcon: const Icon(Icons.search),
// // // //               border: OutlineInputBorder(
// // // //                 borderRadius: BorderRadius.circular(12),
// // // //               ),
// // // //               fillColor: Colors.blueAccent.withOpacity(0.05),
// // // //               filled: true,
// // // //             ),
// // // //           ),
// // // //           const SizedBox(height: 16),

// // // //           // 🔥 REAL USERS FROM FIREBASE
// // // //           StreamBuilder<QuerySnapshot>(
// // // //             stream: FirebaseFirestore.instance.collection('users').snapshots(),
// // // //             builder: (context, snapshot) {
// // // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // // //                 return const Center(child: CircularProgressIndicator());
// // // //               }

// // // //               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //                 return const Center(child: Text("No users found"));
// // // //               }

// // // //               final users = snapshot.data!.docs;

// // // //               return ListView.builder(
// // // //                 shrinkWrap: true,
// // // //                 physics: const NeverScrollableScrollPhysics(),
// // // //                 itemCount: users.length,
// // // //                 itemBuilder: (context, index) {
// // // //                   final user = users[index].data() as Map<String, dynamic>;

// // // //                   final String name = user['name'] ?? 'No Name';
// // // //                   final String email = user['email'] ?? 'No Email';
// // // //                   final String accountType = user['accountType'] ?? 'User';

// // // //                   return Card(
// // // //                     margin: const EdgeInsets.only(bottom: 12),
// // // //                     child: ListTile(
// // // //                       leading: CircleAvatar(
// // // //                         backgroundColor: Colors.blue[100],
// // // //                         backgroundImage: const AssetImage('assets/admin.png'),
// // // //                       ),
// // // //                       title: Text(name),
// // // //                       subtitle: Text(email),
// // // //                       trailing: Text(
// // // //                         accountType,
// // // //                         style: TextStyle(
// // // //                           color: accountType == 'Admin'
// // // //                               ? Colors.red
// // // //                               : Colors.green,
// // // //                           fontWeight: FontWeight.bold,
// // // //                         ),
// // // //                       ),
// // // //                       onTap: () {
// // // //                         // future: open user detail / edit
// // // //                       },
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             },
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:intl/intl.dart';

// // // class UserManagementPage extends StatelessWidget {
// // //   const UserManagementPage({super.key});

// // //   String _formatDate(dynamic value) {
// // //     if (value == null) return 'N/A';

// // //     try {
// // //       if (value is Timestamp) {
// // //         return DateFormat('dd MMM yyyy, hh:mm a').format(value.toDate());
// // //       }

// // //       if (value is String && value.isNotEmpty) {
// // //         return DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.parse(value));
// // //       }
// // //     } catch (_) {}

// // //     return 'N/A';
// // //   }

// // //   String _getString(
// // //     Map<String, dynamic> data,
// // //     String key, {
// // //     String fallback = 'Not Available',
// // //   }) {
// // //     final value = data[key];
// // //     final text = value?.toString().trim() ?? '';
// // //     return text.isEmpty ? fallback : text;
// // //   }

// // //   bool _isUser(Map<String, dynamic> data) {
// // //     final accountType = data['accountType']?.toString().trim().toLowerCase();
// // //     return accountType == 'user';
// // //   }

// // //   DateTime? _parseJoinedAt(dynamic value) {
// // //     try {
// // //       if (value is Timestamp) return value.toDate();
// // //       if (value is String && value.isNotEmpty) return DateTime.parse(value);
// // //     } catch (_) {}
// // //     return null;
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SafeArea(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               const Text(
// // //                 "User Management",
// // //                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 16),
// // //               TextField(
// // //                 decoration: InputDecoration(
// // //                   hintText: "Search users...",
// // //                   prefixIcon: const Icon(Icons.search),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(12),
// // //                   ),
// // //                   filled: true,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 20),
// // //               Expanded(
// // //                 child: StreamBuilder<QuerySnapshot>(
// // //                   stream: FirebaseFirestore.instance
// // //                       .collection('users')
// // //                       .snapshots(),
// // //                   builder: (context, snapshot) {
// // //                     if (snapshot.connectionState == ConnectionState.waiting) {
// // //                       return const Center(child: CircularProgressIndicator());
// // //                     }

// // //                     if (snapshot.hasError) {
// // //                       return Center(
// // //                         child: Text(
// // //                           'Error: ${snapshot.error}',
// // //                           style: const TextStyle(color: Colors.red),
// // //                         ),
// // //                       );
// // //                     }

// // //                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // //                       return const Center(child: Text('No users found'));
// // //                     }

// // //                     final users = snapshot.data!.docs
// // //                         .map((doc) => doc.data() as Map<String, dynamic>)
// // //                         .where(_isUser)
// // //                         .toList();

// // //                     users.sort((a, b) {
// // //                       final aDate = _parseJoinedAt(a['termsAcceptedAt']);
// // //                       final bDate = _parseJoinedAt(b['termsAcceptedAt']);

// // //                       if (aDate == null && bDate == null) return 0;
// // //                       if (aDate == null) return 1;
// // //                       if (bDate == null) return -1;

// // //                       return bDate.compareTo(aDate);
// // //                     });

// // //                     if (users.isEmpty) {
// // //                       return const Center(child: Text('No users found'));
// // //                     }

// // //                     return ListView.builder(
// // //                       itemCount: users.length,
// // //                       itemBuilder: (context, index) {
// // //                         final user = users[index];
// // //                         final name = _getString(
// // //                           user,
// // //                           'name',
// // //                           fallback: 'No Name',
// // //                         );
// // //                         final email = _getString(
// // //                           user,
// // //                           'email',
// // //                           fallback: 'No Email',
// // //                         );
// // //                         final mobile = _getString(user, 'mobile');
// // //                         final address = _getString(user, 'address');
// // //                         final joinedAt = _formatDate(user['termsAcceptedAt']);
// // //                         final profileImage =
// // //                             user['profileImage']?.toString().trim() ?? '';

// // //                         return Card(
// // //                           margin: const EdgeInsets.only(bottom: 12),
// // //                           elevation: 2,
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(12),
// // //                           ),
// // //                           child: Padding(
// // //                             padding: const EdgeInsets.all(16),
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Row(
// // //                                   children: [
// // //                                     CircleAvatar(
// // //                                       radius: 28,
// // //                                       backgroundColor: Colors.blue.shade100,
// // //                                       backgroundImage: profileImage.isNotEmpty
// // //                                           ? NetworkImage(profileImage)
// // //                                           : null,
// // //                                       child: profileImage.isEmpty
// // //                                           ? const Icon(
// // //                                               Icons.person,
// // //                                               size: 30,
// // //                                               color: Colors.blue,
// // //                                             )
// // //                                           : null,
// // //                                     ),
// // //                                     const SizedBox(width: 12),
// // //                                     Expanded(
// // //                                       child: Text(
// // //                                         name,
// // //                                         style: const TextStyle(
// // //                                           fontSize: 18,
// // //                                           fontWeight: FontWeight.bold,
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                                 const Divider(height: 24),
// // //                                 Row(
// // //                                   children: [
// // //                                     const Icon(
// // //                                       Icons.email,
// // //                                       size: 18,
// // //                                       color: Colors.blue,
// // //                                     ),
// // //                                     const SizedBox(width: 8),
// // //                                     Expanded(child: Text(email)),
// // //                                   ],
// // //                                 ),
// // //                                 const SizedBox(height: 10),
// // //                                 Row(
// // //                                   children: [
// // //                                     const Icon(
// // //                                       Icons.phone,
// // //                                       size: 18,
// // //                                       color: Colors.green,
// // //                                     ),
// // //                                     const SizedBox(width: 8),
// // //                                     Expanded(child: Text(mobile)),
// // //                                   ],
// // //                                 ),
// // //                                 const SizedBox(height: 10),
// // //                                 Row(
// // //                                   children: [
// // //                                     const Icon(
// // //                                       Icons.location_on,
// // //                                       size: 18,
// // //                                       color: Colors.red,
// // //                                     ),
// // //                                     const SizedBox(width: 8),
// // //                                     Expanded(child: Text(address)),
// // //                                   ],
// // //                                 ),
// // //                                 const SizedBox(height: 10),
// // //                                 Row(
// // //                                   children: [
// // //                                     const Icon(
// // //                                       Icons.calendar_today,
// // //                                       size: 18,
// // //                                       color: Colors.orange,
// // //                                     ),
// // //                                     const SizedBox(width: 8),
// // //                                     Expanded(
// // //                                       child: Text('Joined At: $joinedAt'),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     );
// // //                   },
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:mentalwellapp/view/ADMIN/AdminUserProfilePage.dart';

// // class UserManagementPage extends StatelessWidget {
// //   const UserManagementPage({super.key});

// //   String _formatDate(dynamic value) {
// //     if (value == null) return 'N/A';
// //     try {
// //       if (value is Timestamp) {
// //         return DateFormat('dd MMM yyyy, hh:mm a').format(value.toDate());
// //       }
// //       if (value is String && value.isNotEmpty) {
// //         return DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.parse(value));
// //       }
// //     } catch (_) {}
// //     return 'N/A';
// //   }

// //   String _getString(
// //     Map<String, dynamic> data,
// //     String key, {
// //     String fallback = 'Not Available',
// //   }) {
// //     final value = data[key];
// //     final text = value?.toString().trim() ?? '';
// //     return text.isEmpty ? fallback : text;
// //   }

// //   bool _isUser(Map<String, dynamic> data) {
// //     final accountType = data['accountType']?.toString().trim().toLowerCase();
// //     return accountType == 'user';
// //   }

// //   DateTime? _parseJoinedAt(dynamic value) {
// //     try {
// //       if (value is Timestamp) return value.toDate();
// //       if (value is String && value.isNotEmpty) return DateTime.parse(value);
// //     } catch (_) {}
// //     return null;
// //   }

// //   int _getProfileCompletion(Map<String, dynamic> user) {
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

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF4F6FB),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text(
// //                 "User Management",
// //                 style: TextStyle(
// //                   fontSize: 26,
// //                   fontWeight: FontWeight.w800,
// //                   color: Color(0xFF1E2432),
// //                 ),
// //               ),
// //               const SizedBox(height: 6),
// //               Text(
// //                 "Tap any user to view full profile",
// //                 style: TextStyle(
// //                   fontSize: 13.5,
// //                   color: Colors.grey.shade600,
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               TextField(
// //                 decoration: InputDecoration(
// //                   hintText: "Search users...",
// //                   prefixIcon: const Icon(Icons.search),
// //                   filled: true,
// //                   fillColor: Colors.white,
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(16),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(16),
// //                     borderSide: BorderSide(color: Colors.grey.shade200),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Expanded(
// //                 child: StreamBuilder<QuerySnapshot>(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('users')
// //                       .snapshots(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.waiting) {
// //                       return const Center(child: CircularProgressIndicator());
// //                     }

// //                     if (snapshot.hasError) {
// //                       return Center(
// //                         child: Text(
// //                           'Error: ${snapshot.error}',
// //                           style: const TextStyle(color: Colors.red),
// //                         ),
// //                       );
// //                     }

// //                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //                       return const Center(child: Text('No users found'));
// //                     }

// //                     final users = snapshot.data!.docs
// //                         .map((doc) {
// //                           final data = doc.data() as Map<String, dynamic>;
// //                           return {'id': doc.id, 'data': data};
// //                         })
// //                         .where((item) {
// //                           return _isUser(item['data'] as Map<String, dynamic>);
// //                         })
// //                         .toList();

// //                     users.sort((a, b) {
// //                       final aData = a['data'] as Map<String, dynamic>;
// //                       final bData = b['data'] as Map<String, dynamic>;
// //                       final aDate = _parseJoinedAt(aData['termsAcceptedAt']);
// //                       final bDate = _parseJoinedAt(bData['termsAcceptedAt']);
// //                       if (aDate == null && bDate == null) return 0;
// //                       if (aDate == null) return 1;
// //                       if (bDate == null) return -1;
// //                       return bDate.compareTo(aDate);
// //                     });

// //                     if (users.isEmpty) {
// //                       return const Center(child: Text('No users found'));
// //                     }

// //                     return ListView.builder(
// //                       itemCount: users.length,
// //                       itemBuilder: (context, index) {
// //                         final docId = users[index]['id'] as String;
// //                         final user =
// //                             users[index]['data'] as Map<String, dynamic>;

// //                         final name = _getString(
// //                           user,
// //                           'name',
// //                           fallback: 'No Name',
// //                         );
// //                         final email = _getString(
// //                           user,
// //                           'email',
// //                           fallback: 'No Email',
// //                         );
// //                         final mobile = _getString(user, 'mobile');
// //                         final address = _getString(user, 'address');
// //                         final joinedAt = _formatDate(user['termsAcceptedAt']);
// //                         final profileImage =
// //                             user['profileImage']?.toString().trim() ?? '';
// //                         final completion = _getProfileCompletion(user);

// //                         return Padding(
// //                           padding: const EdgeInsets.only(bottom: 12),
// //                           child: InkWell(
// //                             borderRadius: BorderRadius.circular(22),
// //                             onTap: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (_) =>
// //                                       AdminUserProfilePage(userId: docId),
// //                                 ),
// //                               );
// //                             },
// //                             child: Container(
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white,
// //                                 borderRadius: BorderRadius.circular(22),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: Colors.black.withOpacity(0.05),
// //                                     blurRadius: 18,
// //                                     offset: const Offset(0, 8),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: Stack(
// //                                 children: [
// //                                   Container(
// //                                     height: 8,
// //                                     decoration: const BoxDecoration(
// //                                       borderRadius: BorderRadius.vertical(
// //                                         top: Radius.circular(22),
// //                                       ),
// //                                       gradient: LinearGradient(
// //                                         colors: [
// //                                           Color(0xFF6C63FF),
// //                                           Color(0xFF8E85FF),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.all(16),
// //                                     child: Column(
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                       children: [
// //                                         Row(
// //                                           crossAxisAlignment:
// //                                               CrossAxisAlignment.start,
// //                                           children: [
// //                                             Stack(
// //                                               children: [
// //                                                 CircleAvatar(
// //                                                   radius: 30,
// //                                                   backgroundColor:
// //                                                       Colors.blue.shade100,
// //                                                   backgroundImage:
// //                                                       profileImage.isNotEmpty
// //                                                       ? NetworkImage(
// //                                                           profileImage,
// //                                                         )
// //                                                       : null,
// //                                                   child: profileImage.isEmpty
// //                                                       ? const Icon(
// //                                                           Icons.person,
// //                                                           size: 30,
// //                                                           color: Colors.blue,
// //                                                         )
// //                                                       : null,
// //                                                 ),
// //                                                 Positioned(
// //                                                   bottom: 0,
// //                                                   right: 0,
// //                                                   child: Container(
// //                                                     padding:
// //                                                         const EdgeInsets.all(4),
// //                                                     decoration:
// //                                                         const BoxDecoration(
// //                                                           color: Colors.green,
// //                                                           shape:
// //                                                               BoxShape.circle,
// //                                                         ),
// //                                                     child: const Icon(
// //                                                       Icons.verified,
// //                                                       size: 12,
// //                                                       color: Colors.white,
// //                                                     ),
// //                                                   ),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                             const SizedBox(width: 12),
// //                                             Expanded(
// //                                               child: Column(
// //                                                 crossAxisAlignment:
// //                                                     CrossAxisAlignment.start,
// //                                                 children: [
// //                                                   Text(
// //                                                     name,
// //                                                     style: const TextStyle(
// //                                                       fontSize: 18,
// //                                                       fontWeight:
// //                                                           FontWeight.w800,
// //                                                       color: Color(0xFF1E2432),
// //                                                     ),
// //                                                   ),
// //                                                   const SizedBox(height: 4),
// //                                                   Text(
// //                                                     email,
// //                                                     maxLines: 1,
// //                                                     overflow:
// //                                                         TextOverflow.ellipsis,
// //                                                     style: TextStyle(
// //                                                       fontSize: 13.5,
// //                                                       color:
// //                                                           Colors.grey.shade700,
// //                                                     ),
// //                                                   ),
// //                                                 ],
// //                                               ),
// //                                             ),
// //                                             const Icon(
// //                                               Icons.arrow_forward_ios_rounded,
// //                                               size: 16,
// //                                               color: Colors.grey,
// //                                             ),
// //                                           ],
// //                                         ),
// //                                         const SizedBox(height: 16),
// //                                         _infoRow(
// //                                           Icons.phone,
// //                                           mobile,
// //                                           Colors.green,
// //                                         ),
// //                                         const SizedBox(height: 10),
// //                                         _infoRow(
// //                                           Icons.location_on,
// //                                           address,
// //                                           Colors.red,
// //                                         ),
// //                                         const SizedBox(height: 10),
// //                                         _infoRow(
// //                                           Icons.calendar_today,
// //                                           'Joined At: $joinedAt',
// //                                           Colors.orange,
// //                                         ),
// //                                         const SizedBox(height: 14),
// //                                         Row(
// //                                           children: [
// //                                             _badge(
// //                                               'User',
// //                                               const Color(0xFF6C63FF),
// //                                             ),
// //                                             const SizedBox(width: 8),
// //                                             _badge(
// //                                               '$completion% complete',
// //                                               Colors.teal,
// //                                             ),
// //                                             const Spacer(),
// //                                             Icon(
// //                                               Icons.visibility_outlined,
// //                                               color: Colors.grey.shade600,
// //                                               size: 18,
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _infoRow(IconData icon, String text, Color color) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 18, color: color),
// //         const SizedBox(width: 8),
// //         Expanded(
// //           child: Text(
// //             text,
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: const TextStyle(
// //               fontSize: 14,
// //               color: Color(0xFF2B3141),
// //               fontWeight: FontWeight.w600,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _badge(String text, Color color) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.12),
// //         borderRadius: BorderRadius.circular(999),
// //       ),
// //       child: Text(
// //         text,
// //         style: TextStyle(
// //           color: color,
// //           fontSize: 12,
// //           fontWeight: FontWeight.w700,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mentalwellapp/view/ADMIN/AdminUserProfilePage.dart';

// class UserManagementPage extends StatefulWidget {
//   const UserManagementPage({super.key});

//   @override
//   State<UserManagementPage> createState() => _UserManagementPageState();
// }

// class _UserManagementPageState extends State<UserManagementPage> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchText = '';

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   String _formatDate(dynamic value) {
//     if (value == null) return 'N/A';
//     try {
//       if (value is Timestamp) {
//         return DateFormat('dd MMM yyyy, hh:mm a').format(value.toDate());
//       }
//       if (value is String && value.isNotEmpty) {
//         return DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.parse(value));
//       }
//     } catch (_) {}
//     return 'N/A';
//   }

//   String _getString(
//     Map<String, dynamic> data,
//     String key, {
//     String fallback = 'Not Available',
//   }) {
//     final value = data[key];
//     final text = value?.toString().trim() ?? '';
//     return text.isEmpty ? fallback : text;
//   }

//   bool _isUser(Map<String, dynamic> data) {
//     final accountType = data['accountType']?.toString().trim().toLowerCase();
//     return accountType == 'user';
//   }

//   DateTime? _parseJoinedAt(dynamic value) {
//     try {
//       if (value is Timestamp) return value.toDate();
//       if (value is String && value.isNotEmpty) return DateTime.parse(value);
//     } catch (_) {}
//     return null;
//   }

//   int _getProfileCompletion(Map<String, dynamic> user) {
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

//   bool _matchesSearch(Map<String, dynamic> user) {
//     if (_searchText.trim().isEmpty) return true;

//     final q = _searchText.toLowerCase().trim();

//     final name = _getString(user, 'name', fallback: '').toLowerCase();
//     final email = _getString(user, 'email', fallback: '').toLowerCase();
//     final mobile = _getString(user, 'mobile', fallback: '').toLowerCase();
//     final address = _getString(user, 'address', fallback: '').toLowerCase();

//     return name.contains(q) ||
//         email.contains(q) ||
//         mobile.contains(q) ||
//         address.contains(q);
//   }

//   Widget _infoRow(IconData icon, String text, Color color) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: color),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             text,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Color(0xFF2B3141),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _badge(String text, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.12),
//         borderRadius: BorderRadius.circular(999),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: color,
//           fontSize: 12,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6FB),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "User Management",
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFF1E2432),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 "Tap any user to view full profile",
//                 style: TextStyle(
//                   fontSize: 13.5,
//                   color: Colors.grey.shade600,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   setState(() {
//                     _searchText = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search users...",
//                   prefixIcon: const Icon(Icons.search),
//                   suffixIcon: _searchText.isNotEmpty
//                       ? IconButton(
//                           onPressed: () {
//                             _searchController.clear();
//                             setState(() {
//                               _searchText = '';
//                             });
//                           },
//                           icon: const Icon(Icons.close),
//                         )
//                       : null,
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide(color: Colors.grey.shade200),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('users')
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text(
//                           'Error: ${snapshot.error}',
//                           style: const TextStyle(color: Colors.red),
//                         ),
//                       );
//                     }

//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return const Center(child: Text('No users found'));
//                     }

//                     final users = snapshot.data!.docs
//                         .map((doc) {
//                           final data = doc.data() as Map<String, dynamic>;
//                           return {'id': doc.id, 'data': data};
//                         })
//                         .where((item) {
//                           return _isUser(item['data'] as Map<String, dynamic>);
//                         })
//                         .toList();

//                     final filteredUsers = users.where((item) {
//                       return _matchesSearch(
//                         item['data'] as Map<String, dynamic>,
//                       );
//                     }).toList();

//                     filteredUsers.sort((a, b) {
//                       final aData = a['data'] as Map<String, dynamic>;
//                       final bData = b['data'] as Map<String, dynamic>;
//                       final aDate = _parseJoinedAt(aData['termsAcceptedAt']);
//                       final bDate = _parseJoinedAt(bData['termsAcceptedAt']);
//                       if (aDate == null && bDate == null) return 0;
//                       if (aDate == null) return 1;
//                       if (bDate == null) return -1;
//                       return bDate.compareTo(aDate);
//                     });

//                     if (filteredUsers.isEmpty) {
//                       return const Center(
//                         child: Text('No matching users found'),
//                       );
//                     }

//                     return ListView.builder(
//                       itemCount: filteredUsers.length,
//                       itemBuilder: (context, index) {
//                         final docId = filteredUsers[index]['id'] as String;
//                         final user =
//                             filteredUsers[index]['data']
//                                 as Map<String, dynamic>;

//                         final name = _getString(
//                           user,
//                           'name',
//                           fallback: 'No Name',
//                         );
//                         final email = _getString(
//                           user,
//                           'email',
//                           fallback: 'No Email',
//                         );
//                         final mobile = _getString(user, 'mobile');
//                         final address = _getString(user, 'address');
//                         final joinedAt = _formatDate(user['termsAcceptedAt']);
//                         final profileImage =
//                             user['profileImage']?.toString().trim() ?? '';
//                         final completion = _getProfileCompletion(user);

//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(22),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       AdminUserProfilePage(userId: docId),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(22),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.05),
//                                     blurRadius: 18,
//                                     offset: const Offset(0, 8),
//                                   ),
//                                 ],
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: 8,
//                                     decoration: const BoxDecoration(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(22),
//                                       ),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Color(0xFF6C63FF),
//                                           Color(0xFF8E85FF),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(16),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Stack(
//                                               children: [
//                                                 CircleAvatar(
//                                                   radius: 30,
//                                                   backgroundColor:
//                                                       Colors.blue.shade100,
//                                                   backgroundImage:
//                                                       profileImage.isNotEmpty
//                                                       ? NetworkImage(
//                                                           profileImage,
//                                                         )
//                                                       : null,
//                                                   child: profileImage.isEmpty
//                                                       ? const Icon(
//                                                           Icons.person,
//                                                           size: 30,
//                                                           color: Colors.blue,
//                                                         )
//                                                       : null,
//                                                 ),
//                                                 Positioned(
//                                                   bottom: 0,
//                                                   right: 0,
//                                                   child: Container(
//                                                     padding:
//                                                         const EdgeInsets.all(4),
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                           color: Colors.green,
//                                                           shape:
//                                                               BoxShape.circle,
//                                                         ),
//                                                     child: const Icon(
//                                                       Icons.verified,
//                                                       size: 12,
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const SizedBox(width: 12),
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     name,
//                                                     style: const TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       color: Color(0xFF1E2432),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 4),
//                                                   Text(
//                                                     email,
//                                                     maxLines: 1,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     style: TextStyle(
//                                                       fontSize: 13.5,
//                                                       color:
//                                                           Colors.grey.shade700,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Icon(
//                                               Icons.arrow_forward_ios_rounded,
//                                               size: 16,
//                                               color: Colors.grey,
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 16),
//                                         _infoRow(
//                                           Icons.phone,
//                                           mobile,
//                                           Colors.green,
//                                         ),
//                                         const SizedBox(height: 10),
//                                         _infoRow(
//                                           Icons.location_on,
//                                           address,
//                                           Colors.red,
//                                         ),
//                                         const SizedBox(height: 10),
//                                         _infoRow(
//                                           Icons.calendar_today,
//                                           'Joined At: $joinedAt',
//                                           Colors.orange,
//                                         ),
//                                         const SizedBox(height: 14),
//                                         Row(
//                                           children: [
//                                             _badge(
//                                               'User',
//                                               const Color(0xFF6C63FF),
//                                             ),
//                                             const SizedBox(width: 8),
//                                             _badge(
//                                               '$completion% complete',
//                                               Colors.teal,
//                                             ),
//                                             const Spacer(),
//                                             Icon(
//                                               Icons.visibility_outlined,
//                                               color: Colors.grey.shade600,
//                                               size: 18,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentalwellapp/view/ADMIN/AdminUserProfilePage.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _formatDate(dynamic value) {
    if (value == null) return 'N/A';
    try {
      if (value is Timestamp) {
        return DateFormat('dd MMM yyyy, hh:mm a').format(value.toDate());
      }
      if (value is String && value.isNotEmpty) {
        return DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.parse(value));
      }
    } catch (_) {}
    return 'N/A';
  }

  String _getString(
    Map<String, dynamic> data,
    String key, {
    String fallback = 'Not Available',
  }) {
    final value = data[key];
    final text = value?.toString().trim() ?? '';
    return text.isEmpty ? fallback : text;
  }

  bool _isUser(Map<String, dynamic> data) {
    final accountType = data['accountType']?.toString().trim().toLowerCase();
    return accountType == 'user';
  }

  DateTime? _parseJoinedAt(dynamic value) {
    try {
      if (value is Timestamp) return value.toDate();
      if (value is String && value.isNotEmpty) return DateTime.parse(value);
    } catch (_) {}
    return null;
  }

  int _getProfileCompletion(Map<String, dynamic> user) {
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

  bool _matchesSearch(Map<String, dynamic> user) {
    if (_searchText.trim().isEmpty) return true;

    final q = _searchText.toLowerCase().trim();
    final name = _getString(user, 'name', fallback: '').toLowerCase();
    final email = _getString(user, 'email', fallback: '').toLowerCase();
    final mobile = _getString(user, 'mobile', fallback: '').toLowerCase();
    final address = _getString(user, 'address', fallback: '').toLowerCase();

    return name.contains(q) ||
        email.contains(q) ||
        mobile.contains(q) ||
        address.contains(q);
  }

  Future<void> _deleteUser(String docId, String name) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text(
          'Are you sure you want to delete $name? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      await FirebaseFirestore.instance.collection('users').doc(docId).delete();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User deleted successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed: $e')));
    }
  }

  Widget _infoRow(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                "Tap any user to view full profile",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() => _searchText = value);
                },
                decoration: InputDecoration(
                  hintText: "Search users...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchText.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchText = '');
                          },
                          icon: const Icon(Icons.close),
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No users found'));
                    }

                    final users = snapshot.data!.docs
                        .map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          return {'id': doc.id, 'data': data};
                        })
                        .where(
                          (item) =>
                              _isUser(item['data'] as Map<String, dynamic>),
                        )
                        .where(
                          (item) => _matchesSearch(
                            item['data'] as Map<String, dynamic>,
                          ),
                        )
                        .toList();

                    users.sort((a, b) {
                      final aData = a['data'] as Map<String, dynamic>;
                      final bData = b['data'] as Map<String, dynamic>;
                      final aDate = _parseJoinedAt(aData['termsAcceptedAt']);
                      final bDate = _parseJoinedAt(bData['termsAcceptedAt']);
                      if (aDate == null && bDate == null) return 0;
                      if (aDate == null) return 1;
                      if (bDate == null) return -1;
                      return bDate.compareTo(aDate);
                    });

                    if (users.isEmpty) {
                      return const Center(
                        child: Text('No matching users found'),
                      );
                    }

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final docId = users[index]['id'] as String;
                        final user =
                            users[index]['data'] as Map<String, dynamic>;

                        final name = _getString(
                          user,
                          'name',
                          fallback: 'No Name',
                        );
                        final email = _getString(
                          user,
                          'email',
                          fallback: 'No Email',
                        );
                        final mobile = _getString(user, 'mobile');
                        final address = _getString(user, 'address');
                        final joinedAt = _formatDate(user['termsAcceptedAt']);
                        final profileImage =
                            user['profileImage']?.toString().trim() ?? '';
                        final completion = _getProfileCompletion(user);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(22),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AdminUserProfilePage(userId: docId),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 18,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(22),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 132, 132, 134),
                                          Color.fromARGB(255, 191, 191, 200),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor:
                                                      Colors.blue.shade100,
                                                  backgroundImage:
                                                      profileImage.isNotEmpty
                                                      ? NetworkImage(
                                                          profileImage,
                                                        )
                                                      : null,
                                                  child: profileImage.isEmpty
                                                      ? const Icon(
                                                          Icons.person,
                                                          size: 30,
                                                          color: Colors.blue,
                                                        )
                                                      : null,
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration:
                                                        const BoxDecoration(
                                                          color: Colors.green,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                    child: const Icon(
                                                      Icons.verified,
                                                      size: 12,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    name,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Color(0xFF1E2432),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    email,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13.5,
                                                      color:
                                                          Colors.grey.shade700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  _deleteUser(docId, name),
                                              icon: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              ),
                                              tooltip: 'Delete User',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        _infoRow(
                                          Icons.phone,
                                          mobile,
                                          Colors.green,
                                        ),
                                        const SizedBox(height: 10),
                                        _infoRow(
                                          Icons.location_on,
                                          address,
                                          Colors.red,
                                        ),
                                        const SizedBox(height: 10),
                                        _infoRow(
                                          Icons.calendar_today,
                                          'Joined At: $joinedAt',
                                          Colors.orange,
                                        ),
                                        const SizedBox(height: 14),
                                        Row(
                                          children: [
                                            _badge(
                                              'User',
                                              const Color(0xFF6C63FF),
                                            ),
                                            const SizedBox(width: 8),
                                            _badge(
                                              '$completion% complete',
                                              Colors.teal,
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Icons.visibility_outlined,
                                              color: Colors.grey.shade600,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
