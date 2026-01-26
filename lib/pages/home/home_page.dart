import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';
import 'package:flutter_layout_olx/pages/home/bottom_nav.dart';
import 'package:flutter_layout_olx/pages/home/header_search_bar.dart';
import 'package:flutter_layout_olx/pages/home/categories_grid.dart';
import 'package:flutter_layout_olx/pages/home/change_language.dart';
import 'package:flutter_layout_olx/pages/home/recommended.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
        elevation: 0, // removes shadow under AppBar
        toolbarHeight: 80,

        title: const HeaderSearchBar(),
        actionsPadding: EdgeInsets.only(right: padding16),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: textColor,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
        surfaceTintColor:
            Colors.transparent, // save background color while scrolling
      ),

      body: Container(
        color: bodyColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CategoriesSection(),
                const ChangeLanguageSection(),
                const RecommendedSection(),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const BottomNav(),
    );
  }
}
