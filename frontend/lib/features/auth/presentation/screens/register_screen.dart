import 'package:flutter/material.dart';

import '../../../design_system/presentation/widgets/buttons.dart';
import '../../../design_system/presentation/widgets/inputs.dart';
import 'auth_scaffold.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Create account',
      subtitle: 'Set up your private beauty space with premium tracking and thoughtful reminders.',
      child: Column(
        children: [
          const CustomTextField(label: 'Email', hint: 'name@example.com'),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Password', hint: 'Create password', obscureText: true),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Confirm password', hint: 'Repeat password', obscureText: true),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Continue', onPressed: () => Navigator.pushNamed(context, '/profile-setup')),
          const SizedBox(height: 12),
          SecondaryButton(label: 'Back to login', onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
