import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/home/products_grid.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class RecommendedSection extends StatelessWidget {
  final List<Product> products;

  const RecommendedSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        right: AppDimensions.padding16,
        bottom: AppDimensions.padding16,
        left: AppDimensions.padding16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Рекомендоване вам',
            style: TextStyle(
              color: AppColors.text,
              fontSize: AppDimensions.font20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          ProductsGrid(products: products),
        ],
      ),
    );
  }
}
