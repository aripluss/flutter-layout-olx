import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:flutter_layout_olx/pages/chat/chat_page.dart';
import 'package:flutter_layout_olx/pages/createAd/create_ad_page.dart';
import 'package:flutter_layout_olx/pages/favorites/favorites_page.dart';
import 'package:flutter_layout_olx/pages/home/home_page.dart';
import 'package:flutter_layout_olx/pages/main/bottom_nav.dart';
import 'package:flutter_layout_olx/pages/main/drawer_custom.dart';
import 'package:flutter_layout_olx/pages/main/floating_action_btn.dart';
import 'package:flutter_layout_olx/pages/main/header_search_bar.dart';
import 'package:flutter_layout_olx/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Product> products;

  // Page switching
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  // FAB
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    // Load products
    products = generateProductsMock();

    // FAB logic
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenHeight = MediaQuery.of(context).size.height;

      _scrollController.addListener(() {
        if (_scrollController.offset > screenHeight && !_showFab) {
          setState(() => _showFab = true);
        } else if (_scrollController.offset <= screenHeight && _showFab) {
          setState(() => _showFab = false);
        }
      });
    });
  }

  // BottomNav logic
  void _onNavTap(int index) {
    if (_currentIndex == index) return;

    setState(() => _currentIndex = index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  // Swipe logic
  void _onPageChanged(int index) {
    if (_currentIndex != index) {
      setState(() => _currentIndex = index);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.body,
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: AppDimensions.padding16,
        title: const HeaderSearchBar(),

        actionsPadding: EdgeInsets.only(right: AppDimensions.padding16),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.text,
              size: 28,
            ),
            onPressed: () {},
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        surfaceTintColor: Colors.transparent,
      ),

      endDrawer: DrawerCustom(),

      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomePage(scrollController: _scrollController, products: products),
          FavoritesPage(),
          CreateAdPage(),
          ChatPage(),
          ProfilePage(),
        ],
      ),

      floatingActionButton: FloatingActionBtn(
        isShown: _showFab,
        controller: _scrollController,
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
