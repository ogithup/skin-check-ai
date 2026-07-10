import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'chips_and_badges.dart';

class BeautyCard extends StatelessWidget {
  const BeautyCard({super.key, required this.title, required this.subtitle, this.child});

  final String title;
  final String subtitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(subtitle),
          if (child != null) ...[
            const SizedBox(height: 16),
            child!,
          ],
        ],
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.brand, required this.name, required this.category});

  final String brand;
  final String name;
  final String category;

  @override
  Widget build(BuildContext context) {
    return BeautyCard(
      title: brand,
      subtitle: name,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppChip(label: category),
          const AppBadge(label: 'New'),
        ],
      ),
    );
  }
}


class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return BeautyCard(title: title, subtitle: message);
  }
}


class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.title, required this.progressLabel});

  final String title;
  final String progressLabel;

  @override
  Widget build(BuildContext context) {
    return BeautyCard(
      title: title,
      subtitle: progressLabel,
      child: const LinearProgressIndicator(value: 0.6, minHeight: 8),
    );
  }
}
