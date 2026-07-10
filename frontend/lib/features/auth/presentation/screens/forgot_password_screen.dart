import 'package:flutter/material.dart';

import '../../../design_system/presentation/widgets/buttons.dart';
import '../../../design_system/presentation/widgets/inputs.dart';
import 'auth_scaffold.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Reset password',
      subtitle: 'Enter your email and we will send a secure reset link.',
      child: Column(
        children: [
          const CustomTextField(label: 'Email', hint: 'name@example.com'),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Send reset link', onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
