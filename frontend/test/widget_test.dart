import 'package:flutter_test/flutter_test.dart';
import 'package:skincheck_ai/app/app.dart';

void main() {
  testWidgets('SkinCheckApp renders login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SkinCheckApp());

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Create account'), findsOneWidget);
  });
}
