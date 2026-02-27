// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:url_launcher/url_launcher.dart';

// // // // // // // // class GuidePage extends StatelessWidget {
// // // // // // // //   const GuidePage({super.key});

// // // // // // // //   final List<Map<String, String>> faqs = const [
// // // // // // // //     {"q": "How to use Emergency Button?", "a": "Tap it whenever you feel unsafe or stressed to get immediate help."},
// // // // // // // //     {"q": "How to track mood and progress?", "a": "Use the Floating Mood Button and Self-Care/Exercise pages to log your daily mood and activities."},
// // // // // // // //     {"q": "How to follow the wellness plan?", "a": "Combine Self-Care, Exercise, and Healing activities daily for best results."},
// // // // // // // //   ];

// // // // // // // //   final List<Map<String, String>> resources = const [
// // // // // // // //     {"name": "WHO Mental Health", "link": "https://www.who.int/mental_health"},
// // // // // // // //     {"name": "NIMH USA", "link": "https://www.nimh.nih.gov"},
// // // // // // // //   ];

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(
// // // // // // // //         title: const Text("Guide"),
// // // // // // // //         backgroundColor: Colors.blueAccent,
// // // // // // // //       ),
// // // // // // // //       body: SingleChildScrollView(
// // // // // // // //         padding: const EdgeInsets.all(16),
// // // // // // // //         child: Column(
// // // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //           children: [
// // // // // // // //             const Text(
// // // // // // // //               "📖 How-To Guides",
// // // // // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 8),
// // // // // // // //             _buildGuideCard("Using the Emergency Button"),
// // // // // // // //             _buildGuideCard("Tracking Mood and Progress"),
// // // // // // // //             _buildGuideCard("Following Weekly Wellness Plans"),

// // // // // // // //             const SizedBox(height: 20),
// // // // // // // //             const Text(
// // // // // // // //               "🗓️ Weekly Wellness Plan",
// // // // // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 8),
// // // // // // // //             _buildGuideCard("Monday: Meditation + Self-Care"),
// // // // // // // //             _buildGuideCard("Tuesday: Exercise + Gratitude Journal"),
// // // // // // // //             _buildGuideCard("Wednesday: Mindfulness + Relaxing Music"),
// // // // // // // //             _buildGuideCard("Thursday: Self-Care + Mood Tracking"),
// // // // // // // //             _buildGuideCard("Friday: Yoga + Affirmations"),
// // // // // // // //             _buildGuideCard("Weekend: Mix activities & review progress"),

// // // // // // // //             const SizedBox(height: 20),
// // // // // // // //             const Text(
// // // // // // // //               "❓ FAQs",
// // // // // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 8),
// // // // // // // //             ...faqs.map((faq) => ExpansionTile(
// // // // // // // //                   title: Text(faq["q"]!),
// // // // // // // //                   children: [Padding(
// // // // // // // //                     padding: const EdgeInsets.all(8.0),
// // // // // // // //                     child: Text(faq["a"]!),
// // // // // // // //                   )],
// // // // // // // //                 )),

// // // // // // // //             const SizedBox(height: 20),
// // // // // // // //             const Text(
// // // // // // // //               "🔗 External Resources",
// // // // // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 8),
// // // // // // // //             ...resources.map((res) => ListTile(
// // // // // // // //                   leading: const Icon(Icons.link, color: Colors.blue),
// // // // // // // //                   title: Text(res["name"]!),
// // // // // // // //                   onTap: () async {
// // // // // // // //                     final uri = Uri.parse(res["link"]!);
// // // // // // // //                     if (await canLaunchUrl(uri)) {
// // // // // // // //                       await launchUrl(uri, mode: LaunchMode.externalApplication);
// // // // // // // //                     }
// // // // // // // //                   },
// // // // // // // //                 )),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   Widget _buildGuideCard(String text) {
// // // // // // // //     return Card(
// // // // // // // //       margin: const EdgeInsets.symmetric(vertical: 4),
// // // // // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // // // // //       color: Colors.blue.shade50,
// // // // // // // //       child: ListTile(
// // // // // // // //         title: Text(text),
// // // // // // // //         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// // // // // // // //         onTap: () {
// // // // // // // //           // Placeholder for future detail page
// // // // // // // //         },
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'dart:async';
// // // // // // // import 'dart:math' as math;
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:flutter/services.dart';

// // // // // // // const kPrimary = Color(0xFF9B5F4D);
// // // // // // // const kCard = Color(0xFFF6EEE3);
// // // // // // // const kBg = Color(0xFFFDF8F3);
// // // // // // // const kTextDark = Color(0xFF2E221E);
// // // // // // // const kTextSoft = Color(0xFF7A675F);
// // // // // // // const kBorder = Color(0xFFE6DBCF);
// // // // // // // const kMuted = Color(0xFFF2E7DA);
// // // // // // // const kSuccess = Color(0xFF7BA37B);

// // // // // // // void main() {
// // // // // // //   runApp(const WellnessApp());
// // // // // // // }

// // // // // // // class WellnessApp extends StatelessWidget {
// // // // // // //   const WellnessApp({super.key});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return MaterialApp(
// // // // // // //       title: 'Daily Wellness',
// // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // //       theme: ThemeData(
// // // // // // //         scaffoldBackgroundColor: kBg,
// // // // // // //         colorScheme: ColorScheme.fromSeed(
// // // // // // //           seedColor: kPrimary,
// // // // // // //           primary: kPrimary,
// // // // // // //           surface: kCard,
// // // // // // //         ),
// // // // // // //         useMaterial3: true,
// // // // // // //         fontFamily: 'sans-serif',
// // // // // // //       ),
// // // // // // //       home: const DailyWellnessPage(),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class DailyWellnessPage extends StatefulWidget {
// // // // // // //   const DailyWellnessPage({super.key});

// // // // // // //   @override
// // // // // // //   State<DailyWellnessPage> createState() => _DailyWellnessPageState();
// // // // // // // }

// // // // // // // class _DailyWellnessPageState extends State<DailyWellnessPage>
// // // // // // //     with TickerProviderStateMixin {
// // // // // // //   int streakDays = 3;
// // // // // // //   int totalMeditationMinutes = 27;
// // // // // // //   int sessionsCompleted = 6;
// // // // // // //   int waterIntake = 4;
// // // // // // //   int waterGoal = 8;

// // // // // // //   MoodType? selectedMood;
// // // // // // //   SessionLength selectedLength = SessionLength.three;
// // // // // // //   SessionGoal selectedGoal = SessionGoal.calm;

// // // // // // //   bool sessionStarted = false;
// // // // // // //   bool isBreathingPlaying = false;
// // // // // // //   String breathPhase = 'Inhale';
// // // // // // //   double breathingScale = 0.82;
// // // // // // //   Timer? breathingTimer;
// // // // // // //   int breathingSeconds = 0;

// // // // // // //   String? selectedMovement;
// // // // // // //   bool movementDone = false;
// // // // // // //   String? movementFeeling;

// // // // // // //   int selectedReflectionMood = 2;

// // // // // // //   final Map<String, bool> dailyChecklist = {
// // // // // // //     'Hydration': false,
// // // // // // //     'Exercise': false,
// // // // // // //     'Meditation': false,
// // // // // // //     'Reading': false,
// // // // // // //     'Sleep preparation': false,
// // // // // // //   };

// // // // // // //   late final AnimationController _moodPulseController;
// // // // // // //   late final AnimationController _playerGlowController;

// // // // // // //   final List<SpiritualCategory> spiritualCategories = [
// // // // // // //     SpiritualCategory(
// // // // // // //       title: 'God & Spiritual Wisdom',
// // // // // // //       emoji: '🕊️',
// // // // // // //       icon: Icons.auto_awesome_rounded,
// // // // // // //       items: [
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Bhagavad Gita',
// // // // // // //           subtitle: 'Duty, self-mastery, calm action, and spiritual clarity.',
// // // // // // //           takeaway:
// // // // // // //               'Take strength from Krishna’s guidance: do your duty with steadiness, not fear.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Google Play Books',
// // // // // // //               url:
// // // // // // //                   'https://play.google.com/store/books/details/Bhagavad_gita_As_It_Is?id=dSA3hsIq5dsC&hl=en_CA',
// // // // // // //             ),
// // // // // // //             LinkItem(
// // // // // // //               title: 'Google Books',
// // // // // // //               url:
// // // // // // //                   'https://books.google.com/books/about/Bhagavad_Gita.html?id=2WsnLilhMYkC',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Gita talks on YouTube',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Bhagavad+Gita+explained',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Ramayana',
// // // // // // //           subtitle:
// // // // // // //               'Values, devotion, courage, sacrifice, and righteous living.',
// // // // // // //           takeaway:
// // // // // // //               'Ramayana teaches how dignity and values remain strongest during hardship.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Valmiki Ramayana - Google Books',
// // // // // // //               url: 'https://books.google.cat/books?id=orU8DwAAQBAJ',
// // // // // // //             ),
// // // // // // //             LinkItem(
// // // // // // //               title: 'Ramayana reference',
// // // // // // //               url:
// // // // // // //                   'https://play.google.com/store/apps/details?id=udroidsa.valmikiramayana&hl=en_IN',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Ramayana stories on YouTube',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Ramayana+story+explained',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Holy Qur’an / Ramadan Reflections',
// // // // // // //           subtitle: 'Patience, gratitude, discipline, prayer, and mercy.',
// // // // // // //           takeaway:
// // // // // // //               'Ramadan-centered reflection helps build inner discipline, empathy, and peace.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'The Qur’an - Google Play Books',
// // // // // // //               url:
// // // // // // //                   'https://play.google.com/store/books/details/The_Qur_an?id=2LmsCiv8waEC&hl=en',
// // // // // // //             ),
// // // // // // //             LinkItem(
// // // // // // //               title: 'The Holy Qur’an - Google Books',
// // // // // // //               url:
// // // // // // //                   'https://books.google.com/books/about/The_Holy_Qur_an.html?id=VajhssX_uP4C',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Ramadan stories on YouTube',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Ramadan+stories+motivation',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ],
// // // // // // //     ),
// // // // // // //     SpiritualCategory(
// // // // // // //       title: 'History & Great Rulers',
// // // // // // //       emoji: '🏰',
// // // // // // //       icon: Icons.castle_rounded,
// // // // // // //       items: [
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Chhatrapati Shivaji Maharaj',
// // // // // // //           subtitle:
// // // // // // //               'Leadership, courage, strategy, self-respect, and people-first governance.',
// // // // // // //           takeaway:
// // // // // // //               'Take motivation from discipline, bravery, and protection of people with integrity.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Britannica biography',
// // // // // // //               url: 'https://www.britannica.com/biography/Shivaji',
// // // // // // //             ),
// // // // // // //             LinkItem(
// // // // // // //               title: 'Biography overview',
// // // // // // //               url:
// // // // // // //                   'https://www.vedantu.com/biography/chhatrapati-shivaji-maharaj-biography',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Shivaji Maharaj stories on YouTube',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Shivaji+Maharaj+story',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Mahabharata: Krishna & Karna',
// // // // // // //           subtitle:
// // // // // // //               'Choices, dharma, loyalty, pain, destiny, and inner conflict.',
// // // // // // //           takeaway:
// // // // // // //               'Mahabharata reminds us that character is shaped by what we choose under pressure.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Mahabharata books search',
// // // // // // //               url: 'https://books.google.com/books?q=Mahabharata+Krishna+Karna',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Krishna and Karna stories',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Krishna+Karna+story+Mahabharata',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ],
// // // // // // //     ),
// // // // // // //     SpiritualCategory(
// // // // // // //       title: 'Motivational Lives',
// // // // // // //       emoji: '🔥',
// // // // // // //       icon: Icons.workspace_premium_rounded,
// // // // // // //       items: [
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'Mahatma Gandhi - My Experiments with Truth',
// // // // // // //           subtitle:
// // // // // // //               'Truth, self-discipline, nonviolence, and moral courage in daily life.',
// // // // // // //           takeaway:
// // // // // // //               'Small honest actions repeated every day create powerful character.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Google Books search',
// // // // // // //               url: 'https://books.google.com/books?q=My+Experiments+with+Truth',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Audiobook on YouTube',
// // // // // // //               url: 'https://www.youtube.com/watch?v=izfu2Qxa7ZM',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'A.P.J. Abdul Kalam - Wings of Fire',
// // // // // // //           subtitle:
// // // // // // //               'Dreams, discipline, humility, science, and service to the nation.',
// // // // // // //           takeaway:
// // // // // // //               'Dreams become real when effort, values, and consistency work together.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Google Books',
// // // // // // //               url:
// // // // // // //                   'https://books.google.com/books/about/Wings_of_Fire.html?id=vg0D0AEACAAJ',
// // // // // // //             ),
// // // // // // //             LinkItem(
// // // // // // //               title: 'More book detail',
// // // // // // //               url:
// // // // // // //                   'https://books.google.co.in/books/about/Wings_of_Fire.html?id=c3qmIZtWUjAC',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Wings of Fire talks on YouTube',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Wings+of+Fire+APJ+Abdul+Kalam',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //         SpiritualContentItem(
// // // // // // //           title: 'श्यामची आई / Shyamchi Aai',
// // // // // // //           subtitle:
// // // // // // //               'Motherhood, values, simplicity, sacrifice, and emotional strength.',
// // // // // // //           takeaway:
// // // // // // //               'A good life is built from tenderness, gratitude, and disciplined values.',
// // // // // // //           bookLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Book search',
// // // // // // //               url: 'https://books.google.com/books?q=Shyamchi+Aai',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           videoLinks: [
// // // // // // //             LinkItem(
// // // // // // //               title: 'Stories and summaries',
// // // // // // //               url:
// // // // // // //                   'https://www.youtube.com/results?search_query=Shyamchi+Aai+story',
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ],
// // // // // // //     ),
// // // // // // //   ];

// // // // // // //   final List<GuidedTrack> guidedTracks = [
// // // // // // //     GuidedTrack(
// // // // // // //       title: 'Peaceful Music - Tropical Shores',
// // // // // // //       source: 'YouTube',
// // // // // // //       type: 'Relaxation Music',
// // // // // // //       duration: '24/7',
// // // // // // //       moodFit: MoodType.sad,
// // // // // // //       link: 'https://www.youtube.com/watch?v=dXIyMS61B68',
// // // // // // //     ),
// // // // // // //     GuidedTrack(
// // // // // // //       title: 'Calming Music for Stress Relief',
// // // // // // //       source: 'YouTube',
// // // // // // //       type: 'Meditation / Sleep',
// // // // // // //       duration: '3h+',
// // // // // // //       moodFit: MoodType.neutral,
// // // // // // //       link: 'https://www.youtube.com/watch?v=lFcSrYw-ARY',
// // // // // // //     ),
// // // // // // //     GuidedTrack(
// // // // // // //       title: 'Deep Sleep Music - Flying',
// // // // // // //       source: 'YouTube',
// // // // // // //       type: 'Sleep / Relaxation',
// // // // // // //       duration: '3h+',
// // // // // // //       moodFit: MoodType.happy,
// // // // // // //       link: 'https://www.youtube.com/watch?v=1ZYbU82GVz4',
// // // // // // //     ),
// // // // // // //   ];

// // // // // // //   final List<SimpleContentCard> natureTools = [
// // // // // // //     SimpleContentCard(
// // // // // // //       title: 'Ocean Waves',
// // // // // // //       subtitle: 'For calming racing thoughts and slowing breath.',
// // // // // // //       icon: Icons.waves_rounded,
// // // // // // //       link:
// // // // // // //           'https://www.youtube.com/results?search_query=ocean+waves+relaxing+sound',
// // // // // // //     ),
// // // // // // //     SimpleContentCard(
// // // // // // //       title: 'Rain Sounds',
// // // // // // //       subtitle: 'Great for study, sleep, and evening calm.',
// // // // // // //       icon: Icons.umbrella_rounded,
// // // // // // //       link: 'https://www.youtube.com/results?search_query=rain+sounds+sleep',
// // // // // // //     ),
// // // // // // //     SimpleContentCard(
// // // // // // //       title: 'Forest Ambience',
// // // // // // //       subtitle: 'Soft birds, leaves, and nature space.',
// // // // // // //       icon: Icons.park_rounded,
// // // // // // //       link:
// // // // // // //           'https://www.youtube.com/results?search_query=forest+ambience+relaxing',
// // // // // // //     ),
// // // // // // //     SimpleContentCard(
// // // // // // //       title: 'White Noise',
// // // // // // //       subtitle: 'Helpful when you need focus and less distraction.',
// // // // // // //       icon: Icons.graphic_eq_rounded,
// // // // // // //       link: 'https://www.youtube.com/results?search_query=white+noise+focus',
// // // // // // //     ),
// // // // // // //   ];

// // // // // // //   final List<String> movementOptions = [
// // // // // // //     'Yoga',
// // // // // // //     'Stretching',
// // // // // // //     'Light Workout',
// // // // // // //     'Mindful Walking',
// // // // // // //   ];

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _moodPulseController = AnimationController(
// // // // // // //       vsync: this,
// // // // // // //       duration: const Duration(milliseconds: 900),
// // // // // // //     );
// // // // // // //     _playerGlowController = AnimationController(
// // // // // // //       vsync: this,
// // // // // // //       duration: const Duration(milliseconds: 1800),
// // // // // // //     )..repeat(reverse: true);
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     breathingTimer?.cancel();
// // // // // // //     _moodPulseController.dispose();
// // // // // // //     _playerGlowController.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   int get totalTasks {
// // // // // // //     return dailyChecklist.length + 4;
// // // // // // //   }

// // // // // // //   int get completedTasks {
// // // // // // //     final checklistCount = dailyChecklist.values.where((e) => e).length;
// // // // // // //     final base = [
// // // // // // //       selectedMood != null,
// // // // // // //       sessionStarted,
// // // // // // //       movementDone,
// // // // // // //       waterIntake >= waterGoal,
// // // // // // //     ].where((e) => e).length;
// // // // // // //     return checklistCount + base;
// // // // // // //   }

// // // // // // //   double get progressValue {
// // // // // // //     return completedTasks / totalTasks;
// // // // // // //   }

// // // // // // //   int get progressPercent {
// // // // // // //     return (progressValue * 100).round();
// // // // // // //   }

// // // // // // //   List<GuidedTrack> get personalizedTracks {
// // // // // // //     if (selectedMood == null) return guidedTracks;
// // // // // // //     return guidedTracks
// // // // // // //         .where((e) => e.moodFit == selectedMood)
// // // // // // //         .followedBy(guidedTracks.where((e) => e.moodFit != selectedMood))
// // // // // // //         .toList();
// // // // // // //   }

// // // // // // //   String get motivationalMessage {
// // // // // // //     if (selectedMood == MoodType.sad) {
// // // // // // //       return 'Take it slow today. Gentle breathing and spiritual reading may help you feel lighter.';
// // // // // // //     }
// // // // // // //     if (selectedMood == MoodType.neutral) {
// // // // // // //       return 'A calm, focused session can turn an average day into a meaningful one.';
// // // // // // //     }
// // // // // // //     if (selectedMood == MoodType.happy) {
// // // // // // //       return 'You already have good energy today. Protect it with mindful routines and gratitude.';
// // // // // // //     }
// // // // // // //     return 'Start with one intentional action. Calm grows from small, repeatable moments.';
// // // // // // //   }

// // // // // // //   String get sleepSuggestion {
// // // // // // //     switch (selectedGoal) {
// // // // // // //       case SessionGoal.sleep:
// // // // // // //         return 'Tonight’s support: calming music, reduced screen time, and a bedtime reflection.';
// // // // // // //       case SessionGoal.focus:
// // // // // // //         return 'Pair focus audio with white noise and one short breathing session before study.';
// // // // // // //       case SessionGoal.calm:
// // // // // // //         return 'Choose slow breathing, soft music, and a short spiritual reflection to reset.';
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void startBreathingSession() {
// // // // // // //     setState(() {
// // // // // // //       sessionStarted = true;
// // // // // // //       isBreathingPlaying = true;
// // // // // // //       breathingSeconds = 0;
// // // // // // //     });
// // // // // // //     _runBreathingCycle();
// // // // // // //   }

// // // // // // //   void pauseBreathingSession() {
// // // // // // //     breathingTimer?.cancel();
// // // // // // //     setState(() {
// // // // // // //       isBreathingPlaying = false;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void resumeBreathingSession() {
// // // // // // //     setState(() {
// // // // // // //       isBreathingPlaying = true;
// // // // // // //     });
// // // // // // //     _runBreathingCycle();
// // // // // // //   }

// // // // // // //   void _runBreathingCycle() {
// // // // // // //     breathingTimer?.cancel();
// // // // // // //     int phaseStep = 0;
// // // // // // //     const phases = ['Inhale', 'Hold', 'Exhale'];
// // // // // // //     const durations = [4, 2, 4];

// // // // // // //     void applyPhase() {
// // // // // // //       if (!mounted || !isBreathingPlaying) return;
// // // // // // //       final phase = phases[phaseStep % phases.length];
// // // // // // //       setState(() {
// // // // // // //         breathPhase = phase;
// // // // // // //         breathingScale = phase == 'Inhale'
// // // // // // //             ? 1.10
// // // // // // //             : phase == 'Hold'
// // // // // // //             ? 1.10
// // // // // // //             : 0.78;
// // // // // // //       });

// // // // // // //       Future.delayed(
// // // // // // //         Duration(seconds: durations[phaseStep % phases.length]),
// // // // // // //         () {
// // // // // // //           if (!mounted || !isBreathingPlaying) return;
// // // // // // //           phaseStep++;
// // // // // // //           applyPhase();
// // // // // // //         },
// // // // // // //       );
// // // // // // //     }

// // // // // // //     applyPhase();

// // // // // // //     breathingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // // // // // //       if (!mounted || !isBreathingPlaying) return;
// // // // // // //       setState(() {
// // // // // // //         breathingSeconds++;
// // // // // // //       });
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void completeCurrentSession() {
// // // // // // //     HapticFeedback.lightImpact();
// // // // // // //     breathingTimer?.cancel();
// // // // // // //     setState(() {
// // // // // // //       isBreathingPlaying = false;
// // // // // // //       sessionStarted = false;
// // // // // // //       totalMeditationMinutes += selectedLength.minutes;
// // // // // // //       sessionsCompleted += 1;
// // // // // // //       dailyChecklist['Meditation'] = true;
// // // // // // //       streakDays += 1;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void toggleChecklist(String key) {
// // // // // // //     setState(() {
// // // // // // //       dailyChecklist[key] = !(dailyChecklist[key] ?? false);
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void updateWater(int delta) {
// // // // // // //     setState(() {
// // // // // // //       waterIntake = (waterIntake + delta).clamp(0, waterGoal);
// // // // // // //       if (waterIntake >= waterGoal) {
// // // // // // //         dailyChecklist['Hydration'] = true;
// // // // // // //       }
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void selectMovement(String movement) {
// // // // // // //     setState(() {
// // // // // // //       selectedMovement = movement;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void markMovementDone(bool value) {
// // // // // // //     setState(() {
// // // // // // //       movementDone = value;
// // // // // // //       dailyChecklist['Exercise'] = value;
// // // // // // //       if (!value) movementFeeling = null;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   Widget _buildHeader() {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
// // // // // // //       decoration: const BoxDecoration(
// // // // // // //         color: kPrimary,
// // // // // // //         borderRadius: BorderRadius.only(
// // // // // // //           topLeft: Radius.circular(24),
// // // // // // //           topRight: Radius.circular(24),
// // // // // // //           bottomLeft: Radius.circular(28),
// // // // // // //           bottomRight: Radius.circular(28),
// // // // // // //         ),
// // // // // // //         boxShadow: [
// // // // // // //           BoxShadow(
// // // // // // //             color: Color(0x22150F0B),
// // // // // // //             blurRadius: 24,
// // // // // // //             offset: Offset(0, 10),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       child: Row(
// // // // // // //         children: [
// // // // // // //           Expanded(
// // // // // // //             child: Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: const [
// // // // // // //                 Text(
// // // // // // //                   'Good Morning, Sakshi ☀️',
// // // // // // //                   style: TextStyle(
// // // // // // //                     color: Colors.white,
// // // // // // //                     fontSize: 25,
// // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 SizedBox(height: 8),
// // // // // // //                 Text(
// // // // // // //                   'Simple, useful wellness for today',
// // // // // // //                   style: TextStyle(
// // // // // // //                     color: Color(0xFFF9F1EA),
// // // // // // //                     fontSize: 14,
// // // // // // //                     fontWeight: FontWeight.w500,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Container(
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// // // // // // //             decoration: BoxDecoration(
// // // // // // //               color: Colors.white.withOpacity(0.14),
// // // // // // //               borderRadius: BorderRadius.circular(18),
// // // // // // //             ),
// // // // // // //             child: Column(
// // // // // // //               children: [
// // // // // // //                 const Icon(
// // // // // // //                   Icons.local_fire_department_rounded,
// // // // // // //                   color: Colors.white,
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 6),
// // // // // // //                 Text(
// // // // // // //                   '$streakDays Day Streak',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: Colors.white,
// // // // // // //                     fontWeight: FontWeight.w700,
// // // // // // //                     fontSize: 12.5,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildProgressCard() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Today’s Progress',
// // // // // // //             icon: Icons.insights_rounded,
// // // // // // //             emoji: '📊',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   '$completedTasks/$totalTasks wellness goals done',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w700,
// // // // // // //                     fontSize: 15,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Container(
// // // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // // //                   horizontal: 12,
// // // // // // //                   vertical: 8,
// // // // // // //                 ),
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: kPrimary.withOpacity(0.1),
// // // // // // //                   borderRadius: BorderRadius.circular(14),
// // // // // // //                 ),
// // // // // // //                 child: Text(
// // // // // // //                   '$progressPercent%',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kPrimary,
// // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           ClipRRect(
// // // // // // //             borderRadius: BorderRadius.circular(14),
// // // // // // //             child: LinearProgressIndicator(
// // // // // // //               value: progressValue,
// // // // // // //               minHeight: 12,
// // // // // // //               backgroundColor: const Color(0xFFE7D7C9),
// // // // // // //               color: kPrimary,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           Text(
// // // // // // //             motivationalMessage,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               height: 1.5,
// // // // // // //               fontSize: 13.5,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildMoodStartSection() {
// // // // // // //     final moods = [
// // // // // // //       MoodButtonData(
// // // // // // //         label: 'Low',
// // // // // // //         emoji: '😞',
// // // // // // //         value: MoodType.sad,
// // // // // // //         subtitle: 'Need comfort',
// // // // // // //       ),
// // // // // // //       MoodButtonData(
// // // // // // //         label: 'Okay',
// // // // // // //         emoji: '😐',
// // // // // // //         value: MoodType.neutral,
// // // // // // //         subtitle: 'Need reset',
// // // // // // //       ),
// // // // // // //       MoodButtonData(
// // // // // // //         label: 'Good',
// // // // // // //         emoji: '😊',
// // // // // // //         value: MoodType.happy,
// // // // // // //         subtitle: 'Keep balance',
// // // // // // //       ),
// // // // // // //     ];

// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Simple Start',
// // // // // // //             icon: Icons.favorite_border_rounded,
// // // // // // //             emoji: '🎯',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           const Text(
// // // // // // //             'How do you feel?',
// // // // // // //             style: TextStyle(
// // // // // // //               fontSize: 20,
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w800,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           Row(
// // // // // // //             children: moods.map((mood) {
// // // // // // //               final selected = selectedMood == mood.value;
// // // // // // //               return Expanded(
// // // // // // //                 child: Padding(
// // // // // // //                   padding: EdgeInsets.only(right: mood == moods.last ? 0 : 10),
// // // // // // //                   child: GestureDetector(
// // // // // // //                     onTap: () {
// // // // // // //                       HapticFeedback.selectionClick();
// // // // // // //                       _moodPulseController.forward(from: 0);
// // // // // // //                       setState(() {
// // // // // // //                         selectedMood = mood.value;
// // // // // // //                       });
// // // // // // //                     },
// // // // // // //                     child: AnimatedContainer(
// // // // // // //                       duration: const Duration(milliseconds: 260),
// // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // //                         horizontal: 12,
// // // // // // //                         vertical: 14,
// // // // // // //                       ),
// // // // // // //                       decoration: BoxDecoration(
// // // // // // //                         color: selected ? kPrimary : Colors.white,
// // // // // // //                         borderRadius: BorderRadius.circular(18),
// // // // // // //                         border: Border.all(
// // // // // // //                           color: selected ? kPrimary : kBorder,
// // // // // // //                         ),
// // // // // // //                         boxShadow: selected
// // // // // // //                             ? [
// // // // // // //                                 BoxShadow(
// // // // // // //                                   color: kPrimary.withOpacity(0.18),
// // // // // // //                                   blurRadius: 20,
// // // // // // //                                   offset: const Offset(0, 8),
// // // // // // //                                 ),
// // // // // // //                               ]
// // // // // // //                             : const [
// // // // // // //                                 BoxShadow(
// // // // // // //                                   color: Color(0x0A000000),
// // // // // // //                                   blurRadius: 10,
// // // // // // //                                   offset: Offset(0, 4),
// // // // // // //                                 ),
// // // // // // //                               ],
// // // // // // //                       ),
// // // // // // //                       child: Column(
// // // // // // //                         children: [
// // // // // // //                           Text(
// // // // // // //                             mood.emoji,
// // // // // // //                             style: const TextStyle(fontSize: 28),
// // // // // // //                           ),
// // // // // // //                           const SizedBox(height: 8),
// // // // // // //                           Text(
// // // // // // //                             mood.label,
// // // // // // //                             style: TextStyle(
// // // // // // //                               color: selected ? Colors.white : kTextDark,
// // // // // // //                               fontWeight: FontWeight.w800,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                           const SizedBox(height: 4),
// // // // // // //                           Text(
// // // // // // //                             mood.subtitle,
// // // // // // //                             textAlign: TextAlign.center,
// // // // // // //                             style: TextStyle(
// // // // // // //                               color: selected
// // // // // // //                                   ? Colors.white.withOpacity(0.9)
// // // // // // //                                   : kTextSoft,
// // // // // // //                               fontSize: 12,
// // // // // // //                               fontWeight: FontWeight.w500,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               );
// // // // // // //             }).toList(),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildSessionSelection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Session Selection',
// // // // // // //             icon: Icons.tune_rounded,
// // // // // // //             emoji: '🕯️',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           const Text(
// // // // // // //             'Choose time',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w700,
// // // // // // //               fontSize: 14.5,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           Wrap(
// // // // // // //             spacing: 10,
// // // // // // //             runSpacing: 10,
// // // // // // //             children: SessionLength.values.map((length) {
// // // // // // //               final selected = selectedLength == length;
// // // // // // //               return ChoiceChip(
// // // // // // //                 label: Text('${length.minutes} min'),
// // // // // // //                 selected: selected,
// // // // // // //                 onSelected: (_) {
// // // // // // //                   setState(() {
// // // // // // //                     selectedLength = length;
// // // // // // //                   });
// // // // // // //                 },
// // // // // // //                 selectedColor: kPrimary.withOpacity(0.14),
// // // // // // //                 backgroundColor: Colors.white,
// // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // //                   borderRadius: BorderRadius.circular(14),
// // // // // // //                   side: BorderSide(color: selected ? kPrimary : kBorder),
// // // // // // //                 ),
// // // // // // //                 labelStyle: TextStyle(
// // // // // // //                   color: selected ? kPrimary : kTextDark,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                 ),
// // // // // // //               );
// // // // // // //             }).toList(),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           const Text(
// // // // // // //             'Choose goal',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w700,
// // // // // // //               fontSize: 14.5,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           Wrap(
// // // // // // //             spacing: 10,
// // // // // // //             runSpacing: 10,
// // // // // // //             children: SessionGoal.values.map((goal) {
// // // // // // //               final selected = selectedGoal == goal;
// // // // // // //               return ChoiceChip(
// // // // // // //                 label: Text(goal.label),
// // // // // // //                 selected: selected,
// // // // // // //                 onSelected: (_) {
// // // // // // //                   setState(() {
// // // // // // //                     selectedGoal = goal;
// // // // // // //                   });
// // // // // // //                 },
// // // // // // //                 selectedColor: kPrimary,
// // // // // // //                 backgroundColor: Colors.white,
// // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // //                   borderRadius: BorderRadius.circular(14),
// // // // // // //                   side: BorderSide(color: selected ? kPrimary : kBorder),
// // // // // // //                 ),
// // // // // // //                 labelStyle: TextStyle(
// // // // // // //                   color: selected ? Colors.white : kTextDark,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                 ),
// // // // // // //               );
// // // // // // //             }).toList(),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           AnimatedContainer(
// // // // // // //             duration: const Duration(milliseconds: 250),
// // // // // // //             padding: const EdgeInsets.all(14),
// // // // // // //             decoration: BoxDecoration(
// // // // // // //               color: const Color(0xFFFFFBF7),
// // // // // // //               borderRadius: BorderRadius.circular(16),
// // // // // // //               border: Border.all(color: kBorder),
// // // // // // //             ),
// // // // // // //             child: Text(
// // // // // // //               sleepSuggestion,
// // // // // // //               style: const TextStyle(
// // // // // // //                 color: kTextSoft,
// // // // // // //                 height: 1.5,
// // // // // // //                 fontSize: 13.5,
// // // // // // //                 fontWeight: FontWeight.w600,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildPlayerScreen() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.all(16),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           gradient: LinearGradient(
// // // // // // //             colors: [
// // // // // // //               const Color(0xFFF0E1D3),
// // // // // // //               const Color(0xFFE4D4C2),
// // // // // // //               kPrimary.withOpacity(0.35),
// // // // // // //             ],
// // // // // // //             begin: Alignment.topLeft,
// // // // // // //             end: Alignment.bottomRight,
// // // // // // //           ),
// // // // // // //           borderRadius: BorderRadius.circular(24),
// // // // // // //         ),
// // // // // // //         child: Column(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //           children: [
// // // // // // //             const SectionTitle(
// // // // // // //               title: 'Player Screen',
// // // // // // //               icon: Icons.headphones_rounded,
// // // // // // //               emoji: '🎧',
// // // // // // //               lightText: true,
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 10),
// // // // // // //             Text(
// // // // // // //               '${selectedGoal.label} • ${selectedLength.minutes} min',
// // // // // // //               style: const TextStyle(
// // // // // // //                 color: Colors.white,
// // // // // // //                 fontWeight: FontWeight.w700,
// // // // // // //                 fontSize: 15,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 22),
// // // // // // //             Center(
// // // // // // //               child: AnimatedBuilder(
// // // // // // //                 animation: _playerGlowController,
// // // // // // //                 builder: (context, child) {
// // // // // // //                   final glow = 20 + (_playerGlowController.value * 18);
// // // // // // //                   return Container(
// // // // // // //                     width: 170,
// // // // // // //                     height: 170,
// // // // // // //                     decoration: BoxDecoration(
// // // // // // //                       shape: BoxShape.circle,
// // // // // // //                       boxShadow: [
// // // // // // //                         BoxShadow(
// // // // // // //                           color: Colors.white.withOpacity(0.18),
// // // // // // //                           blurRadius: glow,
// // // // // // //                           spreadRadius: 1,
// // // // // // //                         ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                     child: child,
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //                 child: Material(
// // // // // // //                   color: Colors.white.withOpacity(0.18),
// // // // // // //                   shape: const CircleBorder(),
// // // // // // //                   child: InkWell(
// // // // // // //                     customBorder: const CircleBorder(),
// // // // // // //                     onTap: () {
// // // // // // //                       HapticFeedback.mediumImpact();
// // // // // // //                       if (!sessionStarted) {
// // // // // // //                         startBreathingSession();
// // // // // // //                       } else if (isBreathingPlaying) {
// // // // // // //                         pauseBreathingSession();
// // // // // // //                       } else {
// // // // // // //                         resumeBreathingSession();
// // // // // // //                       }
// // // // // // //                     },
// // // // // // //                     child: Container(
// // // // // // //                       width: 170,
// // // // // // //                       height: 170,
// // // // // // //                       decoration: BoxDecoration(
// // // // // // //                         shape: BoxShape.circle,
// // // // // // //                         border: Border.all(
// // // // // // //                           color: Colors.white.withOpacity(0.24),
// // // // // // //                           width: 1.5,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       child: Icon(
// // // // // // //                         !sessionStarted
// // // // // // //                             ? Icons.play_arrow_rounded
// // // // // // //                             : isBreathingPlaying
// // // // // // //                             ? Icons.pause_rounded
// // // // // // //                             : Icons.play_arrow_rounded,
// // // // // // //                         color: Colors.white,
// // // // // // //                         size: 72,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             Center(
// // // // // // //               child: Text(
// // // // // // //                 !sessionStarted
// // // // // // //                     ? 'Tap to begin your guided moment'
// // // // // // //                     : isBreathingPlaying
// // // // // // //                     ? 'Playing... breathe slowly'
// // // // // // //                     : 'Paused',
// // // // // // //                 style: const TextStyle(
// // // // // // //                   color: Colors.white,
// // // // // // //                   fontWeight: FontWeight.w600,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             if (sessionStarted) ...[
// // // // // // //               const SizedBox(height: 14),
// // // // // // //               Center(
// // // // // // //                 child: OutlinedButton.icon(
// // // // // // //                   onPressed: completeCurrentSession,
// // // // // // //                   style: OutlinedButton.styleFrom(
// // // // // // //                     foregroundColor: Colors.white,
// // // // // // //                     side: BorderSide(color: Colors.white.withOpacity(0.55)),
// // // // // // //                     padding: const EdgeInsets.symmetric(
// // // // // // //                       horizontal: 18,
// // // // // // //                       vertical: 12,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   icon: const Icon(Icons.check_circle_outline_rounded),
// // // // // // //                   label: const Text('Complete Session'),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildBreathingSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Breathing Animation',
// // // // // // //             icon: Icons.air_rounded,
// // // // // // //             emoji: '🌬️',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           const Text(
// // // // // // //             'Inhale • Hold • Exhale',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w800,
// // // // // // //               fontSize: 18,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 6),
// // // // // // //           const Text(
// // // // // // //             'This is the core calming interaction. Start the player to activate it.',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               fontSize: 13.5,
// // // // // // //               height: 1.5,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 20),
// // // // // // //           Center(
// // // // // // //             child: AnimatedContainer(
// // // // // // //               duration: const Duration(milliseconds: 1800),
// // // // // // //               curve: Curves.easeInOut,
// // // // // // //               width: 220 * breathingScale,
// // // // // // //               height: 220 * breathingScale,
// // // // // // //               decoration: BoxDecoration(
// // // // // // //                 shape: BoxShape.circle,
// // // // // // //                 gradient: RadialGradient(
// // // // // // //                   colors: [
// // // // // // //                     kPrimary.withOpacity(0.82),
// // // // // // //                     kPrimary.withOpacity(0.44),
// // // // // // //                     const Color(0xFFD9B39B).withOpacity(0.22),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //                 boxShadow: [
// // // // // // //                   BoxShadow(
// // // // // // //                     color: kPrimary.withOpacity(0.18),
// // // // // // //                     blurRadius: 28,
// // // // // // //                     spreadRadius: 10,
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //               child: Center(
// // // // // // //                 child: AnimatedSwitcher(
// // // // // // //                   duration: const Duration(milliseconds: 350),
// // // // // // //                   child: Text(
// // // // // // //                     breathPhase,
// // // // // // //                     key: ValueKey(breathPhase),
// // // // // // //                     style: const TextStyle(
// // // // // // //                       color: Colors.white,
// // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // //                       fontSize: 26,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           Center(
// // // // // // //             child: Text(
// // // // // // //               'Elapsed: ${_formatTime(breathingSeconds)}',
// // // // // // //               style: const TextStyle(
// // // // // // //                 color: kTextSoft,
// // // // // // //                 fontWeight: FontWeight.w700,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildMovementSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Exercise / Movement',
// // // // // // //             icon: Icons.self_improvement_rounded,
// // // // // // //             emoji: '🏃',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           Wrap(
// // // // // // //             spacing: 10,
// // // // // // //             runSpacing: 10,
// // // // // // //             children: movementOptions.map((option) {
// // // // // // //               final selected = selectedMovement == option;
// // // // // // //               return ChoiceChip(
// // // // // // //                 label: Text(option),
// // // // // // //                 selected: selected,
// // // // // // //                 onSelected: (_) => selectMovement(option),
// // // // // // //                 selectedColor: kPrimary,
// // // // // // //                 backgroundColor: Colors.white,
// // // // // // //                 labelStyle: TextStyle(
// // // // // // //                   color: selected ? Colors.white : kTextDark,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                 ),
// // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // //                   borderRadius: BorderRadius.circular(14),
// // // // // // //                   side: BorderSide(color: selected ? kPrimary : kBorder),
// // // // // // //                 ),
// // // // // // //               );
// // // // // // //             }).toList(),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           CustomCheckboxTile(
// // // // // // //             title: selectedMovement ?? 'Mark movement complete',
// // // // // // //             subtitle: selectedMovement == null
// // // // // // //                 ? 'Choose yoga, stretching, walking, or a light workout.'
// // // // // // //                 : 'A little movement helps regulate energy and mood.',
// // // // // // //             value: movementDone,
// // // // // // //             onChanged: (v) => markMovementDone(v),
// // // // // // //           ),
// // // // // // //           AnimatedSwitcher(
// // // // // // //             duration: const Duration(milliseconds: 280),
// // // // // // //             child: movementDone
// // // // // // //                 ? Padding(
// // // // // // //                     key: const ValueKey('movementFeeling'),
// // // // // // //                     padding: const EdgeInsets.only(top: 14),
// // // // // // //                     child: Row(
// // // // // // //                       children: [
// // // // // // //                         Expanded(child: _feelChip('😊 Better', 'better')),
// // // // // // //                         const SizedBox(width: 10),
// // // // // // //                         Expanded(child: _feelChip('😐 Same', 'same')),
// // // // // // //                         const SizedBox(width: 10),
// // // // // // //                         Expanded(child: _feelChip('😞 Tired', 'tired')),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                   )
// // // // // // //                 : const SizedBox.shrink(),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _feelChip(String label, String value) {
// // // // // // //     final selected = movementFeeling == value;
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () {
// // // // // // //         setState(() {
// // // // // // //           movementFeeling = value;
// // // // // // //         });
// // // // // // //       },
// // // // // // //       child: AnimatedContainer(
// // // // // // //         duration: const Duration(milliseconds: 220),
// // // // // // //         padding: const EdgeInsets.symmetric(vertical: 14),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: selected ? kPrimary : Colors.white,
// // // // // // //           borderRadius: BorderRadius.circular(16),
// // // // // // //           border: Border.all(color: selected ? kPrimary : kBorder),
// // // // // // //           boxShadow: selected
// // // // // // //               ? [
// // // // // // //                   BoxShadow(
// // // // // // //                     color: kPrimary.withOpacity(0.18),
// // // // // // //                     blurRadius: 18,
// // // // // // //                     offset: const Offset(0, 8),
// // // // // // //                   ),
// // // // // // //                 ]
// // // // // // //               : [],
// // // // // // //         ),
// // // // // // //         child: Center(
// // // // // // //           child: Text(
// // // // // // //             label,
// // // // // // //             style: TextStyle(
// // // // // // //               color: selected ? Colors.white : kTextDark,
// // // // // // //               fontWeight: FontWeight.w700,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildRelaxationTools() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Relaxation Tools',
// // // // // // //             icon: Icons.music_note_rounded,
// // // // // // //             emoji: '🎵',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           ...natureTools.map(
// // // // // // //             (tool) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 10),
// // // // // // //               child: InfoLinkCard(
// // // // // // //                 icon: tool.icon,
// // // // // // //                 title: tool.title,
// // // // // // //                 subtitle: tool.subtitle,
// // // // // // //                 linkTitle: 'Open audio suggestions',
// // // // // // //                 url: tool.link,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildGuidedContentSection() {
// // // // // // //     final tracks = personalizedTracks;
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Guided Music & Audio',
// // // // // // //             icon: Icons.queue_music_rounded,
// // // // // // //             emoji: '🎶',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           const Text(
// // // // // // //             'Suggested from public YouTube relaxation content based on your mood.',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               height: 1.5,
// // // // // // //               fontSize: 13.5,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           ...tracks.map(
// // // // // // //             (track) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 12),
// // // // // // //               child: AudioTrackCard(track: track),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildNutritionSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Nutrition',
// // // // // // //             icon: Icons.restaurant_menu_rounded,
// // // // // // //             emoji: '🥗',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   'Water intake today: $waterIntake/$waterGoal glasses',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w700,
// // // // // // //                     fontSize: 15,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               _roundIcon(icon: Icons.remove, onTap: () => updateWater(-1)),
// // // // // // //               const SizedBox(width: 8),
// // // // // // //               _roundIcon(icon: Icons.add, onTap: () => updateWater(1)),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           Wrap(
// // // // // // //             spacing: 8,
// // // // // // //             runSpacing: 8,
// // // // // // //             children: List.generate(
// // // // // // //               waterGoal,
// // // // // // //               (index) => AnimatedContainer(
// // // // // // //                 duration: const Duration(milliseconds: 220),
// // // // // // //                 width: 28,
// // // // // // //                 height: 28,
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: index < waterIntake
// // // // // // //                       ? kPrimary
// // // // // // //                       : const Color(0xFFE6D7CB),
// // // // // // //                   borderRadius: BorderRadius.circular(10),
// // // // // // //                 ),
// // // // // // //                 child: Icon(
// // // // // // //                   Icons.water_drop_rounded,
// // // // // // //                   size: 17,
// // // // // // //                   color: index < waterIntake ? Colors.white : kTextSoft,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 18),
// // // // // // //           Wrap(
// // // // // // //             spacing: 10,
// // // // // // //             runSpacing: 10,
// // // // // // //             children: const [
// // // // // // //               MiniTag(label: '🥗 Salad'),
// // // // // // //               MiniTag(label: '🥣 Oats'),
// // // // // // //               MiniTag(label: '🍓 Smoothie'),
// // // // // // //               MiniTag(label: '🍌 Banana + nuts'),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _roundIcon({required IconData icon, required VoidCallback onTap}) {
// // // // // // //     return Material(
// // // // // // //       color: Colors.white,
// // // // // // //       borderRadius: BorderRadius.circular(14),
// // // // // // //       child: InkWell(
// // // // // // //         onTap: onTap,
// // // // // // //         borderRadius: BorderRadius.circular(14),
// // // // // // //         child: Container(
// // // // // // //           width: 38,
// // // // // // //           height: 38,
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             borderRadius: BorderRadius.circular(14),
// // // // // // //             border: Border.all(color: kBorder),
// // // // // // //           ),
// // // // // // //           child: Icon(icon, size: 18, color: kPrimary),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildChecklistSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Daily Checklist',
// // // // // // //             icon: Icons.checklist_rounded,
// // // // // // //             emoji: '✅',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           ...dailyChecklist.entries.map((entry) {
// // // // // // //             return Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 12),
// // // // // // //               child: CustomCheckboxTile(
// // // // // // //                 title: entry.key,
// // // // // // //                 subtitle: _checklistTip(entry.key),
// // // // // // //                 value: entry.value,
// // // // // // //                 onChanged: (_) => toggleChecklist(entry.key),
// // // // // // //               ),
// // // // // // //             );
// // // // // // //           }).toList(),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   String _checklistTip(String key) {
// // // // // // //     switch (key) {
// // // // // // //       case 'Hydration':
// // // // // // //         return 'Hydration supports focus, mood, and energy balance.';
// // // // // // //       case 'Exercise':
// // // // // // //         return 'Even light movement helps your mind feel clearer.';
// // // // // // //       case 'Meditation':
// // // // // // //         return 'Short calm sessions are better than skipping the habit.';
// // // // // // //       case 'Reading':
// // // // // // //         return 'Choose something that gives peace, wisdom, or courage.';
// // // // // // //       case 'Sleep preparation':
// // // // // // //         return 'Dim lights, calm audio, and reduce overstimulation.';
// // // // // // //       default:
// // // // // // //         return 'A small daily habit builds long-term wellness.';
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Widget _buildReflectionSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Daily Reflection',
// // // // // // //             icon: Icons.sentiment_satisfied_alt_rounded,
// // // // // // //             emoji: '🎯',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           const Text(
// // // // // // //             'How was your day?',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w800,
// // // // // // //               fontSize: 17,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           MoodSelector(
// // // // // // //             selectedIndex: selectedReflectionMood,
// // // // // // //             onSelected: (index) {
// // // // // // //               setState(() {
// // // // // // //                 selectedReflectionMood = index;
// // // // // // //               });
// // // // // // //             },
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildProgressStats() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Row(
// // // // // // //         children: [
// // // // // // //           Expanded(
// // // // // // //             child: StatTile(
// // // // // // //               title: 'Total Minutes',
// // // // // // //               value: '$totalMeditationMinutes',
// // // // // // //               subtitle: 'Meditated',
// // // // // // //               icon: Icons.timer_rounded,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(width: 12),
// // // // // // //           Expanded(
// // // // // // //             child: StatTile(
// // // // // // //               title: 'Sessions',
// // // // // // //               value: '$sessionsCompleted',
// // // // // // //               subtitle: 'Completed',
// // // // // // //               icon: Icons.spa_rounded,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildSleepSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Sleep Integration',
// // // // // // //             icon: Icons.nightlight_round_rounded,
// // // // // // //             emoji: '🌙',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           const InfoListTile(
// // // // // // //             icon: Icons.menu_book_rounded,
// // // // // // //             title: 'Sleep stories',
// // // // // // //             subtitle:
// // // // // // //                 'Choose soft storytelling or spiritual reading before bed.',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           const InfoListTile(
// // // // // // //             icon: Icons.music_note_rounded,
// // // // // // //             title: 'Calm music',
// // // // // // //             subtitle:
// // // // // // //                 'Use light instrumental or rain audio to reduce mental noise.',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           const InfoListTile(
// // // // // // //             icon: Icons.notifications_active_outlined,
// // // // // // //             title: 'Bedtime reminders',
// // // // // // //             subtitle:
// // // // // // //                 'Set a fixed sleep preparation routine and keep it simple.',
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildSpiritualSection() {
// // // // // // //     return SectionCard(
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           const SectionTitle(
// // // // // // //             title: 'Spiritual & Life Wisdom',
// // // // // // //             icon: Icons.auto_stories_rounded,
// // // // // // //             emoji: '🪔',
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           const Text(
// // // // // // //             'A calming section to reconnect with faith, history, purpose, and inspiring lives.',
// // // // // // //             style: TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               height: 1.5,
// // // // // // //               fontSize: 13.5,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           Container(
// // // // // // //             padding: const EdgeInsets.all(16),
// // // // // // //             decoration: BoxDecoration(
// // // // // // //               color: const Color(0xFFFFFBF7),
// // // // // // //               borderRadius: BorderRadius.circular(20),
// // // // // // //               border: Border.all(color: kBorder),
// // // // // // //             ),
// // // // // // //             child: const Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: [
// // // // // // //                 Text(
// // // // // // //                   '“Live with courage, patience, truth, and devotion. Even small good actions shape a meaningful life.”',
// // // // // // //                   style: TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontSize: 15,
// // // // // // //                     height: 1.6,
// // // // // // //                     fontWeight: FontWeight.w700,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 SizedBox(height: 10),
// // // // // // //                 Text(
// // // // // // //                   'Read a little. Reflect a little. Carry one lesson into your day.',
// // // // // // //                   style: TextStyle(
// // // // // // //                     color: kTextSoft,
// // // // // // //                     fontSize: 13.5,
// // // // // // //                     fontWeight: FontWeight.w600,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 16),
// // // // // // //           ...spiritualCategories.map(
// // // // // // //             (category) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 16),
// // // // // // //               child: SpiritualCategoryCard(category: category),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final paddingBottom = MediaQuery.of(context).padding.bottom;
// // // // // // //     return Scaffold(
// // // // // // //       backgroundColor: kBg,
// // // // // // //       body: SafeArea(
// // // // // // //         child: ListView(
// // // // // // //           padding: EdgeInsets.fromLTRB(20, 16, 20, 24 + paddingBottom),
// // // // // // //           children: [
// // // // // // //             _buildHeader(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildProgressCard(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildMoodStartSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildSessionSelection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildPlayerScreen(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildBreathingSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildGuidedContentSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildMovementSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildRelaxationTools(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildNutritionSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildChecklistSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildProgressStats(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildSleepSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildSpiritualSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             _buildReflectionSection(),
// // // // // // //             const SizedBox(height: 18),
// // // // // // //             SectionCard(
// // // // // // //               child: Text(
// // // // // // //                 motivationalMessage,
// // // // // // //                 style: const TextStyle(
// // // // // // //                   color: kTextDark,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                   height: 1.6,
// // // // // // //                   fontSize: 15,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   String _formatTime(int seconds) {
// // // // // // //     final m = seconds ~/ 60;
// // // // // // //     final s = seconds % 60;
// // // // // // //     return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
// // // // // // //   }
// // // // // // // }

// // // // // // // enum MoodType { sad, neutral, happy }

// // // // // // // enum SessionLength {
// // // // // // //   one(1),
// // // // // // //   three(3),
// // // // // // //   five(5),
// // // // // // //   ten(10);

// // // // // // //   final int minutes;
// // // // // // //   const SessionLength(this.minutes);
// // // // // // // }

// // // // // // // enum SessionGoal {
// // // // // // //   calm('calm'),
// // // // // // //   focus('focus'),
// // // // // // //   sleep('sleep');

// // // // // // //   final String label;
// // // // // // //   const SessionGoal(this.label);
// // // // // // // }

// // // // // // // class SectionCard extends StatelessWidget {
// // // // // // //   final Widget child;

// // // // // // //   const SectionCard({super.key, required this.child});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(18),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: kCard,
// // // // // // //         borderRadius: BorderRadius.circular(24),
// // // // // // //         border: Border.all(color: const Color(0xFFF0E4D8)),
// // // // // // //         boxShadow: const [
// // // // // // //           BoxShadow(
// // // // // // //             color: Color(0x12000000),
// // // // // // //             blurRadius: 22,
// // // // // // //             offset: Offset(0, 10),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       child: child,
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class SectionTitle extends StatelessWidget {
// // // // // // //   final String title;
// // // // // // //   final IconData icon;
// // // // // // //   final String emoji;
// // // // // // //   final bool lightText;

// // // // // // //   const SectionTitle({
// // // // // // //     super.key,
// // // // // // //     required this.title,
// // // // // // //     required this.icon,
// // // // // // //     required this.emoji,
// // // // // // //     this.lightText = false,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final textColor = lightText ? Colors.white : kTextDark;
// // // // // // //     final bgColor = lightText
// // // // // // //         ? Colors.white.withOpacity(0.14)
// // // // // // //         : kPrimary.withOpacity(0.10);

// // // // // // //     return Row(
// // // // // // //       children: [
// // // // // // //         Container(
// // // // // // //           width: 38,
// // // // // // //           height: 38,
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             color: bgColor,
// // // // // // //             borderRadius: BorderRadius.circular(12),
// // // // // // //           ),
// // // // // // //           child: Icon(
// // // // // // //             icon,
// // // // // // //             size: 20,
// // // // // // //             color: lightText ? Colors.white : kPrimary,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //         const SizedBox(width: 10),
// // // // // // //         Expanded(
// // // // // // //           child: Text(
// // // // // // //             '$emoji  $title',
// // // // // // //             style: TextStyle(
// // // // // // //               color: textColor,
// // // // // // //               fontSize: 18,
// // // // // // //               fontWeight: FontWeight.w800,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ],
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class MoodButtonData {
// // // // // // //   final String label;
// // // // // // //   final String emoji;
// // // // // // //   final MoodType value;
// // // // // // //   final String subtitle;

// // // // // // //   MoodButtonData({
// // // // // // //     required this.label,
// // // // // // //     required this.emoji,
// // // // // // //     required this.value,
// // // // // // //     required this.subtitle,
// // // // // // //   });
// // // // // // // }

// // // // // // // class CustomCheckboxTile extends StatelessWidget {
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final bool value;
// // // // // // //   final ValueChanged<bool> onChanged;

// // // // // // //   const CustomCheckboxTile({
// // // // // // //     super.key,
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.value,
// // // // // // //     required this.onChanged,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return AnimatedContainer(
// // // // // // //       duration: const Duration(milliseconds: 220),
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: value ? Colors.white : const Color(0xFFFFFBF7),
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: value ? kPrimary.withOpacity(0.35) : kBorder),
// // // // // // //         boxShadow: value
// // // // // // //             ? [
// // // // // // //                 BoxShadow(
// // // // // // //                   color: kPrimary.withOpacity(0.10),
// // // // // // //                   blurRadius: 16,
// // // // // // //                   offset: const Offset(0, 8),
// // // // // // //                 ),
// // // // // // //               ]
// // // // // // //             : [],
// // // // // // //       ),
// // // // // // //       child: InkWell(
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         onTap: () => onChanged(!value),
// // // // // // //         child: Row(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //           children: [
// // // // // // //             AnimatedContainer(
// // // // // // //               duration: const Duration(milliseconds: 220),
// // // // // // //               width: 24,
// // // // // // //               height: 24,
// // // // // // //               margin: const EdgeInsets.only(top: 2),
// // // // // // //               decoration: BoxDecoration(
// // // // // // //                 color: value ? kPrimary : Colors.transparent,
// // // // // // //                 borderRadius: BorderRadius.circular(8),
// // // // // // //                 border: Border.all(
// // // // // // //                   color: value ? kPrimary : const Color(0xFFC8B7A9),
// // // // // // //                   width: 1.6,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               child: value
// // // // // // //                   ? const Icon(Icons.check, size: 15, color: Colors.white)
// // // // // // //                   : null,
// // // // // // //             ),
// // // // // // //             const SizedBox(width: 12),
// // // // // // //             Expanded(
// // // // // // //               child: Column(
// // // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                 children: [
// // // // // // //                   Text(
// // // // // // //                     title,
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: value ? kPrimary : kTextDark,
// // // // // // //                       fontWeight: FontWeight.w800,
// // // // // // //                       fontSize: 15,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   const SizedBox(height: 4),
// // // // // // //                   Text(
// // // // // // //                     subtitle,
// // // // // // //                     style: const TextStyle(
// // // // // // //                       color: kTextSoft,
// // // // // // //                       fontSize: 12.8,
// // // // // // //                       height: 1.45,
// // // // // // //                       fontWeight: FontWeight.w500,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class MoodSelector extends StatelessWidget {
// // // // // // //   final int selectedIndex;
// // // // // // //   final ValueChanged<int> onSelected;

// // // // // // //   const MoodSelector({
// // // // // // //     super.key,
// // // // // // //     required this.selectedIndex,
// // // // // // //     required this.onSelected,
// // // // // // //   });

// // // // // // //   static const moods = ['😃', '😄', '😊', '😐', '😞', '😡'];

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Row(
// // // // // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //       children: List.generate(moods.length, (index) {
// // // // // // //         final selected = selectedIndex == index;
// // // // // // //         return GestureDetector(
// // // // // // //           onTap: () => onSelected(index),
// // // // // // //           child: AnimatedContainer(
// // // // // // //             duration: const Duration(milliseconds: 250),
// // // // // // //             curve: Curves.easeOut,
// // // // // // //             width: 48,
// // // // // // //             height: 48,
// // // // // // //             decoration: BoxDecoration(
// // // // // // //               color: selected ? kPrimary : Colors.white,
// // // // // // //               borderRadius: BorderRadius.circular(16),
// // // // // // //               border: Border.all(color: selected ? kPrimary : kBorder),
// // // // // // //               boxShadow: selected
// // // // // // //                   ? [
// // // // // // //                       BoxShadow(
// // // // // // //                         color: kPrimary.withOpacity(0.18),
// // // // // // //                         blurRadius: 18,
// // // // // // //                         offset: const Offset(0, 8),
// // // // // // //                       ),
// // // // // // //                     ]
// // // // // // //                   : const [
// // // // // // //                       BoxShadow(
// // // // // // //                         color: Color(0x0B000000),
// // // // // // //                         blurRadius: 10,
// // // // // // //                         offset: Offset(0, 4),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //             ),
// // // // // // //             child: Center(
// // // // // // //               child: AnimatedScale(
// // // // // // //                 duration: const Duration(milliseconds: 220),
// // // // // // //                 scale: selected ? 1.08 : 1,
// // // // // // //                 child: Text(moods[index], style: const TextStyle(fontSize: 22)),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       }),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class GuidedTrack {
// // // // // // //   final String title;
// // // // // // //   final String source;
// // // // // // //   final String type;
// // // // // // //   final String duration;
// // // // // // //   final MoodType moodFit;
// // // // // // //   final String link;

// // // // // // //   GuidedTrack({
// // // // // // //     required this.title,
// // // // // // //     required this.source,
// // // // // // //     required this.type,
// // // // // // //     required this.duration,
// // // // // // //     required this.moodFit,
// // // // // // //     required this.link,
// // // // // // //   });
// // // // // // // }

// // // // // // // class AudioTrackCard extends StatelessWidget {
// // // // // // //   final GuidedTrack track;

// // // // // // //   const AudioTrackCard({super.key, required this.track});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Container(
// // // // // // //                 width: 42,
// // // // // // //                 height: 42,
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: kPrimary.withOpacity(0.10),
// // // // // // //                   borderRadius: BorderRadius.circular(12),
// // // // // // //                 ),
// // // // // // //                 child: const Icon(
// // // // // // //                   Icons.play_circle_fill_rounded,
// // // // // // //                   color: kPrimary,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               const SizedBox(width: 12),
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   track.title,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // //                     fontSize: 14.5,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           Wrap(
// // // // // // //             spacing: 8,
// // // // // // //             runSpacing: 8,
// // // // // // //             children: [
// // // // // // //               _meta(track.source),
// // // // // // //               _meta(track.type),
// // // // // // //               _meta(track.duration),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           LinkButton(label: 'Open recommendation', url: track.link),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _meta(String text) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: kMuted,
// // // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // // //       ),
// // // // // // //       child: Text(
// // // // // // //         text,
// // // // // // //         style: const TextStyle(
// // // // // // //           color: kTextSoft,
// // // // // // //           fontWeight: FontWeight.w700,
// // // // // // //           fontSize: 12,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class LinkButton extends StatelessWidget {
// // // // // // //   final String label;
// // // // // // //   final String url;

// // // // // // //   const LinkButton({super.key, required this.label, required this.url});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return InkWell(
// // // // // // //       onTap: () {
// // // // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //           SnackBar(
// // // // // // //             content: Text('Open externally: $url'),
// // // // // // //             behavior: SnackBarBehavior.floating,
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //       borderRadius: BorderRadius.circular(14),
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: kPrimary,
// // // // // // //           borderRadius: BorderRadius.circular(14),
// // // // // // //         ),
// // // // // // //         child: Row(
// // // // // // //           mainAxisSize: MainAxisSize.min,
// // // // // // //           children: const [
// // // // // // //             Icon(Icons.open_in_new_rounded, color: Colors.white, size: 18),
// // // // // // //             SizedBox(width: 8),
// // // // // // //             Text(
// // // // // // //               'Open link',
// // // // // // //               style: TextStyle(
// // // // // // //                 color: Colors.white,
// // // // // // //                 fontWeight: FontWeight.w800,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class SimpleContentCard {
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final IconData icon;
// // // // // // //   final String link;

// // // // // // //   SimpleContentCard({
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.icon,
// // // // // // //     required this.link,
// // // // // // //   });
// // // // // // // }

// // // // // // // class InfoLinkCard extends StatelessWidget {
// // // // // // //   final IconData icon;
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final String linkTitle;
// // // // // // //   final String url;

// // // // // // //   const InfoLinkCard({
// // // // // // //     super.key,
// // // // // // //     required this.icon,
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.linkTitle,
// // // // // // //     required this.url,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Container(
// // // // // // //                 width: 40,
// // // // // // //                 height: 40,
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: kPrimary.withOpacity(0.10),
// // // // // // //                   borderRadius: BorderRadius.circular(12),
// // // // // // //                 ),
// // // // // // //                 child: Icon(icon, color: kPrimary, size: 20),
// // // // // // //               ),
// // // // // // //               const SizedBox(width: 10),
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   title,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // //                     fontSize: 14.5,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           Text(
// // // // // // //             subtitle,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //               height: 1.5,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           LinkButton(label: linkTitle, url: url),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class MiniTag extends StatelessWidget {
// // // // // // //   final String label;

// // // // // // //   const MiniTag({super.key, required this.label});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(14),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Text(
// // // // // // //         label,
// // // // // // //         style: const TextStyle(color: kTextDark, fontWeight: FontWeight.w700),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class StatTile extends StatelessWidget {
// // // // // // //   final String title;
// // // // // // //   final String value;
// // // // // // //   final String subtitle;
// // // // // // //   final IconData icon;

// // // // // // //   const StatTile({
// // // // // // //     super.key,
// // // // // // //     required this.title,
// // // // // // //     required this.value,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.icon,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Icon(icon, color: kPrimary),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           Text(
// // // // // // //             title,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               fontWeight: FontWeight.w600,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 6),
// // // // // // //           Text(
// // // // // // //             value,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w900,
// // // // // // //               fontSize: 24,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 4),
// // // // // // //           Text(
// // // // // // //             subtitle,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               fontWeight: FontWeight.w600,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class InfoListTile extends StatelessWidget {
// // // // // // //   final IconData icon;
// // // // // // //   final String title;
// // // // // // //   final String subtitle;

// // // // // // //   const InfoListTile({
// // // // // // //     super.key,
// // // // // // //     required this.icon,
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Row(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Icon(icon, color: kPrimary),
// // // // // // //           const SizedBox(width: 12),
// // // // // // //           Expanded(
// // // // // // //             child: Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: [
// // // // // // //                 Text(
// // // // // // //                   title,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w800,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 4),
// // // // // // //                 Text(
// // // // // // //                   subtitle,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextSoft,
// // // // // // //                     height: 1.45,
// // // // // // //                     fontWeight: FontWeight.w500,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class SpiritualCategory {
// // // // // // //   final String title;
// // // // // // //   final String emoji;
// // // // // // //   final IconData icon;
// // // // // // //   final List<SpiritualContentItem> items;

// // // // // // //   SpiritualCategory({
// // // // // // //     required this.title,
// // // // // // //     required this.emoji,
// // // // // // //     required this.icon,
// // // // // // //     required this.items,
// // // // // // //   });
// // // // // // // }

// // // // // // // class SpiritualContentItem {
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final String takeaway;
// // // // // // //   final List<LinkItem> bookLinks;
// // // // // // //   final List<LinkItem> videoLinks;

// // // // // // //   SpiritualContentItem({
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.takeaway,
// // // // // // //     required this.bookLinks,
// // // // // // //     required this.videoLinks,
// // // // // // //   });
// // // // // // // }

// // // // // // // class LinkItem {
// // // // // // //   final String title;
// // // // // // //   final String url;

// // // // // // //   LinkItem({required this.title, required this.url});
// // // // // // // }

// // // // // // // class SpiritualCategoryCard extends StatelessWidget {
// // // // // // //   final SpiritualCategory category;

// // // // // // //   const SpiritualCategoryCard({super.key, required this.category});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(16),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: const Color(0xFFFFFBF7),
// // // // // // //         borderRadius: BorderRadius.circular(20),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Container(
// // // // // // //                 width: 46,
// // // // // // //                 height: 46,
// // // // // // //                 decoration: BoxDecoration(
// // // // // // //                   color: kPrimary.withOpacity(0.10),
// // // // // // //                   borderRadius: BorderRadius.circular(14),
// // // // // // //                 ),
// // // // // // //                 child: Icon(category.icon, color: kPrimary),
// // // // // // //               ),
// // // // // // //               const SizedBox(width: 12),
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   '${category.emoji} ${category.title}',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     color: kTextDark,
// // // // // // //                     fontWeight: FontWeight.w900,
// // // // // // //                     fontSize: 17,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 14),
// // // // // // //           ...category.items.map(
// // // // // // //             (item) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 14),
// // // // // // //               child: SpiritualItemCard(item: item),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class SpiritualItemCard extends StatelessWidget {
// // // // // // //   final SpiritualContentItem item;

// // // // // // //   const SpiritualItemCard({super.key, required this.item});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Container(
// // // // // // //       padding: const EdgeInsets.all(14),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(18),
// // // // // // //         border: Border.all(color: kBorder),
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Text(
// // // // // // //             item.title,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextDark,
// // // // // // //               fontWeight: FontWeight.w900,
// // // // // // //               fontSize: 15.5,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 6),
// // // // // // //           Text(
// // // // // // //             item.subtitle,
// // // // // // //             style: const TextStyle(
// // // // // // //               color: kTextSoft,
// // // // // // //               height: 1.5,
// // // // // // //               fontWeight: FontWeight.w500,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 10),
// // // // // // //           Container(
// // // // // // //             padding: const EdgeInsets.all(12),
// // // // // // //             decoration: BoxDecoration(
// // // // // // //               color: kMuted,
// // // // // // //               borderRadius: BorderRadius.circular(14),
// // // // // // //             ),
// // // // // // //             child: Text(
// // // // // // //               'Motivation: ${item.takeaway}',
// // // // // // //               style: const TextStyle(
// // // // // // //                 color: kTextDark,
// // // // // // //                 height: 1.5,
// // // // // // //                 fontWeight: FontWeight.w700,
// // // // // // //                 fontSize: 13.2,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 12),
// // // // // // //           const Text(
// // // // // // //             'Books / Reading Links',
// // // // // // //             style: TextStyle(color: kTextDark, fontWeight: FontWeight.w800),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           ...item.bookLinks.map(
// // // // // // //             (link) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 8),
// // // // // // //               child: ResourceLinkTile(link: link),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           const Text(
// // // // // // //             'YouTube / Story Links',
// // // // // // //             style: TextStyle(color: kTextDark, fontWeight: FontWeight.w800),
// // // // // // //           ),
// // // // // // //           const SizedBox(height: 8),
// // // // // // //           ...item.videoLinks.map(
// // // // // // //             (link) => Padding(
// // // // // // //               padding: const EdgeInsets.only(bottom: 8),
// // // // // // //               child: ResourceLinkTile(link: link),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class ResourceLinkTile extends StatelessWidget {
// // // // // // //   final LinkItem link;

// // // // // // //   const ResourceLinkTile({super.key, required this.link});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return InkWell(
// // // // // // //       onTap: () {
// // // // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //           SnackBar(
// // // // // // //             content: Text('Open externally: ${link.url}'),
// // // // // // //             behavior: SnackBarBehavior.floating,
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //       borderRadius: BorderRadius.circular(14),
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.all(12),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: const Color(0xFFFFFBF7),
// // // // // // //           borderRadius: BorderRadius.circular(14),
// // // // // // //           border: Border.all(color: kBorder),
// // // // // // //         ),
// // // // // // //         child: Row(
// // // // // // //           children: [
// // // // // // //             const Icon(Icons.link_rounded, color: kPrimary, size: 18),
// // // // // // //             const SizedBox(width: 10),
// // // // // // //             Expanded(
// // // // // // //               child: Text(
// // // // // // //                 link.title,
// // // // // // //                 style: const TextStyle(
// // // // // // //                   color: kTextDark,
// // // // // // //                   fontWeight: FontWeight.w700,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const Icon(Icons.open_in_new_rounded, size: 18, color: kTextSoft),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'dart:async';
// // // // // // import 'dart:ui';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter/services.dart';

// // // // // // void main() {
// // // // // //   runApp(const WellnessApp());
// // // // // // }

// // // // // // class WellnessApp extends StatelessWidget {
// // // // // //   const WellnessApp({super.key});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return MaterialApp(
// // // // // //       title: 'Serene',
// // // // // //       debugShowCheckedModeBanner: false,
// // // // // //       theme: ThemeData(
// // // // // //         scaffoldBackgroundColor: AppColors.bg,
// // // // // //         useMaterial3: true,
// // // // // //         fontFamily: 'sans-serif',
// // // // // //         colorScheme: ColorScheme.fromSeed(
// // // // // //           seedColor: AppColors.primary,
// // // // // //           primary: AppColors.primary,
// // // // // //           surface: Colors.white,
// // // // // //         ),
// // // // // //       ),
// // // // // //       home: const DailyWellnessPage(),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class AppColors {
// // // // // //   static const bg = Color(0xFFF5F8FE);
// // // // // //   static const surface = Colors.white;
// // // // // //   static const cardSoft = Color(0xFFF8FBFF);
// // // // // //   static const primary = Color(0xFF6C7CF6);
// // // // // //   static const secondary = Color(0xFF7ED6C1);
// // // // // //   static const accent = Color(0xFFB6A4FF);
// // // // // //   static const text = Color(0xFF1E2442);
// // // // // //   static const subtext = Color(0xFF6A7292);
// // // // // //   static const border = Color(0xFFE6EBF5);
// // // // // //   static const softBlue = Color(0xFFEFF4FF);
// // // // // //   static const softMint = Color(0xFFEAFBF6);
// // // // // //   static const softLavender = Color(0xFFF3EEFF);
// // // // // //   static const softYellow = Color(0xFFFFF8E7);
// // // // // //   static const danger = Color(0xFFFF8A8A);
// // // // // // }

// // // // // // class DailyWellnessPage extends StatefulWidget {
// // // // // //   const DailyWellnessPage({super.key});

// // // // // //   @override
// // // // // //   State<DailyWellnessPage> createState() => _DailyWellnessPageState();
// // // // // // }

// // // // // // class _DailyWellnessPageState extends State<DailyWellnessPage>
// // // // // //     with TickerProviderStateMixin {
// // // // // //   MoodType? selectedMood;
// // // // // //   SessionLength selectedLength = SessionLength.three;
// // // // // //   SessionGoal selectedGoal = SessionGoal.calm;

// // // // // //   int streakDays = 4;
// // // // // //   int totalMinutes = 36;
// // // // // //   int sessionsCompleted = 9;
// // // // // //   int waterIntake = 5;
// // // // // //   final int waterGoal = 8;

// // // // // //   bool sessionStarted = false;
// // // // // //   bool isPlaying = false;
// // // // // //   String breathingText = 'Inhale';
// // // // // //   double breathingScale = 0.82;
// // // // // //   int elapsedSeconds = 0;
// // // // // //   Timer? timer;
// // // // // //   Timer? breathCycleTimer;

// // // // // //   String? selectedMovement;
// // // // // //   bool movementDone = false;
// // // // // //   String? movementFeedback;

// // // // // //   final Map<String, bool> checklist = {
// // // // // //     'Hydration': true,
// // // // // //     'Meditation': false,
// // // // // //     'Movement': false,
// // // // // //     'Reading': true,
// // // // // //     'Sleep setup': false,
// // // // // //   };

// // // // // //   int reflectionMood = 2;

// // // // // //   final List<GuidedAudio> guidedAudios = [
// // // // // //     GuidedAudio(
// // // // // //       title: 'Peaceful Ocean Relaxation',
// // // // // //       subtitle: 'Gentle soundscape for calming anxious thoughts.',
// // // // // //       type: 'Nature sounds',
// // // // // //       duration: '24/7 stream',
// // // // // //       url: 'https://www.youtube.com/watch?v=dXIyMS61B68',
// // // // // //       moodFit: MoodType.low,
// // // // // //       color: AppColors.softBlue,
// // // // // //       icon: Icons.waves_rounded,
// // // // // //     ),
// // // // // //     GuidedAudio(
// // // // // //       title: 'Calming Music for Stress Relief',
// // // // // //       subtitle: 'Slow instrumental music for reset and quiet focus.',
// // // // // //       type: 'Meditation music',
// // // // // //       duration: 'Long play',
// // // // // //       url: 'https://www.youtube.com/watch?v=lFcSrYw-ARY',
// // // // // //       moodFit: MoodType.neutral,
// // // // // //       color: AppColors.softLavender,
// // // // // //       icon: Icons.music_note_rounded,
// // // // // //     ),
// // // // // //     GuidedAudio(
// // // // // //       title: 'Deep Relaxation Sleep Music',
// // // // // //       subtitle: 'Soft ambient track for evening wind-down.',
// // // // // //       type: 'Sleep support',
// // // // // //       duration: 'Long play',
// // // // // //       url: 'https://www.youtube.com/watch?v=1ZYbU82GVz4',
// // // // // //       moodFit: MoodType.good,
// // // // // //       color: AppColors.softMint,
// // // // // //       icon: Icons.nightlight_round_rounded,
// // // // // //     ),
// // // // // //   ];

// // // // // //   final List<SpiritualSectionModel> spiritualSections = [
// // // // // //     SpiritualSectionModel(
// // // // // //       title: 'God & Spiritual Wisdom',
// // // // // //       emoji: '🪔',
// // // // // //       color: AppColors.softLavender,
// // // // // //       items: [
// // // // // //         SpiritualItem(
// // // // // //           title: 'Bhagavad Gita',
// // // // // //           description:
// // // // // //               'A guide to duty, courage, self-control, and inner peace through Krishna’s teachings.',
// // // // // //           lesson:
// // // // // //               'Do your work with steadiness and let values guide your decisions.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Google Play Books',
// // // // // //               url:
// // // // // //                   'https://play.google.com/store/books/details/Bhagavad_gita_As_It_Is?id=dSA3hsIq5dsC&hl=en_CA',
// // // // // //             ),
// // // // // //             ExternalLink(
// // // // // //               label: 'Google Books',
// // // // // //               url:
// // // // // //                   'https://books.google.com/books/about/Bhagavad_Gita.html?id=2WsnLilhMYkC',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Bhagavad Gita explanations',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Bhagavad+Gita+explained',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         SpiritualItem(
// // // // // //           title: 'Ramayana',
// // // // // //           description:
// // // // // //               'An epic of devotion, righteousness, resilience, and graceful strength in adversity.',
// // // // // //           lesson:
// // // // // //               'Honor, patience, and trust in values can guide life during difficult times.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Valmiki Ramayana - Google Books',
// // // // // //               url: 'https://books.google.cat/books?id=orU8DwAAQBAJ',
// // // // // //             ),
// // // // // //             ExternalLink(
// // // // // //               label: 'Ramayana app reference',
// // // // // //               url:
// // // // // //                   'https://play.google.com/store/apps/details?id=udroidsa.valmikiramayana&hl=en_IN',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Ramayana stories on YouTube',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Ramayana+story+explained',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         SpiritualItem(
// // // // // //           title: 'Qur’an & Ramadan Reflection',
// // // // // //           description:
// // // // // //               'Reflection on prayer, gratitude, discipline, patience, and kindness.',
// // // // // //           lesson:
// // // // // //               'Inner discipline becomes stronger when gratitude and compassion become habits.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'The Qur’an - Play Books',
// // // // // //               url:
// // // // // //                   'https://play.google.com/store/books/details/The_Qur_an?id=2LmsCiv8waEC&hl=en',
// // // // // //             ),
// // // // // //             ExternalLink(
// // // // // //               label: 'The Holy Qur’an - Google Books',
// // // // // //               url:
// // // // // //                   'https://books.google.com/books/about/The_Holy_Qur_an.html?id=VajhssX_uP4C',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Ramadan motivation & stories',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Ramadan+stories+motivation',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ],
// // // // // //     ),
// // // // // //     SpiritualSectionModel(
// // // // // //       title: 'History & Great Leaders',
// // // // // //       emoji: '🏰',
// // // // // //       color: AppColors.softBlue,
// // // // // //       items: [
// // // // // //         SpiritualItem(
// // // // // //           title: 'Chhatrapati Shivaji Maharaj',
// // // // // //           description:
// // // // // //               'A symbol of courage, strategy, self-respect, leadership, and protection of people.',
// // // // // //           lesson:
// // // // // //               'Lead with bravery and responsibility, especially when others depend on you.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Britannica biography',
// // // // // //               url: 'https://www.britannica.com/biography/Shivaji',
// // // // // //             ),
// // // // // //             ExternalLink(
// // // // // //               label: 'Biography overview',
// // // // // //               url:
// // // // // //                   'https://www.vedantu.com/biography/chhatrapati-shivaji-maharaj-biography',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Shivaji Maharaj stories',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Shivaji+Maharaj+story',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         SpiritualItem(
// // // // // //           title: 'Mahabharata: Krishna & Karna',
// // // // // //           description:
// // // // // //               'A deep reflection on dharma, pain, loyalty, destiny, and moral choices.',
// // // // // //           lesson:
// // // // // //               'Your choices under pressure define your path more than your circumstances.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Mahabharata books',
// // // // // //               url: 'https://books.google.com/books?q=Mahabharata+Krishna+Karna',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Krishna & Karna stories',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Krishna+Karna+story+Mahabharata',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ],
// // // // // //     ),
// // // // // //     SpiritualSectionModel(
// // // // // //       title: 'Motivational Lives',
// // // // // //       emoji: '✨',
// // // // // //       color: AppColors.softMint,
// // // // // //       items: [
// // // // // //         SpiritualItem(
// // // // // //           title: 'Mahatma Gandhi',
// // // // // //           description:
// // // // // //               'His autobiography reflects truth, discipline, humility, and nonviolence.',
// // // // // //           lesson:
// // // // // //               'Character is built through small daily decisions, not big speeches alone.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Google Books search',
// // // // // //               url: 'https://books.google.com/books?q=My+Experiments+with+Truth',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Audiobook on YouTube',
// // // // // //               url: 'https://www.youtube.com/watch?v=izfu2Qxa7ZM',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         SpiritualItem(
// // // // // //           title: 'A.P.J. Abdul Kalam - Wings of Fire',
// // // // // //           description:
// // // // // //               'A powerful life story about dreams, science, humility, and service.',
// // // // // //           lesson:
// // // // // //               'Big dreams become real when discipline and effort stay consistent.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Google Books',
// // // // // //               url:
// // // // // //                   'https://books.google.com/books/about/Wings_of_Fire.html?id=vg0D0AEACAAJ',
// // // // // //             ),
// // // // // //             ExternalLink(
// // // // // //               label: 'Book detail',
// // // // // //               url:
// // // // // //                   'https://books.google.co.in/books/about/Wings_of_Fire.html?id=c3qmIZtWUjAC',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Wings of Fire talks',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Wings+of+Fire+APJ+Abdul+Kalam',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //         SpiritualItem(
// // // // // //           title: 'Shyamchi Aai',
// // // // // //           description:
// // // // // //               'A deeply emotional work about values, simplicity, sacrifice, and motherhood.',
// // // // // //           lesson: 'Love, discipline, and gratitude create a strong inner life.',
// // // // // //           bookLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Book search',
// // // // // //               url: 'https://books.google.com/books?q=Shyamchi+Aai',
// // // // // //             ),
// // // // // //           ],
// // // // // //           videoLinks: [
// // // // // //             ExternalLink(
// // // // // //               label: 'Story videos',
// // // // // //               url:
// // // // // //                   'https://www.youtube.com/results?search_query=Shyamchi+Aai+story',
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ],
// // // // // //     ),
// // // // // //   ];

// // // // // //   final List<String> movementOptions = [
// // // // // //     'Yoga',
// // // // // //     'Stretching',
// // // // // //     'Light workout',
// // // // // //     'Mindful walk',
// // // // // //   ];

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     timer?.cancel();
// // // // // //     breathCycleTimer?.cancel();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   int get totalGoals => checklist.length + 4;

// // // // // //   int get completedGoals {
// // // // // //     final done = checklist.values.where((v) => v).length;
// // // // // //     final extra = [
// // // // // //       selectedMood != null,
// // // // // //       waterIntake >= waterGoal,
// // // // // //       sessionsCompleted > 0,
// // // // // //       movementDone,
// // // // // //     ].where((e) => e).length;
// // // // // //     return done + extra;
// // // // // //   }

// // // // // //   double get progress => completedGoals / totalGoals;

// // // // // //   int get progressPercentage => (progress * 100).round();

// // // // // //   List<GuidedAudio> get personalizedAudio {
// // // // // //     if (selectedMood == null) return guidedAudios;
// // // // // //     return guidedAudios
// // // // // //         .where((a) => a.moodFit == selectedMood)
// // // // // //         .followedBy(guidedAudios.where((a) => a.moodFit != selectedMood))
// // // // // //         .toList();
// // // // // //   }

// // // // // //   String get encouragement {
// // // // // //     switch (selectedMood) {
// // // // // //       case MoodType.low:
// // // // // //         return 'Keep today soft. Choose one calming session and one kind thought for yourself.';
// // // // // //       case MoodType.neutral:
// // // // // //         return 'A simple routine can turn an average day into a grounded one.';
// // // // // //       case MoodType.good:
// // // // // //         return 'Protect your good energy with mindful breaks and peaceful content.';
// // // // // //       default:
// // // // // //         return 'Start small. Mood, breath, movement, and reflection are enough for today.';
// // // // // //     }
// // // // // //   }

// // // // // //   void startSession() {
// // // // // //     HapticFeedback.mediumImpact();
// // // // // //     setState(() {
// // // // // //       sessionStarted = true;
// // // // // //       isPlaying = true;
// // // // // //       elapsedSeconds = 0;
// // // // // //       checklist['Meditation'] = true;
// // // // // //     });
// // // // // //     _startBreathingLoop();
// // // // // //   }

// // // // // //   void pauseSession() {
// // // // // //     timer?.cancel();
// // // // // //     breathCycleTimer?.cancel();
// // // // // //     setState(() {
// // // // // //       isPlaying = false;
// // // // // //     });
// // // // // //   }

// // // // // //   void resumeSession() {
// // // // // //     setState(() {
// // // // // //       isPlaying = true;
// // // // // //     });
// // // // // //     _startBreathingLoop();
// // // // // //   }

// // // // // //   void completeSession() {
// // // // // //     timer?.cancel();
// // // // // //     breathCycleTimer?.cancel();
// // // // // //     setState(() {
// // // // // //       isPlaying = false;
// // // // // //       sessionStarted = false;
// // // // // //       sessionsCompleted += 1;
// // // // // //       totalMinutes += selectedLength.minutes;
// // // // // //       streakDays += 1;
// // // // // //     });
// // // // // //   }

// // // // // //   void _startBreathingLoop() {
// // // // // //     timer?.cancel();
// // // // // //     breathCycleTimer?.cancel();

// // // // // //     timer = Timer.periodic(const Duration(seconds: 1), (_) {
// // // // // //       if (!mounted || !isPlaying) return;
// // // // // //       setState(() {
// // // // // //         elapsedSeconds++;
// // // // // //       });
// // // // // //     });

// // // // // //     void cycle() {
// // // // // //       if (!mounted || !isPlaying) return;
// // // // // //       setState(() {
// // // // // //         breathingText = 'Inhale';
// // // // // //         breathingScale = 1.08;
// // // // // //       });

// // // // // //       breathCycleTimer = Timer(const Duration(seconds: 4), () {
// // // // // //         if (!mounted || !isPlaying) return;
// // // // // //         setState(() {
// // // // // //           breathingText = 'Hold';
// // // // // //           breathingScale = 1.08;
// // // // // //         });

// // // // // //         breathCycleTimer = Timer(const Duration(seconds: 2), () {
// // // // // //           if (!mounted || !isPlaying) return;
// // // // // //           setState(() {
// // // // // //             breathingText = 'Exhale';
// // // // // //             breathingScale = 0.80;
// // // // // //           });

// // // // // //           breathCycleTimer = Timer(const Duration(seconds: 4), () {
// // // // // //             cycle();
// // // // // //           });
// // // // // //         });
// // // // // //       });
// // // // // //     }

// // // // // //     cycle();
// // // // // //   }

// // // // // //   void updateWater(int value) {
// // // // // //     setState(() {
// // // // // //       waterIntake = (waterIntake + value).clamp(0, waterGoal);
// // // // // //       if (waterIntake >= waterGoal) {
// // // // // //         checklist['Hydration'] = true;
// // // // // //       }
// // // // // //     });
// // // // // //   }

// // // // // //   void toggleChecklist(String key) {
// // // // // //     setState(() {
// // // // // //       checklist[key] = !(checklist[key] ?? false);
// // // // // //     });
// // // // // //   }

// // // // // //   String _formatTime(int totalSeconds) {
// // // // // //     final min = totalSeconds ~/ 60;
// // // // // //     final sec = totalSeconds % 60;
// // // // // //     return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
// // // // // //   }

// // // // // //   void showExternalLink(String url) {
// // // // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // // // //       SnackBar(
// // // // // //         content: Text('Open externally: $url'),
// // // // // //         behavior: SnackBarBehavior.floating,
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       body: DecoratedBox(
// // // // // //         decoration: const BoxDecoration(
// // // // // //           gradient: LinearGradient(
// // // // // //             colors: [Color(0xFFF9FBFF), Color(0xFFF4F7FD), Color(0xFFF7F8FF)],
// // // // // //             begin: Alignment.topCenter,
// // // // // //             end: Alignment.bottomCenter,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: SafeArea(
// // // // // //           child: ListView(
// // // // // //             padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
// // // // // //             children: [
// // // // // //               _buildHeroHeader(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildOverviewCards(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildMoodSection(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildSessionBuilder(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildPlayerCard(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildQuickSupportRow(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildGuidedMusicSection(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildMovementSection(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildChecklistSection(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildSpiritualSection(),
// // // // // //               const SizedBox(height: 18),
// // // // // //               _buildReflectionSection(),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildHeroHeader() {
// // // // // //     return Container(
// // // // // //       padding: const EdgeInsets.all(20),
// // // // // //       decoration: BoxDecoration(
// // // // // //         gradient: const LinearGradient(
// // // // // //           colors: [Color(0xFF6C7CF6), Color(0xFF8EA0FF), Color(0xFFA99BFF)],
// // // // // //           begin: Alignment.topLeft,
// // // // // //           end: Alignment.bottomRight,
// // // // // //         ),
// // // // // //         borderRadius: BorderRadius.circular(28),
// // // // // //         boxShadow: [
// // // // // //           BoxShadow(
// // // // // //             color: AppColors.primary.withOpacity(0.28),
// // // // // //             blurRadius: 26,
// // // // // //             offset: const Offset(0, 14),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         children: [
// // // // // //           Row(
// // // // // //             children: [
// // // // // //               Expanded(
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: const [
// // // // // //                     Text(
// // // // // //                       'Good Morning, Sakshi ✨',
// // // // // //                       style: TextStyle(
// // // // // //                         fontSize: 25,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                         color: Colors.white,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     SizedBox(height: 8),
// // // // // //                     Text(
// // // // // //                       'What should I do today?',
// // // // // //                       style: TextStyle(
// // // // // //                         fontSize: 16,
// // // // // //                         color: Color(0xFFF4F6FF),
// // // // // //                         fontWeight: FontWeight.w600,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Container(
// // // // // //                 padding: const EdgeInsets.symmetric(
// // // // // //                   horizontal: 14,
// // // // // //                   vertical: 12,
// // // // // //                 ),
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.white.withOpacity(0.16),
// // // // // //                   borderRadius: BorderRadius.circular(18),
// // // // // //                 ),
// // // // // //                 child: Column(
// // // // // //                   children: [
// // // // // //                     const Icon(
// // // // // //                       Icons.local_fire_department_rounded,
// // // // // //                       color: Colors.white,
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 6),
// // // // // //                     Text(
// // // // // //                       '$streakDays Day Streak',
// // // // // //                       style: const TextStyle(
// // // // // //                         color: Colors.white,
// // // // // //                         fontSize: 12.5,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           const SizedBox(height: 18),
// // // // // //           Container(
// // // // // //             padding: const EdgeInsets.all(14),
// // // // // //             decoration: BoxDecoration(
// // // // // //               color: Colors.white.withOpacity(0.14),
// // // // // //               borderRadius: BorderRadius.circular(18),
// // // // // //             ),
// // // // // //             child: Column(
// // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //               children: [
// // // // // //                 Row(
// // // // // //                   children: [
// // // // // //                     const Expanded(
// // // // // //                       child: Text(
// // // // // //                         'Today’s wellness progress',
// // // // // //                         style: TextStyle(
// // // // // //                           color: Colors.white,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     Text(
// // // // // //                       '$progressPercentage%',
// // // // // //                       style: const TextStyle(
// // // // // //                         color: Colors.white,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 12),
// // // // // //                 ClipRRect(
// // // // // //                   borderRadius: BorderRadius.circular(12),
// // // // // //                   child: LinearProgressIndicator(
// // // // // //                     value: progress,
// // // // // //                     minHeight: 10,
// // // // // //                     color: Colors.white,
// // // // // //                     backgroundColor: Colors.white.withOpacity(0.22),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 10),
// // // // // //                 Text(
// // // // // //                   encouragement,
// // // // // //                   style: const TextStyle(
// // // // // //                     color: Color(0xFFF5F7FF),
// // // // // //                     height: 1.45,
// // // // // //                     fontSize: 13,
// // // // // //                     fontWeight: FontWeight.w500,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildOverviewCards() {
// // // // // //     return Row(
// // // // // //       children: [
// // // // // //         Expanded(
// // // // // //           child: StatsCard(
// // // // // //             title: 'Minutes',
// // // // // //             value: '$totalMinutes',
// // // // // //             subtitle: 'Mindful time',
// // // // // //             color: AppColors.softMint,
// // // // // //             icon: Icons.timer_rounded,
// // // // // //           ),
// // // // // //         ),
// // // // // //         const SizedBox(width: 12),
// // // // // //         Expanded(
// // // // // //           child: StatsCard(
// // // // // //             title: 'Sessions',
// // // // // //             value: '$sessionsCompleted',
// // // // // //             subtitle: 'Completed',
// // // // // //             color: AppColors.softLavender,
// // // // // //             icon: Icons.spa_rounded,
// // // // // //           ),
// // // // // //         ),
// // // // // //         const SizedBox(width: 12),
// // // // // //         Expanded(
// // // // // //           child: StatsCard(
// // // // // //             title: 'Water',
// // // // // //             value: '$waterIntake/$waterGoal',
// // // // // //             subtitle: 'Glasses',
// // // // // //             color: AppColors.softBlue,
// // // // // //             icon: Icons.water_drop_rounded,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ],
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildMoodSection() {
// // // // // //     final moods = [
// // // // // //       MoodChipModel(
// // // // // //         emoji: '😞',
// // // // // //         label: 'Low',
// // // // // //         subtitle: 'Need comfort',
// // // // // //         value: MoodType.low,
// // // // // //         color: const Color(0xFFFFF1F1),
// // // // // //       ),
// // // // // //       MoodChipModel(
// // // // // //         emoji: '😐',
// // // // // //         label: 'Okay',
// // // // // //         subtitle: 'Need reset',
// // // // // //         value: MoodType.neutral,
// // // // // //         color: const Color(0xFFFFF8E7),
// // // // // //       ),
// // // // // //       MoodChipModel(
// // // // // //         emoji: '😊',
// // // // // //         label: 'Good',
// // // // // //         subtitle: 'Keep balance',
// // // // // //         value: MoodType.good,
// // // // // //         color: const Color(0xFFEAFBF6),
// // // // // //       ),
// // // // // //     ];

// // // // // //     return SectionShell(
// // // // // //       title: 'Simple Start',
// // // // // //       subtitle: 'How do you feel right now?',
// // // // // //       trailing: const Text(
// // // // // //         '1/4',
// // // // // //         style: TextStyle(color: AppColors.subtext, fontWeight: FontWeight.w700),
// // // // // //       ),
// // // // // //       child: Row(
// // // // // //         children: moods.map((m) {
// // // // // //           final selected = selectedMood == m.value;
// // // // // //           return Expanded(
// // // // // //             child: Padding(
// // // // // //               padding: EdgeInsets.only(right: m == moods.last ? 0 : 10),
// // // // // //               child: GestureDetector(
// // // // // //                 onTap: () {
// // // // // //                   HapticFeedback.selectionClick();
// // // // // //                   setState(() {
// // // // // //                     selectedMood = m.value;
// // // // // //                   });
// // // // // //                 },
// // // // // //                 child: AnimatedContainer(
// // // // // //                   duration: const Duration(milliseconds: 260),
// // // // // //                   padding: const EdgeInsets.all(14),
// // // // // //                   decoration: BoxDecoration(
// // // // // //                     color: selected ? AppColors.primary : m.color,
// // // // // //                     borderRadius: BorderRadius.circular(22),
// // // // // //                     border: Border.all(
// // // // // //                       color: selected ? AppColors.primary : AppColors.border,
// // // // // //                     ),
// // // // // //                     boxShadow: selected
// // // // // //                         ? [
// // // // // //                             BoxShadow(
// // // // // //                               color: AppColors.primary.withOpacity(0.22),
// // // // // //                               blurRadius: 16,
// // // // // //                               offset: const Offset(0, 8),
// // // // // //                             ),
// // // // // //                           ]
// // // // // //                         : [],
// // // // // //                   ),
// // // // // //                   child: Column(
// // // // // //                     children: [
// // // // // //                       Text(m.emoji, style: const TextStyle(fontSize: 28)),
// // // // // //                       const SizedBox(height: 10),
// // // // // //                       Text(
// // // // // //                         m.label,
// // // // // //                         style: TextStyle(
// // // // // //                           color: selected ? Colors.white : AppColors.text,
// // // // // //                           fontWeight: FontWeight.w800,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 4),
// // // // // //                       Text(
// // // // // //                         m.subtitle,
// // // // // //                         textAlign: TextAlign.center,
// // // // // //                         style: TextStyle(
// // // // // //                           color: selected
// // // // // //                               ? Colors.white.withOpacity(0.9)
// // // // // //                               : AppColors.subtext,
// // // // // //                           fontSize: 12,
// // // // // //                           fontWeight: FontWeight.w600,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           );
// // // // // //         }).toList(),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildSessionBuilder() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Choose Your Session',
// // // // // //       subtitle: 'Select time and intention',
// // // // // //       trailing: const Text(
// // // // // //         '2/4',
// // // // // //         style: TextStyle(color: AppColors.subtext, fontWeight: FontWeight.w700),
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           const Text(
// // // // // //             'Duration',
// // // // // //             style: TextStyle(
// // // // // //               color: AppColors.text,
// // // // // //               fontWeight: FontWeight.w800,
// // // // // //               fontSize: 14.5,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 10),
// // // // // //           Wrap(
// // // // // //             spacing: 10,
// // // // // //             runSpacing: 10,
// // // // // //             children: SessionLength.values.map((len) {
// // // // // //               final selected = selectedLength == len;
// // // // // //               return _softChip(
// // // // // //                 label: '${len.minutes} min',
// // // // // //                 selected: selected,
// // // // // //                 onTap: () => setState(() => selectedLength = len),
// // // // // //               );
// // // // // //             }).toList(),
// // // // // //           ),
// // // // // //           const SizedBox(height: 18),
// // // // // //           const Text(
// // // // // //             'Goal',
// // // // // //             style: TextStyle(
// // // // // //               color: AppColors.text,
// // // // // //               fontWeight: FontWeight.w800,
// // // // // //               fontSize: 14.5,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 10),
// // // // // //           Wrap(
// // // // // //             spacing: 10,
// // // // // //             runSpacing: 10,
// // // // // //             children: SessionGoal.values.map((goal) {
// // // // // //               final selected = selectedGoal == goal;
// // // // // //               IconData icon = Icons.self_improvement_rounded;
// // // // // //               if (goal == SessionGoal.focus) icon = Icons.center_focus_strong;
// // // // // //               if (goal == SessionGoal.sleep) icon = Icons.nightlight_round;
// // // // // //               return _softChip(
// // // // // //                 label: goal.label,
// // // // // //                 icon: icon,
// // // // // //                 selected: selected,
// // // // // //                 onTap: () => setState(() => selectedGoal = goal),
// // // // // //               );
// // // // // //             }).toList(),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _softChip({
// // // // // //     required String label,
// // // // // //     required bool selected,
// // // // // //     required VoidCallback onTap,
// // // // // //     IconData? icon,
// // // // // //   }) {
// // // // // //     return InkWell(
// // // // // //       borderRadius: BorderRadius.circular(16),
// // // // // //       onTap: onTap,
// // // // // //       child: AnimatedContainer(
// // // // // //         duration: const Duration(milliseconds: 220),
// // // // // //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: selected ? AppColors.primary : Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(16),
// // // // // //           border: Border.all(
// // // // // //             color: selected ? AppColors.primary : AppColors.border,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           mainAxisSize: MainAxisSize.min,
// // // // // //           children: [
// // // // // //             if (icon != null) ...[
// // // // // //               Icon(
// // // // // //                 icon,
// // // // // //                 size: 18,
// // // // // //                 color: selected ? Colors.white : AppColors.subtext,
// // // // // //               ),
// // // // // //               const SizedBox(width: 8),
// // // // // //             ],
// // // // // //             Text(
// // // // // //               label,
// // // // // //               style: TextStyle(
// // // // // //                 color: selected ? Colors.white : AppColors.text,
// // // // // //                 fontWeight: FontWeight.w800,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildPlayerCard() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Player',
// // // // // //       subtitle: 'Breath, play, and stay present',
// // // // // //       trailing: const Text(
// // // // // //         '3/4',
// // // // // //         style: TextStyle(color: AppColors.subtext, fontWeight: FontWeight.w700),
// // // // // //       ),
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.all(18),
// // // // // //         decoration: BoxDecoration(
// // // // // //           gradient: const LinearGradient(
// // // // // //             colors: [Color(0xFF0F1636), Color(0xFF25346C), Color(0xFF5565C9)],
// // // // // //             begin: Alignment.topLeft,
// // // // // //             end: Alignment.bottomRight,
// // // // // //           ),
// // // // // //           borderRadius: BorderRadius.circular(28),
// // // // // //         ),
// // // // // //         child: Column(
// // // // // //           children: [
// // // // // //             Row(
// // // // // //               children: [
// // // // // //                 const Icon(Icons.headphones_rounded, color: Colors.white),
// // // // // //                 const SizedBox(width: 10),
// // // // // //                 Expanded(
// // // // // //                   child: Text(
// // // // // //                     '${selectedGoal.label} session • ${selectedLength.minutes} min',
// // // // // //                     style: const TextStyle(
// // // // // //                       color: Colors.white,
// // // // // //                       fontWeight: FontWeight.w700,
// // // // // //                       fontSize: 15,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 Container(
// // // // // //                   padding: const EdgeInsets.symmetric(
// // // // // //                     horizontal: 12,
// // // // // //                     vertical: 8,
// // // // // //                   ),
// // // // // //                   decoration: BoxDecoration(
// // // // // //                     color: Colors.white.withOpacity(0.12),
// // // // // //                     borderRadius: BorderRadius.circular(14),
// // // // // //                   ),
// // // // // //                   child: Text(
// // // // // //                     _formatTime(elapsedSeconds),
// // // // // //                     style: const TextStyle(
// // // // // //                       color: Colors.white,
// // // // // //                       fontWeight: FontWeight.w800,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //             const SizedBox(height: 22),
// // // // // //             AnimatedContainer(
// // // // // //               duration: const Duration(milliseconds: 1800),
// // // // // //               curve: Curves.easeInOut,
// // // // // //               width: 190 * breathingScale,
// // // // // //               height: 190 * breathingScale,
// // // // // //               decoration: BoxDecoration(
// // // // // //                 shape: BoxShape.circle,
// // // // // //                 gradient: RadialGradient(
// // // // // //                   colors: [
// // // // // //                     Colors.white.withOpacity(0.85),
// // // // // //                     const Color(0xFFBFCBFF).withOpacity(0.55),
// // // // // //                     Colors.transparent,
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               child: Center(
// // // // // //                 child: Text(
// // // // // //                   breathingText,
// // // // // //                   style: const TextStyle(
// // // // // //                     color: Colors.white,
// // // // // //                     fontWeight: FontWeight.w800,
// // // // // //                     fontSize: 24,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 18),
// // // // // //             const Text(
// // // // // //               'Inhale • Hold • Exhale',
// // // // // //               style: TextStyle(
// // // // // //                 color: Color(0xFFE7ECFF),
// // // // // //                 fontWeight: FontWeight.w600,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 18),
// // // // // //             Row(
// // // // // //               children: [
// // // // // //                 Expanded(
// // // // // //                   child: _playerButton(
// // // // // //                     icon: !sessionStarted
// // // // // //                         ? Icons.play_arrow_rounded
// // // // // //                         : isPlaying
// // // // // //                         ? Icons.pause_rounded
// // // // // //                         : Icons.play_arrow_rounded,
// // // // // //                     label: !sessionStarted
// // // // // //                         ? 'Start'
// // // // // //                         : isPlaying
// // // // // //                         ? 'Pause'
// // // // // //                         : 'Resume',
// // // // // //                     primary: true,
// // // // // //                     onTap: () {
// // // // // //                       if (!sessionStarted) {
// // // // // //                         startSession();
// // // // // //                       } else if (isPlaying) {
// // // // // //                         pauseSession();
// // // // // //                       } else {
// // // // // //                         resumeSession();
// // // // // //                       }
// // // // // //                     },
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const SizedBox(width: 12),
// // // // // //                 Expanded(
// // // // // //                   child: _playerButton(
// // // // // //                     icon: Icons.check_rounded,
// // // // // //                     label: 'Complete',
// // // // // //                     primary: false,
// // // // // //                     onTap: completeSession,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _playerButton({
// // // // // //     required IconData icon,
// // // // // //     required String label,
// // // // // //     required bool primary,
// // // // // //     required VoidCallback onTap,
// // // // // //   }) {
// // // // // //     return InkWell(
// // // // // //       onTap: onTap,
// // // // // //       borderRadius: BorderRadius.circular(18),
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.symmetric(vertical: 14),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: primary ? Colors.white : Colors.white.withOpacity(0.12),
// // // // // //           borderRadius: BorderRadius.circular(18),
// // // // // //           border: Border.all(
// // // // // //             color: primary ? Colors.white : Colors.white.withOpacity(0.2),
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             Icon(icon, color: primary ? AppColors.primary : Colors.white),
// // // // // //             const SizedBox(width: 8),
// // // // // //             Text(
// // // // // //               label,
// // // // // //               style: TextStyle(
// // // // // //                 color: primary ? AppColors.primary : Colors.white,
// // // // // //                 fontWeight: FontWeight.w800,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildQuickSupportRow() {
// // // // // //     return Row(
// // // // // //       children: [
// // // // // //         Expanded(
// // // // // //           child: _smallFeatureCard(
// // // // // //             title: 'Water',
// // // // // //             subtitle: '$waterIntake/$waterGoal glasses',
// // // // // //             icon: Icons.water_drop_rounded,
// // // // // //             color: AppColors.softBlue,
// // // // // //             trailing: Row(
// // // // // //               mainAxisSize: MainAxisSize.min,
// // // // // //               children: [
// // // // // //                 _miniCircleButton(Icons.remove, () => updateWater(-1)),
// // // // // //                 const SizedBox(width: 6),
// // // // // //                 _miniCircleButton(Icons.add, () => updateWater(1)),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //         const SizedBox(width: 12),
// // // // // //         Expanded(
// // // // // //           child: _smallFeatureCard(
// // // // // //             title: 'Sleep',
// // // // // //             subtitle: 'Story, music, reminders',
// // // // // //             icon: Icons.nightlight_round_rounded,
// // // // // //             color: AppColors.softLavender,
// // // // // //             trailing: const Icon(
// // // // // //               Icons.chevron_right_rounded,
// // // // // //               color: AppColors.subtext,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //       ],
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _miniCircleButton(IconData icon, VoidCallback onTap) {
// // // // // //     return InkWell(
// // // // // //       onTap: onTap,
// // // // // //       borderRadius: BorderRadius.circular(12),
// // // // // //       child: Container(
// // // // // //         width: 30,
// // // // // //         height: 30,
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(12),
// // // // // //           border: Border.all(color: AppColors.border),
// // // // // //         ),
// // // // // //         child: Icon(icon, size: 16, color: AppColors.primary),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _smallFeatureCard({
// // // // // //     required String title,
// // // // // //     required String subtitle,
// // // // // //     required IconData icon,
// // // // // //     required Color color,
// // // // // //     required Widget trailing,
// // // // // //   }) {
// // // // // //     return Container(
// // // // // //       padding: const EdgeInsets.all(16),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: color,
// // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // //         border: Border.all(color: AppColors.border),
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           Row(
// // // // // //             children: [
// // // // // //               Icon(icon, color: AppColors.text),
// // // // // //               const Spacer(),
// // // // // //               trailing,
// // // // // //             ],
// // // // // //           ),
// // // // // //           const SizedBox(height: 14),
// // // // // //           Text(
// // // // // //             title,
// // // // // //             style: const TextStyle(
// // // // // //               color: AppColors.text,
// // // // // //               fontWeight: FontWeight.w800,
// // // // // //               fontSize: 15,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 4),
// // // // // //           Text(
// // // // // //             subtitle,
// // // // // //             style: const TextStyle(
// // // // // //               color: AppColors.subtext,
// // // // // //               fontWeight: FontWeight.w600,
// // // // // //               fontSize: 12.5,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildGuidedMusicSection() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Guided Music & Relaxation',
// // // // // //       subtitle: 'Simple, personalized suggestions',
// // // // // //       child: Column(
// // // // // //         children: personalizedAudio.map((audio) {
// // // // // //           return Padding(
// // // // // //             padding: const EdgeInsets.only(bottom: 12),
// // // // // //             child: Container(
// // // // // //               padding: const EdgeInsets.all(14),
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: audio.color,
// // // // // //                 borderRadius: BorderRadius.circular(22),
// // // // // //                 border: Border.all(color: AppColors.border),
// // // // // //               ),
// // // // // //               child: Row(
// // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                 children: [
// // // // // //                   Container(
// // // // // //                     width: 48,
// // // // // //                     height: 48,
// // // // // //                     decoration: BoxDecoration(
// // // // // //                       color: Colors.white.withOpacity(0.8),
// // // // // //                       borderRadius: BorderRadius.circular(16),
// // // // // //                     ),
// // // // // //                     child: Icon(audio.icon, color: AppColors.primary),
// // // // // //                   ),
// // // // // //                   const SizedBox(width: 12),
// // // // // //                   Expanded(
// // // // // //                     child: Column(
// // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                       children: [
// // // // // //                         Text(
// // // // // //                           audio.title,
// // // // // //                           style: const TextStyle(
// // // // // //                             color: AppColors.text,
// // // // // //                             fontWeight: FontWeight.w800,
// // // // // //                             fontSize: 15,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 5),
// // // // // //                         Text(
// // // // // //                           audio.subtitle,
// // // // // //                           style: const TextStyle(
// // // // // //                             color: AppColors.subtext,
// // // // // //                             height: 1.45,
// // // // // //                             fontWeight: FontWeight.w600,
// // // // // //                             fontSize: 12.8,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const SizedBox(height: 10),
// // // // // //                         Wrap(
// // // // // //                           spacing: 8,
// // // // // //                           children: [_tag(audio.type), _tag(audio.duration)],
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   const SizedBox(width: 10),
// // // // // //                   InkWell(
// // // // // //                     onTap: () => showExternalLink(audio.url),
// // // // // //                     borderRadius: BorderRadius.circular(16),
// // // // // //                     child: Container(
// // // // // //                       padding: const EdgeInsets.all(12),
// // // // // //                       decoration: BoxDecoration(
// // // // // //                         color: Colors.white,
// // // // // //                         borderRadius: BorderRadius.circular(16),
// // // // // //                       ),
// // // // // //                       child: const Icon(
// // // // // //                         Icons.play_arrow_rounded,
// // // // // //                         color: AppColors.primary,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           );
// // // // // //         }).toList(),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _tag(String text) {
// // // // // //     return Container(
// // // // // //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: Colors.white.withOpacity(0.88),
// // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // //       ),
// // // // // //       child: Text(
// // // // // //         text,
// // // // // //         style: const TextStyle(
// // // // // //           color: AppColors.subtext,
// // // // // //           fontWeight: FontWeight.w700,
// // // // // //           fontSize: 12,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildMovementSection() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Movement',
// // // // // //       subtitle: 'Light body reset for mood and energy',
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           Wrap(
// // // // // //             spacing: 10,
// // // // // //             runSpacing: 10,
// // // // // //             children: movementOptions.map((option) {
// // // // // //               final selected = selectedMovement == option;
// // // // // //               return _softChip(
// // // // // //                 label: option,
// // // // // //                 selected: selected,
// // // // // //                 onTap: () => setState(() => selectedMovement = option),
// // // // // //                 icon: Icons.self_improvement_rounded,
// // // // // //               );
// // // // // //             }).toList(),
// // // // // //           ),
// // // // // //           const SizedBox(height: 14),
// // // // // //           GlassTile(
// // // // // //             child: Column(
// // // // // //               children: [
// // // // // //                 CustomCheckboxTile(
// // // // // //                   title: selectedMovement ?? 'Mark your movement complete',
// // // // // //                   subtitle: selectedMovement == null
// // // // // //                       ? 'Choose yoga, stretching, light workout, or a mindful walk.'
// // // // // //                       : 'Great choice. A little movement helps calm the mind too.',
// // // // // //                   value: movementDone,
// // // // // //                   onChanged: (value) {
// // // // // //                     setState(() {
// // // // // //                       movementDone = value;
// // // // // //                       checklist['Movement'] = value;
// // // // // //                     });
// // // // // //                   },
// // // // // //                 ),
// // // // // //                 if (movementDone) ...[
// // // // // //                   const SizedBox(height: 14),
// // // // // //                   Row(
// // // // // //                     children: [
// // // // // //                       Expanded(child: _feedbackChip('😊 Better', 'better')),
// // // // // //                       const SizedBox(width: 10),
// // // // // //                       Expanded(child: _feedbackChip('😐 Same', 'same')),
// // // // // //                       const SizedBox(width: 10),
// // // // // //                       Expanded(child: _feedbackChip('😞 Tired', 'tired')),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _feedbackChip(String text, String value) {
// // // // // //     final selected = movementFeedback == value;
// // // // // //     return InkWell(
// // // // // //       onTap: () => setState(() => movementFeedback = value),
// // // // // //       borderRadius: BorderRadius.circular(16),
// // // // // //       child: AnimatedContainer(
// // // // // //         duration: const Duration(milliseconds: 220),
// // // // // //         padding: const EdgeInsets.symmetric(vertical: 13),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: selected ? AppColors.primary : Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(16),
// // // // // //           border: Border.all(
// // // // // //             color: selected ? AppColors.primary : AppColors.border,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Center(
// // // // // //           child: Text(
// // // // // //             text,
// // // // // //             style: TextStyle(
// // // // // //               color: selected ? Colors.white : AppColors.text,
// // // // // //               fontWeight: FontWeight.w800,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildChecklistSection() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Daily Checklist',
// // // // // //       subtitle: 'Small habits that support your day',
// // // // // //       child: Column(
// // // // // //         children: checklist.entries.map((entry) {
// // // // // //           return Padding(
// // // // // //             padding: const EdgeInsets.only(bottom: 12),
// // // // // //             child: CustomCheckboxTile(
// // // // // //               title: entry.key,
// // // // // //               subtitle: _subtitleForChecklist(entry.key),
// // // // // //               value: entry.value,
// // // // // //               onChanged: (_) => toggleChecklist(entry.key),
// // // // // //             ),
// // // // // //           );
// // // // // //         }).toList(),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   String _subtitleForChecklist(String key) {
// // // // // //     switch (key) {
// // // // // //       case 'Hydration':
// // // // // //         return 'A hydrated body supports calm focus.';
// // // // // //       case 'Meditation':
// // // // // //         return 'Even a short breath session counts.';
// // // // // //       case 'Movement':
// // // // // //         return 'A little stretching can change your energy.';
// // // // // //       case 'Reading':
// // // // // //         return 'Read one page that gives peace or wisdom.';
// // // // // //       case 'Sleep setup':
// // // // // //         return 'Quiet music and lower screen time help a lot.';
// // // // // //       default:
// // // // // //         return 'A simple action for your day.';
// // // // // //     }
// // // // // //   }

// // // // // //   Widget _buildSpiritualSection() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Spiritual Growth & Inspiration',
// // // // // //       subtitle: 'God, history, and motivational lives',
// // // // // //       child: Column(
// // // // // //         children: [
// // // // // //           Container(
// // // // // //             width: double.infinity,
// // // // // //             padding: const EdgeInsets.all(18),
// // // // // //             decoration: BoxDecoration(
// // // // // //               gradient: const LinearGradient(
// // // // // //                 colors: [Color(0xFFECEBFF), Color(0xFFEAF7FF)],
// // // // // //               ),
// // // // // //               borderRadius: BorderRadius.circular(24),
// // // // // //               border: Border.all(color: AppColors.border),
// // // // // //             ),
// // // // // //             child: const Column(
// // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //               children: [
// // // // // //                 Text(
// // // // // //                   '“Live with patience, courage, and devotion. Let wisdom shape your actions.”',
// // // // // //                   style: TextStyle(
// // // // // //                     color: AppColors.text,
// // // // // //                     fontWeight: FontWeight.w800,
// // // // // //                     height: 1.5,
// // // // // //                     fontSize: 15,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 SizedBox(height: 8),
// // // // // //                 Text(
// // // // // //                   'Explore faith, powerful stories, and lives that inspire strength and clarity.',
// // // // // //                   style: TextStyle(
// // // // // //                     color: AppColors.subtext,
// // // // // //                     fontWeight: FontWeight.w600,
// // // // // //                     height: 1.45,
// // // // // //                     fontSize: 13,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 16),
// // // // // //           ...spiritualSections.map((section) {
// // // // // //             return Padding(
// // // // // //               padding: const EdgeInsets.only(bottom: 14),
// // // // // //               child: SpiritualSectionCard(
// // // // // //                 model: section,
// // // // // //                 onOpen: showExternalLink,
// // // // // //               ),
// // // // // //             );
// // // // // //           }).toList(),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildReflectionSection() {
// // // // // //     return SectionShell(
// // // // // //       title: 'Daily Reflection',
// // // // // //       subtitle: 'How was your day?',
// // // // // //       trailing: const Text(
// // // // // //         '4/4',
// // // // // //         style: TextStyle(color: AppColors.subtext, fontWeight: FontWeight.w700),
// // // // // //       ),
// // // // // //       child: MoodSelector(
// // // // // //         selectedIndex: reflectionMood,
// // // // // //         onSelected: (index) => setState(() => reflectionMood = index),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class SectionShell extends StatelessWidget {
// // // // // //   final String title;
// // // // // //   final String subtitle;
// // // // // //   final Widget child;
// // // // // //   final Widget? trailing;

// // // // // //   const SectionShell({
// // // // // //     super.key,
// // // // // //     required this.title,
// // // // // //     required this.subtitle,
// // // // // //     required this.child,
// // // // // //     this.trailing,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       padding: const EdgeInsets.all(18),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: AppColors.surface,
// // // // // //         borderRadius: BorderRadius.circular(28),
// // // // // //         border: Border.all(color: AppColors.border),
// // // // // //         boxShadow: [
// // // // // //           BoxShadow(
// // // // // //             color: const Color(0xFF9AA7D1).withOpacity(0.08),
// // // // // //             blurRadius: 24,
// // // // // //             offset: const Offset(0, 10),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         children: [
// // // // // //           Row(
// // // // // //             children: [
// // // // // //               Expanded(
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       title,
// // // // // //                       style: const TextStyle(
// // // // // //                         color: AppColors.text,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                         fontSize: 18,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 4),
// // // // // //                     Text(
// // // // // //                       subtitle,
// // // // // //                       style: const TextStyle(
// // // // // //                         color: AppColors.subtext,
// // // // // //                         fontWeight: FontWeight.w600,
// // // // // //                         fontSize: 13,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               if (trailing != null) trailing!,
// // // // // //             ],
// // // // // //           ),
// // // // // //           const SizedBox(height: 16),
// // // // // //           child,
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class StatsCard extends StatelessWidget {
// // // // // //   final String title;
// // // // // //   final String value;
// // // // // //   final String subtitle;
// // // // // //   final Color color;
// // // // // //   final IconData icon;

// // // // // //   const StatsCard({
// // // // // //     super.key,
// // // // // //     required this.title,
// // // // // //     required this.value,
// // // // // //     required this.subtitle,
// // // // // //     required this.color,
// // // // // //     required this.icon,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       padding: const EdgeInsets.all(14),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: color,
// // // // // //         borderRadius: BorderRadius.circular(22),
// // // // // //         border: Border.all(color: AppColors.border),
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           Icon(icon, color: AppColors.text, size: 20),
// // // // // //           const SizedBox(height: 12),
// // // // // //           Text(
// // // // // //             title,
// // // // // //             style: const TextStyle(
// // // // // //               color: AppColors.subtext,
// // // // // //               fontWeight: FontWeight.w700,
// // // // // //               fontSize: 12.5,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 4),
// // // // // //           Text(
// // // // // //             value,
// // // // // //             style: const TextStyle(
// // // // // //               color: AppColors.text,
// // // // // //               fontWeight: FontWeight.w900,
// // // // // //               fontSize: 22,
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 2),
// // // // // //           Text(
// // // // // //             subtitle,
// // // // // //             style: const TextStyle(
// // // // // //               color: AppColors.subtext,
// // // // // //               fontWeight: FontWeight.w600,
// // // // // //               fontSize: 12,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class GlassTile extends StatelessWidget {
// // // // // //   final Widget child;

// // // // // //   const GlassTile({super.key, required this.child});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return ClipRRect(
// // // // // //       borderRadius: BorderRadius.circular(24),
// // // // // //       child: BackdropFilter(
// // // // // //         filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
// // // // // //         child: Container(
// // // // // //           padding: const EdgeInsets.all(14),
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: AppColors.cardSoft,
// // // // // //             borderRadius: BorderRadius.circular(24),
// // // // // //             border: Border.all(color: AppColors.border),
// // // // // //           ),
// // // // // //           child: child,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class MoodChipModel {
// // // // // //   final String emoji;
// // // // // //   final String label;
// // // // // //   final String subtitle;
// // // // // //   final MoodType value;
// // // // // //   final Color color;

// // // // // //   MoodChipModel({
// // // // // //     required this.emoji,
// // // // // //     required this.label,
// // // // // //     required this.subtitle,
// // // // // //     required this.value,
// // // // // //     required this.color,
// // // // // //   });
// // // // // // }

// // // // // // enum MoodType { low, neutral, good }

// // // // // // enum SessionLength {
// // // // // //   one(1),
// // // // // //   three(3),
// // // // // //   five(5),
// // // // // //   ten(10);

// // // // // //   final int minutes;
// // // // // //   const SessionLength(this.minutes);
// // // // // // }

// // // // // // enum SessionGoal {
// // // // // //   calm('calm'),
// // // // // //   focus('focus'),
// // // // // //   sleep('sleep');

// // // // // //   final String label;
// // // // // //   const SessionGoal(this.label);
// // // // // // }

// // // // // // class GuidedAudio {
// // // // // //   final String title;
// // // // // //   final String subtitle;
// // // // // //   final String type;
// // // // // //   final String duration;
// // // // // //   final String url;
// // // // // //   final MoodType moodFit;
// // // // // //   final Color color;
// // // // // //   final IconData icon;

// // // // // //   GuidedAudio({
// // // // // //     required this.title,
// // // // // //     required this.subtitle,
// // // // // //     required this.type,
// // // // // //     required this.duration,
// // // // // //     required this.url,
// // // // // //     required this.moodFit,
// // // // // //     required this.color,
// // // // // //     required this.icon,
// // // // // //   });
// // // // // // }

// // // // // // class CustomCheckboxTile extends StatelessWidget {
// // // // // //   final String title;
// // // // // //   final String subtitle;
// // // // // //   final bool value;
// // // // // //   final ValueChanged<bool> onChanged;

// // // // // //   const CustomCheckboxTile({
// // // // // //     super.key,
// // // // // //     required this.title,
// // // // // //     required this.subtitle,
// // // // // //     required this.value,
// // // // // //     required this.onChanged,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return InkWell(
// // // // // //       onTap: () => onChanged(!value),
// // // // // //       borderRadius: BorderRadius.circular(20),
// // // // // //       child: AnimatedContainer(
// // // // // //         duration: const Duration(milliseconds: 220),
// // // // // //         padding: const EdgeInsets.all(14),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: value ? AppColors.softMint : Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(20),
// // // // // //           border: Border.all(
// // // // // //             color: value ? AppColors.secondary : AppColors.border,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             AnimatedContainer(
// // // // // //               duration: const Duration(milliseconds: 220),
// // // // // //               width: 24,
// // // // // //               height: 24,
// // // // // //               decoration: BoxDecoration(
// // // // // //                 color: value ? AppColors.secondary : Colors.transparent,
// // // // // //                 borderRadius: BorderRadius.circular(8),
// // // // // //                 border: Border.all(
// // // // // //                   color: value ? AppColors.secondary : AppColors.subtext,
// // // // // //                   width: 1.6,
// // // // // //                 ),
// // // // // //               ),
// // // // // //               child: value
// // // // // //                   ? const Icon(Icons.check, size: 15, color: Colors.white)
// // // // // //                   : null,
// // // // // //             ),
// // // // // //             const SizedBox(width: 12),
// // // // // //             Expanded(
// // // // // //               child: Column(
// // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                 children: [
// // // // // //                   Text(
// // // // // //                     title,
// // // // // //                     style: const TextStyle(
// // // // // //                       color: AppColors.text,
// // // // // //                       fontWeight: FontWeight.w800,
// // // // // //                       fontSize: 15,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   const SizedBox(height: 4),
// // // // // //                   Text(
// // // // // //                     subtitle,
// // // // // //                     style: const TextStyle(
// // // // // //                       color: AppColors.subtext,
// // // // // //                       fontSize: 12.8,
// // // // // //                       height: 1.45,
// // // // // //                       fontWeight: FontWeight.w600,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class SpiritualSectionModel {
// // // // // //   final String title;
// // // // // //   final String emoji;
// // // // // //   final Color color;
// // // // // //   final List<SpiritualItem> items;

// // // // // //   SpiritualSectionModel({
// // // // // //     required this.title,
// // // // // //     required this.emoji,
// // // // // //     required this.color,
// // // // // //     required this.items,
// // // // // //   });
// // // // // // }

// // // // // // class SpiritualItem {
// // // // // //   final String title;
// // // // // //   final String description;
// // // // // //   final String lesson;
// // // // // //   final List<ExternalLink> bookLinks;
// // // // // //   final List<ExternalLink> videoLinks;

// // // // // //   SpiritualItem({
// // // // // //     required this.title,
// // // // // //     required this.description,
// // // // // //     required this.lesson,
// // // // // //     required this.bookLinks,
// // // // // //     required this.videoLinks,
// // // // // //   });
// // // // // // }

// // // // // // class ExternalLink {
// // // // // //   final String label;
// // // // // //   final String url;

// // // // // //   ExternalLink({required this.label, required this.url});
// // // // // // }

// // // // // // class SpiritualSectionCard extends StatelessWidget {
// // // // // //   final SpiritualSectionModel model;
// // // // // //   final ValueChanged<String> onOpen;

// // // // // //   const SpiritualSectionCard({
// // // // // //     super.key,
// // // // // //     required this.model,
// // // // // //     required this.onOpen,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: model.color,
// // // // // //         borderRadius: BorderRadius.circular(24),
// // // // // //         border: Border.all(color: AppColors.border),
// // // // // //       ),
// // // // // //       padding: const EdgeInsets.all(16),
// // // // // //       child: Column(
// // // // // //         children: [
// // // // // //           Row(
// // // // // //             children: [
// // // // // //               Text(model.emoji, style: const TextStyle(fontSize: 24)),
// // // // // //               const SizedBox(width: 10),
// // // // // //               Expanded(
// // // // // //                 child: Text(
// // // // // //                   model.title,
// // // // // //                   style: const TextStyle(
// // // // // //                     color: AppColors.text,
// // // // // //                     fontWeight: FontWeight.w800,
// // // // // //                     fontSize: 17,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           const SizedBox(height: 14),
// // // // // //           ...model.items.map((item) {
// // // // // //             return Padding(
// // // // // //               padding: const EdgeInsets.only(bottom: 12),
// // // // // //               child: Container(
// // // // // //                 padding: const EdgeInsets.all(14),
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.white.withOpacity(0.88),
// // // // // //                   borderRadius: BorderRadius.circular(20),
// // // // // //                 ),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       item.title,
// // // // // //                       style: const TextStyle(
// // // // // //                         color: AppColors.text,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                         fontSize: 15.5,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 6),
// // // // // //                     Text(
// // // // // //                       item.description,
// // // // // //                       style: const TextStyle(
// // // // // //                         color: AppColors.subtext,
// // // // // //                         height: 1.5,
// // // // // //                         fontSize: 13,
// // // // // //                         fontWeight: FontWeight.w600,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 10),
// // // // // //                     Container(
// // // // // //                       padding: const EdgeInsets.all(12),
// // // // // //                       decoration: BoxDecoration(
// // // // // //                         color: model.color.withOpacity(0.7),
// // // // // //                         borderRadius: BorderRadius.circular(16),
// // // // // //                       ),
// // // // // //                       child: Text(
// // // // // //                         'Take from this: ${item.lesson}',
// // // // // //                         style: const TextStyle(
// // // // // //                           color: AppColors.text,
// // // // // //                           fontWeight: FontWeight.w700,
// // // // // //                           height: 1.45,
// // // // // //                           fontSize: 13,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 12),
// // // // // //                     const Text(
// // // // // //                       'Books / Reading',
// // // // // //                       style: TextStyle(
// // // // // //                         color: AppColors.text,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 8),
// // // // // //                     ...item.bookLinks.map(
// // // // // //                       (link) => Padding(
// // // // // //                         padding: const EdgeInsets.only(bottom: 8),
// // // // // //                         child: LinkRow(
// // // // // //                           label: link.label,
// // // // // //                           onTap: () => onOpen(link.url),
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 4),
// // // // // //                     const Text(
// // // // // //                       'Videos / Stories',
// // // // // //                       style: TextStyle(
// // // // // //                         color: AppColors.text,
// // // // // //                         fontWeight: FontWeight.w800,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 8),
// // // // // //                     ...item.videoLinks.map(
// // // // // //                       (link) => Padding(
// // // // // //                         padding: const EdgeInsets.only(bottom: 8),
// // // // // //                         child: LinkRow(
// // // // // //                           label: link.label,
// // // // // //                           onTap: () => onOpen(link.url),
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             );
// // // // // //           }).toList(),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class LinkRow extends StatelessWidget {
// // // // // //   final String label;
// // // // // //   final VoidCallback onTap;

// // // // // //   const LinkRow({super.key, required this.label, required this.onTap});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return InkWell(
// // // // // //       onTap: onTap,
// // // // // //       borderRadius: BorderRadius.circular(14),
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.all(12),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: const Color(0xFFF8FAFF),
// // // // // //           borderRadius: BorderRadius.circular(14),
// // // // // //           border: Border.all(color: AppColors.border),
// // // // // //         ),
// // // // // //         child: Row(
// // // // // //           children: [
// // // // // //             const Icon(Icons.link_rounded, color: AppColors.primary, size: 18),
// // // // // //             const SizedBox(width: 10),
// // // // // //             Expanded(
// // // // // //               child: Text(
// // // // // //                 label,
// // // // // //                 style: const TextStyle(
// // // // // //                   color: AppColors.text,
// // // // // //                   fontWeight: FontWeight.w700,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const Icon(
// // // // // //               Icons.open_in_new_rounded,
// // // // // //               size: 18,
// // // // // //               color: AppColors.subtext,
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class MoodSelector extends StatelessWidget {
// // // // // //   final int selectedIndex;
// // // // // //   final ValueChanged<int> onSelected;

// // // // // //   const MoodSelector({
// // // // // //     super.key,
// // // // // //     required this.selectedIndex,
// // // // // //     required this.onSelected,
// // // // // //   });

// // // // // //   static const moods = ['😃', '😄', '😊', '😐', '😞', '😡'];

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Row(
// // // // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //       children: List.generate(moods.length, (index) {
// // // // // //         final selected = selectedIndex == index;
// // // // // //         return GestureDetector(
// // // // // //           onTap: () => onSelected(index),
// // // // // //           child: AnimatedContainer(
// // // // // //             duration: const Duration(milliseconds: 250),
// // // // // //             width: 48,
// // // // // //             height: 48,
// // // // // //             decoration: BoxDecoration(
// // // // // //               color: selected ? AppColors.primary : Colors.white,
// // // // // //               borderRadius: BorderRadius.circular(16),
// // // // // //               border: Border.all(
// // // // // //                 color: selected ? AppColors.primary : AppColors.border,
// // // // // //               ),
// // // // // //               boxShadow: selected
// // // // // //                   ? [
// // // // // //                       BoxShadow(
// // // // // //                         color: AppColors.primary.withOpacity(0.18),
// // // // // //                         blurRadius: 16,
// // // // // //                         offset: const Offset(0, 8),
// // // // // //                       ),
// // // // // //                     ]
// // // // // //                   : [],
// // // // // //             ),
// // // // // //             child: Center(
// // // // // //               child: Text(moods[index], style: const TextStyle(fontSize: 22)),
// // // // // //             ),
// // // // // //           ),
// // // // // //         );
// // // // // //       }),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:async';
// // // // // import 'dart:ui';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter/services.dart';

// // // // // void main() {
// // // // //   runApp(const WellnessApp());
// // // // // }

// // // // // class WellnessApp extends StatelessWidget {
// // // // //   const WellnessApp({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       title: 'Serenity',
// // // // //       debugShowCheckedModeBanner: false,
// // // // //       theme: ThemeData(
// // // // //         useMaterial3: true,
// // // // //         scaffoldBackgroundColor: AppColors.background,
// // // // //         fontFamily: 'sans-serif',
// // // // //         colorScheme: ColorScheme.fromSeed(
// // // // //           seedColor: AppColors.primary,
// // // // //           primary: AppColors.primary,
// // // // //           surface: Colors.white,
// // // // //         ),
// // // // //       ),
// // // // //       home: const DailyWellnessPage(),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class AppColors {
// // // // //   static const Color background = Color(0xFFF4FBF7);
// // // // //   static const Color primary = Color(0xFF4C9B7E);
// // // // //   static const Color primaryDark = Color(0xFF2F6E5A);
// // // // //   static const Color mint = Color(0xFFDDF4EA);
// // // // //   static const Color softMint = Color(0xFFEAF8F1);
// // // // //   static const Color lightGreen = Color(0xFFCFECDD);
// // // // //   static const Color sage = Color(0xFF8BB8A0);
// // // // //   static const Color text = Color(0xFF18332A);
// // // // //   static const Color subtext = Color(0xFF6D8A7D);
// // // // //   static const Color border = Color(0xFFDCECE4);
// // // // //   static const Color card = Colors.white;
// // // // //   static const Color exercise = Color(0xFFE8F8EE);
// // // // //   static const Color meditation = Color(0xFFEAF7F1);
// // // // //   static const Color relaxation = Color(0xFFF0FBF5);
// // // // //   static const Color motivation = Color(0xFFEFF9F4);
// // // // //   static const Color spiritual = Color(0xFFF5FCF8);
// // // // //   static const Color chipBg = Color(0xFFF6FCF9);
// // // // // }

// // // // // class DailyWellnessPage extends StatefulWidget {
// // // // //   const DailyWellnessPage({super.key});

// // // // //   @override
// // // // //   State<DailyWellnessPage> createState() => _DailyWellnessPageState();
// // // // // }

// // // // // class _DailyWellnessPageState extends State<DailyWellnessPage>
// // // // //     with TickerProviderStateMixin {
// // // // //   final ScrollController _scrollController = ScrollController();

// // // // //   final GlobalKey _meditationKey = GlobalKey();
// // // // //   final GlobalKey _exerciseKey = GlobalKey();
// // // // //   final GlobalKey _relaxationKey = GlobalKey();
// // // // //   final GlobalKey _motivationKey = GlobalKey();
// // // // //   final GlobalKey _spiritualKey = GlobalKey();

// // // // //   int selectedTopTab = 0;

// // // // //   SessionLength selectedLength = SessionLength.five;
// // // // //   SessionGoal selectedGoal = SessionGoal.calm;
// // // // //   bool sessionStarted = false;
// // // // //   bool isPlaying = false;
// // // // //   String breathingText = 'Inhale';
// // // // //   double breathingScale = 0.84;
// // // // //   int elapsedSeconds = 0;
// // // // //   Timer? timer;
// // // // //   Timer? breathCycleTimer;

// // // // //   String? selectedExercise;
// // // // //   bool exerciseCompleted = false;
// // // // //   String? exerciseFeedback;
// // // // //   int selectedExerciseMinutes = 10;

// // // // //   final List<String> exerciseOptions = [
// // // // //     'Yoga',
// // // // //     'Stretching',
// // // // //     'Mindful Walk',
// // // // //     'Light Workout',
// // // // //   ];

// // // // //   final List<MediaItem> meditationMedia = [
// // // // //     MediaItem(
// // // // //       title: 'Beautiful Relaxing Music',
// // // // //       subtitle: 'Calming background music for focus, meditation and rest.',
// // // // //       tag: 'Music',
// // // // //       duration: 'Long play',
// // // // //       icon: Icons.music_note_rounded,
// // // // //       url: 'https://www.youtube.com/watch?v=lFcSrYw-ARY',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Relaxing Music for Stress Relief',
// // // // //       subtitle: 'Peaceful music for sleep, yoga, spa and healing sessions.',
// // // // //       tag: 'Relax',
// // // // //       duration: '1+ hour',
// // // // //       icon: Icons.spa_rounded,
// // // // //       url: 'https://www.youtube.com/watch?v=sztFHij0_W0',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Gentle Waves Deep Relaxation',
// // // // //       subtitle: 'Ocean-based soothing audio for better sleep and calmness.',
// // // // //       tag: 'Sleep',
// // // // //       duration: 'Deep rest',
// // // // //       icon: Icons.waves_rounded,
// // // // //       url: 'https://www.youtube.com/watch?v=z5OClQeHugE',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Nature Rain Meditation',
// // // // //       subtitle: 'Ambient rain sound for breathing and quiet journaling time.',
// // // // //       tag: 'Nature',
// // // // //       duration: 'Ambient',
// // // // //       icon: Icons.cloud_rounded,
// // // // //       url: 'https://www.youtube.com/results?search_query=rain+sound+meditation',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Soft Flute Meditation',
// // // // //       subtitle: 'Indian flute music for inner peace and slow breathing.',
// // // // //       tag: 'Flute',
// // // // //       duration: 'Calm flow',
// // // // //       icon: Icons.graphic_eq_rounded,
// // // // //       url:
// // // // //           'https://www.youtube.com/results?search_query=indian+flute+meditation+music',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Guided Breathing Audio',
// // // // //       subtitle: 'Short guided breathing session for quick reset.',
// // // // //       tag: 'Breathing',
// // // // //       duration: '5-10 min',
// // // // //       icon: Icons.air_rounded,
// // // // //       url:
// // // // //           'https://www.youtube.com/results?search_query=guided+breathing+meditation',
// // // // //     ),
// // // // //   ];

// // // // //   final List<MediaItem> relaxationMedia = [
// // // // //     MediaItem(
// // // // //       title: 'Sleep Story Audio',
// // // // //       subtitle: 'Soft storytelling and calm voice sessions for bedtime.',
// // // // //       tag: 'Story',
// // // // //       duration: 'Night',
// // // // //       icon: Icons.nightlight_round_rounded,
// // // // //       url: 'https://www.youtube.com/results?search_query=sleep+story+audio',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Forest Sounds',
// // // // //       subtitle: 'Natural forest ambience for peaceful rest and slow work.',
// // // // //       tag: 'Nature',
// // // // //       duration: 'Ambient',
// // // // //       icon: Icons.park_rounded,
// // // // //       url: 'https://www.youtube.com/results?search_query=forest+sounds+relax',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Healing Piano',
// // // // //       subtitle: 'Gentle piano sessions for emotional calm and grounding.',
// // // // //       tag: 'Instrumental',
// // // // //       duration: 'Relax',
// // // // //       icon: Icons.piano_rounded,
// // // // //       url: 'https://www.youtube.com/results?search_query=healing+piano+music',
// // // // //     ),
// // // // //     MediaItem(
// // // // //       title: 'Evening Wind Down',
// // // // //       subtitle: 'Relaxation audio for low-stimulation evening routine.',
// // // // //       tag: 'Evening',
// // // // //       duration: 'Routine',
// // // // //       icon: Icons.bedtime_rounded,
// // // // //       url:
// // // // //           'https://www.youtube.com/results?search_query=evening+wind+down+music',
// // // // //     ),
// // // // //   ];

// // // // //   final List<BookSection> motivationSections = [
// // // // //     BookSection(
// // // // //       title: 'Motivational Books',
// // // // //       color: AppColors.motivation,
// // // // //       icon: Icons.auto_stories_rounded,
// // // // //       books: [
// // // // //         BookItem(
// // // // //           title: 'Wings of Fire',
// // // // //           author: 'A.P.J. Abdul Kalam',
// // // // //           summary:
// // // // //               'A life story about dreams, discipline, humility, and purpose.',
// // // // //           links: [
// // // // //             ExternalLink(
// // // // //               label: 'Google Books',
// // // // //               url:
// // // // //                   'https://books.google.com/books/about/Wings_of_Fire.html?id=vg0D0AEACAAJ',
// // // // //             ),
// // // // //             ExternalLink(
// // // // //               label: 'More editions',
// // // // //               url:
// // // // //                   'https://books.google.co.in/books/about/Wings_of_Fire.html?id=c3qmIZtWUjAC',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         BookItem(
// // // // //           title: 'My Experiments with Truth',
// // // // //           author: 'Mahatma Gandhi',
// // // // //           summary:
// // // // //               'A reflective autobiography on truth, values, and discipline.',
// // // // //           links: [
// // // // //             ExternalLink(
// // // // //               label: 'Google Books search',
// // // // //               url: 'https://books.google.com/books?q=My+Experiments+with+Truth',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         BookItem(
// // // // //           title: 'Atomic Habits',
// // // // //           author: 'James Clear',
// // // // //           summary:
// // // // //               'A practical read on building better systems through small actions.',
// // // // //           links: [
// // // // //             ExternalLink(
// // // // //               label: 'Google Books search',
// // // // //               url: 'https://books.google.com/books?q=Atomic+Habits',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //     BookSection(
// // // // //       title: 'Short Motivation Videos',
// // // // //       color: AppColors.softMint,
// // // // //       icon: Icons.ondemand_video_rounded,
// // // // //       books: [
// // // // //         BookItem(
// // // // //           title: 'APJ Abdul Kalam Motivation',
// // // // //           author: 'Video collection',
// // // // //           summary:
// // // // //               'Inspirational talks on learning, dreams, growth, and effort.',
// // // // //           links: [
// // // // //             ExternalLink(
// // // // //               label: 'Watch on YouTube',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=APJ+Abdul+Kalam+motivation',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         BookItem(
// // // // //           title: 'Student Motivation',
// // // // //           author: 'Video collection',
// // // // //           summary:
// // // // //               'Short motivational talks for focus, consistency, and courage.',
// // // // //           links: [
// // // // //             ExternalLink(
// // // // //               label: 'Watch on YouTube',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=student+motivation+study',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //   ];

// // // // //   final List<SpiritualCategory> spiritualCategories = [
// // // // //     SpiritualCategory(
// // // // //       title: 'God & Devotional Wisdom',
// // // // //       emoji: '🪔',
// // // // //       color: AppColors.spiritual,
// // // // //       items: [
// // // // //         SpiritualEntry(
// // // // //           title: 'Bhagavad Gita',
// // // // //           description:
// // // // //               'Timeless teachings on action, balance, courage, peace, and devotion.',
// // // // //           lesson:
// // // // //               'Do your work with steadiness and let inner values guide your choices.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Google Play Books',
// // // // //               url:
// // // // //                   'https://play.google.com/store/books/details/Bhagavad_gita_As_It_Is?id=dSA3hsIq5dsC&hl=en_CA',
// // // // //             ),
// // // // //             ExternalLink(
// // // // //               label: 'Google Books',
// // // // //               url:
// // // // //                   'https://books.google.com/books/about/Bhagavad_Gita.html?id=2WsnLilhMYkC',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Gita explanation videos',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Bhagavad+Gita+explained',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         SpiritualEntry(
// // // // //           title: 'Ramayana',
// // // // //           description:
// // // // //               'An epic of duty, love, sacrifice, resilience, and righteousness.',
// // // // //           lesson:
// // // // //               'Patience, grace, and values become strength during difficult times.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Valmiki Ramayana',
// // // // //               url: 'https://books.google.cat/books?id=orU8DwAAQBAJ',
// // // // //             ),
// // // // //             ExternalLink(
// // // // //               label: 'Ramayana search',
// // // // //               url: 'https://books.google.com/books?q=Ramayana',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Ramayana stories',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Ramayana+story+explained',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         SpiritualEntry(
// // // // //           title: 'Hanuman Chalisa & Devotional Content',
// // // // //           description:
// // // // //               'A devotional path focused on courage, surrender, strength, and faith.',
// // // // //           lesson:
// // // // //               'Faith can become emotional strength when life feels uncertain.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Hanuman Chalisa books',
// // // // //               url: 'https://books.google.com/books?q=Hanuman+Chalisa',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Devotional videos',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Hanuman+Chalisa+devotional',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //     SpiritualCategory(
// // // // //       title: 'History & Great Leaders',
// // // // //       emoji: '🏹',
// // // // //       color: const Color(0xFFF0FBF5),
// // // // //       items: [
// // // // //         SpiritualEntry(
// // // // //           title: 'Chhatrapati Shivaji Maharaj',
// // // // //           description:
// // // // //               'Leadership, self-respect, courage, planning, and protection of people.',
// // // // //           lesson: 'Lead with bravery and wisdom when others depend on you.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Britannica biography',
// // // // //               url: 'https://www.britannica.com/biography/Shivaji',
// // // // //             ),
// // // // //             ExternalLink(
// // // // //               label: 'Biography overview',
// // // // //               url:
// // // // //                   'https://www.vedantu.com/biography/chhatrapati-shivaji-maharaj-biography',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Story videos',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Shivaji+Maharaj+story',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         SpiritualEntry(
// // // // //           title: 'Mahabharata: Krishna & Karna',
// // // // //           description:
// // // // //               'A powerful reflection on dharma, pain, destiny, loyalty, and ethics.',
// // // // //           lesson:
// // // // //               'Your decisions under pressure shape your life more than your circumstances.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Mahabharata books',
// // // // //               url: 'https://books.google.com/books?q=Mahabharata+Krishna+Karna',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Krishna and Karna stories',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Krishna+Karna+story+Mahabharata',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //     SpiritualCategory(
// // // // //       title: 'Faith, Reflection & Peace',
// // // // //       emoji: '☪️',
// // // // //       color: const Color(0xFFF4FCF7),
// // // // //       items: [
// // // // //         SpiritualEntry(
// // // // //           title: 'Qur’an Reflection',
// // // // //           description:
// // // // //               'A source of reflection on prayer, patience, gratitude, discipline, and compassion.',
// // // // //           lesson:
// // // // //               'Inner peace grows when discipline is balanced with kindness.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'The Qur’an - Play Books',
// // // // //               url:
// // // // //                   'https://play.google.com/store/books/details/The_Qur_an?id=2LmsCiv8waEC&hl=en',
// // // // //             ),
// // // // //             ExternalLink(
// // // // //               label: 'The Holy Qur’an - Google Books',
// // // // //               url:
// // // // //                   'https://books.google.com/books/about/The_Holy_Qur_an.html?id=VajhssX_uP4C',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Reflection videos',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Quran+reflection+motivation',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         SpiritualEntry(
// // // // //           title: 'Prayer & Gratitude',
// // // // //           description:
// // // // //               'Simple reflective habits that help slow the mind and reconnect with meaning.',
// // // // //           lesson:
// // // // //               'Gratitude gives emotional stability when the day feels heavy.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Books on gratitude',
// // // // //               url: 'https://books.google.com/books?q=gratitude+spirituality',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Prayer and gratitude talks',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=prayer+gratitude+peace',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //     SpiritualCategory(
// // // // //       title: 'Value-Based Life Stories',
// // // // //       emoji: '✨',
// // // // //       color: const Color(0xFFEEF9F3),
// // // // //       items: [
// // // // //         SpiritualEntry(
// // // // //           title: 'Shyamchi Aai',
// // // // //           description:
// // // // //               'A touching story of values, simplicity, sacrifice, gratitude, and family.',
// // // // //           lesson: 'Love and discipline together build a strong inner life.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Book search',
// // // // //               url: 'https://books.google.com/books?q=Shyamchi+Aai',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Story videos',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=Shyamchi+Aai+story',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         SpiritualEntry(
// // // // //           title: 'Stories of Saints & Wisdom',
// // // // //           description:
// // // // //               'Collections of saint stories, value-based reflections, and devotional inspiration.',
// // // // //           lesson:
// // // // //               'Peace often grows through simple, repeated acts of faith and humility.',
// // // // //           readingLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Saint stories books',
// // // // //               url: 'https://books.google.com/books?q=saint+stories+india',
// // // // //             ),
// // // // //           ],
// // // // //           videoLinks: [
// // // // //             ExternalLink(
// // // // //               label: 'Wisdom stories',
// // // // //               url:
// // // // //                   'https://www.youtube.com/results?search_query=saint+stories+motivation',
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //   ];

// // // // //   @override
// // // // //   void dispose() {
// // // // //     timer?.cancel();
// // // // //     breathCycleTimer?.cancel();
// // // // //     _scrollController.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   void _jumpTo(GlobalKey key, int index) {
// // // // //     setState(() {
// // // // //       selectedTopTab = index;
// // // // //     });
// // // // //     final context = key.currentContext;
// // // // //     if (context != null) {
// // // // //       Scrollable.ensureVisible(
// // // // //         context,
// // // // //         duration: const Duration(milliseconds: 500),
// // // // //         curve: Curves.easeInOut,
// // // // //         alignment: 0.08,
// // // // //       );
// // // // //     }
// // // // //   }

// // // // //   void startSession() {
// // // // //     HapticFeedback.mediumImpact();
// // // // //     setState(() {
// // // // //       sessionStarted = true;
// // // // //       isPlaying = true;
// // // // //       elapsedSeconds = 0;
// // // // //     });
// // // // //     _startBreathingLoop();
// // // // //   }

// // // // //   void pauseSession() {
// // // // //     timer?.cancel();
// // // // //     breathCycleTimer?.cancel();
// // // // //     setState(() {
// // // // //       isPlaying = false;
// // // // //     });
// // // // //   }

// // // // //   void resumeSession() {
// // // // //     setState(() {
// // // // //       isPlaying = true;
// // // // //     });
// // // // //     _startBreathingLoop();
// // // // //   }

// // // // //   void completeSession() {
// // // // //     timer?.cancel();
// // // // //     breathCycleTimer?.cancel();
// // // // //     setState(() {
// // // // //       isPlaying = false;
// // // // //       sessionStarted = false;
// // // // //     });
// // // // //   }

// // // // //   void _startBreathingLoop() {
// // // // //     timer?.cancel();
// // // // //     breathCycleTimer?.cancel();

// // // // //     timer = Timer.periodic(const Duration(seconds: 1), (_) {
// // // // //       if (!mounted || !isPlaying) return;
// // // // //       setState(() {
// // // // //         elapsedSeconds++;
// // // // //       });
// // // // //     });

// // // // //     void cycle() {
// // // // //       if (!mounted || !isPlaying) return;
// // // // //       setState(() {
// // // // //         breathingText = 'Inhale';
// // // // //         breathingScale = 1.05;
// // // // //       });

// // // // //       breathCycleTimer = Timer(const Duration(seconds: 4), () {
// // // // //         if (!mounted || !isPlaying) return;
// // // // //         setState(() {
// // // // //           breathingText = 'Hold';
// // // // //           breathingScale = 1.05;
// // // // //         });

// // // // //         breathCycleTimer = Timer(const Duration(seconds: 2), () {
// // // // //           if (!mounted || !isPlaying) return;
// // // // //           setState(() {
// // // // //             breathingText = 'Exhale';
// // // // //             breathingScale = 0.82;
// // // // //           });

// // // // //           breathCycleTimer = Timer(const Duration(seconds: 4), cycle);
// // // // //         });
// // // // //       });
// // // // //     }

// // // // //     cycle();
// // // // //   }

// // // // //   void openLink(String url) {
// // // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // // //       SnackBar(
// // // // //         content: Text('Open externally: $url'),
// // // // //         behavior: SnackBarBehavior.floating,
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   String formatTime(int totalSeconds) {
// // // // //     final min = totalSeconds ~/ 60;
// // // // //     final sec = totalSeconds % 60;
// // // // //     return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: DecoratedBox(
// // // // //         decoration: const BoxDecoration(
// // // // //           gradient: LinearGradient(
// // // // //             colors: [Color(0xFFF7FCF9), Color(0xFFF2FAF6), Color(0xFFEEF8F3)],
// // // // //             begin: Alignment.topCenter,
// // // // //             end: Alignment.bottomCenter,
// // // // //           ),
// // // // //         ),
// // // // //         child: SafeArea(
// // // // //           child: Column(
// // // // //             children: [
// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
// // // // //                 child: _buildHeader(),
// // // // //               ),
// // // // //               const SizedBox(height: 14),
// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.symmetric(horizontal: 18),
// // // // //                 child: _buildTopNavigator(),
// // // // //               ),
// // // // //               const SizedBox(height: 14),
// // // // //               Expanded(
// // // // //                 child: ListView(
// // // // //                   controller: _scrollController,
// // // // //                   padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
// // // // //                   children: [
// // // // //                     KeyedSubtree(
// // // // //                       key: _meditationKey,
// // // // //                       child: _buildMeditationSection(),
// // // // //                     ),
// // // // //                     const SizedBox(height: 16),
// // // // //                     KeyedSubtree(
// // // // //                       key: _exerciseKey,
// // // // //                       child: _buildExerciseSection(),
// // // // //                     ),
// // // // //                     const SizedBox(height: 16),
// // // // //                     KeyedSubtree(
// // // // //                       key: _relaxationKey,
// // // // //                       child: _buildRelaxationSection(),
// // // // //                     ),
// // // // //                     const SizedBox(height: 16),
// // // // //                     KeyedSubtree(
// // // // //                       key: _motivationKey,
// // // // //                       child: _buildMotivationSection(),
// // // // //                     ),
// // // // //                     const SizedBox(height: 16),
// // // // //                     KeyedSubtree(
// // // // //                       key: _spiritualKey,
// // // // //                       child: _buildSpiritualSection(),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildHeader() {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(20),
// // // // //       decoration: BoxDecoration(
// // // // //         gradient: const LinearGradient(
// // // // //           colors: [Color(0xFF4C9B7E), Color(0xFF69B291), Color(0xFF87C5A9)],
// // // // //           begin: Alignment.topLeft,
// // // // //           end: Alignment.bottomRight,
// // // // //         ),
// // // // //         borderRadius: BorderRadius.circular(28),
// // // // //         boxShadow: [
// // // // //           BoxShadow(
// // // // //             color: AppColors.primary.withOpacity(0.22),
// // // // //             blurRadius: 24,
// // // // //             offset: const Offset(0, 12),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Row(
// // // // //         children: [
// // // // //           Expanded(
// // // // //             child: Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: const [
// // // // //                 Text(
// // // // //                   'Good Morning, Sakshi 🌿',
// // // // //                   style: TextStyle(
// // // // //                     color: Colors.white,
// // // // //                     fontSize: 25,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                   ),
// // // // //                 ),
// // // // //                 SizedBox(height: 8),
// // // // //                 Text(
// // // // //                   'A calm space for meditation, movement, reflection and peace',
// // // // //                   style: TextStyle(
// // // // //                     color: Color(0xFFF3FFFA),
// // // // //                     fontSize: 14,
// // // // //                     height: 1.45,
// // // // //                     fontWeight: FontWeight.w600,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(width: 12),
// // // // //           Container(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// // // // //             decoration: BoxDecoration(
// // // // //               color: Colors.white.withOpacity(0.16),
// // // // //               borderRadius: BorderRadius.circular(18),
// // // // //             ),
// // // // //             child: Column(
// // // // //               children: const [
// // // // //                 Icon(Icons.eco_rounded, color: Colors.white),
// // // // //                 SizedBox(height: 6),
// // // // //                 Text(
// // // // //                   'Peace Mode',
// // // // //                   style: TextStyle(
// // // // //                     color: Colors.white,
// // // // //                     fontSize: 12.5,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildTopNavigator() {
// // // // //     final items = [
// // // // //       _TopItem('Meditation', Icons.self_improvement_rounded),
// // // // //       _TopItem('Exercise', Icons.directions_run_rounded),
// // // // //       _TopItem('Relax', Icons.spa_rounded),
// // // // //       _TopItem('Motivation', Icons.lightbulb_rounded),
// // // // //       _TopItem('Spiritual', Icons.auto_awesome_rounded),
// // // // //     ];

// // // // //     return SizedBox(
// // // // //       height: 56,
// // // // //       child: ListView.separated(
// // // // //         scrollDirection: Axis.horizontal,
// // // // //         itemCount: items.length,
// // // // //         separatorBuilder: (_, __) => const SizedBox(width: 10),
// // // // //         itemBuilder: (context, index) {
// // // // //           final selected = selectedTopTab == index;
// // // // //           return InkWell(
// // // // //             onTap: () {
// // // // //               switch (index) {
// // // // //                 case 0:
// // // // //                   _jumpTo(_meditationKey, index);
// // // // //                   break;
// // // // //                 case 1:
// // // // //                   _jumpTo(_exerciseKey, index);
// // // // //                   break;
// // // // //                 case 2:
// // // // //                   _jumpTo(_relaxationKey, index);
// // // // //                   break;
// // // // //                 case 3:
// // // // //                   _jumpTo(_motivationKey, index);
// // // // //                   break;
// // // // //                 case 4:
// // // // //                   _jumpTo(_spiritualKey, index);
// // // // //                   break;
// // // // //               }
// // // // //             },
// // // // //             borderRadius: BorderRadius.circular(18),
// // // // //             child: AnimatedContainer(
// // // // //               duration: const Duration(milliseconds: 220),
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // //               decoration: BoxDecoration(
// // // // //                 color: selected ? AppColors.primary : Colors.white,
// // // // //                 borderRadius: BorderRadius.circular(18),
// // // // //                 border: Border.all(
// // // // //                   color: selected ? AppColors.primary : AppColors.border,
// // // // //                 ),
// // // // //                 boxShadow: selected
// // // // //                     ? [
// // // // //                         BoxShadow(
// // // // //                           color: AppColors.primary.withOpacity(0.16),
// // // // //                           blurRadius: 16,
// // // // //                           offset: const Offset(0, 8),
// // // // //                         ),
// // // // //                       ]
// // // // //                     : [],
// // // // //               ),
// // // // //               child: Row(
// // // // //                 children: [
// // // // //                   Icon(
// // // // //                     items[index].icon,
// // // // //                     size: 18,
// // // // //                     color: selected ? Colors.white : AppColors.primaryDark,
// // // // //                   ),
// // // // //                   const SizedBox(width: 8),
// // // // //                   Text(
// // // // //                     items[index].label,
// // // // //                     style: TextStyle(
// // // // //                       color: selected ? Colors.white : AppColors.text,
// // // // //                       fontWeight: FontWeight.w800,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMeditationSection() {
// // // // //     return SectionBox(
// // // // //       title: 'Meditation',
// // // // //       subtitle: 'Start with one peaceful guided session',
// // // // //       tint: AppColors.meditation,
// // // // //       icon: Icons.self_improvement_rounded,
// // // // //       child: Column(
// // // // //         children: [
// // // // //           _buildPlayerCard(),
// // // // //           const SizedBox(height: 14),
// // // // //           _buildMeditationChoices(),
// // // // //           const SizedBox(height: 14),
// // // // //           _buildMediaGrid(meditationMedia),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildPlayerCard() {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(18),
// // // // //       decoration: BoxDecoration(
// // // // //         gradient: const LinearGradient(
// // // // //           colors: [Color(0xFF295C4C), Color(0xFF3E7B66), Color(0xFF66A586)],
// // // // //           begin: Alignment.topLeft,
// // // // //           end: Alignment.bottomRight,
// // // // //         ),
// // // // //         borderRadius: BorderRadius.circular(26),
// // // // //       ),
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Row(
// // // // //             children: [
// // // // //               const Icon(Icons.graphic_eq_rounded, color: Colors.white),
// // // // //               const SizedBox(width: 10),
// // // // //               Expanded(
// // // // //                 child: Text(
// // // // //                   '${selectedGoal.label} • ${selectedLength.minutes} min',
// // // // //                   style: const TextStyle(
// // // // //                     color: Colors.white,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                     fontSize: 15,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               Container(
// // // // //                 padding: const EdgeInsets.symmetric(
// // // // //                   horizontal: 12,
// // // // //                   vertical: 8,
// // // // //                 ),
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: Colors.white.withOpacity(0.14),
// // // // //                   borderRadius: BorderRadius.circular(14),
// // // // //                 ),
// // // // //                 child: Text(
// // // // //                   formatTime(elapsedSeconds),
// // // // //                   style: const TextStyle(
// // // // //                     color: Colors.white,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           const SizedBox(height: 18),
// // // // //           AnimatedContainer(
// // // // //             duration: const Duration(milliseconds: 1800),
// // // // //             curve: Curves.easeInOut,
// // // // //             width: 180 * breathingScale,
// // // // //             height: 180 * breathingScale,
// // // // //             decoration: BoxDecoration(
// // // // //               shape: BoxShape.circle,
// // // // //               gradient: RadialGradient(
// // // // //                 colors: [
// // // // //                   Colors.white.withOpacity(0.85),
// // // // //                   Colors.white.withOpacity(0.35),
// // // // //                   Colors.transparent,
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             child: Center(
// // // // //               child: Text(
// // // // //                 breathingText,
// // // // //                 style: const TextStyle(
// // // // //                   color: Colors.white,
// // // // //                   fontSize: 24,
// // // // //                   fontWeight: FontWeight.w800,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           const Text(
// // // // //             'Inhale • Hold • Exhale',
// // // // //             style: TextStyle(
// // // // //               color: Color(0xFFF0FFFA),
// // // // //               fontWeight: FontWeight.w600,
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 16),
// // // // //           Row(
// // // // //             children: [
// // // // //               Expanded(
// // // // //                 child: _actionButton(
// // // // //                   icon: !sessionStarted
// // // // //                       ? Icons.play_arrow_rounded
// // // // //                       : isPlaying
// // // // //                       ? Icons.pause_rounded
// // // // //                       : Icons.play_arrow_rounded,
// // // // //                   label: !sessionStarted
// // // // //                       ? 'Start'
// // // // //                       : isPlaying
// // // // //                       ? 'Pause'
// // // // //                       : 'Resume',
// // // // //                   primary: true,
// // // // //                   onTap: () {
// // // // //                     if (!sessionStarted) {
// // // // //                       startSession();
// // // // //                     } else if (isPlaying) {
// // // // //                       pauseSession();
// // // // //                     } else {
// // // // //                       resumeSession();
// // // // //                     }
// // // // //                   },
// // // // //                 ),
// // // // //               ),
// // // // //               const SizedBox(width: 12),
// // // // //               Expanded(
// // // // //                 child: _actionButton(
// // // // //                   icon: Icons.check_rounded,
// // // // //                   label: 'Complete',
// // // // //                   primary: false,
// // // // //                   onTap: completeSession,
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMeditationChoices() {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(16),
// // // // //       decoration: BoxDecoration(
// // // // //         color: AppColors.card,
// // // // //         borderRadius: BorderRadius.circular(22),
// // // // //         border: Border.all(color: AppColors.border),
// // // // //       ),
// // // // //       child: Column(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: [
// // // // //           const Text(
// // // // //             'Session setup',
// // // // //             style: TextStyle(
// // // // //               color: AppColors.text,
// // // // //               fontWeight: FontWeight.w800,
// // // // //               fontSize: 15,
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 12),
// // // // //           const Text(
// // // // //             'Duration',
// // // // //             style: TextStyle(
// // // // //               color: AppColors.subtext,
// // // // //               fontWeight: FontWeight.w700,
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 10),
// // // // //           Wrap(
// // // // //             spacing: 10,
// // // // //             runSpacing: 10,
// // // // //             children: SessionLength.values.map((len) {
// // // // //               final selected = selectedLength == len;
// // // // //               return _chip(
// // // // //                 label: '${len.minutes} min',
// // // // //                 selected: selected,
// // // // //                 onTap: () => setState(() => selectedLength = len),
// // // // //               );
// // // // //             }).toList(),
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           const Text(
// // // // //             'Goal',
// // // // //             style: TextStyle(
// // // // //               color: AppColors.subtext,
// // // // //               fontWeight: FontWeight.w700,
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 10),
// // // // //           Wrap(
// // // // //             spacing: 10,
// // // // //             runSpacing: 10,
// // // // //             children: SessionGoal.values.map((goal) {
// // // // //               final selected = selectedGoal == goal;
// // // // //               IconData icon = Icons.spa_rounded;
// // // // //               if (goal == SessionGoal.focus) icon = Icons.center_focus_strong;
// // // // //               if (goal == SessionGoal.sleep) icon = Icons.bedtime_rounded;
// // // // //               return _chip(
// // // // //                 label: goal.label,
// // // // //                 icon: icon,
// // // // //                 selected: selected,
// // // // //                 onTap: () => setState(() => selectedGoal = goal),
// // // // //               );
// // // // //             }).toList(),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildExerciseSection() {
// // // // //     return SectionBox(
// // // // //       title: 'Exercise',
// // // // //       subtitle: 'Light movement to relax the body and freshen the mind',
// // // // //       tint: AppColors.exercise,
// // // // //       icon: Icons.directions_run_rounded,
// // // // //       child: Column(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: [
// // // // //           Wrap(
// // // // //             spacing: 10,
// // // // //             runSpacing: 10,
// // // // //             children: exerciseOptions.map((option) {
// // // // //               final selected = selectedExercise == option;
// // // // //               return _chip(
// // // // //                 label: option,
// // // // //                 selected: selected,
// // // // //                 icon: Icons.self_improvement_rounded,
// // // // //                 onTap: () => setState(() => selectedExercise = option),
// // // // //               );
// // // // //             }).toList(),
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           const Text(
// // // // //             'Duration',
// // // // //             style: TextStyle(
// // // // //               color: AppColors.subtext,
// // // // //               fontWeight: FontWeight.w700,
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 10),
// // // // //           Wrap(
// // // // //             spacing: 10,
// // // // //             children: [5, 10, 15, 20].map((min) {
// // // // //               final selected = selectedExerciseMinutes == min;
// // // // //               return _chip(
// // // // //                 label: '$min min',
// // // // //                 selected: selected,
// // // // //                 onTap: () => setState(() => selectedExerciseMinutes = min),
// // // // //               );
// // // // //             }).toList(),
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           CustomCheckboxTile(
// // // // //             title: selectedExercise == null
// // // // //                 ? 'Mark exercise complete'
// // // // //                 : '$selectedExercise • $selectedExerciseMinutes min',
// // // // //             subtitle: selectedExercise == null
// // // // //                 ? 'Choose a simple movement above first.'
// // // // //                 : 'A small session is enough for a calmer day.',
// // // // //             value: exerciseCompleted,
// // // // //             onChanged: (v) {
// // // // //               setState(() {
// // // // //                 exerciseCompleted = v;
// // // // //                 if (!v) exerciseFeedback = null;
// // // // //               });
// // // // //             },
// // // // //           ),
// // // // //           AnimatedSwitcher(
// // // // //             duration: const Duration(milliseconds: 250),
// // // // //             child: exerciseCompleted
// // // // //                 ? Padding(
// // // // //                     padding: const EdgeInsets.only(top: 14),
// // // // //                     child: Row(
// // // // //                       children: [
// // // // //                         Expanded(child: _feedbackChip('Better', 'better')),
// // // // //                         const SizedBox(width: 10),
// // // // //                         Expanded(child: _feedbackChip('Same', 'same')),
// // // // //                         const SizedBox(width: 10),
// // // // //                         Expanded(child: _feedbackChip('Tired', 'tired')),
// // // // //                       ],
// // // // //                     ),
// // // // //                   )
// // // // //                 : const SizedBox.shrink(),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildRelaxationSection() {
// // // // //     return SectionBox(
// // // // //       title: 'Relaxation',
// // // // //       subtitle: 'Calm audio and soothing sessions for deep rest',
// // // // //       tint: AppColors.relaxation,
// // // // //       icon: Icons.spa_rounded,
// // // // //       child: _buildMediaGrid(relaxationMedia),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMotivationSection() {
// // // // //     return SectionBox(
// // // // //       title: 'Motivation',
// // // // //       subtitle: 'Books and videos that help you stay mentally strong',
// // // // //       tint: AppColors.motivation,
// // // // //       icon: Icons.lightbulb_rounded,
// // // // //       child: Column(
// // // // //         children: motivationSections.map((section) {
// // // // //           return Padding(
// // // // //             padding: const EdgeInsets.only(bottom: 14),
// // // // //             child: MotivationSectionCard(section: section, onOpen: openLink),
// // // // //           );
// // // // //         }).toList(),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildSpiritualSection() {
// // // // //     return SectionBox(
// // // // //       title: 'Spiritual',
// // // // //       subtitle:
// // // // //           'A separate space for faith, wisdom, reflection and inspiration',
// // // // //       tint: AppColors.spiritual,
// // // // //       icon: Icons.auto_awesome_rounded,
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Container(
// // // // //             width: double.infinity,
// // // // //             padding: const EdgeInsets.all(18),
// // // // //             decoration: BoxDecoration(
// // // // //               gradient: const LinearGradient(
// // // // //                 colors: [Color(0xFFEFFAF4), Color(0xFFF8FDF9)],
// // // // //               ),
// // // // //               borderRadius: BorderRadius.circular(22),
// // // // //               border: Border.all(color: AppColors.border),
// // // // //             ),
// // // // //             child: const Text(
// // // // //               'Let spiritual reading, devotional wisdom, and meaningful life stories become a calm part of your day. Explore books, explanations, and reflective videos in clearly separated categories.',
// // // // //               style: TextStyle(
// // // // //                 color: AppColors.text,
// // // // //                 fontSize: 14,
// // // // //                 height: 1.55,
// // // // //                 fontWeight: FontWeight.w700,
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           ...spiritualCategories.map((category) {
// // // // //             return Padding(
// // // // //               padding: const EdgeInsets.only(bottom: 14),
// // // // //               child: SpiritualCategoryCard(
// // // // //                 category: category,
// // // // //                 onOpen: openLink,
// // // // //               ),
// // // // //             );
// // // // //           }).toList(),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildMediaGrid(List<MediaItem> items) {
// // // // //     return Column(
// // // // //       children: items.map((item) {
// // // // //         return Padding(
// // // // //           padding: const EdgeInsets.only(bottom: 12),
// // // // //           child: Container(
// // // // //             padding: const EdgeInsets.all(14),
// // // // //             decoration: BoxDecoration(
// // // // //               color: Colors.white,
// // // // //               borderRadius: BorderRadius.circular(22),
// // // // //               border: Border.all(color: AppColors.border),
// // // // //             ),
// // // // //             child: Row(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 Container(
// // // // //                   width: 50,
// // // // //                   height: 50,
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: AppColors.softMint,
// // // // //                     borderRadius: BorderRadius.circular(16),
// // // // //                   ),
// // // // //                   child: Icon(item.icon, color: AppColors.primaryDark),
// // // // //                 ),
// // // // //                 const SizedBox(width: 12),
// // // // //                 Expanded(
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       Text(
// // // // //                         item.title,
// // // // //                         style: const TextStyle(
// // // // //                           color: AppColors.text,
// // // // //                           fontWeight: FontWeight.w800,
// // // // //                           fontSize: 15,
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(height: 5),
// // // // //                       Text(
// // // // //                         item.subtitle,
// // // // //                         style: const TextStyle(
// // // // //                           color: AppColors.subtext,
// // // // //                           fontSize: 12.8,
// // // // //                           height: 1.45,
// // // // //                           fontWeight: FontWeight.w600,
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(height: 10),
// // // // //                       Wrap(
// // // // //                         spacing: 8,
// // // // //                         children: [
// // // // //                           _smallTag(item.tag),
// // // // //                           _smallTag(item.duration),
// // // // //                         ],
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 10),
// // // // //                 InkWell(
// // // // //                   onTap: () => openLink(item.url),
// // // // //                   borderRadius: BorderRadius.circular(16),
// // // // //                   child: Container(
// // // // //                     padding: const EdgeInsets.all(12),
// // // // //                     decoration: BoxDecoration(
// // // // //                       color: AppColors.softMint,
// // // // //                       borderRadius: BorderRadius.circular(16),
// // // // //                     ),
// // // // //                     child: const Icon(
// // // // //                       Icons.play_arrow_rounded,
// // // // //                       color: AppColors.primaryDark,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         );
// // // // //       }).toList(),
// // // // //     );
// // // // //   }

// // // // //   Widget _chip({
// // // // //     required String label,
// // // // //     required bool selected,
// // // // //     required VoidCallback onTap,
// // // // //     IconData? icon,
// // // // //   }) {
// // // // //     return InkWell(
// // // // //       onTap: onTap,
// // // // //       borderRadius: BorderRadius.circular(16),
// // // // //       child: AnimatedContainer(
// // // // //         duration: const Duration(milliseconds: 220),
// // // // //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
// // // // //         decoration: BoxDecoration(
// // // // //           color: selected ? AppColors.primary : AppColors.chipBg,
// // // // //           borderRadius: BorderRadius.circular(16),
// // // // //           border: Border.all(
// // // // //             color: selected ? AppColors.primary : AppColors.border,
// // // // //           ),
// // // // //         ),
// // // // //         child: Row(
// // // // //           mainAxisSize: MainAxisSize.min,
// // // // //           children: [
// // // // //             if (icon != null) ...[
// // // // //               Icon(
// // // // //                 icon,
// // // // //                 size: 18,
// // // // //                 color: selected ? Colors.white : AppColors.primaryDark,
// // // // //               ),
// // // // //               const SizedBox(width: 8),
// // // // //             ],
// // // // //             Text(
// // // // //               label,
// // // // //               style: TextStyle(
// // // // //                 color: selected ? Colors.white : AppColors.text,
// // // // //                 fontWeight: FontWeight.w800,
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _feedbackChip(String label, String value) {
// // // // //     final selected = exerciseFeedback == value;
// // // // //     return InkWell(
// // // // //       onTap: () => setState(() => exerciseFeedback = value),
// // // // //       borderRadius: BorderRadius.circular(16),
// // // // //       child: AnimatedContainer(
// // // // //         duration: const Duration(milliseconds: 220),
// // // // //         padding: const EdgeInsets.symmetric(vertical: 13),
// // // // //         decoration: BoxDecoration(
// // // // //           color: selected ? AppColors.primary : Colors.white,
// // // // //           borderRadius: BorderRadius.circular(16),
// // // // //           border: Border.all(
// // // // //             color: selected ? AppColors.primary : AppColors.border,
// // // // //           ),
// // // // //         ),
// // // // //         child: Center(
// // // // //           child: Text(
// // // // //             label,
// // // // //             style: TextStyle(
// // // // //               color: selected ? Colors.white : AppColors.text,
// // // // //               fontWeight: FontWeight.w800,
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _actionButton({
// // // // //     required IconData icon,
// // // // //     required String label,
// // // // //     required bool primary,
// // // // //     required VoidCallback onTap,
// // // // //   }) {
// // // // //     return InkWell(
// // // // //       onTap: onTap,
// // // // //       borderRadius: BorderRadius.circular(18),
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.symmetric(vertical: 14),
// // // // //         decoration: BoxDecoration(
// // // // //           color: primary ? Colors.white : Colors.white.withOpacity(0.14),
// // // // //           borderRadius: BorderRadius.circular(18),
// // // // //           border: Border.all(
// // // // //             color: primary ? Colors.white : Colors.white.withOpacity(0.24),
// // // // //           ),
// // // // //         ),
// // // // //         child: Row(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             Icon(icon, color: primary ? AppColors.primaryDark : Colors.white),
// // // // //             const SizedBox(width: 8),
// // // // //             Text(
// // // // //               label,
// // // // //               style: TextStyle(
// // // // //                 color: primary ? AppColors.primaryDark : Colors.white,
// // // // //                 fontWeight: FontWeight.w800,
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _smallTag(String text) {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
// // // // //       decoration: BoxDecoration(
// // // // //         color: AppColors.softMint,
// // // // //         borderRadius: BorderRadius.circular(12),
// // // // //       ),
// // // // //       child: Text(
// // // // //         text,
// // // // //         style: const TextStyle(
// // // // //           color: AppColors.subtext,
// // // // //           fontWeight: FontWeight.w700,
// // // // //           fontSize: 12,
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class SectionBox extends StatelessWidget {
// // // // //   final String title;
// // // // //   final String subtitle;
// // // // //   final Color tint;
// // // // //   final IconData icon;
// // // // //   final Widget child;

// // // // //   const SectionBox({
// // // // //     super.key,
// // // // //     required this.title,
// // // // //     required this.subtitle,
// // // // //     required this.tint,
// // // // //     required this.icon,
// // // // //     required this.child,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(18),
// // // // //       decoration: BoxDecoration(
// // // // //         color: tint,
// // // // //         borderRadius: BorderRadius.circular(28),
// // // // //         border: Border.all(color: AppColors.border),
// // // // //         boxShadow: [
// // // // //           BoxShadow(
// // // // //             color: AppColors.primary.withOpacity(0.06),
// // // // //             blurRadius: 20,
// // // // //             offset: const Offset(0, 10),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Row(
// // // // //             children: [
// // // // //               Container(
// // // // //                 width: 44,
// // // // //                 height: 44,
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: Colors.white,
// // // // //                   borderRadius: BorderRadius.circular(16),
// // // // //                 ),
// // // // //                 child: Icon(icon, color: AppColors.primaryDark),
// // // // //               ),
// // // // //               const SizedBox(width: 12),
// // // // //               Expanded(
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       title,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.text,
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                         fontSize: 19,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 4),
// // // // //                     Text(
// // // // //                       subtitle,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.subtext,
// // // // //                         fontWeight: FontWeight.w600,
// // // // //                         fontSize: 13,
// // // // //                         height: 1.4,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           const SizedBox(height: 16),
// // // // //           child,
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class CustomCheckboxTile extends StatelessWidget {
// // // // //   final String title;
// // // // //   final String subtitle;
// // // // //   final bool value;
// // // // //   final ValueChanged<bool> onChanged;

// // // // //   const CustomCheckboxTile({
// // // // //     super.key,
// // // // //     required this.title,
// // // // //     required this.subtitle,
// // // // //     required this.value,
// // // // //     required this.onChanged,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return InkWell(
// // // // //       onTap: () => onChanged(!value),
// // // // //       borderRadius: BorderRadius.circular(20),
// // // // //       child: AnimatedContainer(
// // // // //         duration: const Duration(milliseconds: 220),
// // // // //         padding: const EdgeInsets.all(14),
// // // // //         decoration: BoxDecoration(
// // // // //           color: value ? AppColors.softMint : Colors.white,
// // // // //           borderRadius: BorderRadius.circular(20),
// // // // //           border: Border.all(
// // // // //             color: value ? AppColors.primary : AppColors.border,
// // // // //           ),
// // // // //         ),
// // // // //         child: Row(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             AnimatedContainer(
// // // // //               duration: const Duration(milliseconds: 220),
// // // // //               width: 24,
// // // // //               height: 24,
// // // // //               decoration: BoxDecoration(
// // // // //                 color: value ? AppColors.primary : Colors.transparent,
// // // // //                 borderRadius: BorderRadius.circular(8),
// // // // //                 border: Border.all(
// // // // //                   color: value ? AppColors.primary : AppColors.subtext,
// // // // //                   width: 1.6,
// // // // //                 ),
// // // // //               ),
// // // // //               child: value
// // // // //                   ? const Icon(Icons.check, size: 15, color: Colors.white)
// // // // //                   : null,
// // // // //             ),
// // // // //             const SizedBox(width: 12),
// // // // //             Expanded(
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 children: [
// // // // //                   Text(
// // // // //                     title,
// // // // //                     style: const TextStyle(
// // // // //                       color: AppColors.text,
// // // // //                       fontWeight: FontWeight.w800,
// // // // //                       fontSize: 15,
// // // // //                     ),
// // // // //                   ),
// // // // //                   const SizedBox(height: 4),
// // // // //                   Text(
// // // // //                     subtitle,
// // // // //                     style: const TextStyle(
// // // // //                       color: AppColors.subtext,
// // // // //                       fontSize: 12.8,
// // // // //                       height: 1.45,
// // // // //                       fontWeight: FontWeight.w600,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class MotivationSectionCard extends StatelessWidget {
// // // // //   final BookSection section;
// // // // //   final ValueChanged<String> onOpen;

// // // // //   const MotivationSectionCard({
// // // // //     super.key,
// // // // //     required this.section,
// // // // //     required this.onOpen,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(16),
// // // // //       decoration: BoxDecoration(
// // // // //         color: section.color,
// // // // //         borderRadius: BorderRadius.circular(24),
// // // // //         border: Border.all(color: AppColors.border),
// // // // //       ),
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Row(
// // // // //             children: [
// // // // //               Icon(section.icon, color: AppColors.primaryDark),
// // // // //               const SizedBox(width: 10),
// // // // //               Expanded(
// // // // //                 child: Text(
// // // // //                   section.title,
// // // // //                   style: const TextStyle(
// // // // //                     color: AppColors.text,
// // // // //                     fontSize: 17,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           ...section.books.map((book) {
// // // // //             return Padding(
// // // // //               padding: const EdgeInsets.only(bottom: 12),
// // // // //               child: Container(
// // // // //                 padding: const EdgeInsets.all(14),
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: Colors.white,
// // // // //                   borderRadius: BorderRadius.circular(20),
// // // // //                 ),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       book.title,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.text,
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                         fontSize: 15.5,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 4),
// // // // //                     Text(
// // // // //                       book.author,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.subtext,
// // // // //                         fontWeight: FontWeight.w700,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 8),
// // // // //                     Text(
// // // // //                       book.summary,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.subtext,
// // // // //                         fontSize: 13,
// // // // //                         height: 1.45,
// // // // //                         fontWeight: FontWeight.w600,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 10),
// // // // //                     ...book.links.map((link) {
// // // // //                       return Padding(
// // // // //                         padding: const EdgeInsets.only(bottom: 8),
// // // // //                         child: LinkTile(
// // // // //                           label: link.label,
// // // // //                           onTap: () => onOpen(link.url),
// // // // //                         ),
// // // // //                       );
// // // // //                     }).toList(),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             );
// // // // //           }).toList(),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class SpiritualCategoryCard extends StatelessWidget {
// // // // //   final SpiritualCategory category;
// // // // //   final ValueChanged<String> onOpen;

// // // // //   const SpiritualCategoryCard({
// // // // //     super.key,
// // // // //     required this.category,
// // // // //     required this.onOpen,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       padding: const EdgeInsets.all(16),
// // // // //       decoration: BoxDecoration(
// // // // //         color: category.color,
// // // // //         borderRadius: BorderRadius.circular(24),
// // // // //         border: Border.all(color: AppColors.border),
// // // // //       ),
// // // // //       child: Column(
// // // // //         children: [
// // // // //           Row(
// // // // //             children: [
// // // // //               Text(category.emoji, style: const TextStyle(fontSize: 24)),
// // // // //               const SizedBox(width: 10),
// // // // //               Expanded(
// // // // //                 child: Text(
// // // // //                   category.title,
// // // // //                   style: const TextStyle(
// // // // //                     color: AppColors.text,
// // // // //                     fontWeight: FontWeight.w800,
// // // // //                     fontSize: 17,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           const SizedBox(height: 14),
// // // // //           ...category.items.map((item) {
// // // // //             return Padding(
// // // // //               padding: const EdgeInsets.only(bottom: 12),
// // // // //               child: Container(
// // // // //                 padding: const EdgeInsets.all(14),
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: Colors.white,
// // // // //                   borderRadius: BorderRadius.circular(20),
// // // // //                 ),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       item.title,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.text,
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                         fontSize: 15.5,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 6),
// // // // //                     Text(
// // // // //                       item.description,
// // // // //                       style: const TextStyle(
// // // // //                         color: AppColors.subtext,
// // // // //                         height: 1.48,
// // // // //                         fontSize: 13,
// // // // //                         fontWeight: FontWeight.w600,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 10),
// // // // //                     Container(
// // // // //                       padding: const EdgeInsets.all(12),
// // // // //                       decoration: BoxDecoration(
// // // // //                         color: AppColors.softMint,
// // // // //                         borderRadius: BorderRadius.circular(16),
// // // // //                       ),
// // // // //                       child: Text(
// // // // //                         'Takeaway: ${item.lesson}',
// // // // //                         style: const TextStyle(
// // // // //                           color: AppColors.text,
// // // // //                           fontWeight: FontWeight.w700,
// // // // //                           fontSize: 13,
// // // // //                           height: 1.45,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 12),
// // // // //                     const Text(
// // // // //                       'Books & Reading',
// // // // //                       style: TextStyle(
// // // // //                         color: AppColors.text,
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 8),
// // // // //                     ...item.readingLinks.map((link) {
// // // // //                       return Padding(
// // // // //                         padding: const EdgeInsets.only(bottom: 8),
// // // // //                         child: LinkTile(
// // // // //                           label: link.label,
// // // // //                           onTap: () => onOpen(link.url),
// // // // //                         ),
// // // // //                       );
// // // // //                     }).toList(),
// // // // //                     const SizedBox(height: 4),
// // // // //                     const Text(
// // // // //                       'Videos & Stories',
// // // // //                       style: TextStyle(
// // // // //                         color: AppColors.text,
// // // // //                         fontWeight: FontWeight.w800,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 8),
// // // // //                     ...item.videoLinks.map((link) {
// // // // //                       return Padding(
// // // // //                         padding: const EdgeInsets.only(bottom: 8),
// // // // //                         child: LinkTile(
// // // // //                           label: link.label,
// // // // //                           onTap: () => onOpen(link.url),
// // // // //                         ),
// // // // //                       );
// // // // //                     }).toList(),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             );
// // // // //           }).toList(),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class LinkTile extends StatelessWidget {
// // // // //   final String label;
// // // // //   final VoidCallback onTap;

// // // // //   const LinkTile({super.key, required this.label, required this.onTap});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return InkWell(
// // // // //       onTap: onTap,
// // // // //       borderRadius: BorderRadius.circular(14),
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.all(12),
// // // // //         decoration: BoxDecoration(
// // // // //           color: AppColors.chipBg,
// // // // //           borderRadius: BorderRadius.circular(14),
// // // // //           border: Border.all(color: AppColors.border),
// // // // //         ),
// // // // //         child: Row(
// // // // //           children: [
// // // // //             const Icon(
// // // // //               Icons.link_rounded,
// // // // //               color: AppColors.primaryDark,
// // // // //               size: 18,
// // // // //             ),
// // // // //             const SizedBox(width: 10),
// // // // //             Expanded(
// // // // //               child: Text(
// // // // //                 label,
// // // // //                 style: const TextStyle(
// // // // //                   color: AppColors.text,
// // // // //                   fontWeight: FontWeight.w700,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const Icon(
// // // // //               Icons.open_in_new_rounded,
// // // // //               color: AppColors.subtext,
// // // // //               size: 18,
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _TopItem {
// // // // //   final String label;
// // // // //   final IconData icon;

// // // // //   _TopItem(this.label, this.icon);
// // // // // }

// // // // // enum SessionLength {
// // // // //   five(5),
// // // // //   ten(10),
// // // // //   fifteen(15);

// // // // //   final int minutes;
// // // // //   const SessionLength(this.minutes);
// // // // // }

// // // // // enum SessionGoal {
// // // // //   calm('Calm'),
// // // // //   focus('Focus'),
// // // // //   sleep('Sleep');

// // // // //   final String label;
// // // // //   const SessionGoal(this.label);
// // // // // }

// // // // // class MediaItem {
// // // // //   final String title;
// // // // //   final String subtitle;
// // // // //   final String tag;
// // // // //   final String duration;
// // // // //   final IconData icon;
// // // // //   final String url;

// // // // //   MediaItem({
// // // // //     required this.title,
// // // // //     required this.subtitle,
// // // // //     required this.tag,
// // // // //     required this.duration,
// // // // //     required this.icon,
// // // // //     required this.url,
// // // // //   });
// // // // // }

// // // // // class ExternalLink {
// // // // //   final String label;
// // // // //   final String url;

// // // // //   ExternalLink({required this.label, required this.url});
// // // // // }

// // // // // class BookItem {
// // // // //   final String title;
// // // // //   final String author;
// // // // //   final String summary;
// // // // //   final List<ExternalLink> links;

// // // // //   BookItem({
// // // // //     required this.title,
// // // // //     required this.author,
// // // // //     required this.summary,
// // // // //     required this.links,
// // // // //   });
// // // // // }

// // // // // class BookSection {
// // // // //   final String title;
// // // // //   final Color color;
// // // // //   final IconData icon;
// // // // //   final List<BookItem> books;

// // // // //   BookSection({
// // // // //     required this.title,
// // // // //     required this.color,
// // // // //     required this.icon,
// // // // //     required this.books,
// // // // //   });
// // // // // }

// // // // // class SpiritualEntry {
// // // // //   final String title;
// // // // //   final String description;
// // // // //   final String lesson;
// // // // //   final List<ExternalLink> readingLinks;
// // // // //   final List<ExternalLink> videoLinks;

// // // // //   SpiritualEntry({
// // // // //     required this.title,
// // // // //     required this.description,
// // // // //     required this.lesson,
// // // // //     required this.readingLinks,
// // // // //     required this.videoLinks,
// // // // //   });
// // // // // }

// // // // // class SpiritualCategory {
// // // // //   final String title;
// // // // //   final String emoji;
// // // // //   final Color color;
// // // // //   final List<SpiritualEntry> items;

// // // // //   SpiritualCategory({
// // // // //     required this.title,
// // // // //     required this.emoji,
// // // // //     required this.color,
// // // // //     required this.items,
// // // // //   });
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'dart:math' as math;

// // // // void main() {
// // // //   runApp(const MentalWellApp());
// // // // }

// // // // // --- MODELS (To avoid messy hardcoding in UI) ---
// // // // class SpiritualItem {
// // // //   final String title;
// // // //   final String category;
// // // //   final String motivation;
// // // //   final String imageUrl; // Placeholder for real images
// // // //   final String linkUrl;

// // // //   SpiritualItem({
// // // //     required this.title,
// // // //     required this.category,
// // // //     required this.motivation,
// // // //     required this.imageUrl,
// // // //     required this.linkUrl,
// // // //   });
// // // // }

// // // // class WellnessContent {
// // // //   final String title;
// // // //   final String duration;
// // // //   final IconData icon;

// // // //   WellnessContent({
// // // //     required this.title,
// // // //     required this.duration,
// // // //     required this.icon,
// // // //   });
// // // // }

// // // // class MentalWellApp extends StatelessWidget {
// // // //   const MentalWellApp({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       title: 'MentalWell',
// // // //       theme: ThemeData(
// // // //         scaffoldBackgroundColor: const Color(0xFFF9FAFB), // Soft off-white
// // // //         primaryColor: const Color(0xFFA8D5BA), // Soft pastel green
// // // //         colorScheme: ColorScheme.fromSeed(
// // // //           seedColor: const Color(0xFFA8D5BA),
// // // //           secondary: const Color(0xFFD1C4E9), // Soft lavender accent
// // // //         ),
// // // //         fontFamily: 'Inter', // Recommend adding Google Fonts
// // // //         useMaterial3: true,
// // // //       ),
// // // //       home: const MainNavigationScreen(),
// // // //     );
// // // //   }
// // // // }

// // // // class MainNavigationScreen extends StatefulWidget {
// // // //   const MainNavigationScreen({super.key});

// // // //   @override
// // // //   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// // // // }

// // // // class _MainNavigationScreenState extends State<MainNavigationScreen> {
// // // //   int _currentIndex = 0;

// // // //   final List<Widget> _screens = [
// // // //     const HomeScreen(),
// // // //     const ExploreScreen(),
// // // //     const SpiritualScreen(),
// // // //   ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: _screens[_currentIndex],
// // // //       bottomNavigationBar: NavigationBar(
// // // //         selectedIndex: _currentIndex,
// // // //         onDestinationSelected: (index) => setState(() => _currentIndex = index),
// // // //         backgroundColor: Colors.white,
// // // //         indicatorColor: Theme.of(
// // // //           context,
// // // //         ).colorScheme.secondary.withOpacity(0.5),
// // // //         destinations: const [
// // // //           NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
// // // //           NavigationDestination(
// // // //             icon: Icon(Icons.explore_outlined),
// // // //             label: 'Explore',
// // // //           ),
// // // //           NavigationDestination(
// // // //             icon: Icon(Icons.auto_awesome_outlined),
// // // //             label: 'Spiritual',
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // --- 1. HOME SCREEN (Mood & Breathing) ---
// // // // class HomeScreen extends StatelessWidget {
// // // //   const HomeScreen({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return SafeArea(
// // // //       child: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(24.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //               children: [
// // // //                 const Text(
// // // //                   "Good Morning",
// // // //                   style: TextStyle(
// // // //                     fontSize: 28,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     color: Color(0xFF2C3E50),
// // // //                   ),
// // // //                 ),
// // // //                 Container(
// // // //                   padding: const EdgeInsets.symmetric(
// // // //                     horizontal: 12,
// // // //                     vertical: 6,
// // // //                   ),
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.orange.shade100,
// // // //                     borderRadius: BorderRadius.circular(20),
// // // //                   ),
// // // //                   child: const Row(
// // // //                     children: [
// // // //                       Icon(
// // // //                         Icons.local_fire_department,
// // // //                         color: Colors.orange,
// // // //                         size: 18,
// // // //                       ),
// // // //                       SizedBox(width: 4),
// // // //                       Text(
// // // //                         "3 Day Streak",
// // // //                         style: TextStyle(fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 30),
// // // //             const Text(
// // // //               "How do you feel today?",
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //               children: [
// // // //                 _buildMoodBtn("😞", "Low"),
// // // //                 _buildMoodBtn("😐", "Okay"),
// // // //                 _buildMoodBtn("😊", "Great"),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 40),
// // // //             const Center(
// // // //               child: Text(
// // // //                 "Take a mindful minute",
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),
// // // //             const Center(child: BreathingWidget()),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildMoodBtn(String emoji, String label) {
// // // //     return Column(
// // // //       children: [
// // // //         Container(
// // // //           height: 65,
// // // //           width: 65,
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.white,
// // // //             shape: BoxShape.circle,
// // // //             boxShadow: [
// // // //               BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
// // // //             ],
// // // //           ),
// // // //           child: Center(
// // // //             child: Text(emoji, style: const TextStyle(fontSize: 32)),
// // // //           ),
// // // //         ),
// // // //         const SizedBox(height: 8),
// // // //         Text(label, style: const TextStyle(color: Colors.grey)),
// // // //       ],
// // // //     );
// // // //   }
// // // // }

// // // // // --- CORE FEATURE: Breathing Animation ---
// // // // class BreathingWidget extends StatefulWidget {
// // // //   const BreathingWidget({super.key});

// // // //   @override
// // // //   State<BreathingWidget> createState() => _BreathingWidgetState();
// // // // }

// // // // class _BreathingWidgetState extends State<BreathingWidget>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late AnimationController _controller;
// // // //   late Animation<double> _sizeAnimation;
// // // //   String _instruction = "Inhale";

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _controller = AnimationController(
// // // //       vsync: this,
// // // //       duration: const Duration(seconds: 4),
// // // //     );
// // // //     _sizeAnimation = Tween<double>(
// // // //       begin: 100.0,
// // // //       end: 250.0,
// // // //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

// // // //     _controller.addStatusListener((status) {
// // // //       if (status == AnimationStatus.completed) {
// // // //         setState(() => _instruction = "Hold");
// // // //         Future.delayed(const Duration(seconds: 2), () {
// // // //           if (mounted) {
// // // //             setState(() => _instruction = "Exhale");
// // // //             _controller.reverse();
// // // //           }
// // // //         });
// // // //       } else if (status == AnimationStatus.dismissed) {
// // // //         setState(() => _instruction = "Hold");
// // // //         Future.delayed(const Duration(seconds: 2), () {
// // // //           if (mounted) {
// // // //             setState(() => _instruction = "Inhale");
// // // //             _controller.forward();
// // // //           }
// // // //         });
// // // //       }
// // // //     });
// // // //     _controller.forward();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _controller.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return AnimatedBuilder(
// // // //       animation: _sizeAnimation,
// // // //       builder: (context, child) {
// // // //         return Container(
// // // //           width: 250,
// // // //           height: 250,
// // // //           alignment: Alignment.center,
// // // //           child: Container(
// // // //             width: _sizeAnimation.value,
// // // //             height: _sizeAnimation.value,
// // // //             decoration: BoxDecoration(
// // // //               shape: BoxShape.circle,
// // // //               color: Theme.of(context).primaryColor.withOpacity(0.3),
// // // //               border: Border.all(
// // // //                 color: Theme.of(context).primaryColor,
// // // //                 width: 2,
// // // //               ),
// // // //             ),
// // // //             child: Center(
// // // //               child: Text(
// // // //                 _instruction,
// // // //                 style: const TextStyle(
// // // //                   fontSize: 24,
// // // //                   fontWeight: FontWeight.w500,
// // // //                   color: Color(0xFF2C3E50),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // // // // --- 2. EXPLORE SCREEN (Music, Sleep, Movement) ---
// // // // class ExploreScreen extends StatelessWidget {
// // // //   const ExploreScreen({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final List<WellnessContent> sessions = [
// // // //       WellnessContent(
// // // //         title: "Deep Sleep Forest",
// // // //         duration: "10 min",
// // // //         icon: Icons.nightlight_round,
// // // //       ),
// // // //       WellnessContent(
// // // //         title: "Morning Stretch",
// // // //         duration: "5 min",
// // // //         icon: Icons.self_improvement,
// // // //       ),
// // // //       WellnessContent(
// // // //         title: "Focus White Noise",
// // // //         duration: "30 min",
// // // //         icon: Icons.headphones,
// // // //       ),
// // // //       WellnessContent(
// // // //         title: "Mindful Walking",
// // // //         duration: "15 min",
// // // //         icon: Icons.directions_walk,
// // // //       ),
// // // //     ];

// // // //     return SafeArea(
// // // //       child: ListView(
// // // //         padding: const EdgeInsets.all(24.0),
// // // //         children: [
// // // //           const Text(
// // // //             "Explore",
// // // //             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// // // //           ),
// // // //           const SizedBox(height: 20),
// // // //           // Goal Chips
// // // //           SingleChildScrollView(
// // // //             scrollDirection: Axis.horizontal,
// // // //             child: Row(
// // // //               children: [
// // // //                 _buildChip("Calm", true, context),
// // // //                 _buildChip("Focus", false, context),
// // // //                 _buildChip("Sleep", false, context),
// // // //                 _buildChip("Move", false, context),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //           const SizedBox(height: 30),
// // // //           const Text(
// // // //             "Recommended for you",
// // // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // // //           ),
// // // //           const SizedBox(height: 16),
// // // //           GridView.builder(
// // // //             shrinkWrap: true,
// // // //             physics: const NeverScrollableScrollPhysics(),
// // // //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // //               crossAxisCount: 2,
// // // //               crossAxisSpacing: 16,
// // // //               mainAxisSpacing: 16,
// // // //               childAspectRatio: 0.9,
// // // //             ),
// // // //             itemCount: sessions.length,
// // // //             itemBuilder: (context, index) {
// // // //               final item = sessions[index];
// // // //               return Container(
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.white,
// // // //                   borderRadius: BorderRadius.circular(20),
// // // //                   boxShadow: [
// // // //                     BoxShadow(
// // // //                       color: Colors.black.withOpacity(0.03),
// // // //                       blurRadius: 8,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 child: Padding(
// // // //                   padding: const EdgeInsets.all(16.0),
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Icon(
// // // //                         item.icon,
// // // //                         size: 40,
// // // //                         color: Theme.of(context).primaryColor,
// // // //                       ),
// // // //                       Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           Text(
// // // //                             item.title,
// // // //                             style: const TextStyle(
// // // //                               fontWeight: FontWeight.bold,
// // // //                               fontSize: 16,
// // // //                             ),
// // // //                           ),
// // // //                           const SizedBox(height: 4),
// // // //                           Text(
// // // //                             item.duration,
// // // //                             style: const TextStyle(
// // // //                               color: Colors.grey,
// // // //                               fontSize: 12,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                       Align(
// // // //                         alignment: Alignment.bottomRight,
// // // //                         child: CircleAvatar(
// // // //                           backgroundColor: Theme.of(context).primaryColor,
// // // //                           radius: 18,
// // // //                           child: const Icon(
// // // //                             Icons.play_arrow,
// // // //                             color: Colors.white,
// // // //                             size: 20,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               );
// // // //             },
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildChip(String label, bool isSelected, BuildContext context) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.only(right: 12),
// // // //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// // // //       decoration: BoxDecoration(
// // // //         color: isSelected ? Theme.of(context).primaryColor : Colors.white,
// // // //         borderRadius: BorderRadius.circular(20),
// // // //         border: Border.all(
// // // //           color: isSelected ? Colors.transparent : Colors.grey.shade300,
// // // //         ),
// // // //       ),
// // // //       child: Text(
// // // //         label,
// // // //         style: TextStyle(
// // // //           color: isSelected ? Colors.white : Colors.black87,
// // // //           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // --- 3. SPIRITUAL & MOTIVATION SCREEN ---
// // // // class SpiritualScreen extends StatelessWidget {
// // // //   const SpiritualScreen({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // Dynamic Data Mapping
// // // //     final List<SpiritualItem> items = [
// // // //       SpiritualItem(
// // // //         title: "Bhagavad Gita",
// // // //         category: "Epics",
// // // //         motivation:
// // // //             "Find your duty and perform it without attachment to the outcome. Ultimate guide to life management.",
// // // //         imageUrl: "assets/gita.jpg",
// // // //         linkUrl: "https://youtube.com/...",
// // // //       ),
// // // //       SpiritualItem(
// // // //         title: "Chhatrapati Shivaji Maharaj",
// // // //         category: "History",
// // // //         motivation:
// // // //             "Learn strategic thinking, profound leadership, and unyielding courage in the face of impossible odds.",
// // // //         imageUrl: "assets/shivaji.jpg",
// // // //         linkUrl: "https://youtube.com/...",
// // // //       ),
// // // //       SpiritualItem(
// // // //         title: "Shyamchi Aai",
// // // //         category: "Literature",
// // // //         motivation:
// // // //             "A deeply moving autobiography detailing the profound impact of a mother's unconditional love and moral teachings.",
// // // //         imageUrl: "assets/shyam.jpg",
// // // //         linkUrl: "https://youtube.com/...",
// // // //       ),
// // // //     ];

// // // //     return DefaultTabController(
// // // //       length: 3,
// // // //       child: Scaffold(
// // // //         appBar: AppBar(
// // // //           backgroundColor: Colors.white,
// // // //           elevation: 0,
// // // //           title: const Text(
// // // //             "Spiritual & Historical Wisdom",
// // // //             style: TextStyle(
// // // //               color: Colors.black87,
// // // //               fontWeight: FontWeight.bold,
// // // //             ),
// // // //           ),
// // // //           bottom: TabBar(
// // // //             labelColor: Theme.of(context).primaryColor,
// // // //             unselectedLabelColor: Colors.grey,
// // // //             indicatorColor: Theme.of(context).primaryColor,
// // // //             tabs: const [
// // // //               Tab(text: "God & Epics"),
// // // //               Tab(text: "History"),
// // // //               Tab(text: "Motivators"),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //         body: TabBarView(
// // // //           children: [
// // // //             _buildSpiritualList(
// // // //               items.where((i) => i.category == "Epics").toList(),
// // // //               context,
// // // //             ),
// // // //             _buildSpiritualList(
// // // //               items.where((i) => i.category == "History").toList(),
// // // //               context,
// // // //             ),
// // // //             _buildSpiritualList(
// // // //               items.where((i) => i.category == "Literature").toList(),
// // // //               context,
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildSpiritualList(List<SpiritualItem> items, BuildContext context) {
// // // //     return ListView.builder(
// // // //       padding: const EdgeInsets.all(16),
// // // //       itemCount: items.length,
// // // //       itemBuilder: (context, index) {
// // // //         final item = items[index];
// // // //         return Card(
// // // //           elevation: 0,
// // // //           margin: const EdgeInsets.only(bottom: 16),
// // // //           shape: RoundedRectangleBorder(
// // // //             borderRadius: BorderRadius.circular(16),
// // // //           ),
// // // //           color: Colors.white,
// // // //           child: Padding(
// // // //             padding: const EdgeInsets.all(16.0),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Row(
// // // //                   children: [
// // // //                     Container(
// // // //                       height: 60,
// // // //                       width: 60,
// // // //                       decoration: BoxDecoration(
// // // //                         color: Theme.of(
// // // //                           context,
// // // //                         ).colorScheme.secondary.withOpacity(0.3),
// // // //                         borderRadius: BorderRadius.circular(12),
// // // //                       ),
// // // //                       child: const Icon(
// // // //                         Icons.menu_book,
// // // //                         color: Colors.deepPurple,
// // // //                       ), // Replace with NetworkImage in prod
// // // //                     ),
// // // //                     const SizedBox(width: 16),
// // // //                     Expanded(
// // // //                       child: Text(
// // // //                         item.title,
// // // //                         style: const TextStyle(
// // // //                           fontSize: 18,
// // // //                           fontWeight: FontWeight.bold,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 12),
// // // //                 Text(
// // // //                   "Motivation: ${item.motivation}",
// // // //                   style: TextStyle(color: Colors.grey.shade700, height: 1.4),
// // // //                 ),
// // // //                 const SizedBox(height: 16),
// // // //                 Row(
// // // //                   children: [
// // // //                     OutlinedButton.icon(
// // // //                       onPressed: () {
// // // //                         /* Add url_launcher logic here */
// // // //                       },
// // // //                       icon: const Icon(
// // // //                         Icons.play_circle_fill,
// // // //                         color: Colors.red,
// // // //                       ),
// // // //                       label: const Text("Watch Story"),
// // // //                     ),
// // // //                     const SizedBox(width: 12),
// // // //                     TextButton.icon(
// // // //                       onPressed: () {},
// // // //                       icon: const Icon(Icons.book),
// // // //                       label: const Text("Read Details"),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'dart:math' as math;

// // // void main() {
// // //   runApp(const MentalWellApp());
// // // }

// // // // --- MODELS ---
// // // class SpiritualItem {
// // //   final String title;
// // //   final String category;
// // //   final String motivation;
// // //   final String imageUrl;
// // //   final String linkUrl;

// // //   SpiritualItem({
// // //     required this.title,
// // //     required this.category,
// // //     required this.motivation,
// // //     required this.imageUrl,
// // //     required this.linkUrl,
// // //   });
// // // }

// // // class WellnessContent {
// // //   final String title;
// // //   final String duration;
// // //   final IconData icon;

// // //   WellnessContent({
// // //     required this.title,
// // //     required this.duration,
// // //     required this.icon,
// // //   });
// // // }

// // // class MentalWellApp extends StatelessWidget {
// // //   const MentalWellApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       title: 'MentalWell',
// // //       theme: ThemeData(
// // //         scaffoldBackgroundColor: const Color(0xFFF9FAFB), // Soft off-white
// // //         primaryColor: const Color(0xFF68A678), // Earthy Moss Green
// // //         colorScheme: ColorScheme.fromSeed(
// // //           seedColor: const Color(0xFF68A678),
// // //           secondary: const Color(0xFFD1C4E9), // Soft lavender accent
// // //         ),
// // //         fontFamily: 'Inter',
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MainNavigationScreen(),
// // //     );
// // //   }
// // // }

// // // class MainNavigationScreen extends StatefulWidget {
// // //   const MainNavigationScreen({super.key});

// // //   @override
// // //   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// // // }

// // // class _MainNavigationScreenState extends State<MainNavigationScreen> {
// // //   int _currentIndex = 0;

// // //   final List<Widget> _screens = [
// // //     const HomeScreen(),
// // //     const ExploreScreen(),
// // //     const SpiritualScreen(),
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: _screens[_currentIndex],
// // //       bottomNavigationBar: NavigationBar(
// // //         selectedIndex: _currentIndex,
// // //         onDestinationSelected: (index) => setState(() => _currentIndex = index),
// // //         backgroundColor: Colors.white,
// // //         indicatorColor: Theme.of(
// // //           context,
// // //         ).colorScheme.secondary.withOpacity(0.5),
// // //         destinations: const [
// // //           NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
// // //           NavigationDestination(
// // //             icon: Icon(Icons.explore_outlined),
// // //             label: 'Explore',
// // //           ),
// // //           NavigationDestination(
// // //             icon: Icon(Icons.auto_awesome_outlined),
// // //             label: 'Spiritual',
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // --- 1. HOME SCREEN (Mood & Breathing) ---
// // // class HomeScreen extends StatelessWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SafeArea(
// // //       child: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(24.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 const Text(
// // //                   "Good Morning",
// // //                   style: TextStyle(
// // //                     fontSize: 28,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Color(0xFF2C3E50),
// // //                   ),
// // //                 ),
// // //                 Container(
// // //                   padding: const EdgeInsets.symmetric(
// // //                     horizontal: 12,
// // //                     vertical: 6,
// // //                   ),
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.orange.shade100,
// // //                     borderRadius: BorderRadius.circular(20),
// // //                   ),
// // //                   child: const Row(
// // //                     children: [
// // //                       Icon(
// // //                         Icons.local_fire_department,
// // //                         color: Colors.orange,
// // //                         size: 18,
// // //                       ),
// // //                       SizedBox(width: 4),
// // //                       Text(
// // //                         "3 Day Streak",
// // //                         style: TextStyle(fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 30),
// // //             const Text(
// // //               "How do you feel today?",
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //               children: [
// // //                 _buildMoodBtn("😞", "Low"),
// // //                 _buildMoodBtn("😐", "Okay"),
// // //                 _buildMoodBtn("😊", "Great"),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 40),
// // //             const Center(
// // //               child: Text(
// // //                 "Take a mindful minute",
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             const Center(child: BreathingWidget()),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildMoodBtn(String emoji, String label) {
// // //     return Column(
// // //       children: [
// // //         Container(
// // //           height: 65,
// // //           width: 65,
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             shape: BoxShape.circle,
// // //             boxShadow: [
// // //               BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
// // //             ],
// // //           ),
// // //           child: Center(
// // //             child: Text(emoji, style: const TextStyle(fontSize: 32)),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 8),
// // //         Text(label, style: const TextStyle(color: Colors.grey)),
// // //       ],
// // //     );
// // //   }
// // // }

// // // // --- CORE FEATURE: Breathing Animation ---
// // // class BreathingWidget extends StatefulWidget {
// // //   const BreathingWidget({super.key});

// // //   @override
// // //   State<BreathingWidget> createState() => _BreathingWidgetState();
// // // }

// // // class _BreathingWidgetState extends State<BreathingWidget>
// // //     with SingleTickerProviderStateMixin {
// // //   late AnimationController _controller;
// // //   late Animation<double> _sizeAnimation;
// // //   String _instruction = "Inhale";

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _controller = AnimationController(
// // //       vsync: this,
// // //       duration: const Duration(seconds: 4),
// // //     );
// // //     _sizeAnimation = Tween<double>(
// // //       begin: 100.0,
// // //       end: 250.0,
// // //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

// // //     _controller.addStatusListener((status) {
// // //       if (status == AnimationStatus.completed) {
// // //         setState(() => _instruction = "Hold");
// // //         Future.delayed(const Duration(seconds: 2), () {
// // //           if (mounted) {
// // //             setState(() => _instruction = "Exhale");
// // //             _controller.reverse();
// // //           }
// // //         });
// // //       } else if (status == AnimationStatus.dismissed) {
// // //         setState(() => _instruction = "Hold");
// // //         Future.delayed(const Duration(seconds: 2), () {
// // //           if (mounted) {
// // //             setState(() => _instruction = "Inhale");
// // //             _controller.forward();
// // //           }
// // //         });
// // //       }
// // //     });
// // //     _controller.forward();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AnimatedBuilder(
// // //       animation: _sizeAnimation,
// // //       builder: (context, child) {
// // //         return Container(
// // //           width: 250,
// // //           height: 250,
// // //           alignment: Alignment.center,
// // //           child: Container(
// // //             width: _sizeAnimation.value,
// // //             height: _sizeAnimation.value,
// // //             decoration: BoxDecoration(
// // //               shape: BoxShape.circle,
// // //               color: Theme.of(context).primaryColor.withOpacity(0.3),
// // //               border: Border.all(
// // //                 color: Theme.of(context).primaryColor,
// // //                 width: 2,
// // //               ),
// // //             ),
// // //             child: Center(
// // //               child: Text(
// // //                 _instruction,
// // //                 style: const TextStyle(
// // //                   fontSize: 24,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: Color(0xFF2C3E50),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // // // --- 2. EXPLORE SCREEN (Music, Sleep, Movement) ---
// // // class ExploreScreen extends StatelessWidget {
// // //   const ExploreScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final List<WellnessContent> sessions = [
// // //       WellnessContent(
// // //         title: "Deep Sleep Forest",
// // //         duration: "10 min",
// // //         icon: Icons.nightlight_round,
// // //       ),
// // //       WellnessContent(
// // //         title: "Morning Stretch",
// // //         duration: "5 min",
// // //         icon: Icons.self_improvement,
// // //       ),
// // //       WellnessContent(
// // //         title: "Focus White Noise",
// // //         duration: "30 min",
// // //         icon: Icons.headphones,
// // //       ),
// // //       WellnessContent(
// // //         title: "Mindful Walking",
// // //         duration: "15 min",
// // //         icon: Icons.directions_walk,
// // //       ),
// // //     ];

// // //     return SafeArea(
// // //       child: ListView(
// // //         padding: const EdgeInsets.all(24.0),
// // //         children: [
// // //           const Text(
// // //             "Explore",
// // //             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// // //           ),
// // //           const SizedBox(height: 20),
// // //           // Goal Chips
// // //           SingleChildScrollView(
// // //             scrollDirection: Axis.horizontal,
// // //             child: Row(
// // //               children: [
// // //                 _buildChip("Calm", true, context),
// // //                 _buildChip("Focus", false, context),
// // //                 _buildChip("Sleep", false, context),
// // //                 _buildChip("Move", false, context),
// // //               ],
// // //             ),
// // //           ),
// // //           const SizedBox(height: 30),
// // //           const Text(
// // //             "Recommended for you",
// // //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //           ),
// // //           const SizedBox(height: 16),
// // //           GridView.builder(
// // //             shrinkWrap: true,
// // //             physics: const NeverScrollableScrollPhysics(),
// // //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //               crossAxisCount: 2,
// // //               crossAxisSpacing: 16,
// // //               mainAxisSpacing: 16,
// // //               childAspectRatio: 0.9,
// // //             ),
// // //             itemCount: sessions.length,
// // //             itemBuilder: (context, index) {
// // //               final item = sessions[index];
// // //               return Container(
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.white,
// // //                   borderRadius: BorderRadius.circular(20),
// // //                   boxShadow: [
// // //                     BoxShadow(
// // //                       color: Colors.black.withOpacity(0.03),
// // //                       blurRadius: 8,
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.all(16.0),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Icon(
// // //                         item.icon,
// // //                         size: 40,
// // //                         color: Theme.of(context).primaryColor,
// // //                       ),
// // //                       Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text(
// // //                             item.title,
// // //                             style: const TextStyle(
// // //                               fontWeight: FontWeight.bold,
// // //                               fontSize: 16,
// // //                             ),
// // //                           ),
// // //                           const SizedBox(height: 4),
// // //                           Text(
// // //                             item.duration,
// // //                             style: const TextStyle(
// // //                               color: Colors.grey,
// // //                               fontSize: 12,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       Align(
// // //                         alignment: Alignment.bottomRight,
// // //                         child: CircleAvatar(
// // //                           backgroundColor: Theme.of(context).primaryColor,
// // //                           radius: 18,
// // //                           child: const Icon(
// // //                             Icons.play_arrow,
// // //                             color: Colors.white,
// // //                             size: 20,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildChip(String label, bool isSelected, BuildContext context) {
// // //     return Container(
// // //       margin: const EdgeInsets.only(right: 12),
// // //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// // //       decoration: BoxDecoration(
// // //         color: isSelected ? Theme.of(context).primaryColor : Colors.white,
// // //         borderRadius: BorderRadius.circular(20),
// // //         border: Border.all(
// // //           color: isSelected ? Colors.transparent : Colors.grey.shade300,
// // //         ),
// // //       ),
// // //       child: Text(
// // //         label,
// // //         style: TextStyle(
// // //           color: isSelected ? Colors.white : Colors.black87,
// // //           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // --- 3. SPIRITUAL & MOTIVATION SCREEN ---
// // // class SpiritualScreen extends StatelessWidget {
// // //   const SpiritualScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final List<SpiritualItem> items = [
// // //       SpiritualItem(
// // //         title: "Bhagavad Gita",
// // //         category: "Epics",
// // //         motivation:
// // //             "Find your duty and perform it without attachment to the outcome. Ultimate guide to life management.",
// // //         imageUrl: "assets/gita.jpg",
// // //         linkUrl: "https://youtube.com/...",
// // //       ),
// // //       SpiritualItem(
// // //         title: "Chhatrapati Shivaji Maharaj",
// // //         category: "History",
// // //         motivation:
// // //             "Learn strategic thinking, profound leadership, and unyielding courage in the face of impossible odds.",
// // //         imageUrl: "assets/shivaji.jpg",
// // //         linkUrl: "https://youtube.com/...",
// // //       ),
// // //       SpiritualItem(
// // //         title: "Shyamchi Aai",
// // //         category: "Literature",
// // //         motivation:
// // //             "A deeply moving autobiography detailing the profound impact of a mother's unconditional love and moral teachings.",
// // //         imageUrl: "assets/shyam.jpg",
// // //         linkUrl: "https://youtube.com/...",
// // //       ),
// // //     ];

// // //     return DefaultTabController(
// // //       length: 3,
// // //       child: Scaffold(
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.white,
// // //           elevation: 0,
// // //           title: const Text(
// // //             "Spiritual & Historical Wisdom",
// // //             style: TextStyle(
// // //               color: Colors.black87,
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //           ),
// // //           bottom: TabBar(
// // //             labelColor: Theme.of(context).primaryColor,
// // //             unselectedLabelColor: Colors.grey,
// // //             indicatorColor: Theme.of(context).primaryColor,
// // //             tabs: const [
// // //               Tab(text: "God & Epics"),
// // //               Tab(text: "History"),
// // //               Tab(text: "Motivators"),
// // //             ],
// // //           ),
// // //         ),
// // //         body: TabBarView(
// // //           children: [
// // //             _buildSpiritualList(
// // //               items.where((i) => i.category == "Epics").toList(),
// // //               context,
// // //             ),
// // //             _buildSpiritualList(
// // //               items.where((i) => i.category == "History").toList(),
// // //               context,
// // //             ),
// // //             _buildSpiritualList(
// // //               items.where((i) => i.category == "Literature").toList(),
// // //               context,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSpiritualList(List<SpiritualItem> items, BuildContext context) {
// // //     return ListView.builder(
// // //       padding: const EdgeInsets.all(16),
// // //       itemCount: items.length,
// // //       itemBuilder: (context, index) {
// // //         final item = items[index];
// // //         return Card(
// // //           elevation: 0,
// // //           margin: const EdgeInsets.only(bottom: 16),
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(16),
// // //           ),
// // //           color: Colors.white,
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(16.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   children: [
// // //                     Container(
// // //                       height: 60,
// // //                       width: 60,
// // //                       decoration: BoxDecoration(
// // //                         color: Theme.of(
// // //                           context,
// // //                         ).colorScheme.secondary.withOpacity(0.3),
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       child: const Icon(
// // //                         Icons.menu_book,
// // //                         color: Colors.deepPurple,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 16),
// // //                     Expanded(
// // //                       child: Text(
// // //                         item.title,
// // //                         style: const TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 12),
// // //                 Text(
// // //                   "Motivation: ${item.motivation}",
// // //                   style: TextStyle(color: Colors.grey.shade700, height: 1.4),
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 Row(
// // //                   children: [
// // //                     OutlinedButton.icon(
// // //                       onPressed: () {
// // //                         /* Add url_launcher logic here */
// // //                       },
// // //                       icon: const Icon(
// // //                         Icons.play_circle_fill,
// // //                         color: Colors.red,
// // //                       ),
// // //                       label: const Text("Watch Story"),
// // //                     ),
// // //                     const SizedBox(width: 12),
// // //                     TextButton.icon(
// // //                       onPressed: () {},
// // //                       icon: const Icon(Icons.book, color: Color(0xFF68A678)),
// // //                       label: const Text(
// // //                         "Read Details",
// // //                         style: TextStyle(color: Color(0xFF68A678)),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // import 'dart:async';
// // import 'dart:math' as math;
// // import 'package:flutter/material.dart';
// // import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// // void main() {
// //   runApp(const MentalWellApp());
// // }

// // class MentalWellApp extends StatelessWidget {
// //   const MentalWellApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'MentalWell',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         useMaterial3: true,
// //         fontFamily: 'Inter',
// //         scaffoldBackgroundColor: const Color(0xFFF7F8F5),
// //         colorScheme:
// //             ColorScheme.fromSeed(
// //               seedColor: const Color(0xFF6C9A7C),
// //               brightness: Brightness.light,
// //             ).copyWith(
// //               primary: const Color(0xFF6C9A7C),
// //               secondary: const Color(0xFFD8CCE7),
// //               surface: Colors.white,
// //             ),
// //       ),
// //       home: const MainNavigationScreen(),
// //     );
// //   }
// // }

// // enum MoodType { low, okay, great }

// // enum GoalType { calm, focus, sleep, move }

// // enum ContentType {
// //   breathing,
// //   music,
// //   sleepStory,
// //   movement,
// //   spiritual,
// //   guidedTalk,
// // }

// // enum SpiritualCategory { god, epics, history, motivators, autobiographies }

// // extension MoodTypeX on MoodType {
// //   String get label {
// //     switch (this) {
// //       case MoodType.low:
// //         return "Low";
// //       case MoodType.okay:
// //         return "Okay";
// //       case MoodType.great:
// //         return "Great";
// //     }
// //   }

// //   String get emoji {
// //     switch (this) {
// //       case MoodType.low:
// //         return "😞";
// //       case MoodType.okay:
// //         return "😐";
// //       case MoodType.great:
// //         return "😊";
// //     }
// //   }
// // }

// // extension GoalTypeX on GoalType {
// //   String get label {
// //     switch (this) {
// //       case GoalType.calm:
// //         return "Calm";
// //       case GoalType.focus:
// //         return "Focus";
// //       case GoalType.sleep:
// //         return "Sleep";
// //       case GoalType.move:
// //         return "Move";
// //     }
// //   }

// //   IconData get icon {
// //     switch (this) {
// //       case GoalType.calm:
// //         return Icons.spa_outlined;
// //       case GoalType.focus:
// //         return Icons.psychology_alt_outlined;
// //       case GoalType.sleep:
// //         return Icons.nightlight_round;
// //       case GoalType.move:
// //         return Icons.directions_walk_outlined;
// //     }
// //   }
// // }

// // extension SpiritualCategoryX on SpiritualCategory {
// //   String get label {
// //     switch (this) {
// //       case SpiritualCategory.god:
// //         return "God";
// //       case SpiritualCategory.epics:
// //         return "Epics";
// //       case SpiritualCategory.history:
// //         return "History";
// //       case SpiritualCategory.motivators:
// //         return "Motivators";
// //       case SpiritualCategory.autobiographies:
// //         return "Autobiographies";
// //     }
// //   }

// //   IconData get icon {
// //     switch (this) {
// //       case SpiritualCategory.god:
// //         return Icons.auto_awesome;
// //       case SpiritualCategory.epics:
// //         return Icons.menu_book_rounded;
// //       case SpiritualCategory.history:
// //         return Icons.fort_outlined;
// //       case SpiritualCategory.motivators:
// //         return Icons.emoji_events_outlined;
// //       case SpiritualCategory.autobiographies:
// //         return Icons.library_books_outlined;
// //     }
// //   }
// // }

// // class WellnessStats {
// //   int streakDays;
// //   int totalMinutes;
// //   int sessionsCompleted;
// //   int bedtimeReminders;
// //   MoodType? lastMood;

// //   WellnessStats({
// //     required this.streakDays,
// //     required this.totalMinutes,
// //     required this.sessionsCompleted,
// //     required this.bedtimeReminders,
// //     this.lastMood,
// //   });
// // }

// // class WellnessSession {
// //   final String id;
// //   final String title;
// //   final String subtitle;
// //   final GoalType goal;
// //   final ContentType type;
// //   final int durationMinutes;
// //   final String youtubeId;
// //   final IconData icon;
// //   final List<String> tags;
// //   final String description;
// //   final List<Color> palette;
// //   final bool recommendedForLowMood;
// //   final bool supportsAudioOnly;

// //   WellnessSession({
// //     required this.id,
// //     required this.title,
// //     required this.subtitle,
// //     required this.goal,
// //     required this.type,
// //     required this.durationMinutes,
// //     required this.youtubeId,
// //     required this.icon,
// //     required this.tags,
// //     required this.description,
// //     required this.palette,
// //     this.recommendedForLowMood = false,
// //     this.supportsAudioOnly = true,
// //   });
// // }

// // class SpiritualResource {
// //   final String title;
// //   final SpiritualCategory category;
// //   final String subtitle;
// //   final String lesson;
// //   final String quote;
// //   final String description;
// //   final String bookLink;
// //   final String googleLink;
// //   final String youtubeLink;
// //   final String visualTitle;

// //   SpiritualResource({
// //     required this.title,
// //     required this.category,
// //     required this.subtitle,
// //     required this.lesson,
// //     required this.quote,
// //     required this.description,
// //     required this.bookLink,
// //     required this.googleLink,
// //     required this.youtubeLink,
// //     required this.visualTitle,
// //   });
// // }

// // class MainNavigationScreen extends StatefulWidget {
// //   const MainNavigationScreen({super.key});

// //   @override
// //   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// // }

// // class _MainNavigationScreenState extends State<MainNavigationScreen> {
// //   int _currentIndex = 0;

// //   final WellnessStats _stats = WellnessStats(
// //     streakDays: 3,
// //     totalMinutes: 128,
// //     sessionsCompleted: 16,
// //     bedtimeReminders: 4,
// //     lastMood: MoodType.okay,
// //   );

// //   final List<WellnessSession> _sessions = AppData.sessions;
// //   final List<SpiritualResource> _spiritualResources =
// //       AppData.spiritualResources;

// //   MoodType? _selectedMood = MoodType.okay;
// //   GoalType _selectedGoal = GoalType.calm;
// //   int _selectedDuration = 5;

// //   void _updateMood(MoodType mood) {
// //     setState(() {
// //       _selectedMood = mood;
// //       _stats.lastMood = mood;
// //       if (mood == MoodType.low) {
// //         _selectedGoal = GoalType.calm;
// //         _selectedDuration = 3;
// //       } else if (mood == MoodType.great) {
// //         _selectedGoal = GoalType.move;
// //         _selectedDuration = 10;
// //       } else {
// //         _selectedGoal = GoalType.focus;
// //         _selectedDuration = 5;
// //       }
// //     });
// //   }

// //   void _updateGoal(GoalType goal) {
// //     setState(() => _selectedGoal = goal);
// //   }

// //   void _updateDuration(int minutes) {
// //     setState(() => _selectedDuration = minutes);
// //   }

// //   void _completeSession(int minutes) {
// //     setState(() {
// //       _stats.totalMinutes += minutes;
// //       _stats.sessionsCompleted += 1;
// //     });
// //   }

// //   List<WellnessSession> get _personalizedSessions {
// //     final filtered = _sessions.where((s) {
// //       final durationMatch = s.durationMinutes == _selectedDuration;
// //       final goalMatch = s.goal == _selectedGoal;
// //       return durationMatch && goalMatch;
// //     }).toList();

// //     if (filtered.isNotEmpty) return filtered;

// //     final moodDriven = _sessions.where((s) {
// //       if (_selectedMood == MoodType.low) return s.recommendedForLowMood;
// //       if (_selectedMood == MoodType.great) return s.goal == GoalType.move;
// //       return s.goal == _selectedGoal;
// //     }).toList();

// //     return moodDriven.isNotEmpty ? moodDriven : _sessions.take(6).toList();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final screens = [
// //       HomeScreen(
// //         stats: _stats,
// //         selectedMood: _selectedMood,
// //         selectedGoal: _selectedGoal,
// //         selectedDuration: _selectedDuration,
// //         onMoodSelected: _updateMood,
// //         onGoalSelected: _updateGoal,
// //         onDurationSelected: _updateDuration,
// //         recommendedSessions: _personalizedSessions,
// //         onPlaySession: (session) async {
// //           await Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (_) => PlayerScreen(
// //                 session: session,
// //                 onCompleted: () => _completeSession(session.durationMinutes),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //       ExploreScreen(
// //         stats: _stats,
// //         selectedGoal: _selectedGoal,
// //         sessions: _sessions,
// //         onPlaySession: (session) async {
// //           await Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (_) => PlayerScreen(
// //                 session: session,
// //                 onCompleted: () => _completeSession(session.durationMinutes),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //       SpiritualScreen(resources: _spiritualResources),
// //     ];

// //     return Scaffold(
// //       body: AnimatedSwitcher(
// //         duration: const Duration(milliseconds: 300),
// //         child: screens[_currentIndex],
// //       ),
// //       bottomNavigationBar: NavigationBar(
// //         height: 74,
// //         selectedIndex: _currentIndex,
// //         onDestinationSelected: (index) {
// //           setState(() => _currentIndex = index);
// //         },
// //         backgroundColor: Colors.white,
// //         indicatorColor: Theme.of(
// //           context,
// //         ).colorScheme.secondary.withOpacity(0.45),
// //         destinations: const [
// //           NavigationDestination(
// //             icon: Icon(Icons.home_outlined),
// //             selectedIcon: Icon(Icons.home),
// //             label: "Home",
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.explore_outlined),
// //             selectedIcon: Icon(Icons.explore),
// //             label: "Explore",
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.auto_awesome_outlined),
// //             selectedIcon: Icon(Icons.auto_awesome),
// //             label: "Spiritual",
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   final WellnessStats stats;
// //   final MoodType? selectedMood;
// //   final GoalType selectedGoal;
// //   final int selectedDuration;
// //   final ValueChanged<MoodType> onMoodSelected;
// //   final ValueChanged<GoalType> onGoalSelected;
// //   final ValueChanged<int> onDurationSelected;
// //   final List<WellnessSession> recommendedSessions;
// //   final ValueChanged<WellnessSession> onPlaySession;

// //   const HomeScreen({
// //     super.key,
// //     required this.stats,
// //     required this.selectedMood,
// //     required this.selectedGoal,
// //     required this.selectedDuration,
// //     required this.onMoodSelected,
// //     required this.onGoalSelected,
// //     required this.onDurationSelected,
// //     required this.recommendedSessions,
// //     required this.onPlaySession,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final primary = Theme.of(context).colorScheme.primary;

// //     return SafeArea(
// //       child: SingleChildScrollView(
// //         padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             _Header(stats: stats),
// //             const SizedBox(height: 22),
// //             Container(
// //               padding: const EdgeInsets.all(20),
// //               decoration: BoxDecoration(
// //                 gradient: const LinearGradient(
// //                   colors: [Color(0xFFF2F7F3), Color(0xFFE7F0EB)],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomRight,
// //                 ),
// //                 borderRadius: BorderRadius.circular(28),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     "How do you feel?",
// //                     style: TextStyle(
// //                       fontSize: 26,
// //                       fontWeight: FontWeight.w800,
// //                       color: Color(0xFF253238),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Text(
// //                     "Start with your mood and get a simple session recommendation.",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.grey.shade700,
// //                       height: 1.5,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 18),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: MoodType.values.map((mood) {
// //                       final isSelected = selectedMood == mood;
// //                       return Expanded(
// //                         child: Padding(
// //                           padding: const EdgeInsets.symmetric(horizontal: 4),
// //                           child: GestureDetector(
// //                             onTap: () => onMoodSelected(mood),
// //                             child: AnimatedContainer(
// //                               duration: const Duration(milliseconds: 220),
// //                               padding: const EdgeInsets.symmetric(vertical: 14),
// //                               decoration: BoxDecoration(
// //                                 color: isSelected
// //                                     ? Colors.white
// //                                     : Colors.white70,
// //                                 borderRadius: BorderRadius.circular(22),
// //                                 border: Border.all(
// //                                   color: isSelected
// //                                       ? primary
// //                                       : Colors.grey.shade200,
// //                                   width: 1.5,
// //                                 ),
// //                                 boxShadow: isSelected
// //                                     ? [
// //                                         BoxShadow(
// //                                           color: primary.withOpacity(0.12),
// //                                           blurRadius: 16,
// //                                           offset: const Offset(0, 8),
// //                                         ),
// //                                       ]
// //                                     : null,
// //                               ),
// //                               child: Column(
// //                                 children: [
// //                                   Text(
// //                                     mood.emoji,
// //                                     style: const TextStyle(fontSize: 28),
// //                                   ),
// //                                   const SizedBox(height: 6),
// //                                   Text(
// //                                     mood.label,
// //                                     style: TextStyle(
// //                                       fontWeight: FontWeight.w700,
// //                                       color: isSelected
// //                                           ? primary
// //                                           : const Color(0xFF44525A),
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     }).toList(),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 24),
// //             _SectionTitle(
// //               title: "Choose session",
// //               subtitle:
// //                   "Time-based and goal-based, without overwhelming options.",
// //             ),
// //             const SizedBox(height: 14),
// //             _DurationSelector(
// //               selectedDuration: selectedDuration,
// //               onDurationSelected: onDurationSelected,
// //             ),
// //             const SizedBox(height: 16),
// //             _GoalSelector(
// //               selectedGoal: selectedGoal,
// //               onGoalSelected: onGoalSelected,
// //             ),
// //             const SizedBox(height: 24),
// //             const _SectionTitle(
// //               title: "Breathing",
// //               subtitle: "Inhale, hold, exhale — the core calming interaction.",
// //             ),
// //             const SizedBox(height: 14),
// //             const BreathingCard(),
// //             const SizedBox(height: 24),
// //             const _SectionTitle(
// //               title: "Recommended for you",
// //               subtitle: "Personalized from mood, goal, and session duration.",
// //             ),
// //             const SizedBox(height: 14),
// //             ...recommendedSessions.map(
// //               (session) => Padding(
// //                 padding: const EdgeInsets.only(bottom: 14),
// //                 child: SessionCard(
// //                   session: session,
// //                   onTap: () => onPlaySession(session),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 14),
// //             _QuickStats(stats: stats),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ExploreScreen extends StatefulWidget {
// //   final WellnessStats stats;
// //   final GoalType selectedGoal;
// //   final List<WellnessSession> sessions;
// //   final ValueChanged<WellnessSession> onPlaySession;

// //   const ExploreScreen({
// //     super.key,
// //     required this.stats,
// //     required this.selectedGoal,
// //     required this.sessions,
// //     required this.onPlaySession,
// //   });

// //   @override
// //   State<ExploreScreen> createState() => _ExploreScreenState();
// // }

// // class _ExploreScreenState extends State<ExploreScreen> {
// //   GoalType activeGoal = GoalType.calm;

// //   @override
// //   void initState() {
// //     super.initState();
// //     activeGoal = widget.selectedGoal;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final filtered = widget.sessions
// //         .where((s) => s.goal == activeGoal)
// //         .toList();

// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
// //         children: [
// //           const Text(
// //             "Explore wellness",
// //             style: TextStyle(
// //               fontSize: 28,
// //               fontWeight: FontWeight.w800,
// //               color: Color(0xFF243036),
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             "Music, sleep, movement, focus, and guided sessions in one calm place.",
// //             style: TextStyle(color: Colors.grey.shade700, height: 1.5),
// //           ),
// //           const SizedBox(height: 18),
// //           _GoalSelector(
// //             selectedGoal: activeGoal,
// //             onGoalSelected: (goal) => setState(() => activeGoal = goal),
// //           ),
// //           const SizedBox(height: 22),
// //           _ExploreHighlights(stats: widget.stats),
// //           const SizedBox(height: 24),
// //           if (activeGoal == GoalType.move) ...[
// //             const _SectionTitle(
// //               title: "Movement",
// //               subtitle:
// //                   "Yoga, stretching, mindful walking, and light body sessions.",
// //             ),
// //             const SizedBox(height: 14),
// //           ] else if (activeGoal == GoalType.sleep) ...[
// //             const _SectionTitle(
// //               title: "Sleep tools",
// //               subtitle: "Sleep stories, rain, calm music, and bedtime support.",
// //             ),
// //             const SizedBox(height: 14),
// //           ] else if (activeGoal == GoalType.focus) ...[
// //             const _SectionTitle(
// //               title: "Focus tools",
// //               subtitle:
// //                   "White noise, deep work sounds, and guided concentration.",
// //             ),
// //             const SizedBox(height: 14),
// //           ] else ...[
// //             const _SectionTitle(
// //               title: "Relaxation tools",
// //               subtitle:
// //                   "Nature sounds, calm music, breathing, and gentle guidance.",
// //             ),
// //             const SizedBox(height: 14),
// //           ],
// //           GridView.builder(
// //             itemCount: filtered.length,
// //             shrinkWrap: true,
// //             physics: const NeverScrollableScrollPhysics(),
// //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //               crossAxisCount: 2,
// //               mainAxisSpacing: 14,
// //               crossAxisSpacing: 14,
// //               childAspectRatio: 0.82,
// //             ),
// //             itemBuilder: (context, index) {
// //               final session = filtered[index];
// //               return ExploreTile(
// //                 session: session,
// //                 onTap: () => widget.onPlaySession(session),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PlayerScreen extends StatefulWidget {
// //   final WellnessSession session;
// //   final VoidCallback onCompleted;

// //   const PlayerScreen({
// //     super.key,
// //     required this.session,
// //     required this.onCompleted,
// //   });

// //   @override
// //   State<PlayerScreen> createState() => _PlayerScreenState();
// // }

// // class _PlayerScreenState extends State<PlayerScreen> {
// //   late YoutubePlayerController _controller;
// //   bool _completed = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = YoutubePlayerController.fromVideoId(
// //       videoId: widget.session.youtubeId,
// //       autoPlay: false,
// //       params: const YoutubePlayerParams(
// //         showControls: true,
// //         showFullscreenButton: true,
// //         strictRelatedVideos: true,
// //       ),
// //     );
// //   }

// //   void _markCompleteOnce() {
// //     if (_completed) return;
// //     _completed = true;
// //     widget.onCompleted();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.close();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final session = widget.session;

// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: session.palette,
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: Column(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(8, 8, 14, 8),
// //                 child: Row(
// //                   children: [
// //                     IconButton(
// //                       onPressed: () {
// //                         _markCompleteOnce();
// //                         Navigator.pop(context);
// //                       },
// //                       icon: const Icon(Icons.arrow_back_ios_new_rounded),
// //                       color: Colors.white,
// //                     ),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             session.goal.label,
// //                             style: const TextStyle(
// //                               color: Colors.white70,
// //                               fontSize: 13,
// //                             ),
// //                           ),
// //                           Text(
// //                             session.title,
// //                             maxLines: 1,
// //                             overflow: TextOverflow.ellipsis,
// //                             style: const TextStyle(
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.w800,
// //                               fontSize: 20,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                         horizontal: 14,
// //                         vertical: 8,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.18),
// //                         borderRadius: BorderRadius.circular(24),
// //                       ),
// //                       child: Text(
// //                         "${session.durationMinutes} min",
// //                         style: const TextStyle(
// //                           color: Colors.white,
// //                           fontWeight: FontWeight.w700,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const Spacer(),
// //               Container(
// //                 margin: const EdgeInsets.symmetric(horizontal: 22),
// //                 padding: const EdgeInsets.all(22),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white.withOpacity(0.12),
// //                   borderRadius: BorderRadius.circular(28),
// //                   border: Border.all(color: Colors.white.withOpacity(0.14)),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       height: 92,
// //                       width: 92,
// //                       decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.2),
// //                         shape: BoxShape.circle,
// //                       ),
// //                       child: Icon(session.icon, color: Colors.white, size: 40),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     Text(
// //                       session.subtitle,
// //                       textAlign: TextAlign.center,
// //                       style: const TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w800,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Text(
// //                       session.description,
// //                       textAlign: TextAlign.center,
// //                       style: const TextStyle(
// //                         color: Colors.white70,
// //                         height: 1.5,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 18),
// //                     Wrap(
// //                       spacing: 8,
// //                       runSpacing: 8,
// //                       alignment: WrapAlignment.center,
// //                       children: session.tags
// //                           .map(
// //                             (tag) => Container(
// //                               padding: const EdgeInsets.symmetric(
// //                                 horizontal: 12,
// //                                 vertical: 8,
// //                               ),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white.withOpacity(0.12),
// //                                 borderRadius: BorderRadius.circular(20),
// //                               ),
// //                               child: Text(
// //                                 tag,
// //                                 style: const TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.w600,
// //                                 ),
// //                               ),
// //                             ),
// //                           )
// //                           .toList(),
// //                     ),
// //                     const SizedBox(height: 22),
// //                     YoutubePlayer(controller: _controller, aspectRatio: 16 / 9),
// //                     const SizedBox(height: 16),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: ElevatedButton.icon(
// //                             onPressed: () async {
// //                               await _controller.playVideo();
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: Colors.white,
// //                               foregroundColor: const Color(0xFF2B4C45),
// //                               padding: const EdgeInsets.symmetric(vertical: 14),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(18),
// //                               ),
// //                             ),
// //                             icon: const Icon(Icons.headphones),
// //                             label: const Text(
// //                               "Play",
// //                               style: TextStyle(fontWeight: FontWeight.w700),
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: OutlinedButton.icon(
// //                             onPressed: () {
// //                               _markCompleteOnce();
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 const SnackBar(
// //                                   content: Text("Session marked as completed"),
// //                                 ),
// //                               );
// //                             },
// //                             style: OutlinedButton.styleFrom(
// //                               foregroundColor: Colors.white,
// //                               side: const BorderSide(color: Colors.white54),
// //                               padding: const EdgeInsets.symmetric(vertical: 14),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(18),
// //                               ),
// //                             ),
// //                             icon: const Icon(Icons.check_circle_outline),
// //                             label: const Text("Complete"),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const Spacer(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SpiritualScreen extends StatefulWidget {
// //   final List<SpiritualResource> resources;

// //   const SpiritualScreen({super.key, required this.resources});

// //   @override
// //   State<SpiritualScreen> createState() => _SpiritualScreenState();
// // }

// // class _SpiritualScreenState extends State<SpiritualScreen>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   final categories = SpiritualCategory.values;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: categories.length, vsync: this);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: categories.length,
// //       child: Scaffold(
// //         backgroundColor: const Color(0xFFF7F8F5),
// //         body: SafeArea(
// //           child: Column(
// //             children: [
// //               Container(
// //                 margin: const EdgeInsets.fromLTRB(18, 16, 18, 10),
// //                 padding: const EdgeInsets.all(20),
// //                 decoration: BoxDecoration(
// //                   gradient: const LinearGradient(
// //                     colors: [Color(0xFF6C9A7C), Color(0xFF9CB89A)],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   borderRadius: BorderRadius.circular(28),
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text(
// //                       "Spiritual wisdom",
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.w800,
// //                         fontSize: 28,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     const Text(
// //                       "Stories, books, great lives, and god-centered teachings that support mental strength, discipline, purpose, and peaceful living.",
// //                       style: TextStyle(color: Colors.white70, height: 1.5),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     Row(
// //                       children: const [
// //                         Expanded(
// //                           child: _HeroInfoChip(
// //                             icon: Icons.auto_awesome,
// //                             label: "God & Dharma",
// //                           ),
// //                         ),
// //                         SizedBox(width: 10),
// //                         Expanded(
// //                           child: _HeroInfoChip(
// //                             icon: Icons.fort_outlined,
// //                             label: "History & Leaders",
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               TabBar(
// //                 controller: _tabController,
// //                 isScrollable: true,
// //                 indicatorColor: Theme.of(context).colorScheme.primary,
// //                 labelColor: Theme.of(context).colorScheme.primary,
// //                 unselectedLabelColor: Colors.grey,
// //                 tabs: categories
// //                     .map((e) => Tab(text: e.label, icon: Icon(e.icon)))
// //                     .toList(),
// //               ),
// //               Expanded(
// //                 child: TabBarView(
// //                   controller: _tabController,
// //                   children: categories.map((category) {
// //                     final items = widget.resources
// //                         .where((r) => r.category == category)
// //                         .toList();
// //                     return ListView.builder(
// //                       padding: const EdgeInsets.all(18),
// //                       itemCount: items.length,
// //                       itemBuilder: (context, index) {
// //                         final item = items[index];
// //                         return SpiritualCard(resource: item);
// //                       },
// //                     );
// //                   }).toList(),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class BreathingCard extends StatelessWidget {
// //   const BreathingCard({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(18),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(28),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.04),
// //             blurRadius: 18,
// //             offset: const Offset(0, 10),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: const [
// //           Text(
// //             "Take a mindful minute",
// //             style: TextStyle(
// //               fontSize: 18,
// //               fontWeight: FontWeight.w800,
// //               color: Color(0xFF243036),
// //             ),
// //           ),
// //           SizedBox(height: 16),
// //           BreathingWidget(),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class BreathingWidget extends StatefulWidget {
// //   const BreathingWidget({super.key});

// //   @override
// //   State<BreathingWidget> createState() => _BreathingWidgetState();
// // }

// // class _BreathingWidgetState extends State<BreathingWidget>
// //     with SingleTickerProviderStateMixin {
// //   late final AnimationController _controller;
// //   late final Animation<double> _sizeAnimation;
// //   String _instruction = "Inhale";
// //   Timer? _holdTimer;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(seconds: 4),
// //     );

// //     _sizeAnimation = Tween<double>(
// //       begin: 110,
// //       end: 210,
// //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

// //     _controller.addStatusListener((status) {
// //       if (status == AnimationStatus.completed) {
// //         setState(() => _instruction = "Hold");
// //         _holdTimer?.cancel();
// //         _holdTimer = Timer(const Duration(seconds: 2), () {
// //           if (!mounted) return;
// //           setState(() => _instruction = "Exhale");
// //           _controller.reverse();
// //         });
// //       } else if (status == AnimationStatus.dismissed) {
// //         setState(() => _instruction = "Hold");
// //         _holdTimer?.cancel();
// //         _holdTimer = Timer(const Duration(seconds: 2), () {
// //           if (!mounted) return;
// //           setState(() => _instruction = "Inhale");
// //           _controller.forward();
// //         });
// //       }
// //     });

// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _holdTimer?.cancel();
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final primary = Theme.of(context).colorScheme.primary;

// //     return AnimatedBuilder(
// //       animation: _sizeAnimation,
// //       builder: (context, child) {
// //         return SizedBox(
// //           width: 260,
// //           height: 260,
// //           child: Center(
// //             child: Container(
// //               width: _sizeAnimation.value,
// //               height: _sizeAnimation.value,
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 gradient: RadialGradient(
// //                   colors: [
// //                     primary.withOpacity(0.16),
// //                     primary.withOpacity(0.32),
// //                   ],
// //                 ),
// //                 border: Border.all(color: primary, width: 2),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: primary.withOpacity(0.18),
// //                     blurRadius: 30,
// //                     spreadRadius: 6,
// //                   ),
// //                 ],
// //               ),
// //               child: Center(
// //                 child: Text(
// //                   _instruction,
// //                   style: const TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.w700,
// //                     color: Color(0xFF243036),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class SessionCard extends StatelessWidget {
// //   final WellnessSession session;
// //   final VoidCallback onTap;

// //   const SessionCard({super.key, required this.session, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.circular(24),
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(24),
// //         onTap: onTap,
// //         child: Container(
// //           padding: const EdgeInsets.all(18),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(24),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.035),
// //                 blurRadius: 15,
// //                 offset: const Offset(0, 6),
// //               ),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               Container(
// //                 width: 62,
// //                 height: 62,
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(colors: session.palette),
// //                   borderRadius: BorderRadius.circular(18),
// //                 ),
// //                 child: Icon(session.icon, color: Colors.white, size: 30),
// //               ),
// //               const SizedBox(width: 14),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       session.title,
// //                       style: const TextStyle(
// //                         fontWeight: FontWeight.w800,
// //                         fontSize: 16,
// //                         color: Color(0xFF233037),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       session.subtitle,
// //                       style: TextStyle(
// //                         color: Colors.grey.shade700,
// //                         fontSize: 13,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Wrap(
// //                       spacing: 6,
// //                       runSpacing: 6,
// //                       children: [
// //                         _MiniTag(label: "${session.durationMinutes} min"),
// //                         _MiniTag(label: session.goal.label),
// //                         _MiniTag(label: session.type.name),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(width: 8),
// //               CircleAvatar(
// //                 radius: 22,
// //                 backgroundColor: Theme.of(context).colorScheme.primary,
// //                 child: const Icon(Icons.play_arrow, color: Colors.white),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ExploreTile extends StatelessWidget {
// //   final WellnessSession session;
// //   final VoidCallback onTap;

// //   const ExploreTile({super.key, required this.session, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.circular(24),
// //       child: InkWell(
// //         onTap: onTap,
// //         borderRadius: BorderRadius.circular(24),
// //         child: Container(
// //           padding: const EdgeInsets.all(16),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(24),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.03),
// //                 blurRadius: 10,
// //                 offset: const Offset(0, 4),
// //               ),
// //             ],
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                 height: 52,
// //                 width: 52,
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(colors: session.palette),
// //                   borderRadius: BorderRadius.circular(16),
// //                 ),
// //                 child: Icon(session.icon, color: Colors.white),
// //               ),
// //               const Spacer(),
// //               Text(
// //                 session.title,
// //                 maxLines: 2,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.w800,
// //                   fontSize: 15,
// //                   color: Color(0xFF243036),
// //                 ),
// //               ),
// //               const SizedBox(height: 6),
// //               Text(
// //                 session.subtitle,
// //                 maxLines: 2,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: TextStyle(
// //                   color: Colors.grey.shade700,
// //                   fontSize: 12.5,
// //                   height: 1.35,
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               Row(
// //                 children: [
// //                   Text(
// //                     "${session.durationMinutes} min",
// //                     style: TextStyle(
// //                       color: Colors.grey.shade600,
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.w700,
// //                     ),
// //                   ),
// //                   const Spacer(),
// //                   CircleAvatar(
// //                     radius: 16,
// //                     backgroundColor: Theme.of(context).colorScheme.primary,
// //                     child: const Icon(
// //                       Icons.play_arrow,
// //                       color: Colors.white,
// //                       size: 18,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SpiritualCard extends StatelessWidget {
// //   final SpiritualResource resource;

// //   const SpiritualCard({super.key, required this.resource});

// //   @override
// //   Widget build(BuildContext context) {
// //     final primary = Theme.of(context).colorScheme.primary;

// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       padding: const EdgeInsets.all(18),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(26),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.035),
// //             blurRadius: 14,
// //             offset: const Offset(0, 8),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             height: 170,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               gradient: const LinearGradient(
// //                 colors: [Color(0xFFE8F0EA), Color(0xFFDDE7F3)],
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //               ),
// //               borderRadius: BorderRadius.circular(22),
// //             ),
// //             child: Stack(
// //               children: [
// //                 Positioned(
// //                   right: -12,
// //                   top: -10,
// //                   child: Icon(
// //                     resource.category.icon,
// //                     size: 110,
// //                     color: primary.withOpacity(0.12),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(18),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         resource.visualTitle,
// //                         style: TextStyle(
// //                           color: primary,
// //                           fontWeight: FontWeight.w700,
// //                         ),
// //                       ),
// //                       const Spacer(),
// //                       Text(
// //                         resource.title,
// //                         style: const TextStyle(
// //                           fontSize: 22,
// //                           fontWeight: FontWeight.w800,
// //                           color: Color(0xFF223036),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 6),
// //                       Text(
// //                         resource.subtitle,
// //                         style: TextStyle(color: Colors.grey.shade700),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //           Text(
// //             resource.quote,
// //             style: TextStyle(
// //               color: primary,
// //               fontWeight: FontWeight.w700,
// //               height: 1.5,
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           Text(
// //             resource.description,
// //             style: TextStyle(color: Colors.grey.shade800, height: 1.55),
// //           ),
// //           const SizedBox(height: 10),
// //           Text(
// //             "Motivation to take: ${resource.lesson}",
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w700,
// //               color: Color(0xFF243036),
// //               height: 1.5,
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //           Wrap(
// //             spacing: 10,
// //             runSpacing: 10,
// //             children: [
// //               _LinkChip(
// //                 icon: Icons.play_circle_fill_rounded,
// //                 label: "YouTube Story",
// //                 color: Colors.red.shade50,
// //                 textColor: Colors.red.shade700,
// //                 url: resource.youtubeLink,
// //               ),
// //               _LinkChip(
// //                 icon: Icons.public,
// //                 label: "Google Link",
// //                 color: Colors.blue.shade50,
// //                 textColor: Colors.blue.shade700,
// //                 url: resource.googleLink,
// //               ),
// //               _LinkChip(
// //                 icon: Icons.menu_book_rounded,
// //                 label: "Book Link",
// //                 color: Colors.green.shade50,
// //                 textColor: Colors.green.shade700,
// //                 url: resource.bookLink,
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _Header extends StatelessWidget {
// //   final WellnessStats stats;

// //   const _Header({required this.stats});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         const Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 "Good morning",
// //                 style: TextStyle(
// //                   fontSize: 30,
// //                   fontWeight: FontWeight.w800,
// //                   color: Color(0xFF243036),
// //                 ),
// //               ),
// //               SizedBox(height: 4),
// //               Text(
// //                 "Let’s keep your mind calm and clear today.",
// //                 style: TextStyle(color: Color(0xFF6C737A), height: 1.4),
// //               ),
// //             ],
// //           ),
// //         ),
// //         Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //           decoration: BoxDecoration(
// //             color: Colors.orange.shade50,
// //             borderRadius: BorderRadius.circular(24),
// //           ),
// //           child: Row(
// //             children: [
// //               Icon(
// //                 Icons.local_fire_department,
// //                 color: Colors.orange.shade700,
// //                 size: 18,
// //               ),
// //               const SizedBox(width: 6),
// //               Text(
// //                 "${stats.streakDays} Day Streak",
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.w800,
// //                   color: Colors.orange.shade800,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _QuickStats extends StatelessWidget {
// //   final WellnessStats stats;

// //   const _QuickStats({required this.stats});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: _StatCard(
// //             label: "Minutes",
// //             value: stats.totalMinutes.toString(),
// //             icon: Icons.timer_outlined,
// //           ),
// //         ),
// //         const SizedBox(width: 12),
// //         Expanded(
// //           child: _StatCard(
// //             label: "Sessions",
// //             value: stats.sessionsCompleted.toString(),
// //             icon: Icons.check_circle_outline,
// //           ),
// //         ),
// //         const SizedBox(width: 12),
// //         Expanded(
// //           child: _StatCard(
// //             label: "Sleep",
// //             value: stats.bedtimeReminders.toString(),
// //             icon: Icons.bedtime_outlined,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _ExploreHighlights extends StatelessWidget {
// //   final WellnessStats stats;

// //   const _ExploreHighlights({required this.stats});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(18),
// //       decoration: BoxDecoration(
// //         gradient: const LinearGradient(
// //           colors: [Color(0xFFEEF5F1), Color(0xFFF6F0FA)],
// //         ),
// //         borderRadius: BorderRadius.circular(24),
// //       ),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: _MiniMetric(
// //               title: "Streak",
// //               value: "${stats.streakDays} days",
// //               icon: Icons.local_fire_department,
// //             ),
// //           ),
// //           Expanded(
// //             child: _MiniMetric(
// //               title: "Minutes",
// //               value: "${stats.totalMinutes}",
// //               icon: Icons.timer_outlined,
// //             ),
// //           ),
// //           Expanded(
// //             child: _MiniMetric(
// //               title: "Done",
// //               value: "${stats.sessionsCompleted}",
// //               icon: Icons.task_alt,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _MiniMetric extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   final IconData icon;

// //   const _MiniMetric({
// //     required this.title,
// //     required this.value,
// //     required this.icon,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Icon(icon, color: Theme.of(context).colorScheme.primary),
// //         const SizedBox(height: 8),
// //         Text(
// //           value,
// //           style: const TextStyle(
// //             fontWeight: FontWeight.w800,
// //             fontSize: 16,
// //             color: Color(0xFF243036),
// //           ),
// //         ),
// //         const SizedBox(height: 4),
// //         Text(
// //           title,
// //           style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _DurationSelector extends StatelessWidget {
// //   final int selectedDuration;
// //   final ValueChanged<int> onDurationSelected;

// //   const _DurationSelector({
// //     required this.selectedDuration,
// //     required this.onDurationSelected,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     const durations = [1, 3, 5, 10];
// //     return Wrap(
// //       spacing: 10,
// //       runSpacing: 10,
// //       children: durations.map((d) {
// //         final isSelected = d == selectedDuration;
// //         return ChoiceChip(
// //           selected: isSelected,
// //           onSelected: (_) => onDurationSelected(d),
// //           label: Text("$d min"),
// //           selectedColor: Theme.of(context).colorScheme.primary,
// //           backgroundColor: Colors.white,
// //           labelStyle: TextStyle(
// //             color: isSelected ? Colors.white : const Color(0xFF243036),
// //             fontWeight: FontWeight.w700,
// //           ),
// //           side: BorderSide(
// //             color: isSelected
// //                 ? Theme.of(context).colorScheme.primary
// //                 : Colors.grey.shade300,
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// // }

// // class _GoalSelector extends StatelessWidget {
// //   final GoalType selectedGoal;
// //   final ValueChanged<GoalType> onGoalSelected;

// //   const _GoalSelector({
// //     required this.selectedGoal,
// //     required this.onGoalSelected,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Wrap(
// //       spacing: 10,
// //       runSpacing: 10,
// //       children: GoalType.values.map((goal) {
// //         final isSelected = goal == selectedGoal;
// //         return GestureDetector(
// //           onTap: () => onGoalSelected(goal),
// //           child: AnimatedContainer(
// //             duration: const Duration(milliseconds: 220),
// //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// //             decoration: BoxDecoration(
// //               color: isSelected
// //                   ? Theme.of(context).colorScheme.primary
// //                   : Colors.white,
// //               borderRadius: BorderRadius.circular(18),
// //               border: Border.all(
// //                 color: isSelected
// //                     ? Theme.of(context).colorScheme.primary
// //                     : Colors.grey.shade300,
// //               ),
// //             ),
// //             child: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Icon(
// //                   goal.icon,
// //                   size: 18,
// //                   color: isSelected ? Colors.white : const Color(0xFF243036),
// //                 ),
// //                 const SizedBox(width: 8),
// //                 Text(
// //                   goal.label,
// //                   style: TextStyle(
// //                     color: isSelected ? Colors.white : const Color(0xFF243036),
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// // }

// // class _SectionTitle extends StatelessWidget {
// //   final String title;
// //   final String subtitle;

// //   const _SectionTitle({required this.title, required this.subtitle});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           title,
// //           style: const TextStyle(
// //             fontSize: 20,
// //             fontWeight: FontWeight.w800,
// //             color: Color(0xFF243036),
// //           ),
// //         ),
// //         const SizedBox(height: 4),
// //         Text(
// //           subtitle,
// //           style: TextStyle(color: Colors.grey.shade700, height: 1.45),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _MiniTag extends StatelessWidget {
// //   final String label;

// //   const _MiniTag({required this.label});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFFF5F6F7),
// //         borderRadius: BorderRadius.circular(18),
// //       ),
// //       child: Text(
// //         label,
// //         style: TextStyle(
// //           color: Colors.grey.shade700,
// //           fontSize: 11.5,
// //           fontWeight: FontWeight.w700,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _StatCard extends StatelessWidget {
// //   final String label;
// //   final String value;
// //   final IconData icon;

// //   const _StatCard({
// //     required this.label,
// //     required this.value,
// //     required this.icon,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(22),
// //       ),
// //       child: Column(
// //         children: [
// //           Icon(icon, color: Theme.of(context).colorScheme.primary),
// //           const SizedBox(height: 8),
// //           Text(
// //             value,
// //             style: const TextStyle(
// //               fontWeight: FontWeight.w800,
// //               fontSize: 18,
// //               color: Color(0xFF243036),
// //             ),
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             label,
// //             style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _HeroInfoChip extends StatelessWidget {
// //   final IconData icon;
// //   final String label;

// //   const _HeroInfoChip({required this.icon, required this.label});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// //       decoration: BoxDecoration(
// //         color: Colors.white.withOpacity(0.14),
// //         borderRadius: BorderRadius.circular(18),
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(icon, color: Colors.white, size: 18),
// //           const SizedBox(width: 8),
// //           Expanded(
// //             child: Text(
// //               label,
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.w700,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _LinkChip extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final Color color;
// //   final Color textColor;
// //   final String url;

// //   const _LinkChip({
// //     required this.icon,
// //     required this.label,
// //     required this.color,
// //     required this.textColor,
// //     required this.url,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () {
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text("Open link: $url")));
// //       },
// //       borderRadius: BorderRadius.circular(18),
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
// //         decoration: BoxDecoration(
// //           color: color,
// //           borderRadius: BorderRadius.circular(18),
// //         ),
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Icon(icon, size: 18, color: textColor),
// //             const SizedBox(width: 8),
// //             Text(
// //               label,
// //               style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class AppData {
// //   static final List<WellnessSession> sessions = [
// //     WellnessSession(
// //       id: "calm-forest-3",
// //       title: "Forest Calm",
// //       subtitle: "Ground yourself with soft forest ambience",
// //       goal: GoalType.calm,
// //       type: ContentType.music,
// //       durationMinutes: 3,
// //       youtubeId: "1ZYbU82GVz4",
// //       icon: Icons.park_outlined,
// //       tags: ["forest", "calm", "nature"],
// //       description: "A short peaceful reset with gentle forest atmosphere.",
// //       palette: const [Color(0xFF4E7D67), Color(0xFF93B69B)],
// //       recommendedForLowMood: true,
// //     ),
// //     WellnessSession(
// //       id: "rain-calm-5",
// //       title: "Rain Reset",
// //       subtitle: "Rain sounds for emotional release and softness",
// //       goal: GoalType.calm,
// //       type: ContentType.music,
// //       durationMinutes: 5,
// //       youtubeId: "mPZkdNFkNps",
// //       icon: Icons.grain_outlined,
// //       tags: ["rain", "relax", "release"],
// //       description: "Use this when your mind feels crowded or tired.",
// //       palette: const [Color(0xFF5C6F91), Color(0xFF9DB1C9)],
// //       recommendedForLowMood: true,
// //     ),
// //     WellnessSession(
// //       id: "focus-white-noise-5",
// //       title: "Focus White Noise",
// //       subtitle: "Reduce distractions for study and deep work",
// //       goal: GoalType.focus,
// //       type: ContentType.music,
// //       durationMinutes: 5,
// //       youtubeId: "nMfPqeZjc2c",
// //       icon: Icons.headphones_outlined,
// //       tags: ["focus", "study", "white noise"],
// //       description: "Useful for coding, reading, and concentrated tasks.",
// //       palette: const [Color(0xFF425D78), Color(0xFF88A9C1)],
// //     ),
// //     WellnessSession(
// //       id: "deep-focus-10",
// //       title: "Deep Work Audio",
// //       subtitle: "Steady sound bed for concentration",
// //       goal: GoalType.focus,
// //       type: ContentType.guidedTalk,
// //       durationMinutes: 10,
// //       youtubeId: "WPni755-Krg",
// //       icon: Icons.psychology_alt_outlined,
// //       tags: ["deep work", "clarity", "study"],
// //       description: "Build a calm, uninterrupted attention rhythm.",
// //       palette: const [Color(0xFF37465D), Color(0xFF738CA6)],
// //     ),
// //     WellnessSession(
// //       id: "sleep-rain-10",
// //       title: "Sleep Rain",
// //       subtitle: "Night rain for unwinding before bed",
// //       goal: GoalType.sleep,
// //       type: ContentType.sleepStory,
// //       durationMinutes: 10,
// //       youtubeId: "aXItOY0sLRY",
// //       icon: Icons.bedtime_outlined,
// //       tags: ["sleep", "night", "rain"],
// //       description: "Pair with lights off and a low-volume bedtime routine.",
// //       palette: const [Color(0xFF2F375D), Color(0xFF6877A6)],
// //       recommendedForLowMood: true,
// //     ),
// //     WellnessSession(
// //       id: "sleep-music-5",
// //       title: "Bedtime Calm Music",
// //       subtitle: "Slow, gentle music for restful sleep preparation",
// //       goal: GoalType.sleep,
// //       type: ContentType.music,
// //       durationMinutes: 5,
// //       youtubeId: "lFcSrYw-ARY",
// //       icon: Icons.music_note_outlined,
// //       tags: ["sleep", "music", "bedtime"],
// //       description: "A simple pre-sleep session to lower mental noise.",
// //       palette: const [Color(0xFF53446E), Color(0xFF9E8DBD)],
// //     ),
// //     WellnessSession(
// //       id: "stretch-3",
// //       title: "Desk Stretch",
// //       subtitle: "Light movement for the neck, back, and shoulders",
// //       goal: GoalType.move,
// //       type: ContentType.movement,
// //       durationMinutes: 3,
// //       youtubeId: "SEfs5TJZ6Nk",
// //       icon: Icons.accessibility_new_outlined,
// //       tags: ["stretch", "desk", "body"],
// //       description: "A smart micro-break between study or work blocks.",
// //       palette: const [Color(0xFF8C6A52), Color(0xFFCAA37D)],
// //     ),
// //     WellnessSession(
// //       id: "walk-10",
// //       title: "Mindful Walking",
// //       subtitle: "Move gently and breathe with awareness",
// //       goal: GoalType.move,
// //       type: ContentType.movement,
// //       durationMinutes: 10,
// //       youtubeId: "omADQz5kP8Q",
// //       icon: Icons.directions_walk_outlined,
// //       tags: ["walk", "mindfulness", "energy"],
// //       description: "Great when you feel mentally stuck and need movement.",
// //       palette: const [Color(0xFF617C47), Color(0xFFA5C185)],
// //     ),
// //     WellnessSession(
// //       id: "breathing-1",
// //       title: "1-Minute Breathing",
// //       subtitle: "A quick inhale-hold-exhale reset",
// //       goal: GoalType.calm,
// //       type: ContentType.breathing,
// //       durationMinutes: 1,
// //       youtubeId: "tybOi4hjZFQ",
// //       icon: Icons.bubble_chart_outlined,
// //       tags: ["breathing", "quick", "reset"],
// //       description: "Perfect for a fast mental reset before meetings or study.",
// //       palette: const [Color(0xFF5B907B), Color(0xFFB4D4C6)],
// //       recommendedForLowMood: true,
// //     ),
// //     WellnessSession(
// //       id: "forest-sleep-3",
// //       title: "Night Forest",
// //       subtitle: "Soft ambient forest sounds for quiet rest",
// //       goal: GoalType.sleep,
// //       type: ContentType.music,
// //       durationMinutes: 3,
// //       youtubeId: "OdIJ2x3nxzQ",
// //       icon: Icons.forest_outlined,
// //       tags: ["forest", "sleep", "night"],
// //       description: "A soft transition from overstimulation into quietness.",
// //       palette: const [Color(0xFF40594E), Color(0xFF88A394)],
// //     ),
// //   ];

// //   static final List<SpiritualResource> spiritualResources = [
// //     SpiritualResource(
// //       title: "Bhagavad Gita",
// //       category: SpiritualCategory.god,
// //       subtitle: "Krishna’s guidance on duty, mind, balance, and inner strength",
// //       lesson:
// //           "Do your duty with steadiness, self-control, and less attachment to outcomes.",
// //       quote: "When the mind becomes steady, life becomes lighter.",
// //       description:
// //           "A foundational spiritual text for purpose, discipline, action, emotional control, and clarity during difficult phases of life.",
// //       bookLink: "https://www.holy-bhagavad-gita.org/",
// //       googleLink: "https://www.google.com/search?q=Bhagavad+Gita+book",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Bhagavad+Gita+story+explained",
// //       visualTitle: "Divine wisdom • Krishna",
// //     ),
// //     SpiritualResource(
// //       title: "Ramayana",
// //       category: SpiritualCategory.epics,
// //       subtitle:
// //           "Story of Rama, Sita, Hanuman, devotion, truth, and righteous conduct",
// //       lesson:
// //           "Live with discipline, loyalty, patience, and moral courage even in hardship.",
// //       quote: "Character is tested most when life becomes difficult.",
// //       description:
// //           "Ramayana offers emotional strength through the ideals of dharma, sacrifice, patience, and faith in the face of adversity.",
// //       bookLink: "https://archive.org/details/in.ernet.dli.2015.168319",
// //       googleLink: "https://www.google.com/search?q=Ramayana+book+English",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Ramayana+full+story+explained",
// //       visualTitle: "Epic strength • Rama",
// //     ),
// //     SpiritualResource(
// //       title: "Mahabharata",
// //       category: SpiritualCategory.epics,
// //       subtitle:
// //           "A vast epic of duty, conflict, wisdom, justice, and human complexity",
// //       lesson:
// //           "Right action is not always easy, but wisdom matters most in confusion.",
// //       quote: "In difficult choices, wisdom is greater than impulse.",
// //       description:
// //           "Mahabharata helps readers understand inner conflict, responsibility, family tensions, ethics, and leadership under pressure.",
// //       bookLink: "https://archive.org/details/in.ernet.dli.2015.168319",
// //       googleLink: "https://www.google.com/search?q=Mahabharata+book+English",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Mahabharata+story+explained",
// //       visualTitle: "Epic wisdom • Dharma",
// //     ),
// //     SpiritualResource(
// //       title: "Karna",
// //       category: SpiritualCategory.epics,
// //       subtitle:
// //           "A powerful life of dignity, pain, generosity, and tragic loyalty",
// //       lesson: "Self-worth should not depend on rejection from others.",
// //       quote:
// //           "Pain can build greatness, but loyalty must still be guided by wisdom.",
// //       description:
// //           "Karna’s life is deeply motivational for people facing comparison, exclusion, emotional wounds, and identity struggles.",
// //       bookLink: "https://www.google.com/search?q=Karna+book",
// //       googleLink: "https://www.google.com/search?q=Karna+Mahabharata+story",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Karna+story+Mahabharata",
// //       visualTitle: "Strength through struggle",
// //     ),
// //     SpiritualResource(
// //       title: "Krishna Stories",
// //       category: SpiritualCategory.god,
// //       subtitle: "Playfulness, intelligence, love, and deep life wisdom",
// //       lesson: "Strength and softness can exist together in one personality.",
// //       quote: "Wisdom is not dryness; it can also be joyful and loving.",
// //       description:
// //           "Krishna stories can help people reconnect with devotion, intelligence, emotional grace, and meaningful action.",
// //       bookLink: "https://www.google.com/search?q=Krishna+stories+book",
// //       googleLink:
// //           "https://www.google.com/search?q=Krishna+stories+for+life+lessons",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Krishna+stories+explained",
// //       visualTitle: "Joy, love, and wisdom",
// //     ),
// //     SpiritualResource(
// //       title: "Ramadan Reflections",
// //       category: SpiritualCategory.god,
// //       subtitle:
// //           "Faith, fasting, gratitude, discipline, mercy, and spiritual reset",
// //       lesson: "Restraint, gratitude, and prayer can bring inner order to life.",
// //       quote: "Discipline of the soul creates peace in the mind.",
// //       description:
// //           "Ramadan-focused reading and stories can support spiritual reflection, self-control, humility, and compassion.",
// //       bookLink: "https://www.google.com/search?q=Ramadan+books",
// //       googleLink: "https://www.google.com/search?q=Ramadan+stories+and+lessons",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Ramadan+stories+lessons",
// //       visualTitle: "Faith and reflection",
// //     ),
// //     SpiritualResource(
// //       title: "Chhatrapati Shivaji Maharaj",
// //       category: SpiritualCategory.history,
// //       subtitle: "Leadership, courage, strategy, cultural pride, and resilience",
// //       lesson:
// //           "Lead with courage, planning, self-respect, and protection of people.",
// //       quote: "True leadership protects, uplifts, and never loses purpose.",
// //       description:
// //           "Shivaji Maharaj inspires mental strength, vision, statecraft, discipline, and fearless leadership in impossible circumstances.",
// //       bookLink: "https://www.google.com/search?q=Shivaji+Maharaj+book",
// //       googleLink:
// //           "https://www.google.com/search?q=Chhatrapati+Shivaji+Maharaj+history",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Shivaji+Maharaj+story",
// //       visualTitle: "History • Courage • Swarajya",
// //     ),
// //     SpiritualResource(
// //       title: "Maharana Pratap",
// //       category: SpiritualCategory.history,
// //       subtitle: "Honor, resistance, bravery, and uncompromising dignity",
// //       lesson: "Self-respect matters even when comfort is sacrificed.",
// //       quote: "A person who protects dignity becomes unforgettable.",
// //       description:
// //           "His life motivates people to stay strong in hardship, maintain values, and never trade integrity for convenience.",
// //       bookLink: "https://www.google.com/search?q=Maharana+Pratap+book",
// //       googleLink: "https://www.google.com/search?q=Maharana+Pratap+history",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Maharana+Pratap+story",
// //       visualTitle: "Honor under pressure",
// //     ),
// //     SpiritualResource(
// //       title: "Mahatma Gandhi",
// //       category: SpiritualCategory.motivators,
// //       subtitle: "Truth, discipline, simplicity, courage, and self-mastery",
// //       lesson:
// //           "Real change begins with mastery over one’s own thoughts and habits.",
// //       quote: "Strength is not always loud; often it is disciplined and moral.",
// //       description:
// //           "Gandhi’s life can motivate personal ethics, emotional restraint, persistence, social responsibility, and inner conviction.",
// //       bookLink: "https://www.google.com/search?q=Mahatma+Gandhi+autobiography",
// //       googleLink: "https://www.google.com/search?q=Mahatma+Gandhi+life+story",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Mahatma+Gandhi+story",
// //       visualTitle: "Truth and discipline",
// //     ),
// //     SpiritualResource(
// //       title: "APJ Abdul Kalam",
// //       category: SpiritualCategory.motivators,
// //       subtitle: "Dreams, learning, humility, science, and service",
// //       lesson:
// //           "Stay humble, keep learning, and build your future with discipline.",
// //       quote: "Dreams become real when effort stays steady.",
// //       description:
// //           "A highly inspiring life for students who want purpose, simplicity, dedication, and national contribution.",
// //       bookLink: "https://www.google.com/search?q=APJ+Abdul+Kalam+books",
// //       googleLink: "https://www.google.com/search?q=APJ+Abdul+Kalam+life+story",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=APJ+Abdul+Kalam+story",
// //       visualTitle: "Dreams with discipline",
// //     ),
// //     SpiritualResource(
// //       title: "Shyamchi Aai",
// //       category: SpiritualCategory.autobiographies,
// //       subtitle:
// //           "Values, motherhood, simplicity, sacrifice, and emotional grounding",
// //       lesson: "Moral strength often begins in the love and teachings of home.",
// //       quote: "A gentle heart can build a powerful life.",
// //       description:
// //           "A deeply moving work that connects emotional health with values, gratitude, motherhood, simplicity, and moral formation.",
// //       bookLink: "https://www.google.com/search?q=Shyamchi+Aai+book",
// //       googleLink: "https://www.google.com/search?q=Shyamchi+Aai+summary",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=Shyamchi+Aai+story",
// //       visualTitle: "Love, values, and character",
// //     ),
// //     SpiritualResource(
// //       title: "The Story of My Experiments with Truth",
// //       category: SpiritualCategory.autobiographies,
// //       subtitle: "Gandhi’s autobiography on truth, mistakes, and self-growth",
// //       lesson:
// //           "Growth is possible when a person studies their own life honestly.",
// //       quote: "Self-reflection is one of the deepest forms of courage.",
// //       description:
// //           "A strong autobiographical resource for students and professionals seeking self-improvement through honest introspection.",
// //       bookLink:
// //           "https://www.google.com/search?q=My+Experiments+with+Truth+book",
// //       googleLink:
// //           "https://www.google.com/search?q=My+Experiments+with+Truth+summary",
// //       youtubeLink:
// //           "https://www.youtube.com/results?search_query=My+Experiments+with+Truth+story",
// //       visualTitle: "Autobiography and self-study",
// //     ),
// //   ];
// // }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// void main() {
//   runApp(const SpiritualWisdomApp());
// }

// class SpiritualWisdomApp extends StatelessWidget {
//   const SpiritualWisdomApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Spiritual Wisdom',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         fontFamily: 'Inter',
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: const Color(0xFF071A12),
//         colorScheme: const ColorScheme.dark(
//           primary: Color(0xFF2F7D57),
//           secondary: Color(0xFF6FBF8F),
//           surface: Color(0xFF10241B),
//           tertiary: Color(0xFFB7DCC8),
//         ),
//         cardColor: const Color(0xFF10241B),
//       ),
//       home: const SpiritualHomePage(),
//     );
//   }
// }

// enum SpiritualCategory {
//   god,
//   epics,
//   ramadan,
//   history,
//   motivators,
//   autobiographies,
//   saints,
// }

// extension SpiritualCategoryX on SpiritualCategory {
//   String get label {
//     switch (this) {
//       case SpiritualCategory.god:
//         return "God";
//       case SpiritualCategory.epics:
//         return "Epics";
//       case SpiritualCategory.ramadan:
//         return "Ramadan";
//       case SpiritualCategory.history:
//         return "History";
//       case SpiritualCategory.motivators:
//         return "Motivators";
//       case SpiritualCategory.autobiographies:
//         return "Autobiographies";
//       case SpiritualCategory.saints:
//         return "Saints";
//     }
//   }

//   IconData get icon {
//     switch (this) {
//       case SpiritualCategory.god:
//         return Icons.auto_awesome;
//       case SpiritualCategory.epics:
//         return Icons.menu_book_rounded;
//       case SpiritualCategory.ramadan:
//         return Icons.nights_stay_rounded;
//       case SpiritualCategory.history:
//         return Icons.fort_outlined;
//       case SpiritualCategory.motivators:
//         return Icons.emoji_events_outlined;
//       case SpiritualCategory.autobiographies:
//         return Icons.library_books_outlined;
//       case SpiritualCategory.saints:
//         return Icons.self_improvement_outlined;
//     }
//   }
// }

// class SpiritualResource {
//   final String id;
//   final String title;
//   final String subtitle;
//   final String description;
//   final String lesson;
//   final String quote;
//   final SpiritualCategory category;
//   final String imageUrl;
//   final String youtubeUrl;
//   final String googleUrl;
//   final String bookUrl;
//   final String? youtubeVideoId;
//   bool isSaved;
//   bool isLiked;

//   SpiritualResource({
//     required this.id,
//     required this.title,
//     required this.subtitle,
//     required this.description,
//     required this.lesson,
//     required this.quote,
//     required this.category,
//     required this.imageUrl,
//     required this.youtubeUrl,
//     required this.googleUrl,
//     required this.bookUrl,
//     this.youtubeVideoId,
//     this.isSaved = false,
//     this.isLiked = false,
//   });
// }

// class SpiritualHomePage extends StatefulWidget {
//   const SpiritualHomePage({super.key});

//   @override
//   State<SpiritualHomePage> createState() => _SpiritualHomePageState();
// }

// class _SpiritualHomePageState extends State<SpiritualHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _searchController = TextEditingController();
//   late List<SpiritualResource> _resources;
//   String _searchText = '';

//   final List<SpiritualCategory> _tabs = SpiritualCategory.values;

//   @override
//   void initState() {
//     super.initState();
//     _resources = SpiritualRepository.items;
//     _tabController = TabController(length: _tabs.length, vsync: this);
//     _searchController.addListener(() {
//       setState(() {
//         _searchText = _searchController.text.trim().toLowerCase();
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   List<SpiritualResource> _filteredByCategory(SpiritualCategory category) {
//     return _resources.where((item) {
//       final categoryMatch = item.category == category;
//       final searchMatch =
//           _searchText.isEmpty ||
//           item.title.toLowerCase().contains(_searchText) ||
//           item.subtitle.toLowerCase().contains(_searchText) ||
//           item.description.toLowerCase().contains(_searchText) ||
//           item.lesson.toLowerCase().contains(_searchText);
//       return categoryMatch && searchMatch;
//     }).toList();
//   }

//   List<SpiritualResource> get _featured => _resources
//       .where((e) => e.category == SpiritualCategory.god)
//       .take(4)
//       .toList();

//   int get _savedCount => _resources.where((e) => e.isSaved).length;
//   int get _likedCount => _resources.where((e) => e.isLiked).length;

//   Future<void> _openLink(String url) async {
//     final uri = Uri.parse(url);

//     try {
//       final launched = await launchUrl(
//         uri,
//         mode: LaunchMode.externalApplication,
//       );

//       if (!launched && mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Could not open link: $url')));
//       }
//     } catch (_) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Could not open link: $url')));
//     }
//   }

//   void _toggleSave(SpiritualResource item) {
//     setState(() {
//       item.isSaved = !item.isSaved;
//     });
//   }

//   void _toggleLike(SpiritualResource item) {
//     setState(() {
//       item.isLiked = !item.isLiked;
//     });
//   }

//   void _openPreview(SpiritualResource item) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => SpiritualDetailPage(
//           resource: item,
//           onOpenLink: _openLink,
//           onSave: () {
//             _toggleSave(item);
//           },
//           onLike: () {
//             _toggleLike(item);
//           },
//         ),
//       ),
//     ).then((_) {
//       if (mounted) setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final primary = Theme.of(context).colorScheme.primary;
//     final secondary = Theme.of(context).colorScheme.secondary;

//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             Expanded(
//               child: NestedScrollView(
//                 headerSliverBuilder: (context, innerBoxIsScrolled) {
//                   return [
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(18),
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xFF0D2A1E),
//                                     Color(0xFF1E5B3D),
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(28),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.green.withOpacity(0.18),
//                                     blurRadius: 24,
//                                     offset: const Offset(0, 12),
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Spiritual Wisdom",
//                                     style: TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w800,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   const Text(
//                                     "God, epics, Ramadan, history, saints, autobiographies, and motivating lives — all in one beautiful, calm reading space.",
//                                     style: TextStyle(
//                                       color: Color(0xFFD8EEE2),
//                                       height: 1.5,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 18),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: _HeroStatChip(
//                                           icon: Icons.bookmark_rounded,
//                                           label: "$_savedCount saved",
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Expanded(
//                                         child: _HeroStatChip(
//                                           icon: Icons.favorite_rounded,
//                                           label: "$_likedCount liked",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 16),
//                                   TextField(
//                                     controller: _searchController,
//                                     style: const TextStyle(color: Colors.white),
//                                     decoration: InputDecoration(
//                                       hintText:
//                                           "Search books, people, epics, stories...",
//                                       hintStyle: const TextStyle(
//                                         color: Color(0xFFB7DCC8),
//                                       ),
//                                       prefixIcon: Icon(
//                                         Icons.search,
//                                         color: secondary,
//                                       ),
//                                       filled: true,
//                                       fillColor: Colors.white.withOpacity(0.08),
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                             vertical: 14,
//                                           ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(18),
//                                         borderSide: BorderSide.none,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 14),
//                             SizedBox(
//                               height: 190,
//                               child: ListView.builder(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 0,
//                                 ),
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: _featured.length,
//                                 itemBuilder: (context, index) {
//                                   final item = _featured[index];
//                                   return GestureDetector(
//                                     onTap: () => _openPreview(item),
//                                     child: Container(
//                                       width: 290,
//                                       margin: EdgeInsets.only(
//                                         right: index == _featured.length - 1
//                                             ? 0
//                                             : 14,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(24),
//                                         image: DecorationImage(
//                                           image: NetworkImage(item.imageUrl),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             24,
//                                           ),
//                                           gradient: LinearGradient(
//                                             colors: [
//                                               Colors.black.withOpacity(0.12),
//                                               Colors.black.withOpacity(0.72),
//                                             ],
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                           ),
//                                         ),
//                                         padding: const EdgeInsets.all(18),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 12,
//                                                     vertical: 7,
//                                                   ),
//                                               decoration: BoxDecoration(
//                                                 color: primary.withOpacity(0.9),
//                                                 borderRadius:
//                                                     BorderRadius.circular(18),
//                                               ),
//                                               child: Text(
//                                                 item.category.label,
//                                                 style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             Text(
//                                               item.title,
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 22,
//                                                 fontWeight: FontWeight.w800,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 6),
//                                             Text(
//                                               item.subtitle,
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                 color: Color(0xFFE4F3EA),
//                                                 height: 1.35,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SliverPersistentHeader(
//                       pinned: true,
//                       delegate: _TabBarHeaderDelegate(
//                         Container(
//                           color: const Color(0xFF071A12),
//                           child: TabBar(
//                             controller: _tabController,
//                             isScrollable: true,
//                             tabAlignment: TabAlignment.start,
//                             indicatorColor: primary,
//                             labelColor: primary,
//                             unselectedLabelColor: Colors.grey.shade400,
//                             dividerColor: Colors.white.withOpacity(0.04),
//                             tabs: _tabs
//                                 .map(
//                                   (e) => Tab(icon: Icon(e.icon), text: e.label),
//                                 )
//                                 .toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ];
//                 },
//                 body: TabBarView(
//                   controller: _tabController,
//                   children: _tabs.map((category) {
//                     final items = _filteredByCategory(category);
//                     if (items.isEmpty) {
//                       return const Center(
//                         child: Text(
//                           "No results found",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       );
//                     }
//                     return ListView.builder(
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         final item = items[index];
//                         return SpiritualResourceCard(
//                           resource: item,
//                           onTap: () => _openPreview(item),
//                           onSave: () => _toggleSave(item),
//                           onLike: () => _toggleLike(item),
//                           onOpenBook: () => _openLink(item.bookUrl),
//                           onOpenGoogle: () => _openLink(item.googleUrl),
//                           onOpenYoutube: () => _openLink(item.youtubeUrl),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;

//   _TabBarHeaderDelegate(this.child);

//   @override
//   double get minExtent => 72;

//   @override
//   double get maxExtent => 72;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return child;
//   }

//   @override
//   bool shouldRebuild(covariant _TabBarHeaderDelegate oldDelegate) => false;
// }

// class SpiritualDetailPage extends StatefulWidget {
//   final SpiritualResource resource;
//   final VoidCallback onSave;
//   final VoidCallback onLike;
//   final Future<void> Function(String) onOpenLink;

//   const SpiritualDetailPage({
//     super.key,
//     required this.resource,
//     required this.onSave,
//     required this.onLike,
//     required this.onOpenLink,
//   });

//   @override
//   State<SpiritualDetailPage> createState() => _SpiritualDetailPageState();
// }

// class _SpiritualDetailPageState extends State<SpiritualDetailPage> {
//   YoutubePlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     final hasVideo =
//         widget.resource.youtubeVideoId != null &&
//         widget.resource.youtubeVideoId!.isNotEmpty;

//     if (hasVideo) {
//       _controller = YoutubePlayerController.fromVideoId(
//         videoId: widget.resource.youtubeVideoId!,
//         autoPlay: false,
//         params: const YoutubePlayerParams(
//           showControls: true,
//           showFullscreenButton: true,
//           strictRelatedVideos: true,
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final resource = widget.resource;
//     final hasVideo = _controller != null;

//     return Scaffold(
//       backgroundColor: const Color(0xFF071A12),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 280,
//             pinned: true,
//             backgroundColor: const Color(0xFF0B2017),
//             flexibleSpace: FlexibleSpaceBar(
//               titlePadding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 14,
//               ),
//               title: Text(
//                 resource.title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w800,
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.network(resource.imageUrl, fit: BoxFit.cover),
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.1),
//                           Colors.black.withOpacity(0.85),
//                         ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   widget.onLike();
//                   setState(() {});
//                 },
//                 icon: Icon(
//                   resource.isLiked ? Icons.favorite : Icons.favorite_border,
//                   color: resource.isLiked ? Colors.redAccent : Colors.white,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   widget.onSave();
//                   setState(() {});
//                 },
//                 icon: Icon(
//                   resource.isSaved ? Icons.bookmark : Icons.bookmark_border,
//                   color: resource.isSaved
//                       ? const Color(0xFF89D6A6)
//                       : Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _GlassInfoBox(text: resource.subtitle),
//                   const SizedBox(height: 14),
//                   const _SectionHeading("Quote"),
//                   _DetailCard(
//                     child: Text(
//                       resource.quote,
//                       style: const TextStyle(
//                         color: Color(0xFFBEE7CC),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         height: 1.6,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   const _SectionHeading("Description"),
//                   _DetailCard(
//                     child: Text(
//                       resource.description,
//                       style: const TextStyle(
//                         color: Color(0xFFE4F0E9),
//                         height: 1.65,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   const _SectionHeading("Motivation to take"),
//                   _DetailCard(
//                     child: Text(
//                       resource.lesson,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         height: 1.65,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   const _SectionHeading("Open resources"),
//                   const SizedBox(height: 10),
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: [
//                       _ActionButton(
//                         icon: Icons.play_circle_fill_rounded,
//                         label: "YouTube",
//                         color: const Color(0xFF8B1E1E),
//                         onTap: () => widget.onOpenLink(resource.youtubeUrl),
//                       ),
//                       _ActionButton(
//                         icon: Icons.public,
//                         label: "Google",
//                         color: const Color(0xFF1C4C8C),
//                         onTap: () => widget.onOpenLink(resource.googleUrl),
//                       ),
//                       _ActionButton(
//                         icon: Icons.menu_book_rounded,
//                         label: "Book",
//                         color: const Color(0xFF206347),
//                         onTap: () => widget.onOpenLink(resource.bookUrl),
//                       ),
//                     ],
//                   ),
//                   if (hasVideo) ...[
//                     const SizedBox(height: 22),
//                     const _SectionHeading("Story preview"),
//                     const SizedBox(height: 10),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: YoutubePlayer(
//                         controller: _controller!,
//                         aspectRatio: 16 / 9,
//                       ),
//                     ),
//                   ],
//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SpiritualResourceCard extends StatelessWidget {
//   final SpiritualResource resource;
//   final VoidCallback onTap;
//   final VoidCallback onSave;
//   final VoidCallback onLike;
//   final VoidCallback onOpenBook;
//   final VoidCallback onOpenGoogle;
//   final VoidCallback onOpenYoutube;

//   const SpiritualResourceCard({
//     super.key,
//     required this.resource,
//     required this.onTap,
//     required this.onSave,
//     required this.onLike,
//     required this.onOpenBook,
//     required this.onOpenGoogle,
//     required this.onOpenYoutube,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final primary = Theme.of(context).colorScheme.primary;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF10241B),
//           borderRadius: BorderRadius.circular(26),
//           border: Border.all(color: Colors.white.withOpacity(0.06)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.22),
//               blurRadius: 20,
//               offset: const Offset(0, 12),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(26),
//               ),
//               child: Stack(
//                 children: [
//                   Image.network(
//                     resource.imageUrl,
//                     height: 210,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 14,
//                     left: 14,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 8,
//                       ),
//                       decoration: BoxDecoration(
//                         color: primary.withOpacity(0.92),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Text(
//                         resource.category.label,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 12,
//                     right: 12,
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.black.withOpacity(0.45),
//                           child: IconButton(
//                             onPressed: onLike,
//                             icon: Icon(
//                               resource.isLiked
//                                   ? Icons.favorite
//                                   : Icons.favorite_border,
//                               color: resource.isLiked
//                                   ? Colors.redAccent
//                                   : Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         CircleAvatar(
//                           backgroundColor: Colors.black.withOpacity(0.45),
//                           child: IconButton(
//                             onPressed: onSave,
//                             icon: Icon(
//                               resource.isSaved
//                                   ? Icons.bookmark
//                                   : Icons.bookmark_border,
//                               color: resource.isSaved
//                                   ? const Color(0xFF8BE0AA)
//                                   : Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     resource.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 21,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     resource.subtitle,
//                     style: const TextStyle(
//                       color: Color(0xFFBED5C7),
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     resource.quote,
//                     style: TextStyle(
//                       color: primary.withOpacity(0.95),
//                       fontWeight: FontWeight.w700,
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     resource.description,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Color(0xFFE3EFE8),
//                       height: 1.55,
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   Text(
//                     "Motivation: ${resource.lesson}",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: [
//                       _MiniResourceBtn(
//                         icon: Icons.play_circle_fill_rounded,
//                         label: "YouTube",
//                         bg: const Color(0xFF3D1717),
//                         fg: const Color(0xFFFF9A9A),
//                         onTap: onOpenYoutube,
//                       ),
//                       _MiniResourceBtn(
//                         icon: Icons.public,
//                         label: "Google",
//                         bg: const Color(0xFF112C4F),
//                         fg: const Color(0xFF97C5FF),
//                         onTap: onOpenGoogle,
//                       ),
//                       _MiniResourceBtn(
//                         icon: Icons.menu_book_rounded,
//                         label: "Book",
//                         bg: const Color(0xFF153A2A),
//                         fg: const Color(0xFF8BE0AA),
//                         onTap: onOpenBook,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _HeroStatChip extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _HeroStatChip({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: const Color(0xFF8BE0AA), size: 18),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MiniResourceBtn extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color bg;
//   final Color fg;
//   final VoidCallback onTap;

//   const _MiniResourceBtn({
//     required this.icon,
//     required this.label,
//     required this.bg,
//     required this.fg,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(18),
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         decoration: BoxDecoration(
//           color: bg,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, color: fg, size: 18),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(color: fg, fontWeight: FontWeight.w700),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SectionHeading extends StatelessWidget {
//   final String title;

//   const _SectionHeading(this.title);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.w800,
//         fontSize: 18,
//       ),
//     );
//   }
// }

// class _DetailCard extends StatelessWidget {
//   final Widget child;

//   const _DetailCard({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF10241B),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.white.withOpacity(0.05)),
//       ),
//       child: child,
//     );
//   }
// }

// class _GlassInfoBox extends StatelessWidget {
//   final String text;

//   const _GlassInfoBox({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF153125),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Color(0xFFDBF1E4),
//           fontSize: 15,
//           height: 1.5,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }

// class _ActionButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionButton({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(18),
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, color: Colors.white),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SpiritualRepository {
//   static final List<SpiritualResource> items = [
//     SpiritualResource(
//       id: "gita",
//       title: "Bhagavad Gita",
//       subtitle: "Krishna’s wisdom on mind, duty, courage, and balance",
//       description:
//           "A foundational spiritual guide on action, responsibility, emotional steadiness, discipline, and clarity during confusion.",
//       lesson:
//           "Act with discipline, reduce attachment to outcomes, and build steadiness of mind.",
//       quote: "When the mind becomes steady, even difficult life feels lighter.",
//       category: SpiritualCategory.god,
//       imageUrl:
//           "https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Bhagavad+Gita+explained",
//       googleUrl: "https://www.google.com/search?q=Bhagavad+Gita",
//       bookUrl: "https://openlibrary.org/subjects/bhagavad_gita",
//       youtubeVideoId: "TydLQj4h8hU",
//     ),
//     SpiritualResource(
//       id: "krishna",
//       title: "Krishna Stories",
//       subtitle: "Joy, love, intelligence, and spiritual insight",
//       description:
//           "Stories of Krishna bring emotional softness, devotion, wisdom, playfulness, and a deep sense of purpose in life.",
//       lesson: "Strength and tenderness can live together in one person.",
//       quote: "Wisdom is not dry; it can also be loving and full of joy.",
//       category: SpiritualCategory.god,
//       imageUrl:
//           "https://images.unsplash.com/photo-1519817650390-64a93db51149?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Krishna+stories+explained",
//       googleUrl: "https://www.google.com/search?q=Krishna+stories",
//       bookUrl: "https://www.google.com/search?q=Krishna+stories+book",
//       youtubeVideoId: "s2N4Woc0jY8",
//     ),
//     SpiritualResource(
//       id: "ramayana",
//       title: "Ramayana",
//       subtitle: "Rama, Sita, Hanuman, values, faith, and righteousness",
//       description:
//           "Ramayana teaches patience, dharma, loyalty, courage, devotion, and moral character during hardship.",
//       lesson: "Hold values even when life becomes difficult and unfair.",
//       quote: "Character is tested most when comfort disappears.",
//       category: SpiritualCategory.epics,
//       imageUrl:
//           "https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Ramayana+story+explained",
//       googleUrl: "https://www.google.com/search?q=Ramayana",
//       bookUrl: "https://simple.wikipedia.org/wiki/Ramayana",
//       youtubeVideoId: "E8ZkLh1ovM8",
//     ),
//     SpiritualResource(
//       id: "mahabharata",
//       title: "Mahabharata",
//       subtitle: "Conflict, wisdom, ethics, leadership, and dharma",
//       description:
//           "A massive epic showing family conflict, difficult choices, justice, duty, and the complexity of human life.",
//       lesson: "Wisdom matters most in moments of confusion and inner conflict.",
//       quote: "Right action is not always easy, but it still matters.",
//       category: SpiritualCategory.epics,
//       imageUrl:
//           "https://images.unsplash.com/photo-1477587458883-47145ed94245?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Mahabharata+story+explained",
//       googleUrl: "https://www.google.com/search?q=Mahabharata",
//       bookUrl: "https://simple.wikipedia.org/wiki/Mahabharata",
//       youtubeVideoId: "z3E3S8xX4tw",
//     ),
//     SpiritualResource(
//       id: "karna",
//       title: "Karna",
//       subtitle: "Dignity, pain, generosity, and tragic strength",
//       description:
//           "Karna’s life speaks to those who struggle with rejection, identity, comparison, loyalty, and silent pain.",
//       lesson: "Do not let rejection define your self-worth.",
//       quote: "Pain can shape greatness, but wisdom must guide loyalty.",
//       category: SpiritualCategory.epics,
//       imageUrl:
//           "https://images.unsplash.com/photo-1508672019048-805c876b67e2?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Karna+Mahabharata+story",
//       googleUrl: "https://www.google.com/search?q=Karna+Mahabharata",
//       bookUrl: "https://www.google.com/search?q=Karna+book",
//       youtubeVideoId: "W2Z8K4V4p7U",
//     ),
//     SpiritualResource(
//       id: "quran",
//       title: "Qur'an Reading",
//       subtitle: "Faith, mercy, guidance, reflection, and discipline",
//       description:
//           "Reading and reflecting on the Qur'an can support patience, compassion, gratitude, self-control, and spiritual anchoring.",
//       lesson: "A disciplined inner life creates clarity in the outer life.",
//       quote: "Faith can bring structure to a restless mind.",
//       category: SpiritualCategory.ramadan,
//       imageUrl:
//           "https://images.unsplash.com/photo-1584286595398-a59f21d313f8?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Quran+tafsir+for+beginners",
//       googleUrl: "https://www.google.com/search?q=Quran",
//       bookUrl: "https://quran.com/",
//       youtubeVideoId: "dYxTQp7mWbM",
//     ),
//     SpiritualResource(
//       id: "ramadan-reflections",
//       title: "Ramadan Reflections",
//       subtitle: "Fasting, prayer, gratitude, mercy, and self-control",
//       description:
//           "Ramadan-based books and stories help build patience, humility, gratitude, and spiritual renewal.",
//       lesson: "Restraint can become a form of freedom and peace.",
//       quote: "Discipline of the soul creates peace in the mind.",
//       category: SpiritualCategory.ramadan,
//       imageUrl:
//           "https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Ramadan+stories+and+lessons",
//       googleUrl: "https://www.google.com/search?q=Ramadan+stories+and+books",
//       bookUrl: "https://www.google.com/search?q=Ramadan+books",
//       youtubeVideoId: "gF8gU4mD7kM",
//     ),
//     SpiritualResource(
//       id: "shivaji",
//       title: "Chhatrapati Shivaji Maharaj",
//       subtitle: "Leadership, courage, strategy, and protection of people",
//       description:
//           "Shivaji Maharaj represents resilient leadership, cultural confidence, planning, and fearless action with responsibility.",
//       lesson: "Lead with courage, intelligence, and deep respect for people.",
//       quote: "True leadership protects, uplifts, and never loses purpose.",
//       category: SpiritualCategory.history,
//       imageUrl:
//           "https://images.unsplash.com/photo-1512632578888-169bbbc64f33?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Shivaji+Maharaj+story",
//       googleUrl: "https://www.google.com/search?q=Chhatrapati+Shivaji+Maharaj",
//       bookUrl: "https://www.britannica.com/biography/Shivaji",
//       youtubeVideoId: "P0Q7Q7mD0kA",
//     ),
//     SpiritualResource(
//       id: "maharana-pratap",
//       title: "Maharana Pratap",
//       subtitle: "Honor, courage, resistance, and self-respect",
//       description:
//           "A powerful historical example of dignity, endurance, bravery, and values over convenience.",
//       lesson: "Do not trade self-respect for short-term comfort.",
//       quote: "A person who protects dignity becomes unforgettable.",
//       category: SpiritualCategory.history,
//       imageUrl:
//           "https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Maharana+Pratap+story",
//       googleUrl: "https://www.google.com/search?q=Maharana+Pratap",
//       bookUrl: "https://www.google.com/search?q=Maharana+Pratap+book",
//       youtubeVideoId: "ST7v8w2n7nE",
//     ),
//     SpiritualResource(
//       id: "gandhi",
//       title: "Mahatma Gandhi",
//       subtitle: "Truth, discipline, simplicity, and self-mastery",
//       description:
//           "Gandhi’s life and writings encourage deep self-reflection, ethics, nonviolence, restraint, and social responsibility.",
//       lesson:
//           "Real change begins with discipline over one’s own thoughts and habits.",
//       quote: "Strength is often disciplined, moral, and quiet.",
//       category: SpiritualCategory.motivators,
//       imageUrl:
//           "https://images.unsplash.com/photo-1486299267070-83823f5448dd?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Mahatma+Gandhi+life+story",
//       googleUrl: "https://www.google.com/search?q=Mahatma+Gandhi",
//       bookUrl: "https://egmh.org/Downloads/gandhi_autobiography.pdf",
//       youtubeVideoId: "f6dK0m4Y6nM",
//     ),
//     SpiritualResource(
//       id: "kalam",
//       title: "APJ Abdul Kalam",
//       subtitle: "Dreams, humility, learning, science, and service",
//       description:
//           "A deeply motivating life for students, showing simplicity, work ethic, vision, and contribution to society.",
//       lesson:
//           "Stay humble, keep learning, and build steadily toward your purpose.",
//       quote: "Dreams become real when effort stays steady.",
//       category: SpiritualCategory.motivators,
//       imageUrl:
//           "https://images.unsplash.com/photo-1506784365847-bbad939e9335?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=APJ+Abdul+Kalam+story",
//       googleUrl: "https://www.google.com/search?q=APJ+Abdul+Kalam",
//       bookUrl: "https://openlibrary.org/books/OL9081155M/Wings_of_Fire",
//       youtubeVideoId: "m6V1s3v9kYg",
//     ),
//     SpiritualResource(
//       id: "vivekananda",
//       title: "Swami Vivekananda",
//       subtitle:
//           "Strength, fearless thinking, spirituality, and youth inspiration",
//       description:
//           "His speeches and writings strongly motivate confidence, service, disciplined thinking, and spiritual depth.",
//       lesson: "Build inner strength and live with purpose and fearlessness.",
//       quote: "A strong mind and a pure heart can transform life.",
//       category: SpiritualCategory.saints,
//       imageUrl:
//           "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Swami+Vivekananda+speech+story",
//       googleUrl: "https://www.google.com/search?q=Swami+Vivekananda",
//       bookUrl: "https://www.google.com/search?q=Swami+Vivekananda+books",
//       youtubeVideoId: "XyF8eEH0Xo4",
//     ),
//     SpiritualResource(
//       id: "tukaram",
//       title: "Sant Tukaram",
//       subtitle: "Devotion, simplicity, poetry, and inner surrender",
//       description:
//           "Sant Tukaram’s abhangs and life reflect humility, devotion, and emotional healing through spiritual surrender.",
//       lesson: "Simplicity and devotion can become emotional strength.",
//       quote: "A surrendered heart often becomes a peaceful heart.",
//       category: SpiritualCategory.saints,
//       imageUrl:
//           "https://images.unsplash.com/photo-1518005020951-eccb494ad742?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Sant+Tukaram+story",
//       googleUrl: "https://www.google.com/search?q=Sant+Tukaram",
//       bookUrl: "https://www.google.com/search?q=Sant+Tukaram+abhang+book",
//       youtubeVideoId: "h8Nh3Y4mN6A",
//     ),
//     SpiritualResource(
//       id: "shyamchi-aai",
//       title: "Shyamchi Aai",
//       subtitle: "Motherhood, values, sacrifice, tenderness, and character",
//       description:
//           "A moving Marathi classic that connects emotional grounding, family values, moral education, and gratitude.",
//       lesson: "A gentle heart and strong values can shape a powerful life.",
//       quote: "Moral strength often begins with love at home.",
//       category: SpiritualCategory.autobiographies,
//       imageUrl:
//           "https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=Shyamchi+Aai+story",
//       googleUrl: "https://www.google.com/search?q=Shyamchi+Aai",
//       bookUrl: "https://www.google.com/search?q=Shyamchi+Aai+book",
//       youtubeVideoId: "xQ8NqL8b0nI",
//     ),
//     SpiritualResource(
//       id: "truth",
//       title: "My Experiments with Truth",
//       subtitle: "Self-study, mistakes, growth, truth, and discipline",
//       description:
//           "Gandhi’s autobiography offers honest introspection, moral growth, and practical lessons on self-improvement.",
//       lesson: "Self-reflection is one of the deepest forms of courage.",
//       quote:
//           "Growth becomes possible when a person studies their life honestly.",
//       category: SpiritualCategory.autobiographies,
//       imageUrl:
//           "https://images.unsplash.com/photo-1455390582262-044cdead277a?auto=format&fit=crop&w=1200&q=80",
//       youtubeUrl:
//           "https://www.youtube.com/results?search_query=My+Experiments+with+Truth+summary",
//       googleUrl: "https://www.google.com/search?q=My+Experiments+with+Truth",
//       bookUrl: "https://egmh.org/Downloads/gandhi_autobiography.pdf",
//       youtubeVideoId: "K0m0Qz4mP4s",
//     ),
//   ];
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const SpiritualWisdomApp());
}

class SpiritualWisdomApp extends StatelessWidget {
  const SpiritualWisdomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiritual Wisdom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2F7D57),
          secondary: Color(0xFF6FBF8F),
          surface: Color(0xFFFFFFFF),
          tertiary: Color(0xFFE8F5EC),
        ),
        cardColor: Colors.white,
      ),
      home: const SpiritualHomePage(),
    );
  }
}

enum SpiritualCategory {
  god,
  epics,
  ramadan,
  history,
  motivators,
  autobiographies,
  saints,
}

extension SpiritualCategoryX on SpiritualCategory {
  String get label {
    switch (this) {
      case SpiritualCategory.god:
        return "God";
      case SpiritualCategory.epics:
        return "Epics";
      case SpiritualCategory.ramadan:
        return "Ramadan";
      case SpiritualCategory.history:
        return "History";
      case SpiritualCategory.motivators:
        return "Motivators";
      case SpiritualCategory.autobiographies:
        return "Autobiographies";
      case SpiritualCategory.saints:
        return "Saints";
    }
  }

  IconData get icon {
    switch (this) {
      case SpiritualCategory.god:
        return Icons.auto_awesome;
      case SpiritualCategory.epics:
        return Icons.menu_book_rounded;
      case SpiritualCategory.ramadan:
        return Icons.nightlight_round;
      case SpiritualCategory.history:
        return Icons.account_balance_rounded;
      case SpiritualCategory.motivators:
        return Icons.bolt_rounded;
      case SpiritualCategory.autobiographies:
        return Icons.auto_stories_rounded;
      case SpiritualCategory.saints:
        return Icons.self_improvement_rounded;
    }
  }
}

class SpiritualResource {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String lesson;
  final String quote;
  final SpiritualCategory category;
  final String imageUrl;
  final String youtubeUrl;
  final String googleUrl;
  final String bookUrl;
  final String? youtubeVideoId;

  const SpiritualResource({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.lesson,
    required this.quote,
    required this.category,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.googleUrl,
    required this.bookUrl,
    this.youtubeVideoId,
  });
}

class SpiritualHomePage extends StatefulWidget {
  const SpiritualHomePage({super.key});

  @override
  State<SpiritualHomePage> createState() => _SpiritualHomePageState();
}

class _SpiritualHomePageState extends State<SpiritualHomePage> {
  late final List<SpiritualResource> _resources;
  SpiritualCategory _selectedCategory = SpiritualCategory.god;

  @override
  void initState() {
    super.initState();
    _resources = SpiritualRepository.items;
  }

  List<SpiritualResource> get _featured {
    return _resources.where((e) => e.id != 'g1').take(4).toList();
  }

  List<SpiritualResource> get _categoryItems {
    return _resources
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not open link: $url')));
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open link: $url')));
    }
  }

  void _openPreview(SpiritualResource item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SpiritualDetailPage(resource: item, onOpenLink: _openLink),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF0FAF3), Color(0xFFDDF2E5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFFE0ECE5)),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Spiritual Wisdom",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF18392A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Explore spiritual books, epics, saints, biographies, and timeless lessons in one calm and beautiful space.",
                            style: TextStyle(
                              color: Color(0xFF4D6B5B),
                              height: 1.55,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _TopStatCard(
                                  title: "Books",
                                  value: "${_resources.length}",
                                  icon: Icons.menu_book_rounded,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _TopStatCard(
                                  title: "Sections",
                                  value: "${SpiritualCategory.values.length}",
                                  icon: Icons.dashboard_customize_rounded,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Featured Reads",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1B2C24),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 210,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _featured.length,
                        itemBuilder: (context, index) {
                          final item = _featured[index];
                          return GestureDetector(
                            onTap: () => _openPreview(item),
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.only(
                                right: index == _featured.length - 1 ? 0 : 14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: NetworkImage(item.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.10),
                                    blurRadius: 18,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.55),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primary.withOpacity(0.95),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Text(
                                        item.category.label,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      item.subtitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFFF2F7F4),
                                        height: 1.35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      "Browse Sections",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1B2C24),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: SpiritualCategory.values.map((category) {
                        final selected = _selectedCategory == category;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selected ? primary : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: selected
                                    ? primary
                                    : const Color(0xFFE2EBE6),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: selected
                                      ? primary.withOpacity(0.15)
                                      : Colors.black.withOpacity(0.04),
                                  blurRadius: 14,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  category.icon,
                                  size: 18,
                                  color: selected
                                      ? Colors.white
                                      : const Color(0xFF406354),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category.label,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : const Color(0xFF284338),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      "${_selectedCategory.label} Collection",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1B2C24),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
              sliver: SliverList.builder(
                itemCount: _categoryItems.length,
                itemBuilder: (context, index) {
                  final item = _categoryItems[index];
                  return SpiritualResourceCard(
                    resource: item,
                    onTap: () => _openPreview(item),
                    onOpenBook: () => _openLink(item.bookUrl),
                    onOpenGoogle: () => _openLink(item.googleUrl),
                    onOpenYoutube: () => _openLink(item.youtubeUrl),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpiritualDetailPage extends StatefulWidget {
  final SpiritualResource resource;
  final Future<void> Function(String) onOpenLink;

  const SpiritualDetailPage({
    super.key,
    required this.resource,
    required this.onOpenLink,
  });

  @override
  State<SpiritualDetailPage> createState() => _SpiritualDetailPageState();
}

class _SpiritualDetailPageState extends State<SpiritualDetailPage> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final hasVideo =
        widget.resource.youtubeVideoId != null &&
        widget.resource.youtubeVideoId!.isNotEmpty;

    if (hasVideo) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: widget.resource.youtubeVideoId!,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          strictRelatedVideos: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resource = widget.resource;
    final hasVideo = _controller != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            iconTheme: const IconThemeData(color: Color(0xFF18392A)),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              title: Text(
                resource.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(resource.imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.08),
                          Colors.black.withOpacity(0.60),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _GlassInfoBox(text: resource.subtitle),
                  const SizedBox(height: 14),
                  const _SectionHeading("Quote"),
                  _DetailCard(
                    child: Text(
                      resource.quote,
                      style: const TextStyle(
                        color: Color(0xFF2F7D57),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const _SectionHeading("Description"),
                  _DetailCard(
                    child: Text(
                      resource.description,
                      style: const TextStyle(
                        color: Color(0xFF33443C),
                        height: 1.65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const _SectionHeading("Motivation to take"),
                  _DetailCard(
                    child: Text(
                      resource.lesson,
                      style: const TextStyle(
                        color: Color(0xFF1F2A25),
                        height: 1.65,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const _SectionHeading("Open resources"),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _ActionButton(
                        icon: Icons.play_circle_fill_rounded,
                        label: "YouTube",
                        color: const Color(0xFFFCE8E8),
                        textColor: const Color(0xFFB42318),
                        onTap: () => widget.onOpenLink(resource.youtubeUrl),
                      ),
                      _ActionButton(
                        icon: Icons.public,
                        label: "Google",
                        color: const Color(0xFFEAF2FF),
                        textColor: const Color(0xFF1D4ED8),
                        onTap: () => widget.onOpenLink(resource.googleUrl),
                      ),
                      _ActionButton(
                        icon: Icons.menu_book_rounded,
                        label: "Book",
                        color: const Color(0xFFE8F6ED),
                        textColor: const Color(0xFF206347),
                        onTap: () => widget.onOpenLink(resource.bookUrl),
                      ),
                    ],
                  ),
                  if (hasVideo) ...[
                    const SizedBox(height: 22),
                    const _SectionHeading("Story preview"),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: YoutubePlayer(
                        controller: _controller!,
                        aspectRatio: 16 / 9,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpiritualResourceCard extends StatelessWidget {
  final SpiritualResource resource;
  final VoidCallback onTap;
  final VoidCallback onOpenBook;
  final VoidCallback onOpenGoogle;
  final VoidCallback onOpenYoutube;

  const SpiritualResourceCard({
    super.key,
    required this.resource,
    required this.onTap,
    required this.onOpenBook,
    required this.onOpenGoogle,
    required this.onOpenYoutube,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: const Color(0xFFE4ECE7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(26),
              ),
              child: Stack(
                children: [
                  Image.network(
                    resource.imageUrl,
                    height: 215,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        resource.category.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.title,
                    style: const TextStyle(
                      color: Color(0xFF1A2822),
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    resource.subtitle,
                    style: const TextStyle(
                      color: Color(0xFF64776E),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    resource.quote,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    resource.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF46574F),
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Motivation: ${resource.lesson}",
                    style: const TextStyle(
                      color: Color(0xFF1D2A24),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _MiniResourceBtn(
                        icon: Icons.play_circle_fill_rounded,
                        label: "YouTube",
                        bg: const Color(0xFFFDECEC),
                        fg: const Color(0xFFD92D20),
                        onTap: onOpenYoutube,
                      ),
                      _MiniResourceBtn(
                        icon: Icons.public,
                        label: "Google",
                        bg: const Color(0xFFEAF2FF),
                        fg: const Color(0xFF2563EB),
                        onTap: onOpenGoogle,
                      ),
                      _MiniResourceBtn(
                        icon: Icons.menu_book_rounded,
                        label: "Book",
                        bg: const Color(0xFFE9F7EF),
                        fg: const Color(0xFF15803D),
                        onTap: onOpenBook,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _TopStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE3ECE7)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5EC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF2F7D57)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF18392A),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF5F776C),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GlassInfoBox extends StatelessWidget {
  final String text;

  const _GlassInfoBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE3EBE6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF43564D),
          fontSize: 14,
          height: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;

  const _SectionHeading(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF1B2C24),
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final Widget child;

  const _DetailCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE4ECE7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniResourceBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bg;
  final Color fg;
  final VoidCallback onTap;

  const _MiniResourceBtn({
    required this.icon,
    required this.label,
    required this.bg,
    required this.fg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: fg, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: fg, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class SpiritualRepository {
  static List<SpiritualResource> get items => const [
    SpiritualResource(
      id: 'g1',
      title: 'Bhagavad Gita',
      subtitle: 'Timeless guidance on duty, action, and peace',
      description:
          'The Bhagavad Gita is a spiritual dialogue that teaches balance, purpose, self-discipline, and inner clarity.',
      lesson:
          'Do your work with honesty and calmness without attachment to the result.',
      quote:
          'You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions.',
      category: SpiritualCategory.god,
      imageUrl:
          'https://images.unsplash.com/photo-1508672019048-805c876b67e2?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Bhagavad+Gita+explained',
      googleUrl: 'https://www.google.com/search?q=Bhagavad+Gita+book+summary',
      bookUrl: 'https://www.amazon.in/s?k=Bhagavad+Gita+book',
    ),
    SpiritualResource(
      id: 'g2',
      title: 'Upanishads',
      subtitle: 'Ancient spiritual philosophy on self and reality',
      description:
          'The Upanishads explore the nature of the soul, truth, consciousness, and liberation.',
      lesson:
          'Seek inner understanding and question life with sincerity and depth.',
      quote:
          'From ignorance, lead me to truth; from darkness, lead me to light.',
      category: SpiritualCategory.god,
      imageUrl:
          'https://images.unsplash.com/photo-1518568740560-333139a27e72?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Upanishads+explained',
      googleUrl: 'https://www.google.com/search?q=Upanishads+meaning',
      bookUrl: 'https://www.amazon.in/s?k=Upanishads+book',
    ),
    SpiritualResource(
      id: 'g3',
      title: 'Vedas',
      subtitle: 'Foundational scriptures of wisdom, devotion, and knowledge',
      description:
          'The Vedas contain hymns, philosophy, rituals, and deep spiritual insights that shaped Indian thought.',
      lesson: 'Respect knowledge, discipline, and the sacredness of learning.',
      quote: 'Knowledge is the light that removes the darkness of ignorance.',
      category: SpiritualCategory.god,
      imageUrl:
          'https://images.unsplash.com/photo-1528715471579-d1bcf0ba5e83?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Vedas+introduction',
      googleUrl: 'https://www.google.com/search?q=Vedas+overview',
      bookUrl: 'https://www.amazon.in/s?k=Vedas+book',
    ),
    SpiritualResource(
      id: 'e1',
      title: 'Ramayana',
      subtitle: 'The epic of values, devotion, and righteous living',
      description:
          'Ramayana offers lessons on family, sacrifice, courage, and doing what is right even in difficulty.',
      lesson:
          'Stay truthful and patient, even when life becomes unfair or complicated.',
      quote: 'Dharma protects those who protect dharma.',
      category: SpiritualCategory.epics,
      imageUrl:
          'https://images.unsplash.com/photo-1519817650390-64a93db51149?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Ramayana+explained',
      googleUrl: 'https://www.google.com/search?q=Ramayana+summary',
      bookUrl: 'https://www.amazon.in/s?k=Ramayana+book',
      youtubeVideoId: 'AvY0H8Zk2mI',
    ),
    SpiritualResource(
      id: 'e2',
      title: 'Mahabharata',
      subtitle: 'A grand epic about duty, choices, and human nature',
      description:
          'Mahabharata reveals the complexity of life, justice, war, family, and moral responsibility.',
      lesson:
          'Right choices are not always easy, but they shape character and destiny.',
      quote: 'Time creates all things and time destroys them all.',
      category: SpiritualCategory.epics,
      imageUrl:
          'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Mahabharata+explained',
      googleUrl: 'https://www.google.com/search?q=Mahabharata+summary',
      bookUrl: 'https://www.amazon.in/s?k=Mahabharata+book',
    ),
    SpiritualResource(
      id: 'e3',
      title: 'Hanuman Chalisa',
      subtitle: 'Devotion, strength, surrender, and courage',
      description:
          'Hanuman Chalisa inspires faith, courage, humility, and protection through devotion to Hanuman.',
      lesson: 'True strength is grounded in humility, discipline, and service.',
      quote: 'Where there is devotion, fear starts disappearing.',
      category: SpiritualCategory.epics,
      imageUrl:
          'https://images.unsplash.com/photo-1548013146-72479768bada?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Hanuman+Chalisa+meaning',
      googleUrl: 'https://www.google.com/search?q=Hanuman+Chalisa+meaning',
      bookUrl: 'https://www.amazon.in/s?k=Hanuman+Chalisa+book',
    ),
    SpiritualResource(
      id: 'r1',
      title: 'Ramadan Reflections',
      subtitle: 'A month of discipline, gratitude, and compassion',
      description:
          'Ramadan teaches self-control, prayer, empathy, fasting, and reconnecting with faith and humanity.',
      lesson:
          'Purify your intentions and value gratitude, patience, and service.',
      quote:
          'Ramadan is the month whose beginning is mercy, whose middle is forgiveness, and whose end is freedom from fire.',
      category: SpiritualCategory.ramadan,
      imageUrl:
          'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Ramadan+reflections',
      googleUrl: 'https://www.google.com/search?q=Ramadan+reflections',
      bookUrl: 'https://www.amazon.in/s?k=Ramadan+reflections+book',
    ),
    SpiritualResource(
      id: 'r2',
      title: 'The Clear Quran',
      subtitle: 'Accessible understanding of Quranic teachings',
      description:
          'A readable presentation of the Quran that helps readers connect spiritual teachings with daily life.',
      lesson:
          'Read deeply, reflect sincerely, and let meaning shape your actions.',
      quote: 'Indeed, with hardship comes ease.',
      category: SpiritualCategory.ramadan,
      imageUrl:
          'https://images.unsplash.com/photo-1584286595398-a96f11f62b94?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=The+Clear+Quran+review',
      googleUrl: 'https://www.google.com/search?q=The+Clear+Quran',
      bookUrl: 'https://www.amazon.in/s?k=The+Clear+Quran',
    ),
    SpiritualResource(
      id: 'r3',
      title: 'Secrets of Divine Love',
      subtitle: 'A spiritual journey into faith, healing, and love',
      description:
          'This book connects faith with emotional healing, divine love, prayer, and reflection.',
      lesson:
          'Faith grows stronger when it is rooted in love, reflection, and sincerity.',
      quote:
          'The heart finds peace when it remembers what it truly belongs to.',
      category: SpiritualCategory.ramadan,
      imageUrl:
          'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Secrets+of+Divine+Love+book',
      googleUrl: 'https://www.google.com/search?q=Secrets+of+Divine+Love',
      bookUrl: 'https://www.amazon.in/s?k=Secrets+of+Divine+Love',
    ),
    SpiritualResource(
      id: 'h1',
      title: 'Indian Spiritual History',
      subtitle: 'Stories, reformers, empires, and cultural wisdom',
      description:
          'Indian spiritual history connects people, traditions, reformers, temples, texts, and deep civilizational knowledge.',
      lesson:
          'Study history to understand values, identity, and the roots of great ideas.',
      quote: 'History is not only about the past; it is a guide to wisdom.',
      category: SpiritualCategory.history,
      imageUrl:
          'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Indian+spiritual+history',
      googleUrl: 'https://www.google.com/search?q=Indian+spiritual+history',
      bookUrl: 'https://www.amazon.in/s?k=Indian+spiritual+history+book',
    ),
    SpiritualResource(
      id: 'h2',
      title: 'Sapiens',
      subtitle: 'A broad look at human history, culture, and belief',
      description:
          'Sapiens explores how humans built civilizations, narratives, religions, and social systems.',
      lesson:
          'Understanding humanity helps us better understand faith, identity, and society.',
      quote:
          'You could never convince a monkey to give you a banana by promising him limitless bananas after death in monkey heaven.',
      category: SpiritualCategory.history,
      imageUrl:
          'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Sapiens+book+summary',
      googleUrl: 'https://www.google.com/search?q=Sapiens+book',
      bookUrl: 'https://www.amazon.in/s?k=Sapiens+Yuval+Noah+Harari',
    ),
    SpiritualResource(
      id: 'h3',
      title: 'India After Gandhi',
      subtitle: 'Modern India through politics, people, and identity',
      description:
          'This book traces India’s modern journey with cultural and national depth.',
      lesson:
          'History shows how identity, unity, and values shape nations over time.',
      quote:
          'The making of India is one of the great stories of the modern world.',
      category: SpiritualCategory.history,
      imageUrl:
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=India+After+Gandhi+summary',
      googleUrl: 'https://www.google.com/search?q=India+After+Gandhi',
      bookUrl: 'https://www.amazon.in/s?k=India+After+Gandhi',
    ),
    SpiritualResource(
      id: 'm1',
      title: 'Swami Vivekananda',
      subtitle: 'A life of strength, service, and fearless thinking',
      description:
          'Vivekananda inspired generations through his ideas on youth, character, spirituality, and courage.',
      lesson:
          'Believe in yourself and rise through discipline, focus, and service to others.',
      quote: 'Arise, awake, and stop not till the goal is reached.',
      category: SpiritualCategory.motivators,
      imageUrl:
          'https://images.unsplash.com/photo-1509021436665-8f07dbf5bf1d?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Swami+Vivekananda+speech',
      googleUrl: 'https://www.google.com/search?q=Swami+Vivekananda',
      bookUrl: 'https://www.amazon.in/s?k=Swami+Vivekananda+books',
    ),
    SpiritualResource(
      id: 'm2',
      title: 'The Power of Positive Thinking',
      subtitle: 'Mental strength, faith, and confidence',
      description:
          'A classic motivational book about belief, hope, discipline, and positive thought.',
      lesson:
          'Your inner dialogue strongly shapes your confidence and direction.',
      quote: 'Change your thoughts and you change your world.',
      category: SpiritualCategory.motivators,
      imageUrl:
          'https://images.unsplash.com/photo-1506784365847-bbad939e9335?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=The+Power+of+Positive+Thinking+summary',
      googleUrl:
          'https://www.google.com/search?q=The+Power+of+Positive+Thinking',
      bookUrl: 'https://www.amazon.in/s?k=The+Power+of+Positive+Thinking',
    ),
    SpiritualResource(
      id: 'm3',
      title: 'You Can Win',
      subtitle: 'Simple lessons on mindset, habits, and growth',
      description:
          'A practical motivational book about success, habits, values, and self-improvement.',
      lesson: 'Discipline and attitude often matter more than talent alone.',
      quote: 'Winners don’t do different things, they do things differently.',
      category: SpiritualCategory.motivators,
      imageUrl:
          'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=You+Can+Win+book+summary',
      googleUrl: 'https://www.google.com/search?q=You+Can+Win+Shiv+Khera',
      bookUrl: 'https://www.amazon.in/s?k=You+Can+Win+Shiv+Khera',
    ),
    SpiritualResource(
      id: 'a1',
      title: 'Wings of Fire',
      subtitle: 'The inspiring autobiography of A.P.J. Abdul Kalam',
      description:
          'This autobiography captures Kalam’s humility, discipline, dreams, science, and service.',
      lesson:
          'Dream with action, stay humble, and keep learning throughout life.',
      quote:
          'Dream, dream, dream. Dreams transform into thoughts and thoughts result in action.',
      category: SpiritualCategory.autobiographies,
      imageUrl:
          'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Wings+of+Fire+book+summary',
      googleUrl:
          'https://www.google.com/search?q=Wings+of+Fire+APJ+Abdul+Kalam',
      bookUrl: 'https://www.amazon.in/s?k=Wings+of+Fire+APJ+Abdul+Kalam',
    ),
    SpiritualResource(
      id: 'a2',
      title: 'The Story of My Experiments with Truth',
      subtitle: 'Gandhi’s life, values, truth, and discipline',
      description:
          'Gandhi’s autobiography reveals a life shaped by truth, simplicity, self-examination, and service.',
      lesson:
          'An honest life is built through daily discipline and moral courage.',
      quote: 'Be the change that you wish to see in the world.',
      category: SpiritualCategory.autobiographies,
      imageUrl:
          'https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=My+Experiments+with+Truth+summary',
      googleUrl:
          'https://www.google.com/search?q=The+Story+of+My+Experiments+with+Truth',
      bookUrl: 'https://www.amazon.in/s?k=My+Experiments+with+Truth',
    ),
    SpiritualResource(
      id: 'a3',
      title: 'Long Walk to Freedom',
      subtitle: 'Nelson Mandela’s journey through struggle and purpose',
      description:
          'A powerful life story about leadership, sacrifice, justice, and resilience.',
      lesson:
          'True leadership is tested through patience, suffering, and courage.',
      quote: 'It always seems impossible until it is done.',
      category: SpiritualCategory.autobiographies,
      imageUrl:
          'https://images.unsplash.com/photo-1513258496099-48168024aec0?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Long+Walk+to+Freedom+summary',
      googleUrl: 'https://www.google.com/search?q=Long+Walk+to+Freedom+book',
      bookUrl: 'https://www.amazon.in/s?k=Long+Walk+to+Freedom',
    ),
    SpiritualResource(
      id: 's1',
      title: 'Sant Tukaram',
      subtitle: 'Devotion, humility, and truth through simple words',
      description:
          'Sant Tukaram shared spiritual depth through abhangs that connected faith to everyday life and humanity.',
      lesson:
          'Keep your heart pure, speak honestly, and live with devotion and compassion.',
      quote: 'Where there is devotion, there is true peace.',
      category: SpiritualCategory.saints,
      imageUrl:
          'https://images.unsplash.com/photo-1470115636492-6d2b56f9146d?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Sant+Tukaram+life',
      googleUrl: 'https://www.google.com/search?q=Sant+Tukaram',
      bookUrl: 'https://www.amazon.in/s?k=Sant+Tukaram+book',
    ),
    SpiritualResource(
      id: 's2',
      title: 'Sai Satcharitra',
      subtitle: 'Teachings and life stories of Shirdi Sai Baba',
      description:
          'Sai Satcharitra offers devotional stories, values, miracles, and lessons on surrender and faith.',
      lesson: 'Faith and patience can become anchors during uncertainty.',
      quote: 'Shraddha and Saburi.',
      category: SpiritualCategory.saints,
      imageUrl:
          'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Sai+Satcharitra+summary',
      googleUrl: 'https://www.google.com/search?q=Sai+Satcharitra',
      bookUrl: 'https://www.amazon.in/s?k=Sai+Satcharitra',
    ),
    SpiritualResource(
      id: 's3',
      title: 'Sant Dnyaneshwar',
      subtitle: 'Wisdom, devotion, and spiritual insight at a young age',
      description:
          'Sant Dnyaneshwar’s teachings reflect inner realization, devotion, and philosophical depth.',
      lesson: 'Spiritual maturity depends on understanding, not just age.',
      quote: 'When the heart is pure, knowledge turns into light.',
      category: SpiritualCategory.saints,
      imageUrl:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80',
      youtubeUrl:
          'https://www.youtube.com/results?search_query=Sant+Dnyaneshwar+life',
      googleUrl: 'https://www.google.com/search?q=Sant+Dnyaneshwar',
      bookUrl: 'https://www.amazon.in/s?k=Sant+Dnyaneshwar+book',
    ),
  ];
}
