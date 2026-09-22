import 'package:flutter/material.dart';

class AppDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? labelText;
  final FormFieldValidator<T>? validator;

  const AppDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
