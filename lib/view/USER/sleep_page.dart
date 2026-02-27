import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Set status bar to dark icons for light theme
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MentalWellnessApp());
}

class MentalWellnessApp extends StatelessWidget {
  const MentalWellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Inter',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFFF8FAFC,
        ), // Very light grey-blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF10B981), // Emerald Green
          primary: const Color(0xFF10B981),
        ),
      ),
      home: const SleepRelaxationPage(),
    );
  }
}

class SleepRelaxationPage extends StatefulWidget {
  const SleepRelaxationPage({super.key});

  @override
  State<SleepRelaxationPage> createState() => _SleepRelaxationPageState();
}

class _SleepRelaxationPageState extends State<SleepRelaxationPage> {
  bool _reminderEnabled = true;
  final List<String> _selectedDisturbances = [];
  final Map<String, bool> _routineChecklist = {
    "Avoid screens": false,
    "Drink warm water": true,
    "5-min breathing": false,
    "Lights dimmed": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSleepScoreCard(),
                  const SizedBox(height: 24),
                  _buildBedtimeReminder(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Your Evening Progress"),
                  _buildChecklist(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Guided Sessions"),
                  _buildGuidedSessions(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Sleep Environment"),
                  _buildSleepEnvironment(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Weekly Insights"),
                  _buildWeeklyAnalytics(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("What's keeping you awake?"),
                  _buildSmartUXChips(),
                  const SizedBox(height: 24),
                  _buildQuickTechniques(),
                  const SizedBox(height: 40),
                  _buildQuote(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 LIGHT APP BAR (Green Gradient)
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 140,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Sleep & Relaxation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              "Improve your sleep quality",
              style: TextStyle(fontSize: 10, color: Colors.black45),
            ),
          ],
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFD1FAE5), Colors.white], // Mint to White
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -10,
                top: 20,
                child: Icon(
                  Icons.wb_sunny_outlined,
                  size: 100,
                  color: const Color(0xFF10B981).withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 SLEEP SCORE (Green Accent)
  Widget _buildSleepScoreCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.72,
                  strokeWidth: 8,
                  strokeCap: StrokeCap.round,
                  backgroundColor: const Color(0xFFECFDF5),
                  color: const Color(0xFF10B981),
                ),
              ),
              const Text(
                "72",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF065F46),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Solid Progress",
                  style: TextStyle(
                    color: Color(0xFF10B981),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "You slept 7h 12m last night. Try to hit 8h today!",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 REMINDER (Interactive Toggle)
  Widget _buildBedtimeReminder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_active_outlined,
              color: Color(0xFF10B981),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wind Down",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                "Reminder set for 10:30 PM",
                style: TextStyle(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Switch(
            value: _reminderEnabled,
            activeColor: const Color(0xFF10B981),
            onChanged: (val) => setState(() => _reminderEnabled = val),
          ),
        ],
      ),
    );
  }

  // 🔹 CHECKLIST (Green Themed)
  Widget _buildChecklist() {
    int completed = _routineChecklist.values.where((v) => v).length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: completed / _routineChecklist.length,
              minHeight: 8,
              color: const Color(0xFF10B981),
              backgroundColor: const Color(0xFFF1F5F9),
            ),
          ),
          const SizedBox(height: 8),
          ..._routineChecklist.keys.map((key) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                key,
                style: const TextStyle(fontSize: 14, color: Color(0xFF334155)),
              ),
              value: _routineChecklist[key],
              activeColor: const Color(0xFF10B981),
              onChanged: (val) => setState(() => _routineChecklist[key] = val!),
            );
          }),
        ],
      ),
    );
  }

  // 🔹 GUIDED SESSIONS (Horizontal Cards)
  Widget _buildGuidedSessions() {
    final sessions = [
      {
        "name": "Deep Relaxation",
        "icon": Icons.spa,
        "color": const Color(0xFFD1FAE5),
      },
      {
        "name": "Nature Sounds",
        "icon": Icons.forest,
        "color": const Color(0xFFDBEAFE),
      },
      {
        "name": "Breath Work",
        "icon": Icons.air,
        "color": const Color(0xFFFEF3C7),
      },
    ];

    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: sessions
            .map(
              (s) => Container(
                width: 140,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: s['color'] as Color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(s['icon'] as IconData, color: Colors.black54),
                      Text(
                        s['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // 🔹 WEEKLY ANALYTICS (Green Bars)
  Widget _buildWeeklyAnalytics() {
    final data = [6, 7, 5, 8, 6, 9, 7];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: data
            .map(
              (h) => Column(
                children: [
                  Container(
                    width: 14,
                    height: h * 8,
                    decoration: BoxDecoration(
                      color: h >= 7
                          ? const Color(0xFF10B981)
                          : const Color(0xFFD1FAE5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "M",
                    style: TextStyle(fontSize: 10, color: Colors.black38),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  // 🔹 ENVIRONMENT CARD
  Widget _buildSleepEnvironment() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.thermostat, color: Color(0xFF10B981)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Room Optimization",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Keep it 18°C and pitch black for best results.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 SMART CHIPS
  Widget _buildSmartUXChips() {
    final options = ["Work Stress", "Social Media", "Caffeine", "Environment"];
    return Wrap(
      spacing: 8,
      children: options.map((opt) {
        bool isSelected = _selectedDisturbances.contains(opt);
        return FilterChip(
          label: Text(opt),
          selected: isSelected,
          onSelected: (val) => setState(
            () => val
                ? _selectedDisturbances.add(opt)
                : _selectedDisturbances.remove(opt),
          ),
          selectedColor: const Color(0xFFD1FAE5),
          checkmarkColor: const Color(0xFF10B981),
          labelStyle: TextStyle(
            color: isSelected ? const Color(0xFF065F46) : Colors.black87,
          ),
        );
      }).toList(),
    );
  }

  // 🔹 QUICK TILES
  Widget _buildQuickTechniques() {
    final techs = [
      "4-7-8 Breathing",
      "Muscle Scan",
      "Visualization",
      "White Noise",
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: techs.length,
      itemBuilder: (context, i) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Center(
          child: Text(
            techs[i],
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),
      ),
    );
  }

  Widget _buildQuote() {
    return const Center(
      child: Column(
        children: [
          Icon(Icons.format_quote, color: Color(0xFF10B981), size: 30),
          Text(
            "“A well-spent day brings happy sleep.”",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
