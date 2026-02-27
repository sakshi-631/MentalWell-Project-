import 'package:cloud_firestore/cloud_firestore.dart';

class UserActivityModel {
  final String activityId;
  final String userId;
  final String userName;
  final String action;
  final Timestamp timestamp;
  final String dateKey;
  final String monthKey;

  UserActivityModel({
    required this.activityId,
    required this.userId,
    required this.userName,
    required this.action,
    required this.timestamp,
    required this.dateKey,
    required this.monthKey,
  });

  Map<String, dynamic> toMap() {
    return {
      "activityId": activityId,
      "userId": userId,
      "userName": userName,
      "action": action,
      "timestamp": timestamp,
      "dateKey": dateKey,
      "monthKey": monthKey,
    };
  }

  factory UserActivityModel.fromMap(Map<String, dynamic> map) {
    return UserActivityModel(
      activityId: map["activityId"] ?? "",
      userId: map["userId"] ?? "",
      userName: map["userName"] ?? "",
      action: map["action"] ?? "",
      timestamp: map["timestamp"] ?? Timestamp.now(),
      dateKey: map["dateKey"] ?? "",
      monthKey: map["monthKey"] ?? "",
    );
  }
}
