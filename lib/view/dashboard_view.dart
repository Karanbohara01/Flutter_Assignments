import 'package:first_assignment/view/area_circle_view.dart';
import 'package:first_assignment/view/arithmetic_view.dart';
import 'package:first_assignment/view/simple_interest_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DashboardView());
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Dashboard Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('SI Calculator'),
              onTap: () {
                _navigateTo(context, const SimpleInterestView());
              },
            ),
            ListTile(
              leading: const Icon(Icons.area_chart),
              title: const Text('Area Calculator'),
              onTap: () {
                _navigateTo(context, const AreaOfCircle());
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: const Text('Arithmetic Calculator'),
              onTap: () {
                _navigateTo(context, const ArithmeticView());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            DashboardCard(
              icon: Icons.calculate,
              title: 'SI Calculator',
              color: Colors.blueAccent,
              onTap: () => _navigateTo(context, const SimpleInterestView()),
            ),
            DashboardCard(
              icon: Icons.area_chart,
              title: 'Area Calculator',
              color: Colors.greenAccent,
              onTap: () => _navigateTo(context, const AreaOfCircle()),
            ),
            DashboardCard(
              icon: Icons.calculate_outlined,
              title: ' Calculator',
              color: Colors.orangeAccent,
              onTap: () => _navigateTo(context, const ArithmeticView()),
            ),
            DashboardCard(
              icon: Icons.report,
              title: 'Reports',
              color: Colors.purpleAccent,
              onTap: () {
                // Add navigation for reports or handle action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
