import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/pages/home/products_grid.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<FavoritesModel>(context);
    final isEmpty = favoriteProducts.count == 0;

    return Container(
      color: AppColors.body,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              right: AppDimensions.padding16,
              bottom: AppDimensions.padding16,
              left: AppDimensions.padding16,
            ),
            child: isEmpty
                ? const Center(
                    child: Text(
                      'Тут будуть товари,\nякі вам сподобались',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.font18,
                        color: Colors.black54,
                      ),
                    ),
                  )
                : ProductsGrid(products: favoriteProducts.favorites),
          ),
        ),
      ),
    );
  }
}
