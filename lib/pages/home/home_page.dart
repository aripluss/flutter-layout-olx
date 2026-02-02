import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/pages/home/categories_grid.dart';
import 'package:flutter_layout_olx/pages/home/change_language.dart';
import 'package:flutter_layout_olx/pages/home/recommended.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController;

  const HomePage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bodyColor,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const CategoriesSection(),
              const ChangeLanguageSection(),
              RecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }
}
