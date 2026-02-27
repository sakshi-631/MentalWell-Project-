// import 'package:flutter/material.dart';

// class SelfCarePage extends StatefulWidget {
//   const SelfCarePage({super.key});

//   @override
//   State<SelfCarePage> createState() => _SelfCarePageState();
// }

// class _SelfCarePageState extends State<SelfCarePage> {
//   // Checklist items
//   final List<Map<String, dynamic>> selfCareTasks = [
//     {"task": "Drink water / Hydration", "done": false},
//     {"task": "Journaling", "done": false},
//     {"task": "Meditation / Mindfulness", "done": false},
//     {"task": "Reading / Wind-down", "done": false},
//     {"task": "Warm bath / Relaxation", "done": false},
//     {"task": "Listen to music / Therapy", "done": false},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Self-Care"),
//         backgroundColor: Colors.pinkAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "🌅 Morning Routine Tips",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             _buildTipCard("Hydrate: Drink a glass of water"),
//             _buildTipCard("Journaling: Write your thoughts or gratitude"),
//             _buildTipCard("Meditation: 5-10 min mindfulness session"),

//             const SizedBox(height: 20),
//             const Text(
//               "🌙 Evening Wind-down",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             _buildTipCard("Read a book or article you enjoy"),
//             _buildTipCard("Take a warm bath to relax"),
//             _buildTipCard("Listen to calming music or therapy tracks"),

//             const SizedBox(height: 20),
//             const Text(
//               "✅ Self-Care Checklist",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: selfCareTasks.length,
//               itemBuilder: (context, index) {
//                 final task = selfCareTasks[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(vertical: 4),
//                   child: CheckboxListTile(
//                     title: Text(task["task"]),
//                     value: task["done"],
//                     onChanged: (val) {
//                       setState(() {
//                         selfCareTasks[index]["done"] = val;
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Placeholder for notifications/reminder feature
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Reminder set! (placeholder)")),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pinkAccent,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text("Set Daily Reminders"),
//               ),
//             ),

//             const SizedBox(height: 20),
//             // Placeholder for Mood Tracker Integration
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text(
//                             "Mood Tracker integration placeholder")),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurpleAccent,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text("Track Mood with Self-Care"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTipCard(String text) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       color: Colors.pink.shade50,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Text(
//           text,
//           style: const TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

const kPrimary = Color(0xFF9B5F4D);
const kPrimaryDark = Color(0xFF7E4A3B);
const kPrimarySoft = Color(0xFFD8B5A8);
const kCard = Color(0xFFF6EEE3);
const kBg = Color(0xFFFCF7F2);
const kSurface = Colors.white;
const kTextDark = Color(0xFF2E221E);
const kTextSoft = Color(0xFF7A675F);
const kSuccess = Color(0xFF6A9C6B);
const kWarning = Color(0xFFE0A458);

class DailyWellnessPage extends StatefulWidget {
  const DailyWellnessPage({super.key});

  @override
  State<DailyWellnessPage> createState() => _DailyWellnessPageState();
}

class _DailyWellnessPageState extends State<DailyWellnessPage> {
  int selectedTab = 0;

  final Map<String, bool> morningTasks = {
    'Drink water 💧': true,
    'Journaling ✍️': false,
    'Meditation 🧘': true,
  };

  final Map<String, String> morningTips = {
    'Drink water 💧': 'Start with 1 glass of water to wake your body.',
    'Journaling ✍️': 'Write 3 thoughts, goals, or gratitudes.',
    'Meditation 🧘': 'Take 5 calm minutes before the day gets busy.',
  };

  final List<String> activities = ['Jogging', 'Strength', 'Yoga'];

  String selectedActivity = 'Yoga';
  int selectedDuration = 10;
  bool activityCompleted = true;
  String activityFeeling = 'better';

  int waterIntake = 5;
  final int waterGoal = 8;

  final Map<String, bool> dailyChecklist = {
    'Hydration': true,
    'Exercise': true,
    'Meditation': true,
    'Reading': false,
    'Sleep prep': false,
  };

  int selectedMood = 2;
  int streakDays = 3;

  List<String> get moods => ['😃', '😄', '😊', '😐', '😞', '😡'];

  int get totalCount => morningTasks.length + dailyChecklist.length + 1;

  int get completedCount {
    final morningDone = morningTasks.values.where((e) => e).length;
    final checklistDone = dailyChecklist.values.where((e) => e).length;
    final activityDone = activityCompleted ? 1 : 0;
    return morningDone + checklistDone + activityDone;
  }

  double get progress => completedCount / totalCount;

  int get completionPercentage => (progress * 100).round();

  String get focusMessage {
    if (completionPercentage >= 80) {
      return 'You’re in a strong rhythm today. Protect your peace and keep going.';
    } else if (completionPercentage >= 50) {
      return 'Nice progress so far. A few small wins can make today feel lighter.';
    } else {
      return 'Start soft. One mindful action can shift your whole day.';
    }
  }

  void toggleMorningTask(String key) {
    setState(() {
      morningTasks[key] = !(morningTasks[key] ?? false);
    });
  }

  void toggleChecklistTask(String key) {
    setState(() {
      dailyChecklist[key] = !(dailyChecklist[key] ?? false);
    });
  }

  void updateWater(int delta) {
    setState(() {
      waterIntake = (waterIntake + delta).clamp(0, waterGoal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 28),
          children: [
            _buildHeroHeader(),
            const SizedBox(height: 18),
            _buildQuickOverview(),
            const SizedBox(height: 18),
            _buildTopTabs(),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProgressCard(),
                  const SizedBox(height: 16),
                  _buildMorningRoutineSection(),
                  const SizedBox(height: 16),
                  _buildActivitySection(),
                  const SizedBox(height: 16),
                  _buildNutritionSection(),
                  const SizedBox(height: 16),
                  _buildChecklistSection(),
                  const SizedBox(height: 16),
                  _buildReflectionSection(),
                  const SizedBox(height: 18),
                  _buildMotivationCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kPrimary, kPrimaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: kPrimary.withOpacity(0.24),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.self_improvement_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning, Sakshi ☀️',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Let’s stay calm & productive today',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$streakDays Day',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _heroMiniStat(
                    icon: Icons.task_alt_rounded,
                    label: 'Progress',
                    value: '$completionPercentage%',
                  ),
                ),
                Container(
                  width: 1,
                  height: 34,
                  color: Colors.white.withOpacity(0.18),
                ),
                Expanded(
                  child: _heroMiniStat(
                    icon: Icons.water_drop_rounded,
                    label: 'Water',
                    value: '$waterIntake/$waterGoal',
                  ),
                ),
                Container(
                  width: 1,
                  height: 34,
                  color: Colors.white.withOpacity(0.18),
                ),
                Expanded(
                  child: _heroMiniStat(
                    icon: Icons.favorite_rounded,
                    label: 'Mood',
                    value: moods[selectedMood],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroMiniStat({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.82),
            fontSize: 11.5,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickOverview() {
    return SizedBox(
      height: 88,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          _OverviewCard(
            emoji: '🌿',
            title: 'Calm Focus',
            subtitle: '2 mindful habits done',
            color: const Color(0xFFEEDFD5),
          ),
          _OverviewCard(
            emoji: '💧',
            title: 'Hydration',
            subtitle: '$waterIntake of $waterGoal glasses',
            color: const Color(0xFFEAE3D8),
          ),
          _OverviewCard(
            emoji: '🏃',
            title: selectedActivity,
            subtitle: '$selectedDuration min planned',
            color: const Color(0xFFF3E7DE),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTabs() {
    final tabs = ['Today', 'Routine', 'Reflect'];

    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final selected = selectedTab == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: selected ? kPrimary : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: kPrimary.withOpacity(0.18),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : const [
                        BoxShadow(
                          color: Color(0x0E000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                border: Border.all(
                  color: selected
                      ? Colors.transparent
                      : const Color(0xFFEEE0D3),
                ),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: selected ? Colors.white : kTextDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: tabs.length,
      ),
    );
  }

  Widget _buildProgressCard() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Today’s Progress',
            icon: Icons.insights_rounded,
            actionText: 'Live',
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  '$completedCount/$totalCount tasks completed',
                  style: const TextStyle(
                    color: kTextDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kPrimary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  '$completionPercentage%',
                  style: const TextStyle(
                    color: kPrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Stack(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9DCCE),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                height: 12,
                width: MediaQuery.of(context).size.width * 0.75 * progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kPrimary, kPrimaryDark],
                  ),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            focusMessage,
            style: const TextStyle(
              color: kTextSoft,
              fontSize: 13.2,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMorningRoutineSection() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Morning Routine',
            icon: Icons.wb_sunny_outlined,
            actionText: '3 habits',
          ),
          const SizedBox(height: 14),
          ...morningTasks.keys.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomCheckboxTile(
                title: task,
                subtitle: morningTips[task]!,
                value: morningTasks[task]!,
                onChanged: (_) => toggleMorningTask(task),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySection() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Physical Activity',
            icon: Icons.fitness_center_rounded,
            actionText: 'Active',
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: activities.map((activity) {
              final selected = selectedActivity == activity;
              return WellnessChip(
                label: activity,
                selected: selected,
                onTap: () {
                  setState(() {
                    selectedActivity = activity;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Duration',
                style: TextStyle(
                  color: kTextDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '$selectedDuration min session',
                style: const TextStyle(
                  color: kTextSoft,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [5, 10, 15, 20].map((duration) {
              final selected = selectedDuration == duration;
              return WellnessChip(
                label: '$duration min',
                compact: true,
                selected: selected,
                onTap: () {
                  setState(() {
                    selectedDuration = duration;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                activityCompleted = !activityCompleted;
                if (!activityCompleted) {
                  activityFeeling = '';
                }
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: activityCompleted
                    ? kSuccess.withOpacity(0.10)
                    : const Color(0xFFFFFBF7),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: activityCompleted
                      ? kSuccess.withOpacity(0.35)
                      : const Color(0xFFE6DBCF),
                ),
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: activityCompleted ? kSuccess : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: activityCompleted ? kSuccess : kTextSoft,
                        width: 1.5,
                      ),
                    ),
                    child: activityCompleted
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '$selectedActivity completed',
                      style: TextStyle(
                        color: activityCompleted ? kSuccess : kTextDark,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: activityCompleted
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      key: const ValueKey('feeling'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'How do you feel?',
                          style: TextStyle(
                            color: kTextDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _feelingChip(
                                label: '😊 Better',
                                value: 'better',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _feelingChip(
                                label: '😐 Same',
                                value: 'same',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _feelingChip(
                                label: '😞 Worse',
                                value: 'worse',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _feelingChip({required String label, required String value}) {
    final selected = activityFeeling == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          activityFeeling = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? kPrimary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? kPrimary : const Color(0xFFE5D9CD),
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: kPrimary.withOpacity(0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ]
              : const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : kTextDark,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionSection() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Nutrition',
            icon: Icons.restaurant_menu_rounded,
            actionText: 'Balanced',
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBF7),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFEEE0D3)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Water intake today',
                        style: TextStyle(
                          color: kTextDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                    Text(
                      '$waterIntake/$waterGoal glasses',
                      style: const TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: List.generate(waterGoal, (index) {
                    final filled = index < waterIntake;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == waterGoal - 1 ? 0 : 6,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          height: 36,
                          decoration: BoxDecoration(
                            color: filled ? kPrimary : const Color(0xFFECE0D5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.water_drop_rounded,
                            color: filled ? Colors.white : kTextSoft,
                            size: 18,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _miniActionButton(
                        icon: Icons.remove,
                        text: 'Less',
                        onTap: () => updateWater(-1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _miniActionButton(
                        icon: Icons.add,
                        text: 'Add glass',
                        filled: true,
                        onTap: () => updateWater(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Meal suggestions',
            style: TextStyle(
              color: kTextDark,
              fontWeight: FontWeight.w700,
              fontSize: 14.5,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              SuggestionPill(
                emoji: '🥗',
                title: 'Salad',
                subtitle: 'Fresh & light',
              ),
              SuggestionPill(
                emoji: '🥣',
                title: 'Oats',
                subtitle: 'Steady energy',
              ),
              SuggestionPill(
                emoji: '🍓',
                title: 'Smoothie',
                subtitle: 'Quick nutrients',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniActionButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool filled = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: filled ? kPrimary : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: filled ? kPrimary : const Color(0xFFE7D8CC),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: filled ? Colors.white : kPrimary),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: filled ? Colors.white : kPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistSection() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Daily Checklist',
            icon: Icons.checklist_rounded,
            actionText: 'Focus',
          ),
          const SizedBox(height: 14),
          ...dailyChecklist.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomCheckboxTile(
                title: entry.key,
                subtitle: 'Stay consistent with this habit today',
                value: entry.value,
                onChanged: (_) => toggleChecklistTask(entry.key),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionSection() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Daily Reflection',
            icon: Icons.favorite_rounded,
            actionText: 'Mood',
          ),
          const SizedBox(height: 8),
          const Text(
            'How was your day?',
            style: TextStyle(
              color: kTextDark,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Choose the mood that feels closest to your day.',
            style: TextStyle(color: kTextSoft, fontSize: 13, height: 1.45),
          ),
          const SizedBox(height: 14),
          MoodSelector(
            selectedIndex: selectedMood,
            onSelected: (index) {
              setState(() {
                selectedMood = index;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMotivationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF3E7DE), Color(0xFFFFFBF7)],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFECDCCF)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: kPrimary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text('🌸', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              focusMessage,
              style: const TextStyle(
                color: kTextDark,
                fontSize: 14.2,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
        border: Border.all(color: Color(0xFFF0E4D8)),
      ),
      child: child,
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final String actionText;

  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: kPrimary.withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: kPrimary, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: kTextDark,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE9DCCF)),
          ),
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: kTextSoft,
            ),
          ),
        ),
      ],
    );
  }
}

class WellnessChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  const WellnessChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 14 : 16,
          vertical: compact ? 10 : 12,
        ),
        decoration: BoxDecoration(
          color: selected ? kPrimary : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected ? kPrimary : const Color(0xFFE7D9CD),
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: kPrimary.withOpacity(0.16),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : const [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : kTextDark,
            fontWeight: FontWeight.w700,
            fontSize: compact ? 12.8 : 13.5,
          ),
        ),
      ),
    );
  }
}

class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckboxTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: value ? Colors.white : const Color(0xFFFFFBF7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: value ? kPrimary.withOpacity(0.35) : const Color(0xFFE6DBCF),
        ),
        boxShadow: value
            ? [
                BoxShadow(
                  color: kPrimary.withOpacity(0.08),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ]
            : const [],
      ),
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: value ? kPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: value ? kPrimary : const Color(0xFFC8B7A9),
                  width: 1.6,
                ),
              ),
              child: value
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: value ? kPrimary : kTextDark,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12.8,
                      height: 1.45,
                      color: kTextSoft,
                    ),
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

class MoodSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const MoodSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const moods = ['😃', '😄', '😊', '😐', '😞', '😡'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(moods.length, (index) {
        final selected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOut,
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: selected ? kPrimary : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? kPrimary : const Color(0xFFE5D9CD),
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: kPrimary.withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : const [
                      BoxShadow(
                        color: Color(0x0B000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
            ),
            child: Center(
              child: AnimatedScale(
                duration: const Duration(milliseconds: 220),
                scale: selected ? 1.08 : 1,
                child: Text(moods[index], style: const TextStyle(fontSize: 22)),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SuggestionPill extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;

  const SuggestionPill({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8DCCE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: kTextDark,
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(color: kTextSoft, fontSize: 11.5),
          ),
        ],
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color color;

  const _OverviewCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 14,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kTextDark,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: kTextSoft,
                    fontSize: 11.8,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
