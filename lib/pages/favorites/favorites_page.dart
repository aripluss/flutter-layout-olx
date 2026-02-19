import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/pages/home/products_grid.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  final ScrollController scrollController;

  const FavoritesPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    // final favoriteProductsList = context.watch<FavoritesModel>().favorites; // теж працює
    // final isEmpty = favoriteProductsList.isEmpty;
    final favoriteProducts = Provider.of<FavoritesModel>(context);
    final favoriteProductsList = favoriteProducts.favorites;
    final isEmpty = favoriteProducts.count == 0;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              right: AppDimensions.padding16,
              bottom: AppDimensions.padding16,
              left: AppDimensions.padding16,
            ),
            child: isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height - 224,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Тут будуть товари,\nякі вам сподобались',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  )
                : ProductsGrid(products: favoriteProductsList),
          ),
        ),
      ),
    );
  }
}
