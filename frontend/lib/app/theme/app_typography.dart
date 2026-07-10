import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.graphite),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.graphite),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.graphite),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.graphite),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.graphite),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.graphite),
  );
}
