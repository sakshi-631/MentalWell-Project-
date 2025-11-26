import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

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
        title: const Text("🥗 Nutrition & Wellness"),
        centerTitle: true,
        backgroundColor: Colors.green.shade600,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview
            _buildSectionTitle("🌱 Why Nutrition Matters"),
            const Text(
              "A balanced diet is the foundation of good health. "
              "It fuels your body, boosts immunity, sharpens focus, "
              "and keeps you active throughout the day.",
              style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 20),

            // YouTube Links Section
            _buildSectionTitle("🎥 Learn About Healthy Diets"),
            _buildLinkCard(
              title: "Healthy Eating Basics",
              desc: "Watch tips on eating clean & nutritious meals.",
              color: Colors.green,
              url: "https://www.youtube.com/watch?v=7g6lQplP4Uw",
            ),
            _buildLinkCard(
              title: "Balanced Diet Explained",
              desc: "Understand proteins, carbs & vitamins.",
              color: Colors.orange,
              url: "https://www.youtube.com/watch?v=7lCxD9QvCqg",
            ),
            _buildLinkCard(
              title: "Hydration & Wellness",
              desc: "Why water is your body’s best friend.",
              color: Colors.blue,
              url: "https://www.youtube.com/watch?v=CeB7cljUQpM",
            ),
            const SizedBox(height: 20),

            // Recipes Section
            _buildSectionTitle("🍴 Simple Healthy Recipes"),
            _buildRecipeCard(
              "🥗 Green Salad",
              "Fresh cucumbers, lettuce, tomatoes, olive oil, lemon juice.",
              "High in fiber & vitamins, boosts digestion.",
            ),
            _buildRecipeCard(
              "🍲 Oats Bowl",
              "Oats with milk, banana slices, dry fruits & honey.",
              "Rich in protein, keeps you full longer.",
            ),
            _buildRecipeCard(
              "🥤 Smoothie",
              "Blend spinach, apple, banana & yogurt.",
              "Packed with antioxidants & natural energy.",
            ),
            const SizedBox(height: 20),

            // Benefits Section
            _buildSectionTitle("💡 Benefits of a Healthy Diet"),
            _buildBenefit("Boosts Immunity", Icons.shield, Colors.teal),
            _buildBenefit("Improves Mental Focus", Icons.psychology, Colors.purple),
            _buildBenefit("Supports Healthy Weight", Icons.monitor_weight, Colors.orange),
            _buildBenefit("Increases Energy Levels", Icons.bolt, Colors.blue),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
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
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(desc,
                style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // Recipe Card
  Widget _buildRecipeCard(String name, String ingredients, String benefit) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green.shade200, width: 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 6),
          Text("Ingredients: $ingredients",
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 4),
          Text("Benefit: $benefit",
              style: const TextStyle(fontSize: 14, color: Colors.green)),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }
}
