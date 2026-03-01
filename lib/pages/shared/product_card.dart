import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/product/product_page.dart';
import 'package:flutter_layout_olx/pages/shared/favorite_button.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ProductCard extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final int index;
  final Product product;

  const ProductCard({
    super.key,
    required this.index,
    required this.product,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductPage(
              heroTag: 'product-image-${product.id}',
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            Hero(
              tag: 'product-image-${product.id}',
              child: AspectRatio(
                aspectRatio: 168 / 126,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Theme.of(context).highlightColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // Image.network(product.image, fit: BoxFit.cover),
                ),
              ),
            ),

            // info
            Expanded(
              flex: 114,
              child: Padding(
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
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(height: 1.2),
                            ),
                          ),

                          SizedBox(width: 16),

                          // favorite button
                          FavoriteButton(size: 16, product: product),
                        ],
                      ),
                    ),

                    Spacer(),

                    // price
                    Text(
                      '${product.price} грн',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    // location
                    Text(
                      product.city,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(height: 1.2),
                    ),

                    // time
                    Text(
                      product.time,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(height: 1.2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
