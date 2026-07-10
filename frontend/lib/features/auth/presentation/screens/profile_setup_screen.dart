import 'package:flutter/material.dart';

import '../../../design_system/presentation/widgets/avatar.dart';
import '../../../design_system/presentation/widgets/buttons.dart';
import '../../../design_system/presentation/widgets/inputs.dart';
import 'auth_scaffold.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Profile setup',
      subtitle: 'Tell us just enough to personalize the app without adding friction.',
      child: Column(
        children: [
          const AvatarView(label: 'S'),
          const SizedBox(height: 20),
          const CustomTextField(label: 'Display name', hint: 'Skin lover'),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Skin type', hint: 'Dry, oily, combination...'),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Beauty goal', hint: 'Routine consistency'),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Save profile', onPressed: () => Navigator.pushNamed(context, '/permissions')),
        ],
      ),
    );
  }
}
