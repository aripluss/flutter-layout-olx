import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/pages/home/products_grid.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = favoritesList;

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
            child: favoriteProducts.isEmpty
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
                : ProductsGrid(
                    products: favoriteProducts,
                    onFavoritesChanged: () {
                      setState(() {});
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
