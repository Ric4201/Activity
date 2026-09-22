import 'package:flutter/material.dart';
import '../atoms/app_button.dart';
import '../atoms/app_icon_button.dart';

class ProductCardActions extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCardActions({
    super.key,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          label: 'Add to Cart',
          onPressed: onAddToCart,
        ),
        const SizedBox(height: 6),
        AppIconButton(
          icon: Icons.delete_outline,
          color: Colors.red,
          onPressed: onDelete,
        ),
      ],
    );
  }
}
