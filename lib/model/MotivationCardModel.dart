import 'package:cloud_firestore/cloud_firestore.dart';

class MotivationCardModel {
  final String id;
  final String text;
  final String icon;
  final int color1;
  final int color2;
  final bool isActive;
  final int order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;

  MotivationCardModel({
    required this.id,
    required this.text,
    required this.icon,
    required this.color1,
    required this.color2,
    required this.isActive,
    required this.order,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  factory MotivationCardModel.fromMap(Map<String, dynamic> map, String id) {
    return MotivationCardModel(
      id: id,
      text: (map['text'] ?? '').toString(),
      icon: (map['icon'] ?? '🙂').toString(),
      color1: map['color1'] ?? 0xFFAE70B8,
      color2: map['color2'] ?? 0xFFE040FB,
      isActive: map['isActive'] ?? true,
      order: map['order'] ?? 0,
      createdAt: map['createdAt'] is Timestamp
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] is Timestamp
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      createdBy: map['createdBy']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'icon': icon,
      'color1': color1,
      'color2': color2,
      'isActive': isActive,
      'order': order,
      'createdBy': createdBy,
      'createdAt': createdAt == null
          ? FieldValue.serverTimestamp()
          : Timestamp.fromDate(createdAt!),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  MotivationCardModel copyWith({
    String? id,
    String? text,
    String? icon,
    int? color1,
    int? color2,
    bool? isActive,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
  }) {
    return MotivationCardModel(
      id: id ?? this.id,
      text: text ?? this.text,
      icon: icon ?? this.icon,
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      isActive: isActive ?? this.isActive,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
