import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RelationshipAdvicePage extends StatelessWidget {
  const RelationshipAdvicePage({super.key});

  // Function to open links
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("💞 Relationship Advice"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview
            _buildSectionTitle("💡 Why Healthy Relationships Matter"),
            const Text(
              "Strong relationships build trust, emotional support, and happiness. "
              "They improve mental health, reduce stress, and create a sense of belonging.",
              style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // YouTube Links
            _buildSectionTitle("🎥 Learn From Experts"),
            _buildLinkCard(
              title: "5 Keys to a Healthy Relationship",
              desc: "Understand trust, respect, and communication.",
              color: Colors.pink,
              url: "https://www.youtube.com/watch?v=2XMgV3Fy1fE",
            ),
            _buildLinkCard(
              title: "How to Communicate Better",
              desc: "Learn effective and empathetic communication.",
              color: Colors.deepPurple,
              url: "https://www.youtube.com/watch?v=2VvL1aZ1s5o",
            ),
            _buildLinkCard(
              title: "Building Long-term Trust",
              desc: "Steps to build and maintain trust.",
              color: Colors.orange,
              url: "https://www.youtube.com/watch?v=8hW0eWI7LXA",
            ),
            const SizedBox(height: 20),

            // Relationship Tips
            _buildSectionTitle("🌸 Relationship Tips"),
            _buildTipCard("👂 Active Listening",
                "Listen without interrupting. Show genuine interest in their feelings."),
            _buildTipCard("💬 Open Communication",
                "Express your thoughts honestly but respectfully."),
            _buildTipCard("🤝 Trust & Respect",
                "Trust takes time to build—respect each other's boundaries."),
            _buildTipCard("🌱 Personal Growth",
                "Give each other space for hobbies and self-development."),
            const SizedBox(height: 20),

            // Benefits Section
            _buildSectionTitle("💖 Benefits of Strong Relationships"),
            _buildBenefit("Emotional Support", Icons.favorite, Colors.red),
            _buildBenefit("Reduced Stress", Icons.self_improvement, Colors.blue),
            _buildBenefit("Better Mental Health", Icons.psychology, Colors.green),
            _buildBenefit("Increased Happiness", Icons.sentiment_satisfied, Colors.orange),
            const SizedBox(height: 20),

            // Resources
            _buildSectionTitle("📚 Resources to Explore"),
            _buildResourceLink("The 5 Love Languages – Book",
                "https://www.5lovelanguages.com/"),
            _buildResourceLink("Mindful Relationship Tips – Psychology Today",
                "https://www.psychologytoday.com/us/basics/relationships"),
            _buildResourceLink("Healthy Relationships – Mental Health Foundation",
                "https://www.mentalhealth.org.uk/explore-mental-health/a-z-topics/relationships"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  // YouTube Link Card
  Widget _buildLinkCard({
    required String title,
    required String desc,
    required Color color,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _openLink(url),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // Relationship Tip Card
  Widget _buildTipCard(String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.pink.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }

  // Benefit Card
  Widget _buildBenefit(String text, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Text(text,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }

  // Resource Links
  Widget _buildResourceLink(String title, String url) {
    return GestureDetector(
      onTap: () => _openLink(url),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey.shade200),
        ),
        child: Row(
          children: [
            const Icon(Icons.link, color: Colors.blueGrey),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }
}
