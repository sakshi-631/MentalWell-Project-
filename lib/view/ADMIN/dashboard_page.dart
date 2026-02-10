import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required String username});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool animateCharts = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animateCharts = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 500;

    final cards = [
      const _DashboardCard(
        title: "Total Users",
        value: "1200",
        icon: Icons.people,
      ),
      const _DashboardCard(
        title: "Active Today",
        value: "350",
        icon: Icons.bolt,
      ),
      const _DashboardCard(title: "SOS Requests", value: "5", icon: Icons.sos),
      const _DashboardCard(
        title: "Experts Online",
        value: "12",
        icon: Icons.medical_information,
      ),
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully!")),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard Overview",
              style: TextStyle(
                fontSize: width < 500 ? 18 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // ---------------- Dashboard Cards: 2 per row (square) ----------------
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1, // square shape
              children: cards,
            ),

            const SizedBox(height: 30),

            // User Growth Chart
            Text(
              "User Growth",
              style: TextStyle(
                fontSize: width < 500 ? 14 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 220,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedBar(
                          heightFactor: animateCharts ? 0.1 : 0,
                          label: "Jan",
                          color: Colors.blue,
                        ),
                        AnimatedBar(
                          heightFactor: animateCharts ? 0.2 : 0,
                          label: "Feb",
                          color: Colors.green,
                        ),
                        AnimatedBar(
                          heightFactor: animateCharts ? 0.4 : 0,
                          label: "Mar",
                          color: Colors.orange,
                        ),
                        AnimatedBar(
                          heightFactor: animateCharts ? 0.6 : 0,
                          label: "Apr",
                          color: Colors.red,
                        ),
                        AnimatedBar(
                          heightFactor: animateCharts ? 0.8 : 0,
                          label: "May",
                          color: Colors.purple,
                        ),
                        AnimatedBar(
                          heightFactor: animateCharts ? 1.0 : 0,
                          label: "Jun",
                          color: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Monthly User Growth",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Mood Distribution
            Text(
              "Mood Distribution",
              style: TextStyle(
                fontSize: width < 500 ? 14 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            isWide
                ? Row(
                    children: [
                      Expanded(child: _buildPieChart()),
                      const SizedBox(width: 16),
                      Expanded(child: _buildPieLegend()),
                    ],
                  )
                : Column(
                    children: [
                      _buildPieChart(),
                      const SizedBox(height: 16),
                      _buildPieLegend(),
                    ],
                  ),

            const SizedBox(height: 30),

            // Quick Actions
            Text(
              "Quick Actions & Tips",
              style: TextStyle(
                fontSize: width < 500 ? 16 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "• Review recent SOS requests.\n"
                "• Monitor top contributors.\n"
                "• Check content flagged for review.\n"
                "• Send notifications or alerts to active users.\n"
                "• Track platform health and engagement metrics.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPieSlice(
            color: Colors.green,
            percent: animateCharts ? 0.4 : 0,
          ),
          AnimatedPieSlice(
            color: Colors.orange,
            percent: animateCharts ? 0.25 : 0,
          ),
          AnimatedPieSlice(color: Colors.red, percent: animateCharts ? 0.2 : 0),
          AnimatedPieSlice(
            color: Colors.blue,
            percent: animateCharts ? 0.15 : 0,
          ),
          const Text("Mood\nDistribution", textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildPieLegend() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _Legend(color: Colors.green, label: "Happy 40%"),
        _Legend(color: Colors.orange, label: "Sad 25%"),
        _Legend(color: Colors.red, label: "Anxious 20%"),
        _Legend(color: Colors.blue, label: "Neutral 15%"),
      ],
    );
  }
}

// ---------------- Dashboard Card ----------------
class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(width < 500 ? 6 : 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: width < 500 ? 24 : 32, color: Colors.blue),
            SizedBox(height: width < 500 ? 4 : 6),
            Text(
              value,
              style: TextStyle(
                fontSize: width < 500 ? 14 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: width < 500 ? 2 : 4),
            Text(title, style: TextStyle(fontSize: width < 500 ? 9 : 12)),
          ],
        ),
      ),
    );
  }
}

// ---------------- Animated Bar ----------------
class AnimatedBar extends StatelessWidget {
  final double heightFactor;
  final String label;
  final Color color;

  const AnimatedBar({
    required this.heightFactor,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          width: 20,
          height: 150 * heightFactor,
          color: color,
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// ---------------- Animated Pie Slice ----------------
class AnimatedPieSlice extends StatelessWidget {
  final Color color;
  final double percent;

  const AnimatedPieSlice({
    required this.color,
    required this.percent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percent),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Container(
          width: 150 * value,
          height: 150 * value,
          decoration: BoxDecoration(
            color: color.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

// ---------------- Legend Widget ---------------
class _Legend extends StatelessWidget {
  final Color color;
  final String label;

  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 16, height: 16, color: color),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
