import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/product/product_page.dart';
import 'package:flutter_layout_olx/pages/shared/favorite_button.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ProductCard extends StatefulWidget {
  final int index;
  final Product product;
  final VoidCallback? onUpdate;

  const ProductCard({
    super.key,
    required this.index,
    required this.product,
    this.onUpdate,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (_) => ProductPage(
                  heroTag: 'product-image-${widget.product.id}',
                  product: widget.product,
                ),
              ),
            )
            .then((_) {
              // чи додали в "улюблені" на сторінці товару?
              widget.onUpdate?.call();
              setState(() {});
            });
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteBody,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Hero(
              tag: 'product-image-${widget.product.id}',
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.text,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: AspectRatio(aspectRatio: 168 / 126),
              ),
            ),

            // info
            Padding(
              padding: const EdgeInsets.all(AppDimensions.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Expanded(
                          child: Text(
                            widget.product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: AppDimensions.font14,
                              height: 1.2,
                              color: AppColors.text,
                            ),
                          ),
                        ),

                        SizedBox(width: 16),

                        // favorite button
                        FavoriteButton(
                          size: 16,
                          product: widget.product,
                          onChanged: widget.onUpdate,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // price
                  Text(
                    '${widget.product.price} грн',
                    style: const TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimensions.font16,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // location
                  Text(
                    widget.product.city,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: AppDimensions.font14,
                      height: 1.2,
                    ),
                  ),
                  // time
                  Text(
                    widget.product.time,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: AppDimensions.font14,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
