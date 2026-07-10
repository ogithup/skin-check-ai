import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/permission_screen.dart';
import '../features/auth/presentation/screens/profile_setup_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/navigation/presentation/navigation_shell.dart';
import 'theme/app_theme.dart';

class SkinCheckApp extends StatelessWidget {
  const SkinCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkinCheck AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/forgot-password': (_) => const ForgotPasswordScreen(),
        '/profile-setup': (_) => const ProfileSetupScreen(),
        '/permissions': (_) => const PermissionScreen(),
        '/home': (_) => const NavigationShell(),
      },
    );
  }
}
