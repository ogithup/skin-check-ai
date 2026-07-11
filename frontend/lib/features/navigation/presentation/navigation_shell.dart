import 'package:flutter/material.dart';

import '../../dashboard/presentation/screens/dashboard_screen.dart';
import '../../design_system/presentation/widgets/bottom_navigation.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key});

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final titles = ['Dashboard', 'Makeup Bag', 'Looks', 'Skincare', 'Profile'];
    final screens = [
      const DashboardScreen(),
      const _PlaceholderScreen(title: 'Makeup Bag', message: 'Product diary screens arrive in Sprint 3.'),
      const _PlaceholderScreen(title: 'Looks', message: 'Makeup look journal arrives in Sprint 8.'),
      const _PlaceholderScreen(title: 'Skincare', message: 'Routine tracker arrives in Sprint 9.'),
      const _PlaceholderScreen(title: 'Profile', message: 'Profile and settings continue to expand in later sprints.'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex])),
      body: screens[currentIndex],
      bottomNavigationBar: BeautyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
