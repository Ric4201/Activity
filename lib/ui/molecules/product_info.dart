import 'package:flutter/material.dart';
import '../atoms/price_text.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final String category;
  final double price;

  const ProductInfo({
    super.key,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          category,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        PriceText(price: price),
      ],
    );
  }
}
