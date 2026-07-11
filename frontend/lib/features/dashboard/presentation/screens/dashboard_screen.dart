import 'package:flutter/material.dart';

import '../../data/mock_dashboard_repository.dart';
import '../../domain/dashboard_models.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_sections.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<DashboardSummary> _summaryFuture;

  @override
  void initState() {
    super.initState();
    _summaryFuture = MockDashboardRepository().fetchSummary();
  }

  Future<void> _reload() async {
    setState(() {
      _summaryFuture = MockDashboardRepository().fetchSummary();
    });
    await _summaryFuture;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardSummary>(
      future: _summaryFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const _DashboardLoadingState();
        }

        if (snapshot.hasError) {
          return _DashboardErrorState(onRetry: _reload);
        }

        final summary = snapshot.data!;
        return RefreshIndicator(
          onRefresh: _reload,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              const DashboardHeader(),
              const SizedBox(height: 20),
              ExpiringProductsCard(products: summary.expiringProducts),
              const SizedBox(height: 16),
              RarelyUsedProductsCard(products: summary.rarelyUsedProducts),
              const SizedBox(height: 16),
              FavoriteCarousel(products: summary.favoriteProducts),
              const SizedBox(height: 16),
              RoutineProgressCard(routine: summary.todayRoutine),
              const SizedBox(height: 16),
              LatestLookCard(look: summary.latestLook),
              const SizedBox(height: 16),
              ProgressReminderCard(reminders: summary.progressReminders),
              const SizedBox(height: 16),
              ForumHighlightsCard(highlights: summary.forumHighlights),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardLoadingState extends StatelessWidget {
  const _DashboardLoadingState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: List.generate(
        5,
        (_) => Container(
          height: 124,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}

class _DashboardErrorState extends StatelessWidget {
  const _DashboardErrorState({required this.onRetry});

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Dashboard could not load', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            const Text('Try again to refresh your beauty summary.'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => onRetry(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
