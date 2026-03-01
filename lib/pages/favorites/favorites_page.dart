import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/pages/shared/products_grid.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  final ScrollController scrollController;

  const FavoritesPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
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
            child: Consumer<FavoritesModel>(
              builder: (context, favoritesModel, child) {
                final favoriteProductsList = favoritesModel.favorites;
                final isEmpty = favoriteProductsList.isEmpty;
                return isEmpty
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Вподобані товари',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          ProductsGrid(products: favoriteProductsList),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
