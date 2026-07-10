import 'package:flutter/material.dart';

class BeautyBottomNavigation extends StatelessWidget {
  const BeautyBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
        NavigationDestination(icon: Icon(Icons.face_retouching_natural_outlined), label: 'Looks'),
        NavigationDestination(icon: Icon(Icons.spa_outlined), label: 'Skincare'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
