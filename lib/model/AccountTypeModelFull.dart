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
  final String termsAcceptedAt;
  final bool mobileVerified; // ✅ NEW FIELD

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
    required this.mobileVerified, // ✅ REQUIRED
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
      "mobileVerified": mobileVerified, // ✅ SAVE TO FIRESTORE
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
      termsAcceptedAt: map["termsAcceptedAt"] ?? "",
      mobileVerified: map["mobileVerified"] ?? false,
    );
  }
}

// // class AccountTypeModelFull {
// //   String userId;
// //   String name;
// //   String email;
// //   String mobile;
// //   String address;
// //   String dob;
// //   String profileImage;
// //   String? accountType;

// //   AccountTypeModelFull({
// //     required this.userId,
// //     required this.name,
// //     required this.email,
// //     required this.mobile,
// //     required this.address,
// //     required this.dob,
// //     required this.profileImage,
// //     this.accountType,
// //     required bool termsAccepted,
// //     required String termsAcceptedAt,
// //   });

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'userId': userId,
// //       'name': name,
// //       'email': email,
// //       'mobile': mobile,
// //       'address': address,
// //       'dob': dob,
// //       'profileImage': profileImage,
// //       'accountType': accountType ?? '',
// //       'createdAt': DateTime.now(),
// //     };
// //   }
// // }

// // class AccountTypeModel {
// //   String label;
// //   String subtitle;
// //   String asset;

// //   AccountTypeModel({
// //     required this.label,
// //     required this.subtitle,
// //     required this.asset,
// //   });
// // }

// class AccountTypeModelFull {
//   String userId;
//   String name;
//   String email;
//   String mobile;
//   String address;
//   String dob;
//   String profileImage;
//   String? accountType;

//   // Add these fields
//   bool termsAccepted;
//   String termsAcceptedAt;

//   AccountTypeModelFull({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.address,
//     required this.dob,
//     required this.profileImage,
//     this.accountType,
//     required this.termsAccepted,
//     required this.termsAcceptedAt,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'userId': userId,
//       'name': name,
//       'email': email,
//       'mobile': mobile,
//       'address': address,
//       'dob': dob,
//       'profileImage': profileImage,
//       'accountType': accountType ?? '',
//       'termsAccepted': termsAccepted,
//       'termsAcceptedAt': termsAcceptedAt,
//       'createdAt': DateTime.now(),
//     };
//   }
// }
