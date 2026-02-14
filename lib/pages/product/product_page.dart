import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/shared/favorite_button.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ProductPage extends StatelessWidget {
  final String heroTag;
  final Product product;

  const ProductPage({super.key, required this.product, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.body,
        elevation: 0,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: AppDimensions.padding16),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.text),
            onPressed: () => Navigator.pop(
              context,
            ), // true більше не треба, бо стан оновлюється через Provider
          ),
        ),
        surfaceTintColor: Colors.transparent,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimensions.padding16),
            child: FavoriteButton(product: product),
          ),
        ],
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

            // city & time
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  product.city,
                  style: const TextStyle(
                    fontSize: AppDimensions.font12,
                    color: AppColors.placeholder,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Опубліковано ${product.time}',
                  style: const TextStyle(
                    fontSize: AppDimensions.font12,
                    color: AppColors.placeholder,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // title
            Text(
              product.title,
              style: const TextStyle(
                fontSize: AppDimensions.font16,
                fontWeight: FontWeight.w400,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 16),

            // price
            Text(
              '${product.price} грн',
              style: const TextStyle(
                fontSize: AppDimensions.font20,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 32),

            // description
            const Text(
              'ОПИС',
              style: TextStyle(
                color: AppColors.text,
                fontSize: AppDimensions.font14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: AppDimensions.font14,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 16),

            // order btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.text,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Купити з доставкою',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppDimensions.font16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Spacer(),

            // chat btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteBody,
                  foregroundColor: AppColors.text,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: AppColors.text),
                  ),
                ),
                child: const Text(
                  'Повідомлення',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppDimensions.font16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
