import 'package:flutter/material.dart';

import '../../../design_system/presentation/widgets/buttons.dart';
import '../../../design_system/presentation/widgets/cards.dart';
import 'auth_scaffold.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Stay in sync',
      subtitle: 'Choose gentle reminders for routines, expiration dates, and progress photos.',
      child: Column(
        children: [
          const ReminderCard(
            title: 'Notifications',
            message: 'Useful reminders only. You stay in control and can update settings later.',
          ),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Allow notifications', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
          const SizedBox(height: 12),
          SecondaryButton(label: 'Not now', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
        ],
      ),
    );
  }
}
