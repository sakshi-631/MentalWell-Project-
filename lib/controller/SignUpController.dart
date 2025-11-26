

import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignupController {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Upload profile image
  Future<String> uploadProfileImage(File imageFile, String userId) async {
    try {
      final ref = firebaseStorage.ref().child('profile_images/$userId.jpg');
      await ref.putFile(imageFile);
      final imageUrl = await ref.getDownloadURL();
      log("Image uploaded: $imageUrl");
      return imageUrl;
    } catch (e) {
      log("Error uploading image: $e");
      return '';
    }
  }

  // Save user data to Firestore
  Future<void> addData(
      String collection, String userId, Map<String, dynamic> obj) async {
    try {
      await firebaseFirestore.collection(collection).doc(userId).set(obj);
      log("Data saved at $collection/$userId");
    } catch (e) {
      log("Error saving data: $e");
      rethrow;
    }
  }
}
