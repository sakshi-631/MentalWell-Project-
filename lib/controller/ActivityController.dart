import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentalwellapp/model/UserActivityModel.dart';

class ActivityController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> logActivity({
    required String userId,
    required String userName,
    required String action,
  }) async {
    final now = DateTime.now();
    final activityRef = _firestore.collection("activities").doc();
    final activityId = activityRef.id;

    final model = UserActivityModel(
      activityId: activityId,
      userId: userId,
      userName: userName,
      action: action,
      timestamp: Timestamp.now(),
      dateKey: "${now.year}-${_two(now.month)}-${_two(now.day)}",
      monthKey: "${now.year}-${_two(now.month)}",
    );

    final data = model.toMap();

    await activityRef.set({...data, "timestamp": FieldValue.serverTimestamp()});

    await _firestore
        .collection("users")
        .doc(userId)
        .collection("activity")
        .doc(activityId)
        .set({...data, "timestamp": FieldValue.serverTimestamp()});
  }

  String _two(int value) => value.toString().padLeft(2, '0');
}
