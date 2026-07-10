import 'package:flutter/material.dart';

import '../../../design_system/presentation/widgets/buttons.dart';
import '../../../design_system/presentation/widgets/inputs.dart';
import 'auth_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Welcome back',
      subtitle: 'Track beauty routines, favorite products, and your skin journey in one calm place.',
      child: Column(
        children: [
          const CustomTextField(label: 'Email', hint: 'name@example.com'),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Password', hint: 'Enter password', obscureText: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/forgot-password'),
              child: const Text('Forgot Password?'),
            ),
          ),
          const SizedBox(height: 12),
          PrimaryButton(label: 'Login', onPressed: () => Navigator.pushReplacementNamed(context, '/home')),
          const SizedBox(height: 12),
          SecondaryButton(label: 'Create account', onPressed: () => Navigator.pushNamed(context, '/register')),
        ],
      ),
    );
  }
}
