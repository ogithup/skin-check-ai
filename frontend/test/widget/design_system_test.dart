import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skincheck_ai/features/design_system/presentation/widgets/buttons.dart';
import 'package:skincheck_ai/features/design_system/presentation/widgets/inputs.dart';

void main() {
  testWidgets('PrimaryButton renders label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: PrimaryButton(label: 'Login')),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('CustomTextField renders label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CustomTextField(label: 'Email')),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
  });
}
