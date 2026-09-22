import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool alignLabelWithHint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}
