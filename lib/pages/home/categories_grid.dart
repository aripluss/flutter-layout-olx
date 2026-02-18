import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.padding16,
        vertical: AppDimensions.padding16,
      ),
      color: AppColors.whiteBody,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ознайомтеся з категоріями OLX',
            style: TextStyle(
              color: AppColors.text,
              fontSize: AppDimensions.font20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          CategoriesGrid(),
        ],
      ),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape
                    .circle, // same as borderRadius: BorderRadius.circular(100),
                color: AppColors.accent,
              ),
              alignment: Alignment.center,
              child: Text("SVG", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Text(
              'Категорія товарів №${index + 1}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        );
      },
    );
  }
}
