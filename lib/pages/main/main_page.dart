import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/services/api_service.dart';
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
import 'package:flutter_layout_olx/theme/theme-notifier.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> products = [];
  final ProductService productService = FakeStoreService();
  // final ProductService productService = DummyJsonService();

  // loader
  bool isLoading = true;

  // Page switching
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  // FAB
  final ScrollController _homeScrollController = ScrollController();
  final ScrollController _favoritesScrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    // Load products & favorite products
    _loadProducts();

    // FAB logic
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenHeight = MediaQuery.of(context).size.height;

      _homeScrollController.addListener(() {
        if (_homeScrollController.offset > screenHeight && !_showFab) {
          setState(() => _showFab = true);
        } else if (_homeScrollController.offset <= screenHeight && _showFab) {
          setState(() => _showFab = false);
        }
      });

      _favoritesScrollController.addListener(() {
        if (_favoritesScrollController.offset > screenHeight && !_showFab) {
          setState(() => _showFab = true);
        } else if (_favoritesScrollController.offset <= screenHeight &&
            _showFab) {
          setState(() => _showFab = false);
        }
      });
    });
  }

  Future<void> _loadProducts() async {
    try {
      final result = await productService.fetchProducts();
      setState(() {
        products = result;
        isLoading = false;
      });
    } catch (error) {
      print('Помилка fetchProducts(): $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  // через then/catchError
  // void _loadProducts() {
  //   productService
  //       .fetchProducts()
  //       .then((result) {
  //         setState(() {
  //           products = result;
  //           isLoading = false;
  //         });
  //       })
  //       .catchError((error) {
  //         print('Помилка fetchProducts(): $error');
  //       });
  // }

  // BottomNav logic
  void _onNavTap(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
      _showFab = false;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  // Swipe logic
  void _onPageChanged(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
        _showFab = false;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _homeScrollController.dispose();
    _favoritesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeNotifier>().isDarkTheme;
    void toggleTheme(value) =>
        context.read<ThemeNotifier>().setDarkTheme(value);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: AppDimensions.padding16,
        title: const HeaderSearchBar(),

        actionsPadding: EdgeInsets.only(right: AppDimensions.padding16),
        actions: [
          Switch(value: isDarkTheme, onChanged: toggleTheme),

          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),

      endDrawer: DrawerCustom(),

      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomePage(
            scrollController: _homeScrollController,
            products: products,
            isLoading: isLoading,
          ),
          FavoritesPage(scrollController: _favoritesScrollController),
          CreateAdPage(),
          ChatPage(),
          ProfilePage(),
        ],
      ),

      floatingActionButton: FloatingActionBtn(
        isShown: _showFab,
        controller: _currentIndex == 0
            ? _homeScrollController
            : _currentIndex == 1
            ? _favoritesScrollController
            : null,
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
