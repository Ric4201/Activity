import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';

class SearchBarMolecule extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBarMolecule({
    super.key,
    required this.onChanged,
    this.hintText = 'Type a product name...',
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: hintText,
      onChanged: onChanged,
    );
  }
}
