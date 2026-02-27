// class AccountTypeModelFull {
//   final String userId;
//   final String name;
//   final String email;
//   final String mobile;
//   final String address;
//   final String dob;
//   final String profileImage;
//   final String accountType;
//   final bool termsAccepted;
//   final String termsAcceptedAt;
//   final bool mobileVerified;
//   final String termsVersion;

//   AccountTypeModelFull({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.address,
//     required this.dob,
//     required this.profileImage,
//     required this.accountType,
//     required this.termsAccepted,
//     required this.termsAcceptedAt,
//     required this.mobileVerified,
//     required this.termsVersion,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       "userId": userId,
//       "name": name,
//       "email": email,
//       "mobile": mobile,
//       "address": address,
//       "dob": dob,
//       "profileImage": profileImage,
//       "accountType": accountType,
//       "termsAccepted": termsAccepted,
//       "termsAcceptedAt": termsAcceptedAt,
//       "mobileVerified": mobileVerified,
//       "termsVersion": termsVersion,
//     };
//   }

//   factory AccountTypeModelFull.fromMap(Map<String, dynamic> map) {
//     return AccountTypeModelFull(
//       userId: map["userId"] ?? "",
//       name: map["name"] ?? "",
//       email: map["email"] ?? "",
//       mobile: map["mobile"] ?? "",
//       address: map["address"] ?? "",
//       dob: map["dob"] ?? "",
//       profileImage: map["profileImage"] ?? "",
//       accountType: map["accountType"] ?? "User",
//       termsAccepted: map["termsAccepted"] ?? false,
//       termsAcceptedAt: map["termsAcceptedAt"] ?? "",
//       mobileVerified: map["mobileVerified"] ?? false,
//       termsVersion: map["termsVersion"] ?? "",
//     );
//   }
// }

// // class AccountTypeModelFull {
// //   final String userId;
// //   final String name;
// //   final String email;
// //   final String mobile;
// //   final String address;
// //   final String dob;
// //   final String profileImage;
// //   final String accountType;
// //   final bool termsAccepted;
// //   final String termsAcceptedAt;
// //   final bool mobileVerified;
// //   final String termsVersion;

// //   AccountTypeModelFull({
// //     required this.userId,
// //     required this.name,
// //     required this.email,
// //     required this.mobile,
// //     required this.address,
// //     required this.dob,
// //     required this.profileImage,
// //     required this.accountType,
// //     required this.termsAccepted,
// //     required this.termsAcceptedAt,
// //     required this.mobileVerified,
// //     required this.termsVersion,
// //   });

// //   Map<String, dynamic> toMap() {
// //     return {
// //       "userId": userId,
// //       "name": name,
// //       "email": email,
// //       "mobile": mobile,
// //       "address": address,
// //       "dob": dob,
// //       "profileImage": profileImage,
// //       "accountType": accountType,
// //       "termsAccepted": termsAccepted,
// //       "termsAcceptedAt": termsAcceptedAt,
// //       "mobileVerified": mobileVerified,
// //       "termsVersion": termsVersion,
// //     };
// //   }

// //   factory AccountTypeModelFull.fromMap(Map<String, dynamic> map) {
// //     return AccountTypeModelFull(
// //       userId: map["userId"] ?? "",
// //       name: map["name"] ?? "",
// //       email: map["email"] ?? "",
// //       mobile: map["mobile"] ?? "",
// //       address: map["address"] ?? "",
// //       dob: map["dob"] ?? "",
// //       profileImage: map["profileImage"] ?? "",
// //       accountType: map["accountType"] ?? "User",
// //       termsAccepted: map["termsAccepted"] ?? false,
// //       termsAcceptedAt: map["termsAcceptedAt"] ?? "",
// //       mobileVerified: map["mobileVerified"] ?? false,
// //       termsVersion: map["termsVersion"] ?? "",
// //     );
// //   }
// // }

// // // class AccountTypeModelFull {
// // //   final String userId;
// // //   final String name;
// // //   final String email;
// // //   final String mobile;
// // //   final String address;
// // //   final String dob;
// // //   final String profileImage;
// // //   final String accountType;
// // //   final bool termsAccepted;
// // //   final String termsAcceptedAt;
// // //   final bool mobileVerified; // ✅ NEW FIELD

// // //   AccountTypeModelFull({
// // //     required this.userId,
// // //     required this.name,
// // //     required this.email,
// // //     required this.mobile,
// // //     required this.address,
// // //     required this.dob,
// // //     required this.profileImage,
// // //     required this.accountType,
// // //     required this.termsAccepted,
// // //     required this.termsAcceptedAt,
// // //     required this.mobileVerified,
// // //     required String termsVersion, // ✅ REQUIRED
// // //   });

// // //   Map<String, dynamic> toMap() {
// // //     return {
// // //       "userId": userId,
// // //       "name": name,
// // //       "email": email,
// // //       "mobile": mobile,
// // //       "address": address,
// // //       "dob": dob,
// // //       "profileImage": profileImage,
// // //       "accountType": accountType,
// // //       "termsAccepted": termsAccepted,
// // //       "termsAcceptedAt": termsAcceptedAt,
// // //       "mobileVerified": mobileVerified, // ✅ SAVE TO FIRESTORE
// // //     };
// // //   }

// // //   factory AccountTypeModelFull.fromMap(Map<String, dynamic> map) {
// // //     return AccountTypeModelFull(
// // //       userId: map["userId"] ?? "",
// // //       name: map["name"] ?? "",
// // //       email: map["email"] ?? "",
// // //       mobile: map["mobile"] ?? "",
// // //       address: map["address"] ?? "",
// // //       dob: map["dob"] ?? "",
// // //       profileImage: map["profileImage"] ?? "",
// // //       accountType: map["accountType"] ?? "User",
// // //       termsAccepted: map["termsAccepted"] ?? false,
// // //       termsAcceptedAt: map["termsAcceptedAt"] ?? "",
// // //       mobileVerified: map["mobileVerified"] ?? false,
// // //       termsVersion: '',
// // //     );
// // //   }
// // // }

import 'package:cloud_firestore/cloud_firestore.dart';

class AccountTypeModelFull {
  final String userId;
  final String name;
  final String email;
  final String mobile;
  final String address;
  final String dob;
  final String profileImage;
  final String accountType;
  final bool termsAccepted;
  final Timestamp? termsAcceptedAt;
  final Timestamp? createdAt;
  final Timestamp? lastSeenAt;
  final bool mobileVerified;
  final String termsVersion;

  AccountTypeModelFull({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.dob,
    required this.profileImage,
    required this.accountType,
    required this.termsAccepted,
    required this.termsAcceptedAt,
    required this.createdAt,
    required this.lastSeenAt,
    required this.mobileVerified,
    required this.termsVersion,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "mobile": mobile,
      "address": address,
      "dob": dob,
      "profileImage": profileImage,
      "accountType": accountType,
      "termsAccepted": termsAccepted,
      "termsAcceptedAt": termsAcceptedAt,
      "createdAt": createdAt,
      "lastSeenAt": lastSeenAt,
      "mobileVerified": mobileVerified,
      "termsVersion": termsVersion,
    };
  }

  factory AccountTypeModelFull.fromMap(Map<String, dynamic> map) {
    return AccountTypeModelFull(
      userId: map["userId"] ?? "",
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      mobile: map["mobile"] ?? "",
      address: map["address"] ?? "",
      dob: map["dob"] ?? "",
      profileImage: map["profileImage"] ?? "",
      accountType: map["accountType"] ?? "User",
      termsAccepted: map["termsAccepted"] ?? false,
      termsAcceptedAt: map["termsAcceptedAt"] as Timestamp?,
      createdAt: map["createdAt"] as Timestamp?,
      lastSeenAt: map["lastSeenAt"] as Timestamp?,
      mobileVerified: map["mobileVerified"] ?? false,
      termsVersion: map["termsVersion"] ?? "",
    );
  }
}
