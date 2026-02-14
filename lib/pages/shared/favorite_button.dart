import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/theme/colors.dart';

class FavoriteButton extends StatelessWidget {
  final Product product;
  final double size;

  const FavoriteButton({super.key, required this.product, this.size = 28});

  void _toggle(BuildContext context) {
    // context.read<FavoritesModel>().toggle(product); // теж працює
    Provider.of<FavoritesModel>(context, listen: false).toggle(product);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _toggle(context),
      borderRadius: BorderRadius.circular(size),
      child: Consumer<FavoritesModel>(
        builder: (context, model, child) {
          final isFavorite = model.isFavorite(product.id);

          return Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : AppColors.text,
            size: size,
          );
        },
      ),
    );
  }
}
