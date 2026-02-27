// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:math';

// void main() {
//   runApp(const StressManagementApp());
// }

// class StressManagementApp extends StatelessWidget {
//   const StressManagementApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         // Using a sophisticated Sage/Emerald palette for a calming effect
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF2D5A27),
//           primary: const Color(0xFF2D5A27),
//           secondary: const Color(0xFF6B8E23),
//           surface: const Color(0xFFFBFDFA),
//         ),
//         textTheme: const TextTheme(
//           displaySmall: TextStyle(
//             fontFamily: 'Georgia',
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1B3022),
//           ),
//           titleMedium: TextStyle(
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.5,
//           ),
//         ),
//       ),
//       home: const StressManagementPage(),
//     );
//   }
// }

// class StressManagementPage extends StatefulWidget {
//   const StressManagementPage({super.key});

//   @override
//   State<StressManagementPage> createState() => _StressManagementPageState();
// }

// class _StressManagementPageState extends State<StressManagementPage> {
//   String selectedFactor = "Stress";
//   final TextEditingController _journalController = TextEditingController();
//   final TextEditingController _problemController = TextEditingController();

//   List<String> userNotes = [];
//   int currentStep = 0;

//   final List<String> problemSteps = [
//     "What exactly is bothering you?",
//     "Is this in your control?",
//     "What is the smallest step you can take?",
//     "Take that step. How do you feel now?",
//   ];

//   // Updated Data with Working Book Links (Google Books/Amazon)
//   final Map<String, dynamic> factorDetails = {
//     "Stress": {
//       "emoji": "🌀",
//       "gradient": [Color(0xFF83A4D4), Color(0xFFB6FBFF)],
//       "desc":
//           "Stress is your body's reaction to pressure. It's like an alarm that stays 'on' for too long.",
//       "why": [
//         "Unclear boundaries",
//         "Too many responsibilities",
//         "Lack of sleep",
//         "Major life changes",
//       ],
//       "identify": [
//         "Do you feel constantly rushed?",
//         "Is your heart racing for no reason?",
//       ],
//       "action": [
//         "Limit your to-do list to 3 items",
//         "Go for a 5-minute walk",
//         "Deep breathing (4-7-8 technique)",
//       ],
//       "mindset": "Focus on the next 10 minutes, not the next 10 days.",
//       "closing": "You are more capable than your stress tells you.",
//       "recover": ["Hydrate", "Step outside"],
//       "explore": {
//         "youtube": "https://youtu.be/hnpQrMqDoqE",
//         "article":
//             "https://www.helpguide.org/articles/stress/stress-management.htm",
//         "book": "Why Zebras Don't Get Ulcers",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=Why+Zebras+Don't+Get+Ulcers",
//         "story": "https://mentalhealth.org.uk/stories",
//       },
//     },
//     "Anxiety": {
//       "emoji": "😟",
//       "gradient": [Color(0xFFFFF1EB), Color(0xFFACE0F9)],
//       "desc":
//           "Anxiety is an intense worry about the future. It's the mind's attempt to predict danger.",
//       "why": [
//         "Genetic predisposition",
//         "Past trauma",
//         "Caffeine or poor diet",
//         "Suppressed emotions",
//       ],
//       "identify": [
//         "Are you 'what-ifing' every situation?",
//         "Do you feel a sense of dread?",
//       ],
//       "action": [
//         "Touch 5 things you can see",
//         "Write down your worst-case scenario",
//         "Listen to bilateral music",
//       ],
//       "mindset":
//           "Worrying is like an umbrella; it doesn't stop the rain, it just makes you heavy.",
//       "closing": "Your track record for surviving hard days is 100%.",
//       "recover": ["Brown noise", "Weighted blanket"],
//       "explore": {
//         "youtube": "https://youtu.be/lTID_Vf7Lp4",
//         "article":
//             "https://www.mayoclinic.org/diseases-conditions/anxiety/symptoms-causes/syc-20350961",
//         "book": "First, We Make the Beast Beautiful",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=First+We+Make+the+Beast+Beautiful",
//         "story": "https://beyondblue.org.au",
//       },
//     },
//     "Depression": {
//       "emoji": "☁️",
//       "gradient": [Color(0xFFCFD9DF), Color(0xFFE2EBEB)],
//       "desc":
//           "Depression feels like a heavy fog that drains your energy and interest in the world.",
//       "why": [
//         "Brain chemistry changes",
//         "Loss or grief",
//         "Chronic loneliness",
//         "Physical illness",
//       ],
//       "identify": [
//         "Does everything feel like a chore?",
//         "Have you lost interest in hobbies?",
//       ],
//       "action": [
//         "Get 10 mins of morning sunlight",
//         "Shower and change clothes",
//         "Text one friend just to say hi",
//       ],
//       "mindset": "Break the day into 'tiny wins.' Making the bed is a victory.",
//       "closing": "The fog will eventually lift; stay for the sunshine.",
//       "recover": ["Gentle stretching", "Nutritious meal"],
//       "explore": {
//         "youtube": "https://youtu.be/kTn_L7jMVv0",
//         "article": "https://www.nimh.nih.gov/health/topics/depression",
//         "book": "The Upward Spiral",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=The+Upward+Spiral+Alex+Korb",
//         "story": "https://depressionallies.com",
//       },
//     },
//     "Panic Attack": {
//       "emoji": "⚡",
//       "gradient": [Color(0xFFFAD0C4), Color(0xFFFFD1FF)],
//       "desc":
//           "A sudden episode of intense fear that triggers severe physical reactions.",
//       "why": [
//         "High-stress environment",
//         "Phobias",
//         "Sudden life shocks",
//         "Over-breathing",
//       ],
//       "identify": [
//         "Is it hard to catch your breath?",
//         "Do you feel like you are losing control?",
//       ],
//       "action": [
//         "Splash cold water on your face",
//         "Hold a piece of ice",
//         "Breathe into your belly, not chest",
//       ],
//       "mindset":
//           "This is a physical wave. It will peak and then it will subside.",
//       "closing": "This feeling is temporary. You are safe.",
//       "recover": ["Sit on the floor", "Drink water"],
//       "explore": {
//         "youtube": "https://youtu.be/5T6p6K_XfE8",
//         "article":
//             "https://www.nhs.uk/mental-health/conditions/panic-disorder/",
//         "book": "Dare by Barry McDonagh",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=Dare+Barry+McDonagh",
//         "story": "https://anxietyuk.org.uk",
//       },
//     },
//     "Trauma": {
//       "emoji": "🕯️",
//       "gradient": [Color(0xFFA18CD1), Color(0xFFFBC2EB)],
//       "desc":
//           "The emotional response to a distressing event that overwhelms your ability to cope.",
//       "why": [
//         "Abuse or neglect",
//         "Accidents",
//         "Loss of a loved one",
//         "Witnessing violence",
//       ],
//       "identify": [
//         "Do you have vivid, unwanted memories?",
//         "Do you feel 'on guard' constantly?",
//       ],
//       "action": [
//         "Ground yourself in the present",
//         "Practice self-compassion",
//         "Limit triggers in your environment",
//       ],
//       "mindset":
//           "You aren't broken; you are a person who has survived a storm.",
//       "closing": "Your past does not define your future.",
//       "recover": ["Safe space visualization", "Yoga"],
//       "explore": {
//         "youtube": "https://youtu.be/mYpXF6_U7uE",
//         "article":
//             "https://www.helpguide.org/articles/ptsd-trauma/coping-with-emotional-and-psychological-trauma.htm",
//         "book": "The Body Keeps the Score",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=The+Body+Keeps+the+Score",
//         "story": "https://traumasurvival.org",
//       },
//     },
//     "Anger": {
//       "emoji": "🔥",
//       "gradient": [Color(0xFFFF9A9E), Color(0xFFFAD0C4)],
//       "desc":
//           "A powerful emotion often used as a shield to protect us from feeling hurt or afraid.",
//       "why": [
//         "Unmet expectations",
//         "Feeling disrespected",
//         "Chronic frustration",
//         "Hunger or fatigue",
//       ],
//       "identify": [
//         "Is your jaw clenched right now?",
//         "Are you looking for someone to blame?",
//       ],
//       "action": [
//         "Count to 10 before speaking",
//         "Do 20 jumping jacks",
//         "Write an 'angry letter' (don't send it)",
//       ],
//       "mindset":
//           "Anger is a signal, not a command. You don't have to follow it.",
//       "closing": "Softness is a strength, not a weakness.",
//       "recover": ["Walk away", "Deep exhales"],
//       "explore": {
//         "youtube": "https://youtu.be/BsVq5R_F6RA",
//         "article": "https://www.apa.org/topics/anger/control",
//         "book": "Anger: Wisdom for Cooling the Flames",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=Anger+Thich+Nhat+Hanh",
//         "story": "https://mentalhealth.org.uk",
//       },
//     },
//     "Loneliness": {
//       "emoji": "🏝️",
//       "gradient": [Color(0xFFE2EBEE), Color(0xFFCFCFEA)],
//       "desc":
//           "A feeling of being disconnected even when people are around you.",
//       "why": [
//         "Social isolation",
//         "Major life transitions",
//         "Fear of vulnerability",
//         "Digital over-dependency",
//       ],
//       "identify": [
//         "Do you feel invisible in a crowd?",
//         "Do you crave meaningful conversation?",
//       ],
//       "action": [
//         "Join a community hobby group",
//         "Call a relative",
//         "Volunteer for 1 hour",
//       ],
//       "mindset": "Connection starts with being a friend to yourself first.",
//       "closing": "You are a vital part of the world’s fabric.",
//       "recover": ["Pet an animal", "Visit a park"],
//       "explore": {
//         "youtube": "https://youtu.be/n3Xv_g3g-mA",
//         "article": "https://www.psychologytoday.com/basics/loneliness",
//         "book": "Together by Vivek Murthy",
//         "bookUrl":
//             "https://www.google.com/search?tbm=bks&q=Together+Vivek+Murthy",
//         "story": "https://campaigntoendloneliness.org",
//       },
//     },
//     "Introversion": {
//       "emoji": "📖",
//       "gradient": [Color(0xFFD4FC79), Color(0xFF96E6A1)],
//       "desc":
//           "A personality trait where you gain energy from solitude rather than social stimulation.",
//       "why": [
//         "Biological brain wiring",
//         "Preference for deep thinking",
//         "Sensitivity to dopamine",
//       ],
//       "identify": [
//         "Do you feel drained after parties?",
//         "Do you prefer 1-on-1 talks over groups?",
//       ],
//       "action": [
//         "Schedule 'recharge' time",
//         "Prepare for social events in advance",
//         "Embrace your listening skills",
//       ],
//       "mindset":
//           "Quiet people have the loudest minds. Silence is your superpower.",
//       "closing":
//           "You don't need to change; the world needs your quiet perspective.",
//       "recover": ["Read a book", "Solo coffee date"],
//       "explore": {
//         "youtube": "https://youtu.be/c0KYU2j0TM4",
//         "article": "https://www.quietrev.com",
//         "book": "Quiet by Susan Cain",
//         "bookUrl": "https://www.google.com/search?tbm=bks&q=Quiet+Susan+Cain",
//         "story": "https://introvertdear.com",
//       },
//     },
//   };

//   final List<String> hopeMessages = [
//     "This too shall pass. You are stronger than this moment.",
//     "Your potential is endless. Keep going, one step at a time.",
//     "Be kind to yourself. You are doing the best you can.",
//   ];

//   final List<Map<String, String>> guidedActions = [
//     {
//       "title": "Anxiety Relief",
//       "desc": "Follow the 4-7-8 breathing circle to calm your nerves.",
//       "icon": "🌬️",
//     },
//     {
//       "title": "Cool the Anger",
//       "desc": "Release physical tension with a 2-minute muscle relaxation.",
//       "icon": "❄️",
//     },
//     {
//       "title": "Work De-stress",
//       "desc": "Declutter your mind by listing 3 priority tasks.",
//       "icon": "💻",
//     },
//     {
//       "title": "Family Peace",
//       "desc": "Practice 'I feel' statements to set healthy boundaries.",
//       "icon": "🏠",
//     },
//     {
//       "title": "Overthinking Stop",
//       "desc": "5-minute brain dump: Write everything down now.",
//       "icon": "🧠",
//     },
//   ];

//   late String currentHope;

//   @override
//   void initState() {
//     super.initState();
//     currentHope = hopeMessages[Random().nextInt(hopeMessages.length)];
//   }

//   Future<void> _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw 'Could not launch $url';
//     }
//   }

//   void _addNote() {
//     if (_journalController.text.isNotEmpty) {
//       setState(() {
//         userNotes.add(_journalController.text);
//         _journalController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = factorDetails[selectedFactor];

//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F9F7),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar.large(
//             expandedHeight: 120,
//             floating: false,
//             pinned: true,
//             backgroundColor: const Color(0xFFF7F9F7),
//             title: const Text(
//               "MindCare",
//               style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 color: Color(0xFF2D5A27),
//               ),
//             ),
//             centerTitle: true,
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildHopeMessage(),
//                   const SizedBox(height: 30),
//                   const Text(
//                     "How are you feeling?",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1B3022),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   _buildFactorChips(),
//                   const SizedBox(height: 30),
//                   _buildInteractiveDeepDive(data),
//                   const SizedBox(height: 30),
//                   _buildGuidedHealingSection(),
//                   const SizedBox(height: 30),
//                   _buildQuickRelief(data['recover']),
//                   const SizedBox(height: 30),
//                   _buildExploreMore(data['explore']),
//                   const SizedBox(height: 30),
//                   _buildProblemSolver(),
//                   const SizedBox(height: 30),
//                   _buildJournal(),
//                   const SizedBox(height: 60),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHopeMessage() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFF2D5A27), Color(0xFF4A7C44)],
//         ),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.green.withOpacity(0.2),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           const Icon(Icons.auto_awesome, color: Colors.white, size: 32),
//           const SizedBox(height: 12),
//           Text(
//             currentHope,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontStyle: FontStyle.italic,
//               height: 1.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFactorChips() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: factorDetails.keys.map((key) {
//           bool isSelected = selectedFactor == key;
//           return Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: FilterChip(
//               label: Text("${factorDetails[key]['emoji']} $key"),
//               selected: isSelected,
//               onSelected: (_) => setState(() => selectedFactor = key),
//               backgroundColor: Colors.white,
//               selectedColor: const Color(0xFFE8F3E8),
//               checkmarkColor: const Color(0xFF2D5A27),
//               labelStyle: TextStyle(
//                 color: isSelected ? const Color(0xFF2D5A27) : Colors.black87,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 side: BorderSide(
//                   color: isSelected
//                       ? const Color(0xFF2D5A27)
//                       : Colors.transparent,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildInteractiveDeepDive(dynamic data) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: data['gradient'],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(data['emoji'], style: const TextStyle(fontSize: 40)),
//                 const SizedBox(width: 15),
//                 Text(
//                   selectedFactor,
//                   style: const TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: -1,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Text(
//               data['desc'],
//               style: const TextStyle(
//                 fontSize: 17,
//                 height: 1.6,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Divider(color: Colors.black12),
//             ),

//             _buildSectionHeader("The Roots"),
//             ...data['why'].map<Widget>((e) => _buildBulletPoint(e)),

//             const SizedBox(height: 25),
//             _buildSectionHeader("Listen to your body"),
//             ...data['identify'].map<Widget>((e) => _buildCheckPoint(e)),

//             const SizedBox(height: 25),
//             _buildSectionHeader("Healing Steps"),
//             ...data['action'].map<Widget>((e) => _buildActionPoint(e)),

//             const SizedBox(height: 30),
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white),
//               ),
//               child: Column(
//                 children: [
//                   const Text(
//                     "MINDSET SHIFT",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2,
//                       fontSize: 12,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     data['mindset'],
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Text(
//         title.toUpperCase(),
//         style: const TextStyle(
//           fontWeight: FontWeight.w900,
//           fontSize: 13,
//           letterSpacing: 1.5,
//           color: Colors.black54,
//         ),
//       ),
//     );
//   }

//   Widget _buildBulletPoint(String text) => Padding(
//     padding: const EdgeInsets.only(bottom: 8),
//     child: Row(
//       children: [
//         const Icon(Icons.blur_on, size: 16),
//         const SizedBox(width: 10),
//         Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
//       ],
//     ),
//   );

//   Widget _buildCheckPoint(String text) => Padding(
//     padding: const EdgeInsets.only(bottom: 8),
//     child: Row(
//       children: [
//         const Icon(Icons.help_outline, size: 18, color: Colors.black45),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//           ),
//         ),
//       ],
//     ),
//   );

//   Widget _buildActionPoint(String text) => Padding(
//     padding: const EdgeInsets.only(bottom: 10),
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white70,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           const Icon(
//             Icons.check_circle_outline,
//             size: 18,
//             color: Color(0xFF2D5A27),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   Widget _buildGuidedHealingSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Guided Actions",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 15),
//         SizedBox(
//           height: 160,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: guidedActions
//                 .map(
//                   (action) => Container(
//                     width: 220,
//                     margin: const EdgeInsets.only(right: 16),
//                     child: Card(
//                       elevation: 0,
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         side: BorderSide(color: Colors.grey.shade200),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               action['icon']!,
//                               style: const TextStyle(fontSize: 24),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               action['title']!,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               action['desc']!,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.grey.shade600,
//                               ),
//                               maxLines: 2,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickRelief(List<dynamic> tips) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Quick Recovery",
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         ...tips.map(
//           (t) => Card(
//             elevation: 0,
//             margin: const EdgeInsets.only(bottom: 8),
//             color: const Color(0xFFF0F4F0),
//             child: ListTile(
//               leading: const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.bolt, color: Colors.amber, size: 20),
//               ),
//               title: Text(
//                 t,
//                 style: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildExploreMore(dynamic explore) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Resources",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 10),
//           _resourceTile(
//             Icons.play_circle_fill,
//             "Watch Session",
//             Colors.redAccent,
//             () => _launchURL(explore['youtube']),
//           ),
//           _resourceTile(
//             Icons.menu_book_rounded,
//             "Read Deep Dive",
//             Colors.blueAccent,
//             () => _launchURL(explore['article']),
//           ),
//           _resourceTile(
//             Icons.library_books,
//             "Book: ${explore['book']}",
//             Colors.orangeAccent,
//             () => _launchURL(explore['bookUrl']),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _resourceTile(
//     IconData icon,
//     String title,
//     Color color,
//     VoidCallback onTap,
//   ) {
//     return ListTile(
//       onTap: onTap,
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: color),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 14),
//     );
//   }

//   Widget _buildProblemSolver() {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1B3022),
//         borderRadius: BorderRadius.circular(28),
//       ),
//       child: Column(
//         children: [
//           const Text(
//             "Active Problem Solver",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: LinearProgressIndicator(
//               value: (currentStep + 1) / problemSteps.length,
//               backgroundColor: Colors.white12,
//               color: const Color(0xFF96E6A1),
//               minHeight: 8,
//             ),
//           ),
//           const SizedBox(height: 25),
//           Text(
//             problemSteps[currentStep],
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 15),
//           TextField(
//             controller: _problemController,
//             style: const TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               hintText: "Write your thoughts...",
//               hintStyle: const TextStyle(color: Colors.white38),
//               filled: true,
//               fillColor: Colors.white.withOpacity(0.05),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => setState(() {
//                 if (currentStep < problemSteps.length - 1) {
//                   currentStep++;
//                   _problemController.clear();
//                 } else {
//                   currentStep = 0;
//                   _problemController.clear();
//                 }
//               }),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF96E6A1),
//                 foregroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//               ),
//               child: Text(
//                 currentStep == problemSteps.length - 1 ? "Finish" : "Next Step",
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildJournal() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Healing Journal",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 15),
//         TextField(
//           controller: _journalController,
//           maxLines: 3,
//           decoration: InputDecoration(
//             hintText: "How do you feel after this session?",
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.grey.shade200),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.grey.shade200),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         SizedBox(
//           width: double.infinity,
//           child: OutlinedButton(
//             onPressed: _addNote,
//             style: OutlinedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 16),
//             ),
//             child: const Text(
//               "Save Entry",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         ...userNotes.reversed.map(
//           (n) => Card(
//             elevation: 0,
//             color: Colors.white,
//             margin: const EdgeInsets.only(bottom: 10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//               side: BorderSide(color: Colors.grey.shade100),
//             ),
//             child: ListTile(
//               title: Text(n),
//               subtitle: Text(
//                 DateTime.now().toString().split(' ')[0],
//                 style: const TextStyle(fontSize: 10),
//               ),
//               leading: const Icon(Icons.history_edu, color: Color(0xFF2D5A27)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

void main() {
  runApp(const StressManagementApp());
}

class StressManagementApp extends StatelessWidget {
  const StressManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D5A27),
          primary: const Color(0xFF2D5A27),
          surface: const Color(0xFFFBFDFA),
        ),
      ),
      home: const StressManagementPage(),
    );
  }
}

class StressManagementPage extends StatefulWidget {
  const StressManagementPage({super.key});

  @override
  State<StressManagementPage> createState() => _StressManagementPageState();
}

class _StressManagementPageState extends State<StressManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedFactor = "Stress";
  final TextEditingController _journalController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();

  List<String> userNotes = [];
  int currentStep = 0;

  final List<String> problemSteps = [
    "What exactly is bothering you?",
    "Is this in your control?",
    "What is the smallest step you can take?",
    "Take that step. How do you feel now?",
  ];

  final Map<String, dynamic> factorDetails = {
    "Stress": {
      "emoji": "🌀",
      "gradient": [Color(0xFF83A4D4), Color(0xFFB6FBFF)],
      "desc":
          "Stress is your body's reaction to pressure. It's like an alarm that stays 'on' for too long.",
      "why": [
        "Unclear boundaries",
        "Too many responsibilities",
        "Lack of sleep",
        "Major life changes",
      ],
      "identify": [
        "Do you feel constantly rushed?",
        "Is your heart racing for no reason?",
      ],
      "action": [
        "Limit your to-do list to 3 items",
        "Go for a 5-minute walk",
        "Deep breathing (4-7-8 technique)",
      ],
      "mindset": "Focus on the next 10 minutes, not the next 10 days.",
      "closing": "You are more capable than your stress tells you.",
      "recover": ["Hydrate", "Step outside"],
      "explore": {
        "youtube": "https://youtu.be/hnpQrMqDoqE",
        "article":
            "https://www.helpguide.org/articles/stress/stress-management.htm",
        "book": "Why Zebras Don't Get Ulcers",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=Why+Zebras+Don't+Get+Ulcers",
      },
    },
    "Anxiety": {
      "emoji": "😟",
      "gradient": [Color(0xFFFFF1EB), Color(0xFFACE0F9)],
      "desc":
          "Anxiety is an intense worry about the future. It's the mind's attempt to predict danger.",
      "why": [
        "Genetic predisposition",
        "Past trauma",
        "Caffeine or diet",
        "Suppressed emotions",
      ],
      "identify": [
        "Are you 'what-ifing' every situation?",
        "Do you feel a sense of dread?",
      ],
      "action": [
        "Touch 5 things you can see",
        "Write down worst-case scenario",
        "Listen to bilateral music",
      ],
      "mindset":
          "Worrying is like an umbrella; it doesn't stop the rain, it just makes you heavy.",
      "closing": "Your track record for surviving hard days is 100%.",
      "recover": ["Brown noise", "Weighted blanket"],
      "explore": {
        "youtube": "https://youtu.be/lTID_Vf7Lp4",
        "article":
            "https://www.mayoclinic.org/diseases-conditions/anxiety/symptoms-causes/syc-20350961",
        "book": "First, We Make the Beast Beautiful",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=First+We+Make+the+Beast+Beautiful",
      },
    },
    "Depression": {
      "emoji": "☁️",
      "gradient": [Color(0xFFCFD9DF), Color(0xFFE2EBEB)],
      "desc":
          "Depression feels like a heavy fog that drains your energy and interest in the world.",
      "why": [
        "Brain chemistry changes",
        "Loss or grief",
        "Chronic loneliness",
        "Physical illness",
      ],
      "identify": [
        "Does everything feel like a chore?",
        "Have you lost interest in hobbies?",
      ],
      "action": [
        "Get 10 mins of morning sunlight",
        "Shower and change clothes",
        "Text one friend just to say hi",
      ],
      "mindset": "Break the day into 'tiny wins.' Making the bed is a victory.",
      "closing": "The fog will eventually lift; stay for the sunshine.",
      "recover": ["Gentle stretching", "Nutritious meal"],
      "explore": {
        "youtube": "https://youtu.be/kTn_L7jMVv0",
        "article": "https://www.nimh.nih.gov/health/topics/depression",
        "book": "The Upward Spiral",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=The+Upward+Spiral+Alex+Korb",
      },
    },
    "Panic Attack": {
      "emoji": "⚡",
      "gradient": [Color(0xFFFAD0C4), Color(0xFFFFD1FF)],
      "desc":
          "A sudden episode of intense fear that triggers severe physical reactions.",
      "why": [
        "High-stress environment",
        "Phobias",
        "Sudden life shocks",
        "Over-breathing",
      ],
      "identify": [
        "Is it hard to catch your breath?",
        "Do you feel like losing control?",
      ],
      "action": [
        "Splash cold water on face",
        "Hold a piece of ice",
        "Belly breathing",
      ],
      "mindset":
          "This is a physical wave. It will peak and then it will subside.",
      "closing": "This feeling is temporary. You are safe.",
      "recover": ["Sit on the floor", "Drink water"],
      "explore": {
        "youtube": "https://youtu.be/5T6p6K_XfE8",
        "article":
            "https://www.nhs.uk/mental-health/conditions/panic-disorder/",
        "book": "Dare by Barry McDonagh",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=Dare+Barry+McDonagh",
      },
    },
    "Trauma": {
      "emoji": "🕯️",
      "gradient": [Color(0xFFA18CD1), Color(0xFFFBC2EB)],
      "desc":
          "The emotional response to a distressing event that overwhelms your ability to cope.",
      "why": [
        "Abuse or neglect",
        "Accidents",
        "Loss of a loved one",
        "Witnessing violence",
      ],
      "identify": [
        "Do you have vivid, unwanted memories?",
        "Do you feel 'on guard'?",
      ],
      "action": [
        "Ground yourself in the present",
        "Practice self-compassion",
        "Limit triggers",
      ],
      "mindset":
          "You aren't broken; you are a person who has survived a storm.",
      "closing": "Your past does not define your future.",
      "recover": ["Visualization", "Yoga"],
      "explore": {
        "youtube": "https://youtu.be/mYpXF6_U7uE",
        "article":
            "https://www.helpguide.org/articles/ptsd-trauma/coping-with-emotional-and-psychological-trauma.htm",
        "book": "The Body Keeps the Score",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=The+Body+Keeps+the+Score",
      },
    },
    "Anger": {
      "emoji": "🔥",
      "gradient": [Color(0xFFFF9A9E), Color(0xFFFAD0C4)],
      "desc":
          "A powerful emotion often used as a shield to protect us from feeling hurt or afraid.",
      "why": [
        "Unmet expectations",
        "Feeling disrespected",
        "Chronic frustration",
        "Hunger or fatigue",
      ],
      "identify": ["Is your jaw clenched?", "Looking for someone to blame?"],
      "action": [
        "Count to 10",
        "Do 20 jumping jacks",
        "Write an 'angry letter'",
      ],
      "mindset":
          "Anger is a signal, not a command. You don't have to follow it.",
      "closing": "Softness is a strength, not a weakness.",
      "recover": ["Walk away", "Deep exhales"],
      "explore": {
        "youtube": "https://youtu.be/BsVq5R_F6RA",
        "article": "https://www.apa.org/topics/anger/control",
        "book": "Anger: Wisdom for Cooling the Flames",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=Anger+Thich+Nhat+Hanh",
      },
    },
    "Loneliness": {
      "emoji": "🏝️",
      "gradient": [Color(0xFFE2EBEE), Color(0xFFCFCFEA)],
      "desc":
          "A feeling of being disconnected even when people are around you.",
      "why": [
        "Social isolation",
        "Life transitions",
        "Fear of vulnerability",
        "Digital over-dependency",
      ],
      "identify": [
        "Do you feel invisible in a crowd?",
        "Do you crave conversation?",
      ],
      "action": [
        "Join a hobby group",
        "Call a relative",
        "Volunteer for 1 hour",
      ],
      "mindset": "Connection starts with being a friend to yourself first.",
      "closing": "You are a vital part of the world’s fabric.",
      "recover": ["Pet an animal", "Visit a park"],
      "explore": {
        "youtube": "https://youtu.be/n3Xv_g3g-mA",
        "article": "https://www.psychologytoday.com/basics/loneliness",
        "book": "Together by Vivek Murthy",
        "bookUrl":
            "https://www.google.com/search?tbm=bks&q=Together+Vivek+Murthy",
      },
    },
    "Introversion": {
      "emoji": "📖",
      "gradient": [Color(0xFFD4FC79), Color(0xFF96E6A1)],
      "desc":
          "A personality trait where you gain energy from solitude rather than stimulation.",
      "why": [
        "Biological brain wiring",
        "Preference for deep thinking",
        "Sensitivity to dopamine",
      ],
      "identify": ["Drained after parties?", "Prefer 1-on-1 talks?"],
      "action": [
        "Schedule 'recharge' time",
        "Prepare for social events",
        "Embrace listening",
      ],
      "mindset":
          "Quiet people have the loudest minds. Silence is your superpower.",
      "closing": "The world needs your quiet perspective.",
      "recover": ["Read a book", "Solo coffee date"],
      "explore": {
        "youtube": "https://youtu.be/c0KYU2j0TM4",
        "article": "https://www.quietrev.com",
        "book": "Quiet by Susan Cain",
        "bookUrl": "https://www.google.com/search?tbm=bks&q=Quiet+Susan+Cain",
      },
    },
  };

  final List<Map<String, String>> guidedActions = [
    {
      "title": "Anxiety Relief",
      "desc": "Follow the 4-7-8 breathing circle to calm your nerves.",
      "icon": "🌬️",
    },
    {
      "title": "Cool the Anger",
      "desc": "Release physical tension with a 2-minute muscle relaxation.",
      "icon": "❄️",
    },
    {
      "title": "Work De-stress",
      "desc": "Declutter your mind by listing 3 priority tasks.",
      "icon": "💻",
    },
    {
      "title": "Family Peace",
      "desc": "Practice 'I feel' statements to set healthy boundaries.",
      "icon": "🏠",
    },
    {
      "title": "Overthinking Stop",
      "desc": "5-minute brain dump: Write everything down now.",
      "icon": "🧠",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication))
      throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    var data = factorDetails[selectedFactor];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F7),
      appBar: AppBar(
        title: const Text(
          "MindCare",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xFF2D5A27),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF2D5A27),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF2D5A27),
          indicatorWeight: 3,
          tabs: const [
            Tab(text: "UNDERSTAND", icon: Icon(Icons.menu_book_rounded)),
            Tab(text: "HEALING", icon: Icon(Icons.favorite_rounded)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Section 1: Understand
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Deepen your Knowledge",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _buildFactorChips(),
                const SizedBox(height: 20),
                _buildInteractiveDeepDive(data),
                const SizedBox(height: 20),
                _buildExploreMore(data['explore']),
              ],
            ),
          ),
          // Section 2: Healing
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daily Healing Practices",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildGuidedHealingSection(),
                const SizedBox(height: 30),
                _buildQuickRelief(data['recover']),
                const SizedBox(height: 30),
                _buildProblemSolver(),
                const SizedBox(height: 30),
                _buildJournal(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactorChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: factorDetails.keys.map((key) {
          bool isSelected = selectedFactor == key;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text("${factorDetails[key]['emoji']} $key"),
              selected: isSelected,
              onSelected: (_) => setState(() => selectedFactor = key),
              selectedColor: const Color(0xFFE8F3E8),
              labelStyle: TextStyle(
                color: isSelected ? const Color(0xFF2D5A27) : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInteractiveDeepDive(dynamic data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: data['gradient'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['emoji'], style: const TextStyle(fontSize: 40)),
          Text(
            selectedFactor,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Text(
            data['desc'],
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(height: 40, color: Colors.black12),
          _sectionTitle("THE CAUSE"),
          ...data['why'].map<Widget>((e) => _bullet(e, Icons.circle, 8)),
          const SizedBox(height: 20),
          _sectionTitle("SIGNS TO WATCH"),
          ...data['identify'].map<Widget>((e) => _bullet(e, Icons.search, 18)),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "💡 ${data['mindset']}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.5,
        color: Colors.black54,
      ),
    ),
  );

  Widget _bullet(String text, IconData icon, double size) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        Icon(icon, size: size, color: Colors.black45),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    ),
  );

  Widget _buildExploreMore(dynamic explore) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.play_circle, color: Colors.red),
            title: const Text("Watch Explanation"),
            onTap: () => _launchURL(explore['youtube']),
          ),
          ListTile(
            leading: const Icon(Icons.article, color: Colors.blue),
            title: const Text("Read Expert Article"),
            onTap: () => _launchURL(explore['article']),
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.orange),
            title: Text("Book: ${explore['book']}"),
            onTap: () => _launchURL(explore['bookUrl']),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidedHealingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Guided Sessions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: guidedActions
                .map(
                  (action) => Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey.shade100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              action['icon']!,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              action['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              action['desc']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickRelief(List<dynamic> tips) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Recovery for $selectedFactor",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...tips.map(
          (t) => Card(
            elevation: 0,
            color: const Color(0xFFF0F4F0),
            child: ListTile(
              leading: const Icon(Icons.flash_on, color: Colors.amber),
              title: Text(
                t,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProblemSolver() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B3022),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            "Self-Reflection Tool",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: (currentStep + 1) / problemSteps.length,
            color: const Color(0xFF96E6A1),
            backgroundColor: Colors.white12,
          ),
          const SizedBox(height: 20),
          Text(
            problemSteps[currentStep],
            style: const TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _problemController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Your thoughts...",
              hintStyle: const TextStyle(color: Colors.white38),
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => setState(() {
                if (currentStep < problemSteps.length - 1) {
                  currentStep++;
                  _problemController.clear();
                } else {
                  currentStep = 0;
                  _problemController.clear();
                }
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96E6A1),
                foregroundColor: Colors.black,
              ),
              child: const Text("Next Step"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Healing Journal",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _journalController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Write how you feel now...",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              if (_journalController.text.isNotEmpty)
                setState(() {
                  userNotes.add(_journalController.text);
                  _journalController.clear();
                });
            },
            child: const Text("Save Journal Entry"),
          ),
        ),
        const SizedBox(height: 15),
        ...userNotes.reversed.map(
          (n) => Card(
            elevation: 0,
            color: Colors.white,
            child: ListTile(
              title: Text(n),
              leading: const Icon(Icons.history_edu, color: Color(0xFF2D5A27)),
            ),
          ),
        ),
      ],
    );
  }
}
