class DashboardProduct {
  const DashboardProduct({
    required this.id,
    required this.brand,
    required this.name,
    required this.subtitle,
    required this.status,
  });

  final String id;
  final String brand;
  final String name;
  final String subtitle;
  final String status;
}

class DashboardRoutine {
  const DashboardRoutine({
    required this.title,
    required this.progressLabel,
    required this.completedSteps,
    required this.totalSteps,
  });

  final String title;
  final String progressLabel;
  final int completedSteps;
  final int totalSteps;
}

class DashboardLook {
  const DashboardLook({
    required this.title,
    required this.note,
    this.imageUrl,
  });

  final String title;
  final String note;
  final String? imageUrl;
}

class DashboardReminder {
  const DashboardReminder({
    required this.title,
    required this.message,
    required this.level,
  });

  final String title;
  final String message;
  final String level;
}

class DashboardForumHighlight {
  const DashboardForumHighlight({
    required this.title,
    required this.excerpt,
    required this.tag,
  });

  final String title;
  final String excerpt;
  final String tag;
}

class DashboardSummary {
  const DashboardSummary({
    required this.expiringProducts,
    required this.rarelyUsedProducts,
    required this.favoriteProducts,
    required this.todayRoutine,
    required this.latestLook,
    required this.progressReminders,
    required this.forumHighlights,
  });

  final List<DashboardProduct> expiringProducts;
  final List<DashboardProduct> rarelyUsedProducts;
  final List<DashboardProduct> favoriteProducts;
  final DashboardRoutine? todayRoutine;
  final DashboardLook? latestLook;
  final List<DashboardReminder> progressReminders;
  final List<DashboardForumHighlight> forumHighlights;
}
