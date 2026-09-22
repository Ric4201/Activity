import 'package:flutter/material.dart';
import '../atoms/app_button.dart';
import '../atoms/app_heading.dart';
import '../molecules/category_dropdown_field.dart';
import '../molecules/form_text_field.dart';

typedef OnProductSubmitCallback = void Function({
  required String name,
  required double price,
  required String category,
  required String description,
});

class AddProductForm extends StatefulWidget {
  final OnProductSubmitCallback onProductSubmit;

  const AddProductForm({
    super.key,
    required this.onProductSubmit,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = 'Electronics';

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onProductSubmit(
        name: _nameController.text,
        price: double.parse(_priceController.text),
        category: _selectedCategory,
        description: _descriptionController.text,
      );

      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedCategory = 'Electronics';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppHeading(text: 'Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTextField(
                controller: _nameController,
                label: 'Product Name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Product name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              FormTextField(
                controller: _priceController,
                label: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Price is required';
                  }
                  final parsed = double.tryParse(value);
                  if (parsed == null) {
                    return 'Price must be a number';
                  }
                  if (parsed <= 0) {
                    return 'Price must be greater than zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CategoryDropdownField(
                selectedCategory: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? 'Electronics';
                  });
                },
              ),
              const SizedBox(height: 12),
              FormTextField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 3,
                alignLabelWithHint: true,
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Submit Product',
                isFullWidth: true,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onPressed: _handleSubmit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
