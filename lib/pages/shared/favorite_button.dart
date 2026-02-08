import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/theme/colors.dart';

class FavoriteButton extends StatefulWidget {
  final Product product;
  final double size;
  final VoidCallback? onChanged;

  const FavoriteButton({
    super.key,
    required this.product,
    this.size = 28,
    this.onChanged,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool get isFavorite => favoritesList.any((p) => p.id == widget.product.id);

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoritesList.removeWhere((p) => p.id == widget.product.id);
      } else {
        favoritesList.add(widget.product);
      }
    });

    if (widget.onChanged != null) {
      widget.onChanged!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleFavorite,
      borderRadius: BorderRadius.circular(widget.size),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : AppColors.text,
        size: widget.size,
      ),
    );
  }
}
