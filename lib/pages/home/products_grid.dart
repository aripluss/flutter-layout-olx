import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/home/product_card.dart';

class ProductsGrid extends StatelessWidget {
  // final VoidCallback? onFavoritesChanged;

  final List<Product> products;

  const ProductsGrid({
    super.key,
    required this.products,
    // required this.onFavoritesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.64,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          index: index,
          // onUpdate: onFavoritesChanged,
        );
      },
    );
  }
}
