// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ExerciseDetailPage extends StatelessWidget {
//   const ExerciseDetailPage({super.key});

//   /// Robust URL launcher with error feedback
//   Future<void> _handleOpenLink(BuildContext context, String url) async {
//     final Uri uri = Uri.parse(url);
//     try {
//       // mode: LaunchMode.externalApplication ensures it opens in YouTube app/Browser
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error opening link: $e'),
//             backgroundColor: Colors.redAccent,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // 1. Sleek Modern Header
//           SliverAppBar(
//             expandedHeight: 200.0,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text(
//                 "Mind & Body",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               background: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF43A047), Color(0xFF1B5E20)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Center(
//                   child: Icon(
//                     Icons.self_improvement,
//                     size: 80,
//                     color: Colors.white.withOpacity(0.3),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // 2. Content Sections
//           SliverPadding(
//             padding: const EdgeInsets.all(16.0),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 _buildSectionTitle("Daily Practices"),

//                 // Yoga Section
//                 _buildExpandableCard(
//                   context: context,
//                   title: "Yoga Benefits",
//                   icon: Icons.wb_sunny_outlined,
//                   accentColor: Colors.orange.shade700,
//                   content:
//                       "Improves flexibility, reduces stress, and enhances focus.",
//                   steps: [
//                     "Sit comfortably",
//                     "Focus on breathing",
//                     "Stretch gently",
//                   ],
//                   videoUrl: "https://www.youtube.com/watch?v=v7AYKMP6rOE",
//                 ),

//                 const SizedBox(height: 16),

//                 // Exercise Section
//                 _buildExpandableCard(
//                   context: context,
//                   title: "Physical Exercise",
//                   icon: Icons.fitness_center_rounded,
//                   accentColor: Colors.blue.shade700,
//                   content:
//                       "Boosts energy and significantly improves mental health.",
//                   steps: [
//                     "Running / Cardio",
//                     "Strength Training",
//                     "Consistency is key",
//                   ],
//                   videoUrl: "https://www.youtube.com/watch?v=ml6cT4AZdqI",
//                 ),

//                 const SizedBox(height: 16),

//                 // Meditation Section
//                 _buildExpandableCard(
//                   context: context,
//                   title: "Meditation",
//                   icon: Icons.spa_rounded,
//                   accentColor: Colors.teal.shade700,
//                   content:
//                       "Calms the mind, reduces anxiety, and improves sleep.",
//                   steps: [
//                     "Find a quiet space",
//                     "Sit quietly with eyes closed",
//                     "Focus on your natural breath",
//                   ],
//                   videoUrl: "https://www.youtube.com/watch?v=inpok4MKVLM",
//                 ),

//                 const SizedBox(height: 32),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // --- Reusable Component Widgets ---

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12.0),
//       child: Text(
//         title.toUpperCase(),
//         style: const TextStyle(
//           fontSize: 13,
//           letterSpacing: 1.5,
//           fontWeight: FontWeight.bold,
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }

//   Widget _buildExpandableCard({
//     required BuildContext context,
//     required String title,
//     required IconData icon,
//     required Color accentColor,
//     required String content,
//     required List<String> steps,
//     required String videoUrl,
//   }) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//         side: BorderSide(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               backgroundColor: accentColor.withOpacity(0.1),
//               child: Icon(icon, color: accentColor),
//             ),
//             title: Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(content, style: TextStyle(color: Colors.grey.shade700)),
//           ),
//           const Padding(
//             padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "GUIDE",
//                 style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           ...steps.map(
//             (step) => Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 4.0,
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.check_circle, size: 16, color: Colors.green),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(step, style: const TextStyle(fontSize: 14)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Interactive Action Area
//           InkWell(
//             onTap: () => _handleOpenLink(context, videoUrl),
//             borderRadius: const BorderRadius.vertical(
//               bottom: Radius.circular(20),
//             ),
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               decoration: BoxDecoration(
//                 color: accentColor.withOpacity(0.05),
//                 borderRadius: const BorderRadius.vertical(
//                   bottom: Radius.circular(20),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.play_circle_fill, color: accentColor, size: 20),
//                   const SizedBox(width: 8),
//                   Text(
//                     "Watch Video Tutorial",
//                     style: TextStyle(
//                       color: accentColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// --- Data Models ---

class ActivityStep {
  final String instruction;
  ActivityStep(this.instruction);
}

class ActivityItem {
  final String name;
  final String level;
  final String description;
  final String benefits;
  final List<ActivityStep> steps;
  final String videoUrl;
  final String guideUrl;

  ActivityItem({
    required this.name,
    required this.level,
    required this.description,
    required this.benefits,
    required this.steps,
    required this.videoUrl,
    required this.guideUrl,
  });
}

class CategoryData {
  final String title;
  final String benefits;
  final String consistencyTip;
  final List<ActivityItem> items;
  final Color themeColor;
  final IconData icon;

  CategoryData({
    required this.title,
    required this.benefits,
    required this.consistencyTip,
    required this.items,
    required this.themeColor,
    required this.icon,
  });
}

// --- MAIN PAGE ---

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryData> categories = [
      // 🧘 YOGA
      CategoryData(
        title: "Yoga",
        icon: Icons.wb_sunny_outlined,
        themeColor: Colors.orange.shade800,
        benefits: "Improves flexibility, posture, and mental peace.",
        consistencyTip: "Practice daily in the morning for best results.",
        items: [
          ActivityItem(
            name: "Surya Namaskar",
            level: "Beginner",
            description:
                "A complete 12-step yoga flow that energizes the entire body.",
            benefits:
                "Boosts blood circulation, improves flexibility, strengthens muscles, and increases energy levels.",
            steps: [
              ActivityStep(
                "1. Stand straight with feet together and palms in prayer position.",
              ),
              ActivityStep(
                "2. Inhale and raise arms overhead, gently arch backward.",
              ),
              ActivityStep("3. Exhale and bend forward, touching your feet."),
              ActivityStep(
                "4. Inhale and take your right leg back into a lunge.",
              ),
              ActivityStep("5. Hold breath and move into plank position."),
              ActivityStep(
                "6. Lower your body keeping elbows close (Ashtanga Namaskar).",
              ),
              ActivityStep("7. Inhale and lift chest into Cobra pose."),
              ActivityStep("8. Exhale and lift hips into downward dog."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=v7AYKMP6rOE",
            guideUrl: "https://www.google.com/search?q=surya+namaskar+steps",
          ),

          ActivityItem(
            name: "Vrikshasana (Tree Pose)",
            level: "Beginner",
            description: "A balancing pose that improves focus and stability.",
            benefits:
                "Enhances balance, strengthens legs, improves concentration and posture.",
            steps: [
              ActivityStep("1. Stand straight with feet together."),
              ActivityStep("2. Shift weight to one leg."),
              ActivityStep("3. Place the other foot on inner thigh."),
              ActivityStep("4. Join hands above your head."),
              ActivityStep("5. Hold balance and breathe slowly."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=wdln9qWYloU",
            guideUrl: "https://www.google.com/search?q=vrikshasana+steps",
          ),

          ActivityItem(
            name: "Bhujangasana (Cobra Pose)",
            level: "Beginner",
            description: "A gentle backbend that strengthens the spine.",
            benefits:
                "Improves spinal flexibility, relieves stress, and strengthens back muscles.",
            steps: [
              ActivityStep("1. Lie flat on your stomach."),
              ActivityStep("2. Place palms under shoulders."),
              ActivityStep("3. Inhale and lift chest upward."),
              ActivityStep("4. Keep elbows slightly bent."),
              ActivityStep("5. Hold for a few breaths and relax."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=75oG7uV0q9k",
            guideUrl: "https://www.google.com/search?q=bhujangasana+steps",
          ),

          ActivityItem(
            name: "Trikonasana",
            level: "Intermediate",
            description: "A stretching pose that improves body flexibility.",
            benefits:
                "Stretches legs and spine, improves digestion and posture.",
            steps: [
              ActivityStep("1. Stand with feet wide apart."),
              ActivityStep("2. Stretch arms sideways."),
              ActivityStep("3. Bend sideways towards one foot."),
              ActivityStep("4. Touch ankle or shin."),
              ActivityStep("5. Look upward and hold position."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=upFYlxZHif0",
            guideUrl: "https://www.google.com/search?q=trikonasana+steps",
          ),

          ActivityItem(
            name: "Paschimottanasana",
            level: "Expert",
            description: "A deep forward bend stretch for the entire body.",
            benefits:
                "Stretches spine, improves digestion, reduces stress and anxiety.",
            steps: [
              ActivityStep("1. Sit with legs extended straight."),
              ActivityStep("2. Inhale and raise arms."),
              ActivityStep("3. Exhale and bend forward slowly."),
              ActivityStep("4. Try to hold your feet."),
              ActivityStep("5. Stay in position and breathe deeply."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=T8sgVyF4Ux4",
            guideUrl: "https://www.google.com/search?q=paschimottanasana+steps",
          ),
        ],
      ),

      // 💪 PHYSICAL EXERCISE
      CategoryData(
        title: "Physical Exercise",
        icon: Icons.fitness_center,
        themeColor: Colors.blue.shade800,
        benefits: "Builds strength, stamina and improves heart health.",
        consistencyTip: "Train 3-5 times a week with rest days.",
        items: [
          ActivityItem(
            name: "Push-ups",
            level: "Beginner",
            description: "A basic strength exercise for upper body.",
            benefits:
                "Builds chest, shoulders, arms, and improves core strength.",
            steps: [
              ActivityStep("1. Start in plank position."),
              ActivityStep("2. Keep body straight."),
              ActivityStep("3. Lower your chest slowly."),
              ActivityStep("4. Push back up."),
              ActivityStep("5. Repeat for desired reps."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4",
            guideUrl: "https://www.google.com/search?q=push+ups+steps",
          ),

          ActivityItem(
            name: "Squats",
            level: "Beginner",
            description: "A lower body strength exercise.",
            benefits: "Strengthens legs, glutes, and improves mobility.",
            steps: [
              ActivityStep("1. Stand with feet shoulder-width apart."),
              ActivityStep("2. Lower hips like sitting."),
              ActivityStep("3. Keep chest up and back straight."),
              ActivityStep("4. Push through heels to stand."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=aclHkVaku9U",
            guideUrl: "https://www.google.com/search?q=squats+exercise+steps",
          ),

          ActivityItem(
            name: "Plank",
            level: "Intermediate",
            description: "Core strengthening isometric exercise.",
            benefits: "Builds core strength, improves posture and stability.",
            steps: [
              ActivityStep("1. Get into forearm plank position."),
              ActivityStep("2. Keep body in straight line."),
              ActivityStep("3. Tighten core muscles."),
              ActivityStep("4. Hold as long as possible."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=pSHjTRCQxIw",
            guideUrl: "https://www.google.com/search?q=plank+exercise+steps",
          ),

          ActivityItem(
            name: "Burpees",
            level: "Expert",
            description: "High-intensity full body workout.",
            benefits:
                "Improves stamina, burns calories, and builds full-body strength.",
            steps: [
              ActivityStep("1. Start standing."),
              ActivityStep("2. Squat down."),
              ActivityStep("3. Jump into plank."),
              ActivityStep("4. Perform a push-up."),
              ActivityStep("5. Jump back and explode upward."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=TU8QYVW0gDU",
            guideUrl: "https://www.google.com/search?q=burpees+exercise",
          ),

          ActivityItem(
            name: "Jump Rope",
            level: "Beginner",
            description: "A simple cardio workout.",
            benefits:
                "Improves heart health, coordination, and burns calories.",
            steps: [
              ActivityStep("1. Hold rope handles firmly."),
              ActivityStep("2. Swing rope over head."),
              ActivityStep("3. Jump lightly as rope passes."),
              ActivityStep("4. Maintain steady rhythm."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=1BZM2Vre5oc",
            guideUrl: "https://www.google.com/search?q=jump+rope+exercise",
          ),
        ],
      ),

      // 🧘‍♂️ MEDITATION
      CategoryData(
        title: "Meditation",
        icon: Icons.spa,
        themeColor: Colors.teal.shade800,
        benefits: "Reduces anxiety and improves focus.",
        consistencyTip: "Practice daily for 10–20 minutes.",
        items: [
          ActivityItem(
            name: "Mindfulness Meditation",
            level: "Beginner",
            description: "Focus on present moment awareness.",
            benefits: "Reduces stress, improves focus, and calms the mind.",
            steps: [
              ActivityStep("1. Sit comfortably."),
              ActivityStep("2. Close your eyes."),
              ActivityStep("3. Focus on your breath."),
              ActivityStep("4. Notice thoughts without reacting."),
              ActivityStep("5. Return focus to breathing."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=inpok4MKVLM",
            guideUrl: "https://www.google.com/search?q=mindfulness+meditation",
          ),

          ActivityItem(
            name: "Body Scan",
            level: "Beginner",
            description: "Relaxation through body awareness.",
            benefits: "Releases tension, improves sleep, reduces anxiety.",
            steps: [
              ActivityStep("1. Lie down comfortably."),
              ActivityStep("2. Close your eyes."),
              ActivityStep("3. Focus on each body part."),
              ActivityStep("4. Relax muscles gradually."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=15q-N-_kkrU",
            guideUrl: "https://www.google.com/search?q=body+scan+meditation",
          ),

          ActivityItem(
            name: "Loving Kindness",
            level: "Intermediate",
            description: "Meditation for emotional healing.",
            benefits: "Increases positivity, empathy, and emotional strength.",
            steps: [
              ActivityStep("1. Sit in a quiet place."),
              ActivityStep("2. Close your eyes."),
              ActivityStep("3. Repeat positive affirmations."),
              ActivityStep("4. Send love to yourself and others."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=sz7cpV7ERsM",
            guideUrl:
                "https://www.google.com/search?q=loving+kindness+meditation",
          ),

          ActivityItem(
            name: "Visualization",
            level: "Intermediate",
            description: "Mental imagery relaxation technique.",
            benefits:
                "Reduces stress, boosts creativity, improves mental clarity.",
            steps: [
              ActivityStep("1. Sit comfortably."),
              ActivityStep("2. Close eyes."),
              ActivityStep("3. Imagine peaceful place."),
              ActivityStep("4. Engage all senses."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=O-6f5wQXSu8",
            guideUrl:
                "https://www.google.com/search?q=visualization+meditation",
          ),

          ActivityItem(
            name: "Zen Meditation",
            level: "Expert",
            description: "Deep awareness and stillness practice.",
            benefits: "Improves discipline, awareness, and inner peace.",
            steps: [
              ActivityStep("1. Sit upright in silence."),
              ActivityStep("2. Focus on posture."),
              ActivityStep("3. Observe thoughts without judgment."),
              ActivityStep("4. Maintain stillness."),
            ],
            videoUrl: "https://www.youtube.com/watch?v=4pLUleLdwY4",
            guideUrl: "https://www.google.com/search?q=zen+meditation",
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _buildCategoryCard(context, categories[index]),
                childCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 AppBar
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Wellness Center",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B5E20), Color(0xFF43A047)],
            ),
          ),
          child: Icon(
            Icons.favorite,
            size: 80,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  // 🔹 Category Card
  Widget _buildCategoryCard(BuildContext context, CategoryData category) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _showCategoryDetails(context, category),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: category.themeColor.withOpacity(0.1),
                child: Icon(
                  category.icon,
                  color: category.themeColor,
                  size: 30,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      category.benefits,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Bottom Sheet
  void _showCategoryDetails(BuildContext context, CategoryData category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: category.items
              .map(
                (item) =>
                    _buildActivityCard(context, item, category.themeColor),
              )
              .toList(),
        ),
      ),
    );
  }

  // 🔹 Activity Card
  Widget _buildActivityCard(
    BuildContext context,
    ActivityItem item,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          // ✅ FIXED
          color: color.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ...item.steps.map((step) => Text("• ${step.instruction}")),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _buildButton(
                  context,
                  "Video",
                  item.videoUrl,
                  Colors.orange, // 🔥 Fixed
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildButton(
                  context,
                  "Guide",
                  item.guideUrl,
                  const Color(0xFF81C784), // 🌿 Faint green
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    String url,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () => _launchUrl(context, url),
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(text),
    );
  }

  // 🔹 Safe URL launcher (FIXED)
  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Could not open link")));
      }
    }
  }
}
