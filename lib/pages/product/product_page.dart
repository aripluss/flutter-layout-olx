import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/models/chats.dart';
import 'package:flutter_layout_olx/pages/product/chat-bottom_sheet.dart';
import 'package:flutter_layout_olx/pages/shared/favorite_button.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final String heroTag;
  final Product product;

  const ProductPage({
    super.key,
    required this.product,
    required this.heroTag,
    this.navigatorKey,
  });

  void _openChatModal(
    BuildContext context,
    String productId,
    String sellerId,
  ) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ChatBottomSheet(productId: productId, sellerId: sellerId),
    );

    if (result != null && result.isNotEmpty) {
      context.read<Chats>().addMessage(productId, sellerId, result);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Повідомлення відправлено ✅'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _handleBack(BuildContext context) {
    if (navigatorKey?.currentState?.canPop() ?? false) {
      navigatorKey!.currentState!.pop();
    } else if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // image
              Hero(
                tag: heroTag,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(product.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              // Back button
              Positioned(
                top: 16,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => _handleBack(context),
                  ),
                ),
              ),
              // Favorite button
              Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: FavoriteButton(product: product),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.padding16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // city & time
                Row(
                  children: [
                    Text(
                      product.city,
                      style: TextStyle(
                        fontSize: Theme.of(
                          context,
                        ).textTheme.bodySmall!.fontSize,
                        color: Theme.of(context).hintColor,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Text(
                      'Опубліковано ${product.time}',
                      style: TextStyle(
                        fontSize: Theme.of(
                          context,
                        ).textTheme.bodySmall!.fontSize,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // title
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 16),

                // price
                Text(
                  '${product.price} грн',
                  style: TextStyle(
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 16),

                // category
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Категорія: ${product.category}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // description
                Text(
                  'ОПИС',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 16),

                // order btn
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    icon: Icon(
                      Icons.local_shipping_outlined,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    label: Text(
                      'Купити з доставкою',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // chat btn
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _openChatModal(context, product.id, 'seller1');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    child: Text(
                      'Повідомлення',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
