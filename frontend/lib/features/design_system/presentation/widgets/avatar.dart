import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: AppColors.sage,
      child: Text(label, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
