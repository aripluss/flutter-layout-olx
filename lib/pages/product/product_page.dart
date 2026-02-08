import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ProductPage extends StatelessWidget {
  final String heroTag;
  final String title;
  final String price;

  const ProductPage({
    super.key,
    required this.title,
    required this.price,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.body,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: AppDimensions.font20,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        surfaceTintColor: Colors.transparent,
      ),

      body: Container(
        color: AppColors.body,
        padding: const EdgeInsets.all(AppDimensions.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // photo
            Hero(
              tag: heroTag,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // title
            Text(
              title,
              style: const TextStyle(
                fontSize: AppDimensions.font20,
                fontWeight: FontWeight.w500,
                color: AppColors.text,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 12),

            // price
            Text(
              price,
              style: const TextStyle(
                fontSize: AppDimensions.font20,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
