import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool alignLabelWithHint;
  final FormFieldValidator<String>? validator;

  const FormTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: label,
      keyboardType: keyboardType,
      maxLines: maxLines,
      alignLabelWithHint: alignLabelWithHint,
      validator: validator,
    );
  }
}
