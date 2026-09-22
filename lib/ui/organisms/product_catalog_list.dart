import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/app_heading.dart';
import '../molecules/product_card.dart';

class ProductCatalogList extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<int> onDeleteProduct;

  const ProductCatalogList({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDeleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppHeading(text: 'Catalog'),
        const SizedBox(height: 8),
        Column(
          children: products.map((product) {
            return ProductCard(
              key: ValueKey(product.id),
              product: product,
              onAddToCart: () => onAddToCart(product),
              onDelete: () => onDeleteProduct(product.id),
            );
          }).toList(),
        ),
      ],
    );
  }
}
