import '../domain/dashboard_models.dart';

class MockDashboardRepository {
  Future<DashboardSummary> fetchSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return DashboardSummary(
      expiringProducts: const [],
      rarelyUsedProducts: const [],
      favoriteProducts: [
        const DashboardProduct(
          id: 'fav-1',
          brand: 'Rare Beauty',
          name: 'Soft Pinch Blush',
          subtitle: 'Favorite glow product',
          status: 'Favorite',
        ),
        const DashboardProduct(
          id: 'fav-2',
          brand: 'Laneige',
          name: 'Lip Sleeping Mask',
          subtitle: 'Night routine staple',
          status: 'Favorite',
        ),
      ],
      todayRoutine: const DashboardRoutine(
        title: 'Morning skincare',
        progressLabel: '2 of 4 steps completed',
        completedSteps: 2,
        totalSteps: 4,
      ),
      latestLook: const DashboardLook(
        title: 'Soft glass-skin look',
        note: 'Fresh base, cream blush, and glossy lip.',
      ),
      progressReminders: const [
        DashboardReminder(
          title: 'Next progress photo in 2 days',
          message: 'Keep lighting consistent for your next skincare check-in.',
          level: 'info',
        ),
      ],
      forumHighlights: const [
        DashboardForumHighlight(
          title: 'Hydration routines for combination skin',
          excerpt: 'Users are sharing lightweight layering tips for humid weather.',
          tag: 'Community',
        ),
      ],
    );
  }
}
