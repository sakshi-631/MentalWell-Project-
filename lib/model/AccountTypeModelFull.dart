
class AccountTypeModelFull {
  String userId;
  String name;
  String email;
  String mobile;
  String address;
  String dob;
  String profileImage;
  String? accountType;

  AccountTypeModelFull({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.dob,
    required this.profileImage,
    this.accountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'mobile': mobile,
      'address': address,
      'dob': dob,
      'profileImage': profileImage,
      'accountType': accountType ?? '',
      'createdAt': DateTime.now(),
    };
  }
}

class AccountTypeModel {
  String label;
  String subtitle;
  String asset;

  AccountTypeModel({
    required this.label,
    required this.subtitle,
    required this.asset,
  });
}
