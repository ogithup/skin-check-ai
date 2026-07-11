import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/dashboard_models.dart';
import '../../../design_system/presentation/widgets/cards.dart';
import '../../../design_system/presentation/widgets/chips_and_badges.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BeautyCard(
      title: title,
      subtitle: subtitle,
      child: child,
    );
  }
}

class EmptyDashboardState extends StatelessWidget {
  const EmptyDashboardState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(message),
    );
  }
}

class ExpiringProductsCard extends StatelessWidget {
  const ExpiringProductsCard({super.key, required this.products});

  final List<DashboardProduct> products;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Expiring Products',
      subtitle: 'Stay ahead of opened-product usage windows.',
      child: products.isEmpty
          ? const EmptyDashboardState(message: 'No expiring products yet. Your future reminders will appear here.')
          : Column(
              children: products
                  .map(
                    (product) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(product.name),
                      subtitle: Text(product.brand),
                      trailing: AppBadge(label: product.status),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class RarelyUsedProductsCard extends StatelessWidget {
  const RarelyUsedProductsCard({super.key, required this.products});

  final List<DashboardProduct> products;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Rarely Used',
      subtitle: 'Rediscover products already in your bag.',
      child: products.isEmpty
          ? const EmptyDashboardState(message: 'No underused products detected yet.')
          : Column(
              children: products
                  .map(
                    (product) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(product.name),
                      subtitle: Text(product.subtitle),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class FavoriteCarousel extends StatelessWidget {
  const FavoriteCarousel({super.key, required this.products});

  final List<DashboardProduct> products;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Favorite Products',
      subtitle: 'Quick access to your most-loved staples.',
      child: products.isEmpty
          ? const EmptyDashboardState(message: 'Mark favorites in upcoming product sprints to populate this row.')
          : SizedBox(
              height: 154,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    width: 220,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.line),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppChip(label: product.status),
                        const Spacer(),
                        Text(product.brand, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 6),
                        Text(product.name),
                        const SizedBox(height: 4),
                        Text(product.subtitle, style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class RoutineProgressCard extends StatelessWidget {
  const RoutineProgressCard({super.key, required this.routine});

  final DashboardRoutine? routine;

  @override
  Widget build(BuildContext context) {
    if (routine == null) {
      return const DashboardSection(
        title: "Today's Skincare",
        subtitle: 'Your morning and evening progress lives here.',
        child: EmptyDashboardState(message: 'No routine configured yet.'),
      );
    }

    final progress = routine!.totalSteps == 0 ? 0.0 : routine!.completedSteps / routine!.totalSteps;
    return DashboardSection(
      title: "Today's Skincare",
      subtitle: routine!.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(routine!.progressLabel),
          const SizedBox(height: 12),
          LinearProgressIndicator(value: progress, minHeight: 10),
        ],
      ),
    );
  }
}

class LatestLookCard extends StatelessWidget {
  const LatestLookCard({super.key, required this.look});

  final DashboardLook? look;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Latest Look',
      subtitle: 'Your most recent beauty journal entry.',
      child: look == null
          ? const EmptyDashboardState(message: 'No looks saved yet.')
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.sand,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(look!.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(look!.note),
                ],
              ),
            ),
    );
  }
}

class ProgressReminderCard extends StatelessWidget {
  const ProgressReminderCard({super.key, required this.reminders});

  final List<DashboardReminder> reminders;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Progress Reminder',
      subtitle: 'Keep your routine and photo timeline consistent.',
      child: reminders.isEmpty
          ? const EmptyDashboardState(message: 'No reminders yet.')
          : Column(
              children: reminders
                  .map(
                    (reminder) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(reminder.title),
                      subtitle: Text(reminder.message),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class ForumHighlightsCard extends StatelessWidget {
  const ForumHighlightsCard({super.key, required this.highlights});

  final List<DashboardForumHighlight> highlights;

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: 'Forum Highlights',
      subtitle: 'Soft insight from the wider community.',
      child: highlights.isEmpty
          ? const EmptyDashboardState(message: 'No community highlights available yet.')
          : Column(
              children: highlights
                  .map(
                    (highlight) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(highlight.title),
                      subtitle: Text(highlight.excerpt),
                      trailing: AppChip(label: highlight.tag),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
