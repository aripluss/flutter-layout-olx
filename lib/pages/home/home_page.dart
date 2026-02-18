import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/pages/home/categories_grid.dart';
import 'package:flutter_layout_olx/pages/home/change_language.dart';
import 'package:flutter_layout_olx/pages/home/recommended.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController;

  final List<Product> products;

  const HomePage({
    super.key,
    required this.scrollController,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const CategoriesSection(),
              const ChangeLanguageSection(),
              RecommendedSection(products: products),
            ],
          ),
        ),
      ),
    );
  }
}
