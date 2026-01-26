import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: padding16,
        vertical: padding16,
      ),
      color: whiteBodyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ознайомтеся з категоріями OLX',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize20,
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
      // padding: EdgeInsets.zero, // не працює
      // primary: false,           // не працює
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
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape
                    .circle, // same as borderRadius: BorderRadius.circular(100),
                color: accentColor,
              ),
              alignment: Alignment.center,
              child: Text("SVG", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Text(
              'Категорія ${index + 1}',
              style: const TextStyle(color: textColor, fontSize: fontSize12),
            ),
          ],
        );
      },
    );
  }
}
