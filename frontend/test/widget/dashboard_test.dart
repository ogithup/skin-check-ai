import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skincheck_ai/features/dashboard/presentation/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen renders dashboard sections', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DashboardScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Today Dashboard'), findsOneWidget);
    expect(find.text('Expiring Products'), findsOneWidget);
    expect(find.text('Favorite Products'), findsOneWidget);
    expect(find.text("Today's Skincare"), findsOneWidget);
    expect(find.text('Latest Look'), findsOneWidget);
  });
}
