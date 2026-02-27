// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:url_launcher/url_launcher.dart';

// // // // // // class RelationshipAdvicePage extends StatelessWidget {
// // // // // //   const RelationshipAdvicePage({super.key});

// // // // // //   // Function to open links
// // // // // //   Future<void> _openLink(String url) async {
// // // // // //     final Uri uri = Uri.parse(url);
// // // // // //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
// // // // // //       throw Exception("Could not launch $url");
// // // // // //     }
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: const Text("💞 Relationship Advice"),
// // // // // //         centerTitle: true,
// // // // // //         backgroundColor: Colors.pink.shade400,
// // // // // //       ),
// // // // // //       body: SingleChildScrollView(
// // // // // //         padding: const EdgeInsets.all(16),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             // Overview
// // // // // //             _buildSectionTitle("💡 Why Healthy Relationships Matter"),
// // // // // //             const Text(
// // // // // //               "Strong relationships build trust, emotional support, and happiness. "
// // // // // //               "They improve mental health, reduce stress, and create a sense of belonging.",
// // // // // //               style: TextStyle(
// // // // // //                 fontSize: 15,
// // // // // //                 height: 1.5,
// // // // // //                 color: Colors.black87,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // YouTube Links
// // // // // //             _buildSectionTitle("🎥 Learn From Experts"),
// // // // // //             _buildLinkCard(
// // // // // //               title: "5 Keys to a Healthy Relationship",
// // // // // //               desc: "Understand trust, respect, and communication.",
// // // // // //               color: Colors.pink,
// // // // // //               url: "https://www.youtube.com/watch?v=2XMgV3Fy1fE",
// // // // // //             ),
// // // // // //             _buildLinkCard(
// // // // // //               title: "How to Communicate Better",
// // // // // //               desc: "Learn effective and empathetic communication.",
// // // // // //               color: Colors.deepPurple,
// // // // // //               url: "https://www.youtube.com/watch?v=2VvL1aZ1s5o",
// // // // // //             ),
// // // // // //             _buildLinkCard(
// // // // // //               title: "Building Long-term Trust",
// // // // // //               desc: "Steps to build and maintain trust.",
// // // // // //               color: Colors.orange,
// // // // // //               url: "https://www.youtube.com/watch?v=8hW0eWI7LXA",
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Relationship Tips
// // // // // //             _buildSectionTitle("🌸 Relationship Tips"),
// // // // // //             _buildTipCard(
// // // // // //               "👂 Active Listening",
// // // // // //               "Listen without interrupting. Show genuine interest in their feelings.",
// // // // // //             ),
// // // // // //             _buildTipCard(
// // // // // //               "💬 Open Communication",
// // // // // //               "Express your thoughts honestly but respectfully.",
// // // // // //             ),
// // // // // //             _buildTipCard(
// // // // // //               "🤝 Trust & Respect",
// // // // // //               "Trust takes time to build—respect each other's boundaries.",
// // // // // //             ),
// // // // // //             _buildTipCard(
// // // // // //               "🌱 Personal Growth",
// // // // // //               "Give each other space for hobbies and self-development.",
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Benefits Section
// // // // // //             _buildSectionTitle("💖 Benefits of Strong Relationships"),
// // // // // //             _buildBenefit("Emotional Support", Icons.favorite, Colors.red),
// // // // // //             _buildBenefit(
// // // // // //               "Reduced Stress",
// // // // // //               Icons.self_improvement,
// // // // // //               Colors.blue,
// // // // // //             ),
// // // // // //             _buildBenefit(
// // // // // //               "Better Mental Health",
// // // // // //               Icons.psychology,
// // // // // //               Colors.green,
// // // // // //             ),
// // // // // //             _buildBenefit(
// // // // // //               "Increased Happiness",
// // // // // //               Icons.sentiment_satisfied,
// // // // // //               Colors.orange,
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Resources
// // // // // //             _buildSectionTitle("📚 Resources to Explore"),
// // // // // //             _buildResourceLink(
// // // // // //               "The 5 Love Languages – Book",
// // // // // //               "https://www.5lovelanguages.com/",
// // // // // //             ),
// // // // // //             _buildResourceLink(
// // // // // //               "Mindful Relationship Tips – Psychology Today",
// // // // // //               "https://www.psychologytoday.com/us/basics/relationships",
// // // // // //             ),
// // // // // //             _buildResourceLink(
// // // // // //               "Healthy Relationships – Mental Health Foundation",
// // // // // //               "https://www.mentalhealth.org.uk/explore-mental-health/a-z-topics/relationships",
// // // // // //             ),
// // // // // //             const SizedBox(height: 30),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Section Title
// // // // // //   Widget _buildSectionTitle(String title) {
// // // // // //     return Padding(
// // // // // //       padding: const EdgeInsets.only(bottom: 10),
// // // // // //       child: Text(
// // // // // //         title,
// // // // // //         style: const TextStyle(
// // // // // //           fontSize: 20,
// // // // // //           fontWeight: FontWeight.bold,
// // // // // //           color: Colors.black87,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // YouTube Link Card
// // // // // //   Widget _buildLinkCard({
// // // // // //     required String title,
// // // // // //     required String desc,
// // // // // //     required Color color,
// // // // // //     required String url,
// // // // // //   }) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => _openLink(url),
// // // // // //       child: Container(
// // // // // //         margin: const EdgeInsets.symmetric(vertical: 8),
// // // // // //         padding: const EdgeInsets.all(16),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: color.withOpacity(0.85),
// // // // // //           borderRadius: BorderRadius.circular(16),
// // // // // //           boxShadow: [
// // // // // //             BoxShadow(
// // // // // //               color: color.withOpacity(0.4),
// // // // // //               blurRadius: 10,
// // // // // //               offset: const Offset(0, 5),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             Text(
// // // // // //               title,
// // // // // //               style: const TextStyle(
// // // // // //                 color: Colors.white,
// // // // // //                 fontSize: 17,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 6),
// // // // // //             Text(
// // // // // //               desc,
// // // // // //               style: const TextStyle(color: Colors.white70, fontSize: 14),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Relationship Tip Card
// // // // // //   Widget _buildTipCard(String title, String desc) {
// // // // // //     return Container(
// // // // // //       margin: const EdgeInsets.symmetric(vertical: 6),
// // // // // //       padding: const EdgeInsets.all(14),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: Colors.pink.shade50,
// // // // // //         borderRadius: BorderRadius.circular(14),
// // // // // //         border: Border.all(color: Colors.pink.shade200, width: 1),
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           Text(
// // // // // //             title,
// // // // // //             style: const TextStyle(
// // // // // //               fontSize: 16,
// // // // // //               fontWeight: FontWeight.bold,
// // // // // //               color: Colors.black87,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 4),
// // // // // //           Text(
// // // // // //             desc,
// // // // // //             style: const TextStyle(fontSize: 14, color: Colors.black87),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Benefit Card
// // // // // //   Widget _buildBenefit(String text, IconData icon, Color color) {
// // // // // //     return Container(
// // // // // //       margin: const EdgeInsets.symmetric(vertical: 6),
// // // // // //       padding: const EdgeInsets.all(14),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: color.withOpacity(0.1),
// // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // //       ),
// // // // // //       child: Row(
// // // // // //         children: [
// // // // // //           Icon(icon, color: color, size: 28),
// // // // // //           const SizedBox(width: 12),
// // // // // //           Text(
// // // // // //             text,
// // // // // //             style: TextStyle(
// // // // // //               fontSize: 15,
// // // // // //               fontWeight: FontWeight.w500,
// // // // // //               color: color,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Resource Links
// // // // // //   Widget _buildResourceLink(String title, String url) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => _openLink(url),
// // // // // //       child: Container(
// // // // // //         margin: const EdgeInsets.symmetric(vertical: 6),
// // // // // //         padding: const EdgeInsets.all(14),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: Colors.blueGrey.shade50,
// // // // // //           borderRadius: BorderRadius.circular(12),
// // // // // //           border: Border.all(color: Colors.blueGrey.shade200),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           children: [
// // // // // //             const Icon(Icons.link, color: Colors.blueGrey),
// // // // // //             const SizedBox(width: 10),
// // // // // //             Expanded(
// // // // // //               child: Text(
// // // // // //                 title,
// // // // // //                 style: const TextStyle(
// // // // // //                   fontSize: 14,
// // // // // //                   fontWeight: FontWeight.w500,
// // // // // //                   color: Colors.black87,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // Full Flutter UI with dynamic sections, topic-based books, check-in, quiz, etc.
// // // // // // Note: Add dependencies: url_launcher, cloud_firestore (optional)

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:url_launcher/url_launcher.dart';

// // // // // class RelationshipAdvicePage extends StatefulWidget {
// // // // //   const RelationshipAdvicePage({super.key});

// // // // //   @override
// // // // //   State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
// // // // // }

// // // // // class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
// // // // //   String? selectedMood;
// // // // //   String adviceText = "";

// // // // //   String selectedTopic = "Early Relationship";

// // // // //   final Map<String, List<Map<String, String>>> bookData = {
// // // // //     "Early Relationship": [
// // // // //       {
// // // // //         "title": "Attached",
// // // // //         "url": "https://www.google.com/search?q=Attached+book",
// // // // //       },
// // // // //       {
// // // // //         "title": "Modern Romance",
// // // // //         "url": "https://www.google.com/search?q=Modern+Romance+book",
// // // // //       },
// // // // //     ],
// // // // //     "Solving Fights": [
// // // // //       {
// // // // //         "title": "The Seven Principles for Making Marriage Work",
// // // // //         "url": "https://www.google.com/search?q=Seven+Principles+Marriage+book",
// // // // //       },
// // // // //       {
// // // // //         "title": "Hold Me Tight",
// // // // //         "url": "https://www.google.com/search?q=Hold+Me+Tight+book",
// // // // //       },
// // // // //     ],
// // // // //     "Understanding Partner": [
// // // // //       {
// // // // //         "title": "Men Are from Mars Women Are from Venus",
// // // // //         "url":
// // // // //             "https://www.google.com/search?q=Men+Are+from+Mars+Women+Are+from+Venus",
// // // // //       },
// // // // //       {
// // // // //         "title": "The 5 Love Languages",
// // // // //         "url": "https://www.google.com/search?q=5+Love+Languages+book",
// // // // //       },
// // // // //     ],
// // // // //     "Self Growth": [
// // // // //       {
// // // // //         "title": "The Mastery of Love",
// // // // //         "url": "https://www.google.com/search?q=The+Mastery+of+Love",
// // // // //       },
// // // // //       {
// // // // //         "title": "Love Yourself Like Your Life Depends On It",
// // // // //         "url": "https://www.google.com/search?q=Love+Yourself+Book",
// // // // //       },
// // // // //     ],
// // // // //     "Red Flags": [
// // // // //       {
// // // // //         "title": "Why Does He Do That",
// // // // //         "url": "https://www.google.com/search?q=Why+Does+He+Do+That+book",
// // // // //       },
// // // // //     ],
// // // // //     "Marriage": [
// // // // //       {
// // // // //         "title": "The Meaning of Marriage",
// // // // //         "url": "https://www.google.com/search?q=Meaning+of+Marriage+book",
// // // // //       },
// // // // //     ],
// // // // //   };

// // // // //   Future<void> openLink(String url) async {
// // // // //     final Uri uri = Uri.parse(url);
// // // // //     await launchUrl(uri);
// // // // //   }

// // // // //   void handleMood(String mood) {
// // // // //     setState(() {
// // // // //       selectedMood = mood;

// // // // //       if (mood == "😔") {
// // // // //         adviceText = "Try expressing your feelings calmly today.";
// // // // //       } else if (mood == "😡") {
// // // // //         adviceText = "Pause before reacting. Give yourself time.";
// // // // //       } else if (mood == "😊") {
// // // // //         adviceText = "Great! Appreciate your partner today ❤️";
// // // // //       } else {
// // // // //         adviceText = "Maintain open communication.";
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   int score = 0;

// // // // //   void calculateResult() {
// // // // //     String result = "";
// // // // //     if (score >= 3)
// // // // //       result = "Healthy 💚";
// // // // //     else if (score == 2)
// // // // //       result = "Needs Attention ⚠️";
// // // // //     else
// // // // //       result = "Work Required 🔴";

// // // // //     showDialog(
// // // // //       context: context,
// // // // //       builder: (_) =>
// // // // //           AlertDialog(title: const Text("Result"), content: Text(result)),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text("Relationship Wellness 💖"),
// // // // //         backgroundColor: Colors.pink,
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             // Daily Tip
// // // // //             Container(
// // // // //               padding: const EdgeInsets.all(12),
// // // // //               decoration: BoxDecoration(
// // // // //                 color: Colors.pink.shade100,
// // // // //                 borderRadius: BorderRadius.circular(12),
// // // // //               ),
// // // // //               child: const Text("Tip: Appreciate your partner today ❤️"),
// // // // //             ),

// // // // //             const SizedBox(height: 20),

// // // // //             // Mood Check
// // // // //             const Text("How are you feeling?"),
// // // // //             Row(
// // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //               children: [
// // // // //                 _emoji("😊"),
// // // // //                 _emoji("😐"),
// // // // //                 _emoji("😔"),
// // // // //                 _emoji("😡"),
// // // // //               ],
// // // // //             ),
// // // // //             Text(adviceText),

// // // // //             const SizedBox(height: 20),

// // // // //             // Quiz
// // // // //             const Text("Self Assessment"),
// // // // //             CheckboxListTile(
// // // // //               title: const Text("Do you communicate openly?"),
// // // // //               value: score > 0,
// // // // //               onChanged: (v) => setState(() => score++),
// // // // //             ),
// // // // //             ElevatedButton(
// // // // //               onPressed: calculateResult,
// // // // //               child: const Text("Check Result"),
// // // // //             ),

// // // // //             const SizedBox(height: 20),

// // // // //             // Conversation starters
// // // // //             const Text("Conversation Starters"),
// // // // //             SizedBox(
// // // // //               height: 100,
// // // // //               child: ListView(
// // // // //                 scrollDirection: Axis.horizontal,
// // // // //                 children: const [
// // // // //                   Card(
// // // // //                     child: Padding(
// // // // //                       padding: EdgeInsets.all(10),
// // // // //                       child: Text("What made you happy today?"),
// // // // //                     ),
// // // // //                   ),
// // // // //                   Card(
// // // // //                     child: Padding(
// // // // //                       padding: EdgeInsets.all(10),
// // // // //                       child: Text("How can I support you?"),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),

// // // // //             const SizedBox(height: 20),

// // // // //             // Books Section
// // // // //             const Text("📚 Learn via Books"),
// // // // //             DropdownButton<String>(
// // // // //               value: selectedTopic,
// // // // //               items: bookData.keys
// // // // //                   .map((e) => DropdownMenuItem(value: e, child: Text(e)))
// // // // //                   .toList(),
// // // // //               onChanged: (v) => setState(() => selectedTopic = v!),
// // // // //             ),

// // // // //             ...bookData[selectedTopic]!.map(
// // // // //               (book) => ListTile(
// // // // //                 title: Text(book["title"]!),
// // // // //                 trailing: const Icon(Icons.open_in_new),
// // // // //                 onTap: () => openLink(book["url"]!),
// // // // //               ),
// // // // //             ),

// // // // //             const SizedBox(height: 20),

// // // // //             // Male Female Psychology
// // // // //             const Text("🧠 Understanding Male & Female Psychology"),
// // // // //             const Text(
// // // // //               "Men tend to be less expressive and solution-focused, while women are more emotionally expressive and seek connection. Understanding this reduces conflicts.",
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _emoji(String emoji) {
// // // // //     return GestureDetector(
// // // // //       onTap: () => handleMood(emoji),
// // // // //       child: Text(emoji, style: const TextStyle(fontSize: 30)),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';

// // // // class RelationshipAdvicePage extends StatefulWidget {
// // // //   const RelationshipAdvicePage({super.key});

// // // //   @override
// // // //   State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
// // // // }

// // // // class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
// // // //   String? selectedMood;
// // // //   String adviceText = "";
// // // //   int score = 0;

// // // //   String selectedTopic = "Early Relationship";

// // // //   final Map<String, List<Map<String, String>>> bookData = {
// // // //     "Early Relationship": [
// // // //       {
// // // //         "title": "Attached (Attachment Theory)",
// // // //         "url": "https://www.google.com/search?q=Attached+book",
// // // //       },
// // // //       {
// // // //         "title": "Modern Romance (Dating Insights)",
// // // //         "url": "https://www.google.com/search?q=Modern+Romance+book",
// // // //       },
// // // //     ],
// // // //     "Solving Fights": [
// // // //       {
// // // //         "title": "Marriage Work (Conflict Resolution)",
// // // //         "url": "https://www.google.com/search?q=Seven+Principles+Marriage+book",
// // // //       },
// // // //       {
// // // //         "title": "Hold Me Tight (Emotional Bonding)",
// // // //         "url": "https://www.google.com/search?q=Hold+Me+Tight+book",
// // // //       },
// // // //     ],
// // // //     "Understanding Partner": [
// // // //       {
// // // //         "title": "Men vs Women Psychology",
// // // //         "url":
// // // //             "https://www.google.com/search?q=Men+Are+from+Mars+Women+Are+from+Venus",
// // // //       },
// // // //       {
// // // //         "title": "5 Love Languages (Emotional Needs)",
// // // //         "url": "https://www.google.com/search?q=5+Love+Languages+book",
// // // //       },
// // // //     ],
// // // //     "Self Growth": [
// // // //       {
// // // //         "title": "Mastery of Love",
// // // //         "url": "https://www.google.com/search?q=The+Mastery+of+Love",
// // // //       },
// // // //       {
// // // //         "title": "Love Yourself",
// // // //         "url": "https://www.google.com/search?q=Love+Yourself+Book",
// // // //       },
// // // //     ],
// // // //   };

// // // //   Future<void> openLink(String url) async {
// // // //     final Uri uri = Uri.parse(url);
// // // //     await launchUrl(uri);
// // // //   }

// // // //   void handleMood(String mood) {
// // // //     setState(() {
// // // //       selectedMood = mood;

// // // //       if (mood == "😔") {
// // // //         adviceText = "Try expressing your feelings calmly today.";
// // // //       } else if (mood == "😡") {
// // // //         adviceText = "Pause before reacting. Give yourself time.";
// // // //       } else if (mood == "😊") {
// // // //         adviceText = "Great! Appreciate your partner today ❤️";
// // // //       } else {
// // // //         adviceText = "Maintain open communication.";
// // // //       }
// // // //     });
// // // //   }

// // // //   void calculateResult() {
// // // //     String result = "";
// // // //     if (score >= 3) {
// // // //       result = "Healthy 💚";
// // // //     } else if (score == 2) {
// // // //       result = "Needs Attention ⚠️";
// // // //     } else {
// // // //       result = "Work Required 🔴";
// // // //     }

// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (_) =>
// // // //           AlertDialog(title: const Text("Result"), content: Text(result)),
// // // //     );
// // // //   }

// // // //   // 🔥 Reusable Section Card
// // // //   Widget sectionCard({
// // // //     required String title,
// // // //     required IconData icon,
// // // //     required Color color,
// // // //     required List<Widget> children,
// // // //   }) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // // //       decoration: BoxDecoration(
// // // //         gradient: LinearGradient(colors: [color.withOpacity(0.8), color]),
// // // //         borderRadius: BorderRadius.circular(18),
// // // //         boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)],
// // // //       ),
// // // //       child: ExpansionTile(
// // // //         collapsedIconColor: Colors.white,
// // // //         iconColor: Colors.white,
// // // //         title: Row(
// // // //           children: [
// // // //             Icon(icon, color: Colors.white),
// // // //             const SizedBox(width: 10),
// // // //             Text(
// // // //               title,
// // // //               style: const TextStyle(
// // // //                 color: Colors.white,
// // // //                 fontWeight: FontWeight.bold,
// // // //                 fontSize: 16,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         children: children,
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget linkTile(String title, String url) {
// // // //     return ListTile(
// // // //       leading: const Icon(Icons.open_in_new),
// // // //       title: Text(title),
// // // //       onTap: () => openLink(url),
// // // //     );
// // // //   }

// // // //   Widget emoji(String e) {
// // // //     return GestureDetector(
// // // //       onTap: () => handleMood(e),
// // // //       child: Text(e, style: const TextStyle(fontSize: 30)),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text("💖 Relationship Wellness"),
// // // //         backgroundColor: Colors.pink,
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           children: [
// // // //             // 🌟 DAILY TIP
// // // //             Container(
// // // //               padding: const EdgeInsets.all(12),
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.pink.shade100,
// // // //                 borderRadius: BorderRadius.circular(12),
// // // //               ),
// // // //               child: const Text("Tip: Appreciate your partner today ❤️"),
// // // //             ),

// // // //             const SizedBox(height: 15),

// // // //             // 😊 MOOD CHECK
// // // //             sectionCard(
// // // //               title: "Mood Check",
// // // //               icon: Icons.emoji_emotions,
// // // //               color: Colors.pink,
// // // //               children: [
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                   children: [
// // // //                     emoji("😊"),
// // // //                     emoji("😐"),
// // // //                     emoji("😔"),
// // // //                     emoji("😡"),
// // // //                   ],
// // // //                 ),
// // // //                 Padding(
// // // //                   padding: const EdgeInsets.all(10),
// // // //                   child: Text(adviceText),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // 🧠 SELF ASSESSMENT QUIZ
// // // //             sectionCard(
// // // //               title: "Self Assessment",
// // // //               icon: Icons.quiz,
// // // //               color: Colors.deepPurple,
// // // //               children: [
// // // //                 CheckboxListTile(
// // // //                   title: const Text("Do you communicate openly?"),
// // // //                   value: score > 0,
// // // //                   onChanged: (v) => setState(() => score++),
// // // //                 ),
// // // //                 ElevatedButton(
// // // //                   onPressed: calculateResult,
// // // //                   child: const Text("Check Result"),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // 💬 CONVERSATION STARTERS
// // // //             sectionCard(
// // // //               title: "Conversation Starters",
// // // //               icon: Icons.chat,
// // // //               color: Colors.orange,
// // // //               children: [
// // // //                 SizedBox(
// // // //                   height: 100,
// // // //                   child: ListView(
// // // //                     scrollDirection: Axis.horizontal,
// // // //                     children: const [
// // // //                       Card(
// // // //                         child: Padding(
// // // //                           padding: EdgeInsets.all(10),
// // // //                           child: Text("What made you happy today?"),
// // // //                         ),
// // // //                       ),
// // // //                       Card(
// // // //                         child: Padding(
// // // //                           padding: EdgeInsets.all(10),
// // // //                           child: Text("How can I support you?"),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // 🎥 VIDEOS
// // // //             sectionCard(
// // // //               title: "Learn via Videos",
// // // //               icon: Icons.play_circle,
// // // //               color: Colors.purple,
// // // //               children: [
// // // //                 linkTile(
// // // //                   "Healthy Relationship Guide",
// // // //                   "https://www.youtube.com/results?search_query=healthy+relationship",
// // // //                 ),
// // // //                 linkTile(
// // // //                   "Communication Skills",
// // // //                   "https://www.youtube.com/results?search_query=relationship+communication",
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // ❤️ TIPS
// // // //             sectionCard(
// // // //               title: "Relationship Tips",
// // // //               icon: Icons.favorite,
// // // //               color: Colors.pinkAccent,
// // // //               children: const [
// // // //                 ListTile(title: Text("Active Listening")),
// // // //                 ListTile(title: Text("Trust & Respect")),
// // // //               ],
// // // //             ),

// // // //             // 🚩 RED FLAGS
// // // //             sectionCard(
// // // //               title: "Red Flags",
// // // //               icon: Icons.warning,
// // // //               color: Colors.red,
// // // //               children: [
// // // //                 linkTile(
// // // //                   "Toxic Behavior",
// // // //                   "https://www.google.com/search?q=toxic+relationship",
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // 📚 BOOKS (DYNAMIC)
// // // //             sectionCard(
// // // //               title: "Books by Topic",
// // // //               icon: Icons.menu_book,
// // // //               color: Colors.deepPurple,
// // // //               children: [
// // // //                 DropdownButton<String>(
// // // //                   value: selectedTopic,
// // // //                   items: bookData.keys
// // // //                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
// // // //                       .toList(),
// // // //                   onChanged: (v) => setState(() => selectedTopic = v!),
// // // //                 ),
// // // //                 ...bookData[selectedTopic]!.map(
// // // //                   (book) => linkTile(book["title"]!, book["url"]!),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             // 🧠 PSYCHOLOGY
// // // //             sectionCard(
// // // //               title: "Understanding Psychology",
// // // //               icon: Icons.psychology,
// // // //               color: Colors.teal,
// // // //               children: const [
// // // //                 Padding(
// // // //                   padding: EdgeInsets.all(12),
// // // //                   child: Text(
// // // //                     "Men are often solution-focused while women seek emotional connection. Understanding this improves relationships.",
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class RelationshipAdvicePage extends StatefulWidget {
// // //   const RelationshipAdvicePage({super.key});

// // //   @override
// // //   State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
// // // }

// // // class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
// // //   // 🌐 OPEN LINKS
// // //   Future<void> openLink(String url) async {
// // //     await launchUrl(Uri.parse(url));
// // //   }

// // //   // 💡 REUSABLE CARD
// // //   Widget sectionCard({
// // //     required String title,
// // //     required IconData icon,
// // //     required Color color,
// // //     required List<Widget> children,
// // //   }) {
// // //     return Container(
// // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // //       decoration: BoxDecoration(
// // //         gradient: LinearGradient(colors: [color.withOpacity(0.8), color]),
// // //         borderRadius: BorderRadius.circular(18),
// // //         boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)],
// // //       ),
// // //       child: ExpansionTile(
// // //         collapsedIconColor: Colors.white,
// // //         iconColor: Colors.white,
// // //         title: Row(
// // //           children: [
// // //             Icon(icon, color: Colors.white),
// // //             const SizedBox(width: 10),
// // //             Text(
// // //               title,
// // //               style: const TextStyle(
// // //                 color: Colors.white,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         children: children,
// // //       ),
// // //     );
// // //   }

// // //   Widget linkTile(String title, String url) {
// // //     return ListTile(
// // //       leading: const Icon(Icons.open_in_new),
// // //       title: Text(title),
// // //       onTap: () => openLink(url),
// // //     );
// // //   }

// // //   // =========================
// // //   // 📚 BOOK DATA (30+ LINKS)
// // //   // =========================

// // //   String selectedTopic = "Early Relationship";

// // //   final Map<String, List<Map<String, String>>> bookTopics = {
// // //     "Early Relationship": [
// // //       {
// // //         "title": "Attached (Attachment Theory)",
// // //         "url": "https://www.google.com/search?q=attached+book",
// // //       },
// // //       {
// // //         "title": "Modern Romance (Dating Psychology)",
// // //         "url": "https://www.google.com/search?q=modern+romance+book",
// // //       },
// // //       {
// // //         "title": "The Defining Decade",
// // //         "url": "https://www.google.com/search?q=defining+decade+book",
// // //       },
// // //     ],

// // //     "Solving Fights": [
// // //       {
// // //         "title": "7 Principles for Marriage Work",
// // //         "url": "https://www.google.com/search?q=seven+principles+marriage+book",
// // //       },
// // //       {
// // //         "title": "Hold Me Tight (Emotional Bonding)",
// // //         "url": "https://www.google.com/search?q=hold+me+tight+book",
// // //       },
// // //       {
// // //         "title": "Nonviolent Communication",
// // //         "url": "https://www.google.com/search?q=nonviolent+communication+book",
// // //       },
// // //     ],

// // //     "Understanding Partner": [
// // //       {
// // //         "title": "Men Are from Mars Women Are from Venus",
// // //         "url":
// // //             "https://www.google.com/search?q=men+are+from+mars+women+are+from+venus",
// // //       },
// // //       {
// // //         "title": "5 Love Languages",
// // //         "url": "https://www.google.com/search?q=5+love+languages+book",
// // //       },
// // //       {
// // //         "title": "Attached Psychology",
// // //         "url":
// // //             "https://www.google.com/search?q=attachment+theory+relationships",
// // //       },
// // //     ],

// // //     "Self Growth": [
// // //       {
// // //         "title": "Mastery of Love",
// // //         "url": "https://www.google.com/search?q=mastery+of+love",
// // //       },
// // //       {
// // //         "title": "Love Yourself",
// // //         "url": "https://www.google.com/search?q=love+yourself+book",
// // //       },
// // //       {
// // //         "title": "Atomic Habits (Behavior Change)",
// // //         "url": "https://www.google.com/search?q=atomic+habits",
// // //       },
// // //     ],

// // //     "Fake vs Real Relationship": [
// // //       {
// // //         "title": "Codependent No More",
// // //         "url": "https://www.google.com/search?q=codependent+no+more",
// // //       },
// // //       {
// // //         "title": "Too Good to Leave Too Bad to Stay",
// // //         "url":
// // //             "https://www.google.com/search?q=too+good+to+leave+too+bad+to+stay",
// // //       },
// // //     ],

// // //     "Red Flags / Green Flags": [
// // //       {
// // //         "title": "Why Does He Do That",
// // //         "url": "https://www.google.com/search?q=why+does+he+do+that+book",
// // //       },
// // //       {
// // //         "title": "Psychopath Free",
// // //         "url": "https://www.google.com/search?q=psychopath+free+book",
// // //       },
// // //     ],

// // //     "Marriage Problems": [
// // //       {
// // //         "title": "Meaning of Marriage",
// // //         "url": "https://www.google.com/search?q=meaning+of+marriage+book",
// // //       },
// // //       {
// // //         "title": "Love & Respect",
// // //         "url": "https://www.google.com/search?q=love+and+respect+book",
// // //       },
// // //     ],

// // //     "Real Life Experiences": [
// // //       {
// // //         "title": "All About Love",
// // //         "url": "https://www.google.com/search?q=all+about+love+bell+hooks",
// // //       },
// // //       {
// // //         "title": "The Course of Love",
// // //         "url": "https://www.google.com/search?q=course+of+love+book",
// // //       },
// // //     ],
// // //   };

// // //   // =========================
// // //   // 🚩 RED FLAGS / GREEN FLAGS
// // //   // =========================

// // //   final List<String> redFlags = [
// // //     "Constant criticism",
// // //     "Controlling behavior",
// // //     "Lack of respect",
// // //     "Gaslighting",
// // //     "Emotional manipulation",
// // //     "Ignoring boundaries",
// // //   ];

// // //   final List<String> greenFlags = [
// // //     "Mutual respect",
// // //     "Healthy communication",
// // //     "Emotional support",
// // //     "Trust and honesty",
// // //     "Encouraging growth",
// // //     "Listening actively",
// // //   ];

// // //   // =========================
// // //   // 🧠 BUILD UI
// // //   // =========================

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("💖 Relationship Intelligence"),
// // //         backgroundColor: Colors.pink,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           children: [
// // //             // =========================
// // //             // 🧠 MALE VS FEMALE PSYCHOLOGY
// // //             // =========================
// // //             sectionCard(
// // //               title: "Male Mindset",
// // //               icon: Icons.male,
// // //               color: Colors.blue,
// // //               children: [
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(12),
// // //                   child: Text(
// // //                     "Men are often biologically wired to be solution-focused. Research shows they tend to suppress emotions due to social conditioning. They express love through actions rather than words.",
// // //                   ),
// // //                 ),
// // //                 linkTile(
// // //                   "Male Psychology Research",
// // //                   "https://www.google.com/search?q=male+psychology+relationships",
// // //                 ),
// // //                 linkTile(
// // //                   "YouTube: Male Mindset",
// // //                   "https://www.youtube.com/results?search_query=male+psychology+relationships",
// // //                 ),
// // //               ],
// // //             ),

// // //             sectionCard(
// // //               title: "Female Mindset",
// // //               icon: Icons.female,
// // //               color: Colors.pink,
// // //               children: [
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(12),
// // //                   child: Text(
// // //                     "Women tend to be more emotionally expressive. Studies show they value emotional connection, communication, and empathy more strongly in relationships.",
// // //                   ),
// // //                 ),
// // //                 linkTile(
// // //                   "Female Psychology Research",
// // //                   "https://www.google.com/search?q=female+psychology+relationships",
// // //                 ),
// // //                 linkTile(
// // //                   "YouTube: Female Mindset",
// // //                   "https://www.youtube.com/results?search_query=female+psychology+relationships",
// // //                 ),
// // //               ],
// // //             ),

// // //             sectionCard(
// // //               title: "Common Misunderstandings",
// // //               icon: Icons.psychology,
// // //               color: Colors.deepPurple,
// // //               children: [
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(12),
// // //                   child: Text(
// // //                     "Men may think solving problems = love. Women may think emotional sharing = love. This mismatch causes conflicts.",
// // //                   ),
// // //                 ),
// // //                 linkTile(
// // //                   "Relationship Psychology",
// // //                   "https://www.google.com/search?q=relationship+miscommunication+psychology",
// // //                 ),
// // //                 linkTile(
// // //                   "YouTube Learning",
// // //                   "https://www.youtube.com/results?search_query=relationship+misunderstanding+psychology",
// // //                 ),
// // //               ],
// // //             ),

// // //             // =========================
// // //             // 🚩 RED FLAG VS GREEN FLAG
// // //             // =========================
// // //             sectionCard(
// // //               title: "Red Flags vs Green Flags",
// // //               icon: Icons.warning,
// // //               color: Colors.red,
// // //               children: [
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(10),
// // //                   child: Text("🚩 Red Flags"),
// // //                 ),
// // //                 ...redFlags.map((e) => ListTile(title: Text(e))),

// // //                 const Padding(
// // //                   padding: EdgeInsets.all(10),
// // //                   child: Text("✅ Green Flags"),
// // //                 ),
// // //                 ...greenFlags.map((e) => ListTile(title: Text(e))),

// // //                 linkTile(
// // //                   "Google Red Flags Guide",
// // //                   "https://www.google.com/search?q=relationship+red+flags",
// // //                 ),
// // //                 linkTile(
// // //                   "YouTube Red Flags",
// // //                   "https://www.youtube.com/results?search_query=relationship+red+flags",
// // //                 ),
// // //               ],
// // //             ),

// // //             // =========================
// // //             // 📚 BOOKS SECTION
// // //             // =========================
// // //             sectionCard(
// // //               title: "Books by Topic",
// // //               icon: Icons.menu_book,
// // //               color: Colors.deepPurple,
// // //               children: [
// // //                 DropdownButton<String>(
// // //                   value: selectedTopic,
// // //                   items: bookTopics.keys
// // //                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
// // //                       .toList(),
// // //                   onChanged: (v) => setState(() => selectedTopic = v!),
// // //                 ),

// // //                 ...bookTopics[selectedTopic]!.map(
// // //                   (book) => linkTile(book["title"]!, book["url"]!),
// // //                 ),
// // //               ],
// // //             ),

// // //             // =========================
// // //             // 🎥 LEARNING RESOURCES
// // //             // =========================
// // //             sectionCard(
// // //               title: "Learning Resources",
// // //               icon: Icons.play_circle,
// // //               color: Colors.orange,
// // //               children: [
// // //                 linkTile(
// // //                   "Relationship Advice Videos",
// // //                   "https://www.youtube.com/results?search_query=relationship+advice",
// // //                 ),
// // //                 linkTile(
// // //                   "Communication Skills",
// // //                   "https://www.youtube.com/results?search_query=relationship+communication",
// // //                 ),
// // //                 linkTile(
// // //                   "Marriage Advice",
// // //                   "https://www.youtube.com/results?search_query=marriage+advice",
// // //                 ),
// // //                 linkTile(
// // //                   "Google Relationship Tips",
// // //                   "https://www.google.com/search?q=relationship+tips",
// // //                 ),
// // //                 linkTile(
// // //                   "Psychology Articles",
// // //                   "https://www.google.com/search?q=relationship+psychology+articles",
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class RelationshipAdvicePage extends StatefulWidget {
// //   const RelationshipAdvicePage({super.key});

// //   @override
// //   State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
// // }

// // class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
// //   String selectedTopic = 'Early Stage';
// //   int selectedSegment = 0;

// //   final Map<String, List<Map<String, String>>> bookTopics = {
// //     'Early Stage': [
// //       {
// //         'title': 'Attached',
// //         'subtitle': 'Attachment styles and emotional patterns',
// //         'url': 'https://www.google.com/search?q=attached+book',
// //       },
// //       {
// //         'title': 'Modern Romance',
// //         'subtitle': 'Dating, communication, and modern relationships',
// //         'url': 'https://www.google.com/search?q=modern+romance+book',
// //       },
// //     ],
// //     'Understanding Your Partner': [
// //       {
// //         'title': 'The 5 Love Languages',
// //         'subtitle': 'Understanding how people give and receive love',
// //         'url': 'https://www.google.com/search?q=the+5+love+languages+book',
// //       },
// //       {
// //         'title': 'Men Are from Mars, Women Are from Venus',
// //         'subtitle': 'Popular relationship communication framework',
// //         'url':
// //             'https://www.google.com/search?q=men+are+from+mars+women+are+from+venus+book',
// //       },
// //     ],
// //     'Healthy Communication': [
// //       {
// //         'title': 'Nonviolent Communication',
// //         'subtitle': 'Better conflict handling and emotional clarity',
// //         'url': 'https://www.google.com/search?q=nonviolent+communication+book',
// //       },
// //       {
// //         'title': 'Crucial Conversations',
// //         'subtitle': 'How to talk when emotions are high',
// //         'url': 'https://www.google.com/search?q=crucial+conversations+book',
// //       },
// //     ],
// //   };

// //   final List<String> redFlags = [
// //     'Controlling behavior',
// //     'Constant criticism',
// //     'Gaslighting',
// //     'Avoiding accountability',
// //     'Disrespect for boundaries',
// //   ];

// //   final List<String> greenFlags = [
// //     'Consistent communication',
// //     'Respect for boundaries',
// //     'Emotional safety',
// //     'Trust and honesty',
// //     'Support during stress',
// //   ];

// //   final List<Map<String, dynamic>> mindsetCards = [
// //     {
// //       'title': 'Clarity matters',
// //       'subtitle':
// //           'Many people respond better to direct and respectful communication.',
// //       'icon': Icons.forum_rounded,
// //       'color': Color(0xFF6C63FF),
// //     },
// //     {
// //       'title': 'Connection matters',
// //       'subtitle': 'Feeling heard is often as important as solving the issue.',
// //       'icon': Icons.favorite_rounded,
// //       'color': Color(0xFFE86A92),
// //     },
// //     {
// //       'title': 'Patterns matter',
// //       'subtitle': 'Notice repeated behavior, not just isolated sweet moments.',
// //       'icon': Icons.insights_rounded,
// //       'color': Color(0xFF2AA889),
// //     },
// //   ];

// //   final List<String> segments = ['Overview', 'Mindset', 'Signals'];

// //   Future<void> openLink(String url) async {
// //     final uri = Uri.parse(url);
// //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(const SnackBar(content: Text('Could not open link')));
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = ThemeData(
// //       useMaterial3: true,
// //       colorScheme: ColorScheme.fromSeed(
// //         seedColor: const Color(0xFF6C63FF),
// //         brightness: Brightness.light,
// //       ),
// //       textTheme: GoogleFonts.poppinsTextTheme(),
// //       scaffoldBackgroundColor: const Color(0xFFF6F7FB),
// //     );

// //     return Theme(
// //       data: theme,
// //       child: Scaffold(
// //         body: CustomScrollView(
// //           slivers: [
// //             SliverAppBar(
// //               pinned: true,
// //               elevation: 0,
// //               backgroundColor: const Color(0xFFF6F7FB),
// //               surfaceTintColor: Colors.transparent,
// //               title: Text(
// //                 'Relationship Guide',
// //                 style: GoogleFonts.poppins(
// //                   fontWeight: FontWeight.w600,
// //                   color: const Color(0xFF1F2430),
// //                 ),
// //               ),
// //               actions: [
// //                 IconButton(
// //                   onPressed: () {
// //                     showModalBottomSheet(
// //                       context: context,
// //                       isScrollControlled: true,
// //                       backgroundColor: Colors.white,
// //                       shape: const RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.vertical(
// //                           top: Radius.circular(28),
// //                         ),
// //                       ),
// //                       builder: (_) => _buildResourcesSheet(),
// //                     );
// //                   },
// //                   icon: const Icon(Icons.menu_book_rounded),
// //                 ),
// //               ],
// //             ),

// //             SliverToBoxAdapter(
// //               child: Padding(
// //                 padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     _buildHeroSection(),
// //                     const SizedBox(height: 24),
// //                     _buildSegmentTabs(),
// //                     const SizedBox(height: 24),
// //                     if (selectedSegment == 0) ...[
// //                       _buildTodayFocus(),
// //                       const SizedBox(height: 24),
// //                       _buildMindsetCards(),
// //                       const SizedBox(height: 24),
// //                       _buildMiniChecklist(),
// //                     ] else if (selectedSegment == 1) ...[
// //                       _buildSectionTitle('How people tend to process'),
// //                       const SizedBox(height: 12),
// //                       _buildExpandableSection(
// //                         title: 'Practical mindset notes',
// //                         icon: Icons.psychology_alt_rounded,
// //                         children: const [
// //                           _AdvicePoint(
// //                             text:
// //                                 'Some people become solution-focused during conflict and may skip emotional validation.',
// //                           ),
// //                           _AdvicePoint(
// //                             text:
// //                                 'Others naturally want emotional connection first, then practical solutions.',
// //                           ),
// //                           _AdvicePoint(
// //                             text:
// //                                 'A strong relationship usually needs both: empathy and clarity.',
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 14),
// //                       _buildExpandableSection(
// //                         title: 'How to respond better',
// //                         icon: Icons.chat_bubble_outline_rounded,
// //                         children: const [
// //                           _AdvicePoint(
// //                             text:
// //                                 'Ask: “Do you want comfort, clarity, or a solution right now?”',
// //                           ),
// //                           _AdvicePoint(
// //                             text: 'Avoid assumptions based only on gender.',
// //                           ),
// //                           _AdvicePoint(
// //                             text:
// //                                 'Pay attention to your partner’s actual habits and needs.',
// //                           ),
// //                         ],
// //                       ),
// //                     ] else ...[
// //                       _buildSignalsSection(),
// //                     ],
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton.extended(
// //           onPressed: () {
// //             showModalBottomSheet(
// //               context: context,
// //               backgroundColor: Colors.white,
// //               shape: const RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
// //               ),
// //               builder: (_) => _buildQuickActions(),
// //             );
// //           },
// //           icon: const Icon(Icons.favorite_outline_rounded),
// //           label: const Text('Tools'),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildHeroSection() {
// //     return Container(
// //       padding: const EdgeInsets.all(22),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(28),
// //         gradient: const LinearGradient(
// //           colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),
// //       ),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Build better connection',
// //                   style: GoogleFonts.poppins(
// //                     fontSize: 24,
// //                     height: 1.2,
// //                     fontWeight: FontWeight.w700,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Text(
// //                   'Simple relationship insights, healthy signals, and useful reading suggestions in one place.',
// //                   style: GoogleFonts.poppins(
// //                     fontSize: 13.5,
// //                     color: Colors.white.withOpacity(0.92),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 18),
// //                 Container(
// //                   padding: const EdgeInsets.symmetric(
// //                     horizontal: 12,
// //                     vertical: 8,
// //                   ),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white.withOpacity(0.16),
// //                     borderRadius: BorderRadius.circular(100),
// //                   ),
// //                   child: Text(
// //                     'Self-awareness • Communication • Boundaries',
// //                     style: GoogleFonts.poppins(
// //                       fontSize: 11.5,
// //                       fontWeight: FontWeight.w500,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           Container(
// //             height: 74,
// //             width: 74,
// //             decoration: BoxDecoration(
// //               color: Colors.white.withOpacity(0.16),
// //               borderRadius: BorderRadius.circular(22),
// //             ),
// //             child: const Icon(
// //               Icons.favorite_rounded,
// //               size: 34,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSegmentTabs() {
// //     return SizedBox(
// //       height: 44,
// //       child: ListView.separated(
// //         scrollDirection: Axis.horizontal,
// //         itemCount: segments.length,
// //         separatorBuilder: (_, __) => const SizedBox(width: 10),
// //         itemBuilder: (context, index) {
// //           final selected = selectedSegment == index;
// //           return ChoiceChip(
// //             label: Text(segments[index]),
// //             selected: selected,
// //             onSelected: (_) => setState(() => selectedSegment = index),
// //             labelStyle: TextStyle(
// //               color: selected ? Colors.white : const Color(0xFF4B5563),
// //               fontWeight: FontWeight.w600,
// //             ),
// //             selectedColor: const Color(0xFF6C63FF),
// //             backgroundColor: Colors.white,
// //             side: BorderSide(
// //               color: selected ? Colors.transparent : const Color(0xFFE5E7EB),
// //             ),
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(14),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildTodayFocus() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildSectionTitle('Today’s focus'),
// //         const SizedBox(height: 12),
// //         Container(
// //           padding: const EdgeInsets.all(18),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(22),
// //             boxShadow: const [
// //               BoxShadow(
// //                 color: Color(0x0D000000),
// //                 blurRadius: 18,
// //                 offset: Offset(0, 8),
// //               ),
// //             ],
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               _infoRow(
// //                 Icons.auto_awesome_rounded,
// //                 'Healthy relationships feel calm, not confusing.',
// //               ),
// //               const SizedBox(height: 12),
// //               _infoRow(
// //                 Icons.record_voice_over_rounded,
// //                 'Clear communication is more useful than mind-reading.',
// //               ),
// //               const SizedBox(height: 12),
// //               _infoRow(
// //                 Icons.shield_moon_rounded,
// //                 'Boundaries protect connection; they do not weaken it.',
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildMindsetCards() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildSectionTitle('Core insights'),
// //         const SizedBox(height: 12),
// //         SizedBox(
// //           height: 178,
// //           child: ListView.separated(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: mindsetCards.length,
// //             separatorBuilder: (_, __) => const SizedBox(width: 14),
// //             itemBuilder: (context, index) {
// //               final item = mindsetCards[index];
// //               return Container(
// //                 width: 220,
// //                 padding: const EdgeInsets.all(18),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(24),
// //                   boxShadow: const [
// //                     BoxShadow(
// //                       color: Color(0x0D000000),
// //                       blurRadius: 16,
// //                       offset: Offset(0, 8),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 24,
// //                       backgroundColor: (item['color'] as Color).withOpacity(
// //                         0.12,
// //                       ),
// //                       child: Icon(
// //                         item['icon'] as IconData,
// //                         color: item['color'] as Color,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     Text(
// //                       item['title'] as String,
// //                       style: GoogleFonts.poppins(
// //                         fontWeight: FontWeight.w700,
// //                         fontSize: 16,
// //                         color: const Color(0xFF1F2430),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Text(
// //                       item['subtitle'] as String,
// //                       style: GoogleFonts.poppins(
// //                         fontSize: 13,
// //                         height: 1.45,
// //                         color: const Color(0xFF667085),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildMiniChecklist() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildSectionTitle('Healthy basics'),
// //         const SizedBox(height: 12),
// //         Wrap(
// //           spacing: 10,
// //           runSpacing: 10,
// //           children: const [
// //             _TagChip(label: 'Mutual respect'),
// //             _TagChip(label: 'Honest communication'),
// //             _TagChip(label: 'Consistency'),
// //             _TagChip(label: 'Emotional safety'),
// //             _TagChip(label: 'Accountability'),
// //             _TagChip(label: 'Shared effort'),
// //           ],
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildSignalsSection() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildSectionTitle('Relationship signals'),
// //         const SizedBox(height: 12),
// //         Row(
// //           children: [
// //             Expanded(
// //               child: _signalCard(
// //                 title: 'Red flags',
// //                 color: const Color(0xFFE25555),
// //                 icon: Icons.flag_rounded,
// //                 items: redFlags,
// //               ),
// //             ),
// //             const SizedBox(width: 14),
// //             Expanded(
// //               child: _signalCard(
// //                 title: 'Green flags',
// //                 color: const Color(0xFF22A06B),
// //                 icon: Icons.verified_rounded,
// //                 items: greenFlags,
// //               ),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 22),
// //         _buildSectionTitle('Reading suggestions'),
// //         const SizedBox(height: 12),
// //         _buildTopicSelector(),
// //         const SizedBox(height: 12),
// //         ...bookTopics[selectedTopic]!.map(_bookTile),
// //       ],
// //     );
// //   }

// //   Widget _signalCard({
// //     required String title,
// //     required Color color,
// //     required IconData icon,
// //     required List<String> items,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(22),
// //         boxShadow: const [
// //           BoxShadow(
// //             color: Color(0x0D000000),
// //             blurRadius: 18,
// //             offset: Offset(0, 8),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Icon(icon, color: color, size: 20),
// //               const SizedBox(width: 8),
// //               Text(
// //                 title,
// //                 style: GoogleFonts.poppins(
// //                   fontWeight: FontWeight.w700,
// //                   fontSize: 15,
// //                   color: const Color(0xFF1F2430),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 12),
// //           ...items
// //               .take(5)
// //               .map(
// //                 (e) => Padding(
// //                   padding: const EdgeInsets.only(bottom: 10),
// //                   child: Row(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Icon(Icons.circle, size: 8, color: color),
// //                       const SizedBox(width: 8),
// //                       Expanded(
// //                         child: Text(
// //                           e,
// //                           style: GoogleFonts.poppins(
// //                             fontSize: 13,
// //                             color: const Color(0xFF667085),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTopicSelector() {
// //     return SizedBox(
// //       height: 42,
// //       child: ListView(
// //         scrollDirection: Axis.horizontal,
// //         children: bookTopics.keys.map((topic) {
// //           final selected = topic == selectedTopic;
// //           return Padding(
// //             padding: const EdgeInsets.only(right: 10),
// //             child: FilterChip(
// //               label: Text(topic),
// //               selected: selected,
// //               onSelected: (_) => setState(() => selectedTopic = topic),
// //               selectedColor: const Color(0xFFE9E7FF),
// //               checkmarkColor: const Color(0xFF6C63FF),
// //               labelStyle: TextStyle(
// //                 color: selected
// //                     ? const Color(0xFF4C43D8)
// //                     : const Color(0xFF4B5563),
// //                 fontWeight: FontWeight.w600,
// //               ),
// //               backgroundColor: Colors.white,
// //               side: const BorderSide(color: Color(0xFFE5E7EB)),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(14),
// //               ),
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }

// //   Widget _bookTile(Map<String, String> book) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(20),
// //         boxShadow: const [
// //           BoxShadow(
// //             color: Color(0x0D000000),
// //             blurRadius: 16,
// //             offset: Offset(0, 8),
// //           ),
// //         ],
// //       ),
// //       child: ListTile(
// //         contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
// //         leading: Container(
// //           height: 46,
// //           width: 46,
// //           decoration: BoxDecoration(
// //             color: const Color(0xFFEAE8FF),
// //             borderRadius: BorderRadius.circular(14),
// //           ),
// //           child: const Icon(Icons.menu_book_rounded, color: Color(0xFF6C63FF)),
// //         ),
// //         title: Text(
// //           book['title']!,
// //           style: GoogleFonts.poppins(
// //             fontWeight: FontWeight.w600,
// //             color: const Color(0xFF1F2430),
// //           ),
// //         ),
// //         subtitle: Padding(
// //           padding: const EdgeInsets.only(top: 4),
// //           child: Text(
// //             book['subtitle']!,
// //             style: GoogleFonts.poppins(
// //               fontSize: 12.5,
// //               color: const Color(0xFF667085),
// //             ),
// //           ),
// //         ),
// //         trailing: const Icon(Icons.open_in_new_rounded, size: 20),
// //         onTap: () => openLink(book['url']!),
// //       ),
// //     );
// //   }

// //   Widget _buildExpandableSection({
// //     required String title,
// //     required IconData icon,
// //     required List<Widget> children,
// //   }) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(22),
// //         boxShadow: const [
// //           BoxShadow(
// //             color: Color(0x0D000000),
// //             blurRadius: 18,
// //             offset: Offset(0, 8),
// //           ),
// //         ],
// //       ),
// //       child: Theme(
// //         data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
// //         child: ExpansionTile(
// //           tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
// //           childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
// //           leading: Container(
// //             height: 42,
// //             width: 42,
// //             decoration: BoxDecoration(
// //               color: const Color(0xFFEAE8FF),
// //               borderRadius: BorderRadius.circular(14),
// //             ),
// //             child: Icon(icon, color: const Color(0xFF6C63FF)),
// //           ),
// //           title: Text(
// //             title,
// //             style: GoogleFonts.poppins(
// //               fontWeight: FontWeight.w600,
// //               color: const Color(0xFF1F2430),
// //             ),
// //           ),
// //           iconColor: const Color(0xFF6C63FF),
// //           collapsedIconColor: const Color(0xFF98A2B3),
// //           children: children,
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildQuickActions() {
// //     return SafeArea(
// //       child: Padding(
// //         padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Container(
// //               width: 42,
// //               height: 4,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFD0D5DD),
// //                 borderRadius: BorderRadius.circular(100),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             _actionTile(
// //               icon: Icons.book_outlined,
// //               title: 'Open books',
// //               subtitle: 'See suggested reading by topic',
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 showModalBottomSheet(
// //                   context: context,
// //                   isScrollControlled: true,
// //                   backgroundColor: Colors.white,
// //                   shape: const RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.vertical(
// //                       top: Radius.circular(28),
// //                     ),
// //                   ),
// //                   builder: (_) => _buildResourcesSheet(),
// //                 );
// //               },
// //             ),
// //             _actionTile(
// //               icon: Icons.psychology_outlined,
// //               title: 'Learn more',
// //               subtitle: 'Search relationship psychology topics',
// //               onTap: () => openLink(
// //                 'https://www.google.com/search?q=relationship+psychology',
// //               ),
// //             ),
// //             _actionTile(
// //               icon: Icons.volunteer_activism_outlined,
// //               title: 'Healthy communication',
// //               subtitle: 'Explore communication advice',
// //               onTap: () => openLink(
// //                 'https://www.google.com/search?q=healthy+relationship+communication',
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildResourcesSheet() {
// //     return SafeArea(
// //       child: Padding(
// //         padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(
// //               child: Container(
// //                 width: 42,
// //                 height: 4,
// //                 decoration: BoxDecoration(
// //                   color: const Color(0xFFD0D5DD),
// //                   borderRadius: BorderRadius.circular(100),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               'Recommended books',
// //               style: GoogleFonts.poppins(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.w700,
// //                 color: const Color(0xFF1F2430),
// //               ),
// //             ),
// //             const SizedBox(height: 6),
// //             Text(
// //               'Browse practical books for different relationship stages.',
// //               style: GoogleFonts.poppins(
// //                 fontSize: 13,
// //                 color: const Color(0xFF667085),
// //               ),
// //             ),
// //             const SizedBox(height: 18),
// //             _buildTopicSelector(),
// //             const SizedBox(height: 14),
// //             ...bookTopics[selectedTopic]!.map(_bookTile),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _actionTile({
// //     required IconData icon,
// //     required String title,
// //     required String subtitle,
// //     required VoidCallback onTap,
// //   }) {
// //     return ListTile(
// //       onTap: onTap,
// //       contentPadding: EdgeInsets.zero,
// //       leading: Container(
// //         height: 46,
// //         width: 46,
// //         decoration: BoxDecoration(
// //           color: const Color(0xFFEAE8FF),
// //           borderRadius: BorderRadius.circular(14),
// //         ),
// //         child: Icon(icon, color: const Color(0xFF6C63FF)),
// //       ),
// //       title: Text(
// //         title,
// //         style: GoogleFonts.poppins(
// //           fontWeight: FontWeight.w600,
// //           color: const Color(0xFF1F2430),
// //         ),
// //       ),
// //       subtitle: Text(
// //         subtitle,
// //         style: GoogleFonts.poppins(
// //           fontSize: 12.5,
// //           color: const Color(0xFF667085),
// //         ),
// //       ),
// //       trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
// //     );
// //   }

// //   Widget _buildSectionTitle(String title) {
// //     return Text(
// //       title,
// //       style: GoogleFonts.poppins(
// //         fontSize: 18,
// //         fontWeight: FontWeight.w700,
// //         color: const Color(0xFF1F2430),
// //       ),
// //     );
// //   }

// //   Widget _infoRow(IconData icon, String text) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Container(
// //           margin: const EdgeInsets.only(top: 2),
// //           height: 32,
// //           width: 32,
// //           decoration: BoxDecoration(
// //             color: const Color(0xFFEAE8FF),
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           child: Icon(icon, size: 18, color: const Color(0xFF6C63FF)),
// //         ),
// //         const SizedBox(width: 12),
// //         Expanded(
// //           child: Text(
// //             text,
// //             style: GoogleFonts.poppins(
// //               fontSize: 13.5,
// //               height: 1.45,
// //               color: const Color(0xFF475467),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _AdvicePoint extends StatelessWidget {
// //   final String text;

// //   const _AdvicePoint({required this.text});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 12),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             margin: const EdgeInsets.only(top: 6),
// //             width: 8,
// //             height: 8,
// //             decoration: const BoxDecoration(
// //               color: Color(0xFF6C63FF),
// //               shape: BoxShape.circle,
// //             ),
// //           ),
// //           const SizedBox(width: 10),
// //           Expanded(
// //             child: Text(
// //               text,
// //               style: GoogleFonts.poppins(
// //                 fontSize: 13,
// //                 height: 1.5,
// //                 color: const Color(0xFF667085),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _TagChip extends StatelessWidget {
// //   final String label;

// //   const _TagChip({required this.label});

// //   get GoogleFonts => null;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //         border: Border.all(color: const Color(0xFFE5E7EB)),
// //       ),
// //       child: Text(
// //         label,
// //         style: GoogleFonts.poppins(
// //           fontSize: 12.5,
// //           fontWeight: FontWeight.w500,
// //           color: const Color(0xFF344054),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class RelationshipAdvicePage extends StatefulWidget {
//   const RelationshipAdvicePage({super.key});

//   @override
//   State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
// }

// class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
//   String selectedTopic = 'Early Stage';
//   int selectedSegment = 0;

//   final Map<String, List<Map<String, String>>> bookTopics = {
//     'Early Stage': [
//       {
//         'title': 'Attached',
//         'subtitle': 'Attachment styles and emotional patterns',
//         'url': 'https://www.google.com/search?q=attached+book',
//       },
//       {
//         'title': 'Modern Romance',
//         'subtitle': 'Dating, communication, and modern relationships',
//         'url': 'https://www.google.com/search?q=modern+romance+book',
//       },
//     ],
//     'Understanding Your Partner': [
//       {
//         'title': 'The 5 Love Languages',
//         'subtitle': 'Understanding how people give and receive love',
//         'url': 'https://www.google.com/search?q=the+5+love+languages+book',
//       },
//       {
//         'title': 'Men Are from Mars, Women Are from Venus',
//         'subtitle': 'Popular relationship communication framework',
//         'url':
//             'https://www.google.com/search?q=men+are+from+mars+women+are+from+venus+book',
//       },
//     ],
//     'Healthy Communication': [
//       {
//         'title': 'Nonviolent Communication',
//         'subtitle': 'Better conflict handling and emotional clarity',
//         'url': 'https://www.google.com/search?q=nonviolent+communication+book',
//       },
//       {
//         'title': 'Crucial Conversations',
//         'subtitle': 'How to talk when emotions are high',
//         'url': 'https://www.google.com/search?q=crucial+conversations+book',
//       },
//     ],
//   };

//   final List<String> redFlags = [
//     'Controlling behavior',
//     'Constant criticism',
//     'Gaslighting',
//     'Avoiding accountability',
//     'Disrespect for boundaries',
//   ];

//   final List<String> greenFlags = [
//     'Consistent communication',
//     'Respect for boundaries',
//     'Emotional safety',
//     'Trust and honesty',
//     'Support during stress',
//   ];

//   final List<Map<String, dynamic>> mindsetCards = [
//     {
//       'title': 'Clarity matters',
//       'subtitle':
//           'Many people respond better to direct and respectful communication.',
//       'icon': Icons.forum_rounded,
//       'color': const Color(0xFF6C63FF),
//     },
//     {
//       'title': 'Connection matters',
//       'subtitle': 'Feeling heard is often as important as solving the issue.',
//       'icon': Icons.favorite_rounded,
//       'color': const Color(0xFFE86A92),
//     },
//     {
//       'title': 'Patterns matter',
//       'subtitle': 'Notice repeated behavior, not just isolated sweet moments.',
//       'icon': Icons.insights_rounded,
//       'color': const Color(0xFF2AA889),
//     },
//   ];

//   final List<String> segments = ['Overview', 'Mindset', 'Signals'];

//   Future<void> openLink(String url) async {
//     final uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Could not open link')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = ThemeData(
//       useMaterial3: true,
//       colorScheme: ColorScheme.fromSeed(
//         seedColor: const Color(0xFF6C63FF),
//         brightness: Brightness.light,
//       ),
//       textTheme: GoogleFonts.poppinsTextTheme(),
//       scaffoldBackgroundColor: const Color(0xFFF6F7FB),
//     );

//     return Theme(
//       data: theme,
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
//               elevation: 0,
//               backgroundColor: const Color(0xFFF6F7FB),
//               surfaceTintColor: Colors.transparent,
//               title: Text(
//                 'Relationship Guide',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF1F2430),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       backgroundColor: Colors.white,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(28),
//                         ),
//                       ),
//                       builder: (_) => _buildResourcesSheet(),
//                     );
//                   },
//                   icon: const Icon(Icons.menu_book_rounded),
//                 ),
//               ],
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildHeroSection(),
//                     const SizedBox(height: 24),
//                     _buildSegmentTabs(),
//                     const SizedBox(height: 24),
//                     if (selectedSegment == 0) ...[
//                       _buildTodayFocus(),
//                       const SizedBox(height: 24),
//                       _buildMindsetCards(),
//                       const SizedBox(height: 24),
//                       _buildMiniChecklist(),
//                     ] else if (selectedSegment == 1) ...[
//                       _buildSectionTitle('How people tend to process'),
//                       const SizedBox(height: 12),
//                       _buildExpandableSection(
//                         title: 'Practical mindset notes',
//                         icon: Icons.psychology_alt_rounded,
//                         children: const [
//                           _AdvicePoint(
//                             text:
//                                 'Some people become solution-focused during conflict and may skip emotional validation.',
//                           ),
//                           _AdvicePoint(
//                             text:
//                                 'Others naturally want emotional connection first, then practical solutions.',
//                           ),
//                           _AdvicePoint(
//                             text:
//                                 'A strong relationship usually needs both: empathy and clarity.',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 14),
//                       _buildExpandableSection(
//                         title: 'How to respond better',
//                         icon: Icons.chat_bubble_outline_rounded,
//                         children: const [
//                           _AdvicePoint(
//                             text:
//                                 'Ask: “Do you want comfort, clarity, or a solution right now?”',
//                           ),
//                           _AdvicePoint(
//                             text: 'Avoid assumptions based only on gender.',
//                           ),
//                           _AdvicePoint(
//                             text:
//                                 'Pay attention to your partner’s actual habits and needs.',
//                           ),
//                         ],
//                       ),
//                     ] else ...[
//                       _buildSignalsSection(),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               backgroundColor: Colors.white,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//               ),
//               builder: (_) => _buildQuickActions(),
//             );
//           },
//           icon: const Icon(Icons.favorite_outline_rounded),
//           label: const Text('Tools'),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroSection() {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(28),
//         gradient: const LinearGradient(
//           colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Build better connection',
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     height: 1.2,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Simple relationship insights, healthy signals, and useful reading suggestions in one place.',
//                   style: GoogleFonts.poppins(
//                     fontSize: 13.5,
//                     color: Colors.white.withOpacity(0.92),
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.16),
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: Text(
//                     'Self-awareness • Communication • Boundaries',
//                     style: GoogleFonts.poppins(
//                       fontSize: 11.5,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Container(
//             height: 74,
//             width: 74,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.16),
//               borderRadius: BorderRadius.circular(22),
//             ),
//             child: const Icon(
//               Icons.favorite_rounded,
//               size: 34,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSegmentTabs() {
//     return SizedBox(
//       height: 44,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: segments.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 10),
//         itemBuilder: (context, index) {
//           final selected = selectedSegment == index;
//           return ChoiceChip(
//             label: Text(segments[index]),
//             selected: selected,
//             onSelected: (_) => setState(() => selectedSegment = index),
//             labelStyle: TextStyle(
//               color: selected ? Colors.white : const Color(0xFF4B5563),
//               fontWeight: FontWeight.w600,
//             ),
//             selectedColor: const Color(0xFF6C63FF),
//             backgroundColor: Colors.white,
//             side: BorderSide(
//               color: selected ? Colors.transparent : const Color(0xFFE5E7EB),
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(14),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildTodayFocus() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle('Today’s focus'),
//         const SizedBox(height: 12),
//         Container(
//           padding: const EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(22),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0x0D000000),
//                 blurRadius: 18,
//                 offset: Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _infoRow(
//                 Icons.auto_awesome_rounded,
//                 'Healthy relationships feel calm, not confusing.',
//               ),
//               const SizedBox(height: 12),
//               _infoRow(
//                 Icons.record_voice_over_rounded,
//                 'Clear communication is more useful than mind-reading.',
//               ),
//               const SizedBox(height: 12),
//               _infoRow(
//                 Icons.shield_moon_rounded,
//                 'Boundaries protect connection; they do not weaken it.',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMindsetCards() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle('Core insights'),
//         const SizedBox(height: 12),
//         SizedBox(
//           height: 190,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: mindsetCards.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 14),
//             itemBuilder: (context, index) {
//               final item = mindsetCards[index];
//               return Container(
//                 width: 220,
//                 padding: const EdgeInsets.all(18),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(24),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0x0D000000),
//                       blurRadius: 16,
//                       offset: Offset(0, 8),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundColor: (item['color'] as Color).withOpacity(
//                         0.12,
//                       ),
//                       child: Icon(
//                         item['icon'] as IconData,
//                         color: item['color'] as Color,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       item['title'] as String,
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16,
//                         color: const Color(0xFF1F2430),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Expanded(
//                       child: Text(
//                         item['subtitle'] as String,
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           height: 1.45,
//                           color: const Color(0xFF667085),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMiniChecklist() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle('Healthy basics'),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: const [
//             _TagChip(label: 'Mutual respect'),
//             _TagChip(label: 'Honest communication'),
//             _TagChip(label: 'Consistency'),
//             _TagChip(label: 'Emotional safety'),
//             _TagChip(label: 'Accountability'),
//             _TagChip(label: 'Shared effort'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildSignalsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle('Relationship signals'),
//         const SizedBox(height: 12),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: _signalCard(
//                 title: 'Red flags',
//                 color: const Color(0xFFE25555),
//                 icon: Icons.flag_rounded,
//                 items: redFlags,
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: _signalCard(
//                 title: 'Green flags',
//                 color: const Color(0xFF22A06B),
//                 icon: Icons.verified_rounded,
//                 items: greenFlags,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 22),
//         _buildSectionTitle('Reading suggestions'),
//         const SizedBox(height: 12),
//         _buildTopicSelector(),
//         const SizedBox(height: 12),
//         ...bookTopics[selectedTopic]!.map(_bookTile),
//       ],
//     );
//   }

//   Widget _signalCard({
//     required String title,
//     required Color color,
//     required IconData icon,
//     required List<String> items,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x0D000000),
//             blurRadius: 18,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: color, size: 20),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                     color: const Color(0xFF1F2430),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           ...items
//               .take(5)
//               .map(
//                 (e) => Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.circle, size: 8, color: color),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           e,
//                           style: GoogleFonts.poppins(
//                             fontSize: 13,
//                             color: const Color(0xFF667085),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTopicSelector() {
//     return SizedBox(
//       height: 42,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: bookTopics.keys.map((topic) {
//           final selected = topic == selectedTopic;
//           return Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: FilterChip(
//               label: Text(topic),
//               selected: selected,
//               onSelected: (_) => setState(() => selectedTopic = topic),
//               selectedColor: const Color(0xFFE9E7FF),
//               checkmarkColor: const Color(0xFF6C63FF),
//               labelStyle: TextStyle(
//                 color: selected
//                     ? const Color(0xFF4C43D8)
//                     : const Color(0xFF4B5563),
//                 fontWeight: FontWeight.w600,
//               ),
//               backgroundColor: Colors.white,
//               side: const BorderSide(color: Color(0xFFE5E7EB)),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _bookTile(Map<String, String> book) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x0D000000),
//             blurRadius: 16,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
//         leading: Container(
//           height: 46,
//           width: 46,
//           decoration: BoxDecoration(
//             color: const Color(0xFFEAE8FF),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: const Icon(Icons.menu_book_rounded, color: Color(0xFF6C63FF)),
//         ),
//         title: Text(
//           book['title']!,
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF1F2430),
//           ),
//         ),
//         subtitle: Padding(
//           padding: const EdgeInsets.only(top: 4),
//           child: Text(
//             book['subtitle']!,
//             style: GoogleFonts.poppins(
//               fontSize: 12.5,
//               color: const Color(0xFF667085),
//             ),
//           ),
//         ),
//         trailing: const Icon(Icons.open_in_new_rounded, size: 20),
//         onTap: () => openLink(book['url']!),
//       ),
//     );
//   }

//   Widget _buildExpandableSection({
//     required String title,
//     required IconData icon,
//     required List<Widget> children,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x0D000000),
//             blurRadius: 18,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Theme(
//         data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//         child: ExpansionTile(
//           tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
//           childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
//           leading: Container(
//             height: 42,
//             width: 42,
//             decoration: BoxDecoration(
//               color: const Color(0xFFEAE8FF),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Icon(icon, color: const Color(0xFF6C63FF)),
//           ),
//           title: Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               color: const Color(0xFF1F2430),
//             ),
//           ),
//           iconColor: const Color(0xFF6C63FF),
//           collapsedIconColor: const Color(0xFF98A2B3),
//           children: children,
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickActions() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 42,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFD0D5DD),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//             const SizedBox(height: 20),
//             _actionTile(
//               icon: Icons.book_outlined,
//               title: 'Open books',
//               subtitle: 'See suggested reading by topic',
//               onTap: () {
//                 Navigator.pop(context);
//                 showModalBottomSheet(
//                   context: context,
//                   isScrollControlled: true,
//                   backgroundColor: Colors.white,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(28),
//                     ),
//                   ),
//                   builder: (_) => _buildResourcesSheet(),
//                 );
//               },
//             ),
//             _actionTile(
//               icon: Icons.psychology_outlined,
//               title: 'Learn more',
//               subtitle: 'Search relationship psychology topics',
//               onTap: () => openLink(
//                 'https://www.google.com/search?q=relationship+psychology',
//               ),
//             ),
//             _actionTile(
//               icon: Icons.volunteer_activism_outlined,
//               title: 'Healthy communication',
//               subtitle: 'Explore communication advice',
//               onTap: () => openLink(
//                 'https://www.google.com/search?q=healthy+relationship+communication',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildResourcesSheet() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: 42,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFD0D5DD),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Recommended books',
//               style: GoogleFonts.poppins(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 color: const Color(0xFF1F2430),
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               'Browse practical books for different relationship stages.',
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//                 color: const Color(0xFF667085),
//               ),
//             ),
//             const SizedBox(height: 18),
//             _buildTopicSelector(),
//             const SizedBox(height: 14),
//             ...bookTopics[selectedTopic]!.map(_bookTile),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _actionTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       onTap: onTap,
//       contentPadding: EdgeInsets.zero,
//       leading: Container(
//         height: 46,
//         width: 46,
//         decoration: BoxDecoration(
//           color: const Color(0xFFEAE8FF),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Icon(icon, color: const Color(0xFF6C63FF)),
//       ),
//       title: Text(
//         title,
//         style: GoogleFonts.poppins(
//           fontWeight: FontWeight.w600,
//           color: const Color(0xFF1F2430),
//         ),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: GoogleFonts.poppins(
//           fontSize: 12.5,
//           color: const Color(0xFF667085),
//         ),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.poppins(
//         fontSize: 18,
//         fontWeight: FontWeight.w700,
//         color: const Color(0xFF1F2430),
//       ),
//     );
//   }

//   Widget _infoRow(IconData icon, String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 2),
//           height: 32,
//           width: 32,
//           decoration: BoxDecoration(
//             color: const Color(0xFFEAE8FF),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(icon, size: 18, color: const Color(0xFF6C63FF)),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             text,
//             style: GoogleFonts.poppins(
//               fontSize: 13.5,
//               height: 1.45,
//               color: const Color(0xFF475467),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _AdvicePoint extends StatelessWidget {
//   final String text;

//   const _AdvicePoint({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 6),
//             width: 8,
//             height: 8,
//             decoration: const BoxDecoration(
//               color: Color(0xFF6C63FF),
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               text,
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//                 height: 1.5,
//                 color: const Color(0xFF667085),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TagChip extends StatelessWidget {
//   final String label;

//   const _TagChip({required this.label, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: const Color(0xFFE5E7EB)),
//       ),
//       child: Text(
//         label,
//         style: GoogleFonts.poppins(
//           fontSize: 12.5,
//           fontWeight: FontWeight.w500,
//           color: const Color(0xFF344054),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RelationshipAdvicePage extends StatefulWidget {
  const RelationshipAdvicePage({super.key});

  @override
  State<RelationshipAdvicePage> createState() => _RelationshipAdvicePageState();
}

class _RelationshipAdvicePageState extends State<RelationshipAdvicePage> {
  String selectedTopic = 'Early Stage';
  int selectedSegment = 0;
  int selectedInsightIndex = 0;

  final List<String> segments = [
    'Overview',
    'Mindset',
    'Signals',
    'Healing',
    'Self Discovery',
    'Men & Women',
  ];

  final Map<String, List<Map<String, String>>> bookTopics = {
    'Early Stage': [
      {
        'title': 'Attached',
        'subtitle': 'Attachment styles and emotional patterns',
        'url': 'https://www.google.com/search?q=attached+book',
      },
      {
        'title': 'Modern Romance',
        'subtitle': 'Dating, communication, and modern relationships',
        'url': 'https://www.google.com/search?q=modern+romance+book',
      },
      {
        'title': 'Hold Me Tight',
        'subtitle': 'Attachment, bonding, and emotional connection',
        'url': 'https://www.google.com/search?q=hold+me+tight+book',
      },
      {
        'title': 'The Seven Principles for Making Marriage Work',
        'subtitle': 'Research-based patterns for strong relationships',
        'url':
            'https://www.google.com/search?q=the+seven+principles+for+making+marriage+work+book',
      },
    ],
    'Understanding Your Partner': [
      {
        'title': 'The 5 Love Languages',
        'subtitle': 'Understanding how people give and receive love',
        'url': 'https://www.google.com/search?q=the+5+love+languages+book',
      },
      {
        'title': 'Men Are from Mars, Women Are from Venus',
        'subtitle': 'Popular relationship communication framework',
        'url':
            'https://www.google.com/search?q=men+are+from+mars+women+are+from+venus+book',
      },
      {
        'title': 'Wired for Love',
        'subtitle': 'How attachment and neuroscience shape closeness',
        'url': 'https://www.google.com/search?q=wired+for+love+book',
      },
      {
        'title': 'Getting the Love You Want',
        'subtitle': 'Patterns, needs, and partner understanding',
        'url': 'https://www.google.com/search?q=getting+the+love+you+want+book',
      },
    ],
    'Healthy Communication': [
      {
        'title': 'Nonviolent Communication',
        'subtitle': 'Better conflict handling and emotional clarity',
        'url': 'https://www.google.com/search?q=nonviolent+communication+book',
      },
      {
        'title': 'Crucial Conversations',
        'subtitle': 'How to talk when emotions are high',
        'url': 'https://www.google.com/search?q=crucial+conversations+book',
      },
      {
        'title': 'Set Boundaries, Find Peace',
        'subtitle': 'Boundary setting and emotional health',
        'url': 'https://www.google.com/search?q=set+boundaries+find+peace+book',
      },
      {
        'title': 'Difficult Conversations',
        'subtitle': 'How to discuss sensitive issues with clarity',
        'url': 'https://www.google.com/search?q=difficult+conversations+book',
      },
    ],
    'Toxic Relationships': [
      {
        'title': 'Why Does He Do That?',
        'subtitle': 'Understanding controlling and harmful patterns',
        'url': 'https://www.google.com/search?q=why+does+he+do+that+book',
      },
      {
        'title': 'Psychopath Free',
        'subtitle': 'Healing after manipulative or toxic dynamics',
        'url': 'https://www.google.com/search?q=psychopath+free+book',
      },
      {
        'title': 'The Body Keeps the Score',
        'subtitle': 'Trauma, stress, and healing patterns',
        'url': 'https://www.google.com/search?q=the+body+keeps+the+score+book',
      },
      {
        'title': 'Boundaries',
        'subtitle': 'Learning limits, self-respect, and responsibility',
        'url': 'https://www.google.com/search?q=boundaries+henry+cloud+book',
      },
    ],
    'Self Discovery': [
      {
        'title': 'The Gifts of Imperfection',
        'subtitle': 'Self-worth, vulnerability, and inner grounding',
        'url': 'https://www.google.com/search?q=the+gifts+of+imperfection+book',
      },
      {
        'title': 'The Mountain Is You',
        'subtitle': 'Self-sabotage, healing, and growth',
        'url': 'https://www.google.com/search?q=the+mountain+is+you+book',
      },
      {
        'title': 'Radical Acceptance',
        'subtitle': 'Letting go, self-acceptance, and peace',
        'url': 'https://www.google.com/search?q=radical+acceptance+book',
      },
      {
        'title': 'Atomic Habits',
        'subtitle': 'Rebuilding self through small consistent actions',
        'url': 'https://www.google.com/search?q=atomic+habits+book',
      },
    ],
    'Men & Women Differences': [
      {
        'title': 'Come As You Are',
        'subtitle': 'Science of emotion, desire, and differences',
        'url': 'https://www.google.com/search?q=come+as+you+are+book',
      },
      {
        'title': 'The Will to Change',
        'subtitle': 'Masculinity, emotion, and male inner life',
        'url': 'https://www.google.com/search?q=the+will+to+change+book',
      },
      {
        'title': 'For Women Only',
        'subtitle': 'Popular book on common male needs and perceptions',
        'url': 'https://www.google.com/search?q=for+women+only+book',
      },
      {
        'title': 'For Men Only',
        'subtitle': 'Popular book on common female needs and perceptions',
        'url': 'https://www.google.com/search?q=for+men+only+book',
      },
    ],
  };

  final List<String> redFlags = [
    'Controlling behavior',
    'Constant criticism',
    'Gaslighting',
    'Avoiding accountability',
    'Disrespect for boundaries',
    'Isolation from friends or family',
    'Jealous monitoring',
  ];

  final List<String> greenFlags = [
    'Consistent communication',
    'Respect for boundaries',
    'Emotional safety',
    'Trust and honesty',
    'Support during stress',
    'Shared accountability',
    'Freedom to be yourself',
  ];

  final List<Map<String, dynamic>> mindsetCards = [
    {
      'title': 'Clarity matters',
      'subtitle':
          'Many people respond better to direct and respectful communication.',
      'icon': Icons.forum_rounded,
      'color': const Color(0xFF6C63FF),
      'points': [
        'Say what you feel, need, and expect in simple language.',
        'Do not expect your partner to decode silence or mood shifts.',
        'Clear requests reduce confusion and resentment.',
        'Research-based communication models emphasize direct but respectful expression.',
      ],
      'blog':
          'https://www.gottman.com/blog/solving-relationship-communication-problems-how-couples-overcome-issues-in-relationships/',
      'youtube':
          'https://www.youtube.com/results?search_query=gottman+communication+relationships',
      'google':
          'https://www.google.com/search?q=healthy+relationship+communication+gottman',
    },
    {
      'title': 'Connection matters',
      'subtitle': 'Feeling heard is often as important as solving the issue.',
      'icon': Icons.favorite_rounded,
      'color': const Color(0xFFE86A92),
      'points': [
        'Validation does not mean agreement; it means the other person feels understood.',
        'A partner may calm down faster when they feel emotionally seen.',
        'Small “bids for connection” build security over time.',
        'Attachment research suggests emotional responsiveness supports trust and stability.',
      ],
      'blog':
          'https://www.gottman.com/blog/small-things-often-create-secure-attachments-interview-amir-levine-m-d/',
      'youtube':
          'https://www.youtube.com/results?search_query=secure+attachment+relationships',
      'google':
          'https://www.google.com/search?q=attachment+style+emotional+responsiveness+relationships',
    },
    {
      'title': 'Patterns matter',
      'subtitle': 'Notice repeated behavior, not just isolated sweet moments.',
      'icon': Icons.insights_rounded,
      'color': const Color(0xFF2AA889),
      'points': [
        'Look at consistency across weeks and months, not just intense moments.',
        'Repeated contempt, defensiveness, or withdrawal usually matter more than apologies alone.',
        'Healthy change is visible in actions, not only promises.',
        'Warning-sign research shows repeated red flags can predict later harm.',
      ],
      'blog': 'https://www.gottman.com/blog/what-defines-a-toxic-relationship/',
      'youtube':
          'https://www.youtube.com/results?search_query=toxic+relationship+warning+signs+gottman',
      'google':
          'https://www.google.com/search?q=relationship+red+flags+patterns+research',
    },
  ];

  final Map<String, List<Map<String, String>>> trustedResources = {
    'General': [
      {
        'title': 'The Gottman Institute',
        'subtitle': 'Research-based relationship articles and tools',
        'url': 'https://www.gottman.com/blog/',
      },
      {
        'title': 'NIMH: Caring for Your Mental Health',
        'subtitle': 'Mental health, self-care, and emotional support',
        'url':
            'https://www.nimh.nih.gov/health/topics/caring-for-your-mental-health',
      },
      {
        'title': 'HelpGuide: Attachment in Adult Relationships',
        'subtitle': 'Readable explanation of adult attachment patterns',
        'url':
            'https://www.helpguide.org/relationships/social-connection/attachment-and-adult-relationships',
      },
      {
        'title': 'Google: Relationship psychology',
        'subtitle': 'Explore broader psychology resources',
        'url': 'https://www.google.com/search?q=relationship+psychology',
      },
    ],
    'Toxic Relationship Help': [
      {
        'title': 'Healthy People: Warning signs of relationship violence',
        'subtitle': 'Official guidance on controlling or unsafe relationships',
        'url':
            'https://odphp.health.gov/myhealthfinder/healthy-living/mental-health-and-relationships/watch-warning-signs-relationship-violence',
      },
      {
        'title': 'The National Domestic Violence Hotline',
        'subtitle': '24/7 confidential support and resources',
        'url': 'https://www.thehotline.org',
      },
      {
        'title': 'Gottman: What Defines a Toxic Relationship?',
        'subtitle': 'Toxic patterns, Four Horsemen, and recovery direction',
        'url':
            'https://www.gottman.com/blog/what-defines-a-toxic-relationship/',
      },
      {
        'title': 'Google: How to leave a toxic relationship safely',
        'subtitle': 'Search more professional guidance',
        'url':
            'https://www.google.com/search?q=how+to+leave+a+toxic+relationship+safely',
      },
    ],
    'Mindset & Attachment': [
      {
        'title':
            'Public Health Post: Attachment styles and relationship health',
        'subtitle': 'Clear article on anxious, avoidant, and secure patterns',
        'url':
            'https://publichealthpost.org/mental-behavioral-health/attachment-styles-neuroticism-and-relationship-health/',
      },
      {
        'title': 'PMC: Attachment style and psychological well-being',
        'subtitle': 'Scientific article linking attachment and well-being',
        'url': 'https://pmc.ncbi.nlm.nih.gov/articles/PMC10047625/',
      },
      {
        'title': 'Google: Attachment styles in adult relationships',
        'subtitle': 'Find more articles, therapists, and explainers',
        'url':
            'https://www.google.com/search?q=attachment+styles+adult+relationships',
      },
    ],
    'Men & Women Differences': [
      {
        'title': 'PMC: Gender and emotion expression',
        'subtitle':
            'Review article on average gender differences in emotional expression',
        'url': 'https://pmc.ncbi.nlm.nih.gov/articles/PMC4469291/',
      },
      {
        'title':
            'ScienceDirect: Sex differences in processing emotional signals',
        'subtitle': 'Research review on emotional signal processing',
        'url':
            'https://www.sciencedirect.com/science/article/abs/pii/S0028393212000024',
      },
      {
        'title': 'Google: Men women emotional expression research',
        'subtitle': 'Search more evidence and interpretations',
        'url':
            'https://www.google.com/search?q=men+women+emotional+expression+research',
      },
    ],
  };

  final Map<String, List<Map<String, String>>> videoResources = {
    'Communication': [
      {
        'title': 'Gottman communication videos',
        'subtitle': 'Search relationship communication lessons',
        'url':
            'https://www.youtube.com/results?search_query=gottman+communication+relationships',
      },
      {
        'title': 'Healthy communication in relationships',
        'subtitle': 'Practical communication YouTube results',
        'url':
            'https://www.youtube.com/results?search_query=healthy+communication+in+relationships',
      },
    ],
    'Attachment': [
      {
        'title': 'How the 4 attachment styles impact dating & relationships',
        'subtitle': 'Attachment style explainer videos',
        'url':
            'https://www.youtube.com/results?search_query=how+the+4+attachment+styles+impact+dating+relationships',
      },
      {
        'title': 'Secure attachment relationship videos',
        'subtitle': 'Search secure attachment guidance',
        'url':
            'https://www.youtube.com/results?search_query=secure+attachment+style+relationships',
      },
    ],
    'Toxic Relationship': [
      {
        'title': 'Toxic relationship red flags',
        'subtitle': 'Search educational toxic relationship videos',
        'url':
            'https://www.youtube.com/results?search_query=toxic+relationship+red+flags',
      },
      {
        'title': 'How to leave a toxic relationship safely',
        'subtitle': 'Search recovery and safety planning videos',
        'url':
            'https://www.youtube.com/results?search_query=how+to+leave+a+toxic+relationship+safely',
      },
    ],
    'Men & Women': [
      {
        'title': 'Men women emotional expression psychology',
        'subtitle': 'Search psychology explainers on emotional expression',
        'url':
            'https://www.youtube.com/results?search_query=men+women+emotional+expression+psychology',
      },
      {
        'title': 'Relationship needs men women psychology',
        'subtitle': 'Search balanced discussions of partner needs',
        'url':
            'https://www.youtube.com/results?search_query=relationship+needs+men+women+psychology',
      },
    ],
  };

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF),
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: const Color(0xFFF6F7FB),
    );

    return Theme(
      data: theme,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: const Color(0xFFF6F7FB),
              surfaceTintColor: Colors.transparent,
              title: Text(
                'Relationship Guide',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2430),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28),
                        ),
                      ),
                      builder: (_) => _buildResourcesSheet(),
                    );
                  },
                  icon: const Icon(Icons.menu_book_rounded),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(),
                    const SizedBox(height: 24),
                    _buildSegmentTabs(),
                    const SizedBox(height: 24),
                    if (selectedSegment == 0) ...[
                      _buildTodayFocus(),
                      const SizedBox(height: 24),
                      _buildMindsetCards(),
                      const SizedBox(height: 18),
                      _buildInsightDetails(),
                      const SizedBox(height: 24),
                      _buildMiniChecklist(),
                      const SizedBox(height: 24),
                      _buildResourceCluster(
                        title: 'Helpful websites',
                        items: trustedResources['General']!,
                      ),
                    ] else if (selectedSegment == 1) ...[
                      _buildMindsetSectionExpanded(),
                    ] else if (selectedSegment == 2) ...[
                      _buildSignalsSection(),
                    ] else if (selectedSegment == 3) ...[
                      _buildToxicRecoverySection(),
                    ] else if (selectedSegment == 4) ...[
                      _buildSelfDiscoverySection(),
                    ] else ...[
                      _buildGenderDifferencesSection(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              builder: (_) => _buildQuickActions(),
            );
          },
          icon: const Icon(Icons.favorite_outline_rounded),
          label: const Text('Tools'),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Build better connection',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Simple relationship insights, healthy signals, useful reading suggestions, and recovery tools in one place.',
                  style: GoogleFonts.poppins(
                    fontSize: 13.5,
                    color: Colors.white.withOpacity(0.92),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Self-awareness • Communication • Boundaries',
                    style: GoogleFonts.poppins(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.favorite_rounded,
              size: 34,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentTabs() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: segments.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = selectedSegment == index;
          return ChoiceChip(
            label: Text(segments[index]),
            selected: selected,
            onSelected: (_) => setState(() => selectedSegment = index),
            labelStyle: TextStyle(
              color: selected ? Colors.white : const Color(0xFF4B5563),
              fontWeight: FontWeight.w600,
            ),
            selectedColor: const Color(0xFF6C63FF),
            backgroundColor: Colors.white,
            side: BorderSide(
              color: selected ? Colors.transparent : const Color(0xFFE5E7EB),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTodayFocus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Today’s focus'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoRow(
                Icons.auto_awesome_rounded,
                'Healthy relationships feel calmer and safer than constant confusion.',
              ),
              const SizedBox(height: 12),
              _infoRow(
                Icons.record_voice_over_rounded,
                'Clear communication is more useful than guessing, overthinking, or testing.',
              ),
              const SizedBox(height: 12),
              _infoRow(
                Icons.shield_moon_rounded,
                'Boundaries protect connection; they do not weaken it.',
              ),
              const SizedBox(height: 12),
              _infoRow(
                Icons.psychology_alt_rounded,
                'Repeated patterns usually reveal more truth than occasional intensity.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMindsetCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Core insights'),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mindsetCards.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final item = mindsetCards[index];
              final isSelected = selectedInsightIndex == index;

              return GestureDetector(
                onTap: () => setState(() => selectedInsightIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 220,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF6C63FF)
                          : Colors.transparent,
                      width: 1.4,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: (item['color'] as Color).withOpacity(
                          0.12,
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: item['color'] as Color,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['title'] as String,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xFF1F2430),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          item['subtitle'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            height: 1.45,
                            color: const Color(0xFF667085),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInsightDetails() {
    final item = mindsetCards[selectedInsightIndex];
    final points = (item['points'] as List<String>);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('${item['title']} details'),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...points.map((e) => _bulletPoint(e)),
              const SizedBox(height: 12),
              _linkRow('Read article', item['blog'] as String),
              const SizedBox(height: 10),
              _linkRow('Watch videos', item['youtube'] as String),
              const SizedBox(height: 10),
              _linkRow('Google topic', item['google'] as String),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniChecklist() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Healthy basics'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _TagChip(label: 'Mutual respect'),
            _TagChip(label: 'Honest communication'),
            _TagChip(label: 'Consistency'),
            _TagChip(label: 'Emotional safety'),
            _TagChip(label: 'Accountability'),
            _TagChip(label: 'Shared effort'),
            _TagChip(label: 'Boundaries'),
            _TagChip(label: 'Trust'),
          ],
        ),
      ],
    );
  }

  Widget _buildMindsetSectionExpanded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('How people tend to process'),
        const SizedBox(height: 12),
        _buildExpandableSection(
          title: 'Practical mindset notes',
          icon: Icons.psychology_alt_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Some people become solution-focused during conflict and may skip emotional validation.',
            ),
            _AdvicePoint(
              text:
                  'Others naturally want emotional connection first, then practical solutions.',
            ),
            _AdvicePoint(
              text:
                  'Attachment style can shape whether someone becomes clingy, avoidant, calm, or inconsistent under stress.',
            ),
            _AdvicePoint(
              text:
                  'A strong relationship usually needs both empathy and clarity, not one without the other.',
            ),
            _AdvicePoint(
              text:
                  'People often repeat communication patterns learned in childhood, family life, or past relationships.',
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildExpandableSection(
          title: 'How to respond better',
          icon: Icons.chat_bubble_outline_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Ask: “Do you want comfort, clarity, or a solution right now?”',
            ),
            _AdvicePoint(text: 'Avoid assumptions based only on gender.'),
            _AdvicePoint(
              text:
                  'Pay attention to your partner’s actual habits, triggers, and needs.',
            ),
            _AdvicePoint(
              text: 'Name the issue without attacking the person’s character.',
            ),
            _AdvicePoint(
              text:
                  'If emotions are too high, pause and return when both people are calmer.',
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildExpandableSection(
          title: 'Pointwise notes on emotional processing',
          icon: Icons.fact_check_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Stress changes listening; a person may hear threat before they hear meaning.',
            ),
            _AdvicePoint(
              text:
                  'Validation lowers defensiveness faster than correcting every detail.',
            ),
            _AdvicePoint(
              text:
                  'People with avoidant tendencies may need space before deeper discussion.',
            ),
            _AdvicePoint(
              text:
                  'People with anxious tendencies may need reassurance before they can think clearly.',
            ),
            _AdvicePoint(
              text:
                  'Repeated criticism, contempt, defensiveness, and stonewalling can damage trust over time.',
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildResourceCluster(
          title: 'Trusted reading',
          items: trustedResources['Mindset & Attachment']!,
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Videos to explore',
          items: videoResources['Attachment']!,
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Communication videos',
          items: videoResources['Communication']!,
        ),
      ],
    );
  }

  Widget _buildSignalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Relationship signals'),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _signalCard(
                title: 'Red flags',
                color: const Color(0xFFE25555),
                icon: Icons.flag_rounded,
                items: redFlags,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _signalCard(
                title: 'Green flags',
                color: const Color(0xFF22A06B),
                icon: Icons.verified_rounded,
                items: greenFlags,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        _buildSectionTitle('Reading suggestions'),
        const SizedBox(height: 12),
        _buildTopicSelector(),
        const SizedBox(height: 12),
        ...bookTopics[selectedTopic]!.map(_bookTile),
        const SizedBox(height: 20),
        _buildResourceCluster(
          title: 'Blogs and trusted sites',
          items: trustedResources['General']!,
        ),
      ],
    );
  }

  Widget _buildToxicRecoverySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Come out of toxic relationships'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletPoint(
                'Take repeated disrespect, fear, control, contempt, and manipulation seriously.',
              ),
              _bulletPoint(
                'Do not judge the relationship only by apologies or rare good days; judge the pattern.',
              ),
              _bulletPoint(
                'Tell a trusted person what is happening, especially if isolation has started.',
              ),
              _bulletPoint(
                'Set boundaries clearly and observe whether the person respects them.',
              ),
              _bulletPoint(
                'If the relationship feels unsafe, plan your exit carefully and seek professional help.',
              ),
              _bulletPoint(
                'Healing often includes distance, support, routine, therapy, and rebuilding self-trust.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionTitle('Toxic signs to discover early'),
        const SizedBox(height: 12),
        _buildExpandableSection(
          title: 'Patterns that often harm emotional safety',
          icon: Icons.warning_amber_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Gaslighting: making you doubt your memory, feelings, or reality.',
            ),
            _AdvicePoint(
              text:
                  'Control: deciding what you wear, who you meet, or what you are allowed to do.',
            ),
            _AdvicePoint(
              text:
                  'Contempt: mocking, humiliating, shaming, or talking down to you.',
            ),
            _AdvicePoint(
              text:
                  'Isolation: pulling you away from friends, family, or support systems.',
            ),
            _AdvicePoint(
              text:
                  'Hot-cold intensity: affection followed by withdrawal, blame, or punishment.',
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildExpandableSection(
          title: 'Safer recovery steps',
          icon: Icons.health_and_safety_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Document patterns privately if you need clarity or support later.',
            ),
            _AdvicePoint(
              text:
                  'Reach out to a counselor, helpline, or trusted family member.',
            ),
            _AdvicePoint(
              text:
                  'Reduce opportunities for manipulation after ending the relationship.',
            ),
            _AdvicePoint(
              text:
                  'Focus on sleep, meals, routine, movement, and emotional grounding after separation.',
            ),
            _AdvicePoint(
              text:
                  'If there is any abuse or threat, use professional safety resources immediately.',
            ),
          ],
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Trusted toxic relationship resources',
          items: trustedResources['Toxic Relationship Help']!,
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Videos on toxic patterns',
          items: videoResources['Toxic Relationship']!,
        ),
        const SizedBox(height: 18),
        _buildSectionTitle('Books for healing and red flags'),
        const SizedBox(height: 12),
        ...bookTopics['Toxic Relationships']!.map(_bookTile),
      ],
    );
  }

  Widget _buildSelfDiscoverySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Self discovery'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletPoint(
                'Learn to separate your worth from whether someone chooses, praises, or validates you.',
              ),
              _bulletPoint(
                'Expectations hurt more when they stay unspoken and become silent demands.',
              ),
              _bulletPoint(
                'Peace grows when you focus on values, routine, and self-respect more than control.',
              ),
              _bulletPoint(
                'Boundaries and self-care help people regain a stable sense of self.',
              ),
              _bulletPoint(
                'A strong inner life makes love healthier because connection becomes a choice, not a rescue.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildExpandableSection(
          title: 'Living with fewer expectations',
          icon: Icons.spa_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Replace “They should know” with “I can express my needs clearly.”',
            ),
            _AdvicePoint(
              text:
                  'Replace over-attachment to outcomes with attention to your daily habits and values.',
            ),
            _AdvicePoint(
              text:
                  'Notice when fantasy, idealization, or future promises are replacing present reality.',
            ),
            _AdvicePoint(
              text:
                  'Build emotional independence: friends, hobbies, goals, study, work, and rest.',
            ),
            _AdvicePoint(
              text:
                  'Practice self-compassion instead of judging yourself for needing love or reassurance.',
            ),
          ],
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Self growth resources',
          items: [
            {
              'title': 'NIMH: Caring for Your Mental Health',
              'subtitle': 'Official self-care guidance',
              'url':
                  'https://www.nimh.nih.gov/health/topics/caring-for-your-mental-health',
            },
            {
              'title': 'Google: Self discovery emotional independence',
              'subtitle': 'Explore articles and practical guidance',
              'url':
                  'https://www.google.com/search?q=self+discovery+emotional+independence',
            },
            {
              'title': 'Google: Letting go of expectations in relationships',
              'subtitle': 'Search more reading and videos',
              'url':
                  'https://www.google.com/search?q=letting+go+of+expectations+in+relationships',
            },
            {
              'title': 'YouTube: Emotional independence',
              'subtitle': 'Search mindset and self-growth videos',
              'url':
                  'https://www.youtube.com/results?search_query=emotional+independence+self+growth',
            },
          ],
        ),
        const SizedBox(height: 18),
        _buildSectionTitle('Books for self discovery'),
        const SizedBox(height: 12),
        ...bookTopics['Self Discovery']!.map(_bookTile),
      ],
    );
  }

  Widget _buildGenderDifferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Men and women in relationships'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletPoint(
                'Research suggests average gender differences in emotional expression are real but usually small, and socialization matters a lot.',
              ),
              _bulletPoint(
                'Women, on average, are often more emotionally expressive, especially for sadness and relationship-focused emotions.',
              ),
              _bulletPoint(
                'Men, on average, may hide vulnerability more often or shift toward action, withdrawal, or problem-solving.',
              ),
              _bulletPoint(
                'These are tendencies, not rules; many men are highly expressive and many women are more reserved.',
              ),
              _bulletPoint(
                'Relationship conflict often grows when each partner assumes their own style is the “normal” one.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildExpandableSection(
          title: 'Common misunderstandings',
          icon: Icons.compare_arrows_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'A woman may seek emotional validation first, while a man may jump quickly to solutions; both can feel misunderstood.',
            ),
            _AdvicePoint(
              text:
                  'A man may need more time before discussing vulnerable feelings, while a woman may interpret delay as disinterest.',
            ),
            _AdvicePoint(
              text:
                  'One partner may expect “being understood without explanation,” while the other needs direct communication.',
            ),
            _AdvicePoint(
              text:
                  'The real goal is not proving who is right, but learning your partner’s emotional language.',
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildExpandableSection(
          title: 'Scientifically grounded notes',
          icon: Icons.science_rounded,
          children: const [
            _AdvicePoint(
              text:
                  'Attachment theory explains that secure, anxious, avoidant, and disorganized patterns influence closeness, reassurance needs, and conflict habits.',
            ),
            _AdvicePoint(
              text:
                  'Emotion-expression research suggests women often show greater emotional expressivity on average, especially for internalizing emotions.',
            ),
            _AdvicePoint(
              text:
                  'Men may be more shaped by norms discouraging visible vulnerability, which affects relationship communication.',
            ),
            _AdvicePoint(
              text:
                  'Good relationship understanding comes from observing your partner’s real behavior, not from stereotypes alone.',
            ),
          ],
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Research and reading links',
          items: trustedResources['Men & Women Differences']!,
        ),
        const SizedBox(height: 18),
        _buildResourceCluster(
          title: 'Videos on relationship differences',
          items: videoResources['Men & Women']!,
        ),
        const SizedBox(height: 18),
        _buildSectionTitle('Books for this topic'),
        const SizedBox(height: 12),
        ...bookTopics['Men & Women Differences']!.map(_bookTile),
      ],
    );
  }

  Widget _signalCard({
    required String title,
    required Color color,
    required IconData icon,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: const Color(0xFF1F2430),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items
              .take(7)
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle, size: 8, color: color),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          e,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: const Color(0xFF667085),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildTopicSelector() {
    return SizedBox(
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: bookTopics.keys.map((topic) {
          final selected = topic == selectedTopic;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilterChip(
              label: Text(topic),
              selected: selected,
              onSelected: (_) => setState(() => selectedTopic = topic),
              selectedColor: const Color(0xFFE9E7FF),
              checkmarkColor: const Color(0xFF6C63FF),
              labelStyle: TextStyle(
                color: selected
                    ? const Color(0xFF4C43D8)
                    : const Color(0xFF4B5563),
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFE5E7EB)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _bookTile(Map<String, String> book) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        leading: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: const Color(0xFFEAE8FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.menu_book_rounded, color: Color(0xFF6C63FF)),
        ),
        title: Text(
          book['title']!,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2430),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            book['subtitle']!,
            style: GoogleFonts.poppins(
              fontSize: 12.5,
              color: const Color(0xFF667085),
            ),
          ),
        ),
        trailing: const Icon(Icons.open_in_new_rounded, size: 20),
        onTap: () => openLink(book['url']!),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          leading: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAE8FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF6C63FF)),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2430),
            ),
          ),
          iconColor: const Color(0xFF6C63FF),
          collapsedIconColor: const Color(0xFF98A2B3),
          children: children,
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD0D5DD),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 20),
            _actionTile(
              icon: Icons.book_outlined,
              title: 'Open books',
              subtitle: 'See suggested reading by topic',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  builder: (_) => _buildResourcesSheet(),
                );
              },
            ),
            _actionTile(
              icon: Icons.psychology_outlined,
              title: 'Learn more',
              subtitle: 'Search relationship psychology topics',
              onTap: () => openLink(
                'https://www.google.com/search?q=relationship+psychology',
              ),
            ),
            _actionTile(
              icon: Icons.volunteer_activism_outlined,
              title: 'Healthy communication',
              subtitle: 'Explore communication advice',
              onTap: () => openLink(
                'https://www.google.com/search?q=healthy+relationship+communication',
              ),
            ),
            _actionTile(
              icon: Icons.warning_amber_outlined,
              title: 'Toxic relationship help',
              subtitle: 'Open trusted warning-sign resources',
              onTap: () => openLink('https://www.thehotline.org'),
            ),
            _actionTile(
              icon: Icons.self_improvement_outlined,
              title: 'Self discovery',
              subtitle: 'Search emotional independence topics',
              onTap: () => openLink(
                'https://www.google.com/search?q=emotional+independence+self+growth',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourcesSheet() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD0D5DD),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Recommended books',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2430),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Browse practical books, videos, and trusted links for different relationship stages.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 18),
              _buildTopicSelector(),
              const SizedBox(height: 14),
              ...bookTopics[selectedTopic]!.map(_bookTile),
              const SizedBox(height: 18),
              _buildSectionTitle('Videos'),
              const SizedBox(height: 12),
              ...videoResources.entries
                  .expand((entry) => entry.value)
                  .take(6)
                  .map(_resourceTile),
              const SizedBox(height: 18),
              _buildSectionTitle('Trusted websites'),
              const SizedBox(height: 12),
              ...trustedResources.entries
                  .expand((entry) => entry.value)
                  .take(8)
                  .map(_resourceTile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: const Color(0xFFEAE8FF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: const Color(0xFF6C63FF)),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F2430),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 12.5,
          color: const Color(0xFF667085),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    );
  }

  Widget _resourceTile(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        leading: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: const Color(0xFFEAE8FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.link_rounded, color: Color(0xFF6C63FF)),
        ),
        title: Text(
          item['title']!,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2430),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            item['subtitle']!,
            style: GoogleFonts.poppins(
              fontSize: 12.5,
              color: const Color(0xFF667085),
            ),
          ),
        ),
        trailing: const Icon(Icons.open_in_new_rounded, size: 20),
        onTap: () => openLink(item['url']!),
      ),
    );
  }

  Widget _buildResourceCluster({
    required String title,
    required List<Map<String, String>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        const SizedBox(height: 12),
        ...items.map(_resourceTile),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F2430),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFEAE8FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF6C63FF)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              height: 1.45,
              color: const Color(0xFF475467),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF6C63FF),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 13,
                height: 1.5,
                color: const Color(0xFF667085),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkRow(String title, String url) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => openLink(url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.open_in_new_rounded,
              size: 18,
              color: Color(0xFF6C63FF),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12.8,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF344054),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdvicePoint extends StatelessWidget {
  final String text;

  const _AdvicePoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF6C63FF),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 13,
                height: 1.5,
                color: const Color(0xFF667085),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF344054),
        ),
      ),
    );
  }
}
