
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  void _callNumber(String number) async {
    final Uri callUri = Uri(scheme: "tel", path: number);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$feature coming soon 🚀")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Emergency"),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 🚨 SOS Emergency Button
          Center(
            child: GestureDetector(
              onTap: () {
                _callNumber("108");
                _showComingSoon(context, "SOS alerts to friends & family");
              },
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    "SOS",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ⚡ Quick Access Section
          const Text(
            "Quick Contacts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildQuickCard(
                context,
                icon: Icons.local_hospital,
                label: "Ambulance",
                color: Colors.red,
                number: "108",
              ),
              _buildQuickCard(
                context,
                icon: Icons.local_police,
                label: "Police",
                color: Colors.indigo,
                number: "100",
              ),
              _buildQuickCard(
                context,
                icon: Icons.medical_services,
                label: "Doctor",
                color: Colors.green,
                number: "9876501234",
              ),
              _buildQuickCard(
                context,
                icon: Icons.people,
                label: "Best Friend",
                color: Colors.orange,
                number: "9876543210",
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 🌍 Additional Features
          const Text(
            "More Safety Features",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildFeatureCard(
            context,
            icon: Icons.map,
            title: "Share Live Location",
            subtitle: "Send your real-time location to trusted contacts",
            color: Colors.blue,
            onTap: () => _showComingSoon(context, "Location Sharing"),
          ),
          _buildFeatureCard(
            context,
            icon: Icons.message,
            title: "Send Panic SMS",
            subtitle: "Automatically alert friends with a quick SMS",
            color: Colors.purple,
            onTap: () => _showComingSoon(context, "Panic SMS"),
          ),
          _buildFeatureCard(
            context,
            icon: Icons.contacts,
            title: "Add More Trusted Contacts",
            subtitle: "Keep your emergency circle updated",
            color: Colors.teal,
            onTap: () => _showComingSoon(context, "Manage Contacts"),
          ),
        ],
      ),
    );
  }

  // 🔘 Quick Access Card (Grid Style)
  Widget _buildQuickCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required String number,
  }) {
    return InkWell(
      onTap: () => _callNumber(number),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📌 Feature Card
  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
