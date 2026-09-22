import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final double price;

  const PriceText({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'PHP ${price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }
}
