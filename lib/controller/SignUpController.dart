import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/model/AccountTypeModelFull.dart';

class SignupController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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

  Future<void> saveFullUserProfile(AccountTypeModelFull model) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(model.userId)
          .set(model.toMap(), SetOptions(merge: true));
      log("Full user profile saved for ${model.userId}");
    } catch (e) {
      log("Error saving full user profile: $e");
      rethrow;
    }
  }

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
// import 'package:mentalwellapp/model/AccountTypeModelFull.dart';

// class SignupController {
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   Future<void> addData(
//     String collection,
//     String docId,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       await firebaseFirestore.collection(collection).doc(docId).set(data);
//       log("Data saved in $collection/$docId");
//     } catch (e) {
//       log("Error saving data: $e");
//       rethrow;
//     }
//   }

//   Future<void> addUserData({
//     required String userId,
//     required String email,
//     required String name,
//     String accountType = "User",
//   }) async {
//     try {
//       await firebaseFirestore.collection("users").doc(userId).set({
//         "email": email,
//         "name": name,
//         "accountType": accountType,
//         "mobileVerified": false,
//         "createdAt": FieldValue.serverTimestamp(),
//       });
//       log("Basic user data saved for $userId");
//     } catch (e) {
//       log("Error saving user data: $e");
//       rethrow;
//     }
//   }

//   Future<void> saveFullUserProfile(AccountTypeModelFull model) async {
//     try {
//       await firebaseFirestore
//           .collection("users")
//           .doc(model.userId)
//           .set(model.toMap(), SetOptions(merge: true));
//       log("Full user profile saved for ${model.userId}");
//     } catch (e) {
//       log("Error saving full user profile: $e");
//       rethrow;
//     }
//   }

//   Future<void> saveTermsAcceptance(String userId) async {
//     try {
//       await firebaseFirestore.collection('user_consents').doc(userId).set({
//         "termsAccepted": true,
//         "privacyPolicyAccepted": true,
//         "acceptedAt": FieldValue.serverTimestamp(),
//         "source": "signup",
//       });
//       log("Terms accepted for user $userId");
//     } catch (e) {
//       log("Error saving terms acceptance: $e");
//       rethrow;
//     }
//   }
// }

// // import 'dart:developer';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class SignupController {
// //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// //   // 🔹 GENERIC SAVE (FOR FULL USER MODEL) ✅ FIXES ERROR
// //   Future<void> addData(
// //     String collection,
// //     String docId,
// //     Map<String, dynamic> data,
// //   ) async {
// //     try {
// //       await firebaseFirestore.collection(collection).doc(docId).set(data);
// //       log("Data saved in $collection/$docId");
// //     } catch (e) {
// //       log("Error saving data: $e");
// //       rethrow;
// //     }
// //   }

// //   // 🔹 BASIC SAVE (OPTIONAL – FOR SIMPLE USERS / FUTURE USE)
// //   Future<void> addUserData({
// //     required String userId,
// //     required String email,
// //     required String name,
// //     String accountType = "User",
// //   }) async {
// //     try {
// //       await firebaseFirestore.collection("users").doc(userId).set({
// //         "email": email,
// //         "name": name,
// //         "accountType": accountType,
// //         "mobileVerified": false,
// //         "createdAt": FieldValue.serverTimestamp(),
// //       });
// //       log("Basic user data saved for $userId");
// //     } catch (e) {
// //       log("Error saving user data: $e");
// //       rethrow;
// //     }
// //   }

// //   // 🔹 TERMS & CONDITIONS (NO CHANGE)
// //   Future<void> saveTermsAcceptance(String userId) async {
// //     try {
// //       await firebaseFirestore.collection('user_consents').doc(userId).set({
// //         "termsAccepted": true,
// //         "privacyPolicyAccepted": true,
// //         "acceptedAt": FieldValue.serverTimestamp(),
// //         "source": "signup",
// //       });
// //       log("Terms accepted for user $userId");
// //     } catch (e) {
// //       log("Error saving terms acceptance: $e");
// //       rethrow;
// //     }
// //   }
// // }


