import 'package:flutter/material.dart';

import '../../design_system/presentation/widgets/bottom_navigation.dart';
import '../../design_system/presentation/widgets/cards.dart';
import '../../design_system/presentation/widgets/inputs.dart';

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

    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex])),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SearchBarField(hint: 'Search products or routines'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  BeautyCard(title: 'Premium UI foundation', subtitle: 'Theme, spacing, and reusable widgets are ready.'),
                  SizedBox(height: 16),
                  ProductCard(brand: 'SkinCheck AI', name: 'Auth Sprint Mock Card', category: 'Design System'),
                  SizedBox(height: 16),
                  ProgressCard(title: 'Sprint 1 progress', progressLabel: 'Authentication shell completed'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BeautyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
