import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final subtitle = '${today.day}/${today.month}/${today.year} • Calm beauty check-in';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.blush, AppColors.cream],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today Dashboard', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.espresso),
          ),
          const SizedBox(height: 16),
          Text(
            'Track what matters first: routine, favorites, reminders, and product health.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
