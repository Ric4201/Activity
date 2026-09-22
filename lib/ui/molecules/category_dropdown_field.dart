import 'package:flutter/material.dart';
import '../atoms/app_dropdown_field.dart';

class CategoryDropdownField extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String?> onChanged;
  final List<String> categories;

  const CategoryDropdownField({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
    this.categories = const [
      'Electronics',
      'Home',
      'Office',
      'Accessories',
    ],
  });

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<String>(
      value: selectedCategory,
      labelText: 'Category',
      items: categories
          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
