import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
  });

  final String label;
  final String? hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}


class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hint,
      ),
    );
  }
}
