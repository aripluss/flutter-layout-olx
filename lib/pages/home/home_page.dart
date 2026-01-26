import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';
import 'package:flutter_layout_olx/pages/home/bottom_nav.dart';
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

        title: const SearchBar(),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteBodyColor,
          hintText: 'Що шукаєте?',
          hintStyle: const TextStyle(
            color: placeholderColor,
            fontSize: fontSize14,
          ),
          suffixIcon: SuffixIcon(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.all(padding16),
        ),
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4), // верхній лівий кут
          bottomRight: Radius.circular(4), // нижній лівий кут
        ),
      ),
      child: IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
