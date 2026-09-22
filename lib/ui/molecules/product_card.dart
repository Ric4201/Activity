import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/product_icon_box.dart';
import 'product_card_actions.dart';
import 'product_info.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ProductIconBox(icon: product.icon),
          const SizedBox(width: 12),
          Expanded(
            child: ProductInfo(
              name: product.name,
              category: product.category,
              price: product.price,
            ),
          ),
          ProductCardActions(
            onAddToCart: onAddToCart,
            onDelete: onDelete,
          ),
        ],
      ),
    );
  }
}
