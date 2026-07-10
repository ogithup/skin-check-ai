import 'package:flutter/material.dart';

import 'buttons.dart';

class AppModalSheet extends StatelessWidget {
  const AppModalSheet({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(body),
          const SizedBox(height: 20),
          PrimaryButton(label: 'Continue', onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
