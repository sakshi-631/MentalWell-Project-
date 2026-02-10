import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // 🔹 GENERIC SAVE (FOR FULL USER MODEL) ✅ FIXES ERROR
  Future<void> addData(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    try {
      await firebaseFirestore.collection(collection).doc(docId).set(data);
      log("Data saved in $collection/$docId");
    } catch (e) {
      log("Error saving data: $e");
      rethrow;
    }
  }

  // 🔹 BASIC SAVE (OPTIONAL – FOR SIMPLE USERS / FUTURE USE)
  Future<void> addUserData({
    required String userId,
    required String email,
    required String name,
    String accountType = "User",
  }) async {
    try {
      await firebaseFirestore.collection("users").doc(userId).set({
        "email": email,
        "name": name,
        "accountType": accountType,
        "mobileVerified": false,
        "createdAt": FieldValue.serverTimestamp(),
      });
      log("Basic user data saved for $userId");
    } catch (e) {
      log("Error saving user data: $e");
      rethrow;
    }
  }

  // 🔹 TERMS & CONDITIONS (NO CHANGE)
  Future<void> saveTermsAcceptance(String userId) async {
    try {
      await firebaseFirestore.collection('user_consents').doc(userId).set({
        "termsAccepted": true,
        "privacyPolicyAccepted": true,
        "acceptedAt": FieldValue.serverTimestamp(),
        "source": "signup",
      });
      log("Terms accepted for user $userId");
    } catch (e) {
      log("Error saving terms acceptance: $e");
      rethrow;
    }
  }
}

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignupController {
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   // Save user basic data
//   Future<void> addData(
//     String collection,
//     String userId,
//     Map<String, dynamic> obj,
//   ) async {
//     try {
//       await firebaseFirestore.collection(collection).doc(userId).set(obj);
//       log("Data saved at $collection/$userId");
//     } catch (e) {
//       log("Error saving data: $e");
//       rethrow;
//     }
//   }

//   // ✅ USER CONSENT (THIS WAS MISSING AT RUNTIME)
//   Future<void> saveTermsAcceptance(String userId) async {
//     try {
//       await firebaseFirestore.collection('user_consents').doc(userId).set({
//         "termsAccepted": true,
//         "privacyPolicyAccepted": true,
//         "acceptedAt": FieldValue.serverTimestamp(),
//         "source": "signup",
//       });
//       log("Terms & Conditions accepted for user $userId");
//     } catch (e) {
//       log("Error saving terms acceptance: $e");
//       rethrow;
//     }
//   }
// }

// // import 'dart:io';
// // import 'dart:developer';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_storage/firebase_storage.dart';

// // class SignupController {
// //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
// //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// //   // Upload profile image
// //   Future<String> uploadProfileImage(File imageFile, String userId) async {
// //     try {
// //       final ref = firebaseStorage.ref().child('profile_images/$userId.jpg');
// //       await ref.putFile(imageFile);
// //       final imageUrl = await ref.getDownloadURL();
// //       log("Image uploaded: $imageUrl");
// //       return imageUrl;
// //     } catch (e) {
// //       log("Error uploading image: $e");
// //       return '';
// //     }
// //   }

// //   // Save user data to Firestore (existing collections)
// //   Future<void> addData(
// //     String collection,
// //     String userId,
// //     Map<String, dynamic> obj,
// //   ) async {
// //     try {
// //       await firebaseFirestore.collection(collection).doc(userId).set(obj);
// //       log("Data saved at $collection/$userId");
// //     } catch (e) {
// //       log("Error saving data: $e");
// //       rethrow;
// //     }
// //   }

// //   // Save Terms & Conditions / user consent
// //   Future<void> saveTermsAcceptance(String userId) async {
// //     try {
// //       await firebaseFirestore.collection('user_consents').doc(userId).set({
// //         "termsAccepted": true,
// //         "privacyPolicyAccepted": true,
// //         "acceptedAt": FieldValue.serverTimestamp(),
// //         "source": "signup", // optional: for tracking
// //       });
// //       log("Terms & Conditions accepted for user $userId");
// //     } catch (e) {
// //       log("Error saving terms acceptance: $e");
// //       rethrow; // important to catch errors in signup
// //     }
// //   }
// // }

// // import 'dart:io';
// // import 'dart:developer';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:device_info_plus/device_info_plus.dart';
// // import 'package:flutter/foundation.dart';

// // class SignupController {
// //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
// //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// //   // ================== EXISTING ADDDATA METHOD (KEEP AS-IS) ==================
// //   Future<void> addData(
// //     String collection,
// //     String userId,
// //     Map<String, dynamic> obj,
// //   ) async {
// //     try {
// //       await firebaseFirestore.collection(collection).doc(userId).set(obj);
// //       log("Data saved at $collection/$userId");
// //     } catch (e) {
// //       log("Error saving data: $e");
// //       rethrow;
// //     }
// //   }

// //   // ================== UPLOAD PROFILE IMAGE ==================
// //   Future<String> uploadProfileImage(File imageFile, String userId) async {
// //     try {
// //       final ref = firebaseStorage.ref().child('profile_images/$userId.jpg');
// //       await ref.putFile(imageFile);
// //       final imageUrl = await ref.getDownloadURL();
// //       log("Image uploaded: $imageUrl");
// //       return imageUrl;
// //     } catch (e) {
// //       log("Error uploading image: $e");
// //       return '';
// //     }
// //   }

// //   // ================== SAVE TERMS & CONSENT ==================
// //   Future<void> saveTermsAcceptance(String userId) async {
// //     try {
// //       Map<String, dynamic> consentData = {
// //         "termsAccepted": true,
// //         "privacyPolicyAccepted": true,
// //         "acceptedAt": FieldValue.serverTimestamp(),
// //         "source": "signup",
// //       };

// //       // Optional: add device info for cybersecurity
// //       consentData.addAll(await _getDeviceInfo());

// //       await firebaseFirestore
// //           .collection('user_consents')
// //           .doc(userId)
// //           .set(consentData);

// //       log("Terms & Conditions accepted for user $userId");
// //     } catch (e) {
// //       log("Error saving terms acceptance: $e");
// //       rethrow;
// //     }
// //   }

// //   // ================== DEVICE INFO FOR CYBERSECURITY ==================
// //   Future<Map<String, dynamic>> _getDeviceInfo() async {
// //     Map<String, dynamic> deviceData = {};
// //     try {
// //       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// //       if (kIsWeb) {
// //         deviceData = {"platform": "Web"};
// //       } else {
// //         if (defaultTargetPlatform == TargetPlatform.android) {
// //           AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// //           deviceData = {
// //             "platform": "Android",
// //             "model": androidInfo.model,
// //             "androidVersion": androidInfo.version.sdkInt,
// //             "manufacturer": androidInfo.manufacturer,
// //           };
// //         } else if (defaultTargetPlatform == TargetPlatform.iOS) {
// //           IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
// //           deviceData = {
// //             "platform": "iOS",
// //             "model": iosInfo.utsname.machine,
// //             "systemVersion": iosInfo.systemVersion,
// //           };
// //         }
// //       }
// //     } catch (e) {
// //       log("Device info error: $e");
// //     }
// //     return deviceData;
// //   }
// // }

// // // import 'dart:io';
// // // import 'dart:developer';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_storage/firebase_storage.dart';

// // // class SignupController {
// // //   final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
// // //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// // //   // Upload profile image
// // //   Future<String> uploadProfileImage(File imageFile, String userId) async {
// // //     try {
// // //       final ref = firebaseStorage.ref().child('profile_images/$userId.jpg');
// // //       await ref.putFile(imageFile);
// // //       final imageUrl = await ref.getDownloadURL();
// // //       log("Image uploaded: $imageUrl");
// // //       return imageUrl;
// // //     } catch (e) {
// // //       log("Error uploading image: $e");
// // //       return '';
// // //     }
// // //   }

// // //   // Save user data to Firestore
// // //   Future<void> addData(
// // //       String collection, String userId, Map<String, dynamic> obj) async {
// // //     try {
// // //       await firebaseFirestore.collection(collection).doc(userId).set(obj);
// // //       log("Data saved at $collection/$userId");
// // //     } catch (e) {
// // //       log("Error saving data: $e");
// // //       rethrow;
// // //     }
// // //   }
// // // }
