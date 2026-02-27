import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminUserProfilePage extends StatelessWidget {
  final String userId;
  const AdminUserProfilePage({super.key, required this.userId});

  String getDisplayValue(dynamic value, {String fallback = "Not set"}) {
    if (value == null) return fallback;
    final text = value.toString().trim();
    if (text.isEmpty) return fallback;
    return text;
  }

  String formatDate(dynamic date) {
    if (date == null) return "Not set";
    try {
      if (date is Timestamp) {
        final d = date.toDate().toLocal();
        return DateFormat('dd MMM yyyy').format(d);
      }
      if (date is String && date.trim().isNotEmpty) {
        final d = DateTime.parse(date).toLocal();
        return DateFormat('dd MMM yyyy').format(d);
      }
    } catch (_) {}
    return "Not set";
  }

  String formatDateTime(dynamic date) {
    if (date == null) return "Not set";
    try {
      if (date is Timestamp) {
        final d = date.toDate().toLocal();
        return DateFormat('dd MMM yyyy, hh:mm a').format(d);
      }
      if (date is String && date.trim().isNotEmpty) {
        final d = DateTime.parse(date).toLocal();
        return DateFormat('dd MMM yyyy, hh:mm a').format(d);
      }
    } catch (_) {}
    return "Not set";
  }

  String getSafeGreetingName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return "User";
    return trimmed
        .split(" ")
        .where((e) => e.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(" ");
  }

  String getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return "U";
    final parts = trimmed.split(" ").where((e) => e.isNotEmpty).toList();
    if (parts.isEmpty) return "U";
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  int getContactsAdded(Map<String, dynamic> user) {
    int count = 0;

    final doctorName = getDisplayValue(user["doctorName"], fallback: "");
    final doctorNumber = getDisplayValue(user["doctorNumber"], fallback: "");
    final friendName = getDisplayValue(user["friendName"], fallback: "");
    final friendNumber = getDisplayValue(user["friendNumber"], fallback: "");

    if (doctorName.isNotEmpty && doctorNumber.isNotEmpty) count++;
    if (friendName.isNotEmpty && friendNumber.isNotEmpty) count++;

    return count;
  }

  int getProfileCompletion(Map<String, dynamic> user) {
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
      user["profileImage"],
      user["mobileVerified"],
      user["termsAcceptedAt"],
    ];

    final filled = fields.where((field) {
      if (field == null) return false;
      if (field is String) return field.trim().isNotEmpty;
      return true;
    }).length;

    return ((filled / fields.length) * 100).round();
  }

  Future<void> callNumber(String? number) async {
    if (number == null || number.trim().isEmpty) return;
    final uri = Uri(scheme: "tel", path: number.trim());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1E2432),
        ),
      ),
    );
  }

  Widget _mainCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _tile(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1E2432),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusTile(String title, bool status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: status
                  ? Colors.green.withOpacity(0.12)
                  : Colors.redAccent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              status ? Icons.check_circle : Icons.cancel_outlined,
              color: status ? Colors.green : Colors.redAccent,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E2432),
              ),
            ),
          ),
          Text(
            status ? "Verified" : "Not verified",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: status ? Colors.green : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FB),
        foregroundColor: Colors.black87,
        elevation: 0,
        title: const Text(
          "User Profile",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load profile.\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("User not found"));
          }

          final user = snapshot.data!.data() ?? {};

          final name = getDisplayValue(user["name"], fallback: "User");
          final safeName = getSafeGreetingName(name);
          final email = getDisplayValue(user["email"]);
          final mobile = getDisplayValue(user["mobile"]);
          final dob = formatDate(user["dob"]);
          final address = getDisplayValue(user["address"]);
          final doctorName = getDisplayValue(user["doctorName"]);
          final doctorNumber = getDisplayValue(user["doctorNumber"]);
          final friendName = getDisplayValue(user["friendName"]);
          final friendNumber = getDisplayValue(user["friendNumber"]);
          final mobileVerified = user["mobileVerified"] == true;
          final termsAccepted = user["termsAccepted"] == true;
          final accountCreated = formatDateTime(user["termsAcceptedAt"]);
          final profileImage = getDisplayValue(
            user["profileImage"],
            fallback: "",
          );
          final contactsAdded = getContactsAdded(user);
          final profileCompletion = getProfileCompletion(user);
          final accountType = getDisplayValue(
            user["accountType"],
            fallback: "User",
          );
          final userIdValue = getDisplayValue(user["userId"], fallback: userId);

          return RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderCard(
                    name: safeName,
                    subtitle: accountType,
                    imageUrl: profileImage,
                  ),
                  const SizedBox(height: 22),

                  _sectionTitle("Personal Information"),
                  _mainCard(
                    children: [
                      _tile("Name", safeName, Icons.person_outline_rounded),
                      _tile("Email", email, Icons.mail_outline_rounded),
                      _tile("Phone", mobile, Icons.call_outlined),
                      _tile("Date of Birth", dob, Icons.cake_outlined),
                      _tile("Address", address, Icons.location_on_outlined),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Emergency Support Network"),
                  Row(
                    children: [
                      Expanded(
                        child: _contactCard(
                          title: "Doctor",
                          name: doctorName,
                          number: doctorNumber,
                          icon: Icons.local_hospital_outlined,
                          topColor: const Color(0xFFFF6B6B),
                          onCall: () => callNumber(
                            doctorNumber == "Not set" ? null : doctorNumber,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _contactCard(
                          title: "Friend",
                          name: friendName,
                          number: friendNumber,
                          icon: Icons.favorite_border_rounded,
                          topColor: const Color(0xFF5B8DEF),
                          onCall: () => callNumber(
                            friendNumber == "Not set" ? null : friendNumber,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Safety Summary"),
                  _mainCard(
                    children: [
                      _summaryRow(
                        "Contacts Added",
                        "$contactsAdded / 2",
                        Icons.people_outline_rounded,
                        const Color(0xFF00A389),
                      ),
                      _summaryRow(
                        "Profile Completion",
                        "$profileCompletion%",
                        Icons.donut_small_rounded,
                        const Color(0xFF7E57C2),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _sectionTitle("Account Information"),
                  _mainCard(
                    children: [
                      _statusTile("Terms Accepted", termsAccepted),
                      _statusTile("Mobile Verified", mobileVerified),
                      _tile(
                        "Account Created",
                        accountCreated,
                        Icons.calendar_month_outlined,
                      ),
                      _tile("Account Type", accountType, Icons.badge_outlined),
                      _tile("User ID", userIdValue, Icons.fingerprint),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderCard({
    required String name,
    required String subtitle,
    required String imageUrl,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8E85FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.22),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
              image: imageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl.isEmpty
                ? Center(
                    child: Text(
                      getInitials(name),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.92),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard({
    required String title,
    required String name,
    required String number,
    required IconData icon,
    required Color topColor,
    required VoidCallback onCall,
  }) {
    final canCall = number != "Not set";

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: topColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: topColor, size: 26),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E2432),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            number,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.5, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canCall ? onCall : null,
              icon: const Icon(Icons.call_outlined, size: 18),
              label: Text(canCall ? "Call Now" : "Not Added"),
              style: ElevatedButton.styleFrom(
                backgroundColor: topColor,
                disabledBackgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E2432),
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
