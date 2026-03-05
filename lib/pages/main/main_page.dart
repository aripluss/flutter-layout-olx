import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/models/chat.dart';
import 'package:flutter_layout_olx/pages/chats/chat_detail_page.dart';
import 'package:flutter_layout_olx/pages/product/product_page.dart';
import 'package:flutter_layout_olx/pages/profile/my_ads_page.dart';
import 'package:flutter_layout_olx/services/api_service.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:flutter_layout_olx/pages/chats/chats_page.dart';
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
  // ключі для Nested Navigator
  final _homeKey = GlobalKey<NavigatorState>();
  final _favoritesKey = GlobalKey<NavigatorState>();
  final _chatsKey = GlobalKey<NavigatorState>();
  final _profileKey = GlobalKey<NavigatorState>();
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
      setState(() {
        isLoading = false;
      });
    }
  }

  // BottomNav logic
  // Navigator для поточної вкладки
  NavigatorState _currentNavigator() {
    switch (_currentIndex) {
      case 0:
        return _homeKey.currentState!;
      case 1:
        return _favoritesKey.currentState!;
      case 3:
        return _chatsKey.currentState!;
      case 4:
        return _profileKey.currentState!;
      default:
        return _homeKey.currentState!;
    }
  }

  void _onNavTap(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
      _showFab = false;
    });
  }

  @override
  void dispose() {
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

      endDrawer: DrawerCustom(
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
            _showFab = false;
          });
        },
      ),

      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          final navigator = _currentNavigator();

          if (navigator.canPop()) {
            navigator.pop();
            return;
          }

          if (_currentIndex != 0) {
            setState(() {
              _currentIndex = 0;
            });
            return;
          }
          Navigator.of(context).pop();
        },
        child: IndexedStack(
          index: _currentIndex,
          children: [
            // Home
            Navigator(
              key: _homeKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (_) => HomePage(
                        scrollController: _homeScrollController,
                        products: products,
                        isLoading: isLoading,
                      ),
                    );
                  default:
                    return null;
                }
              },
            ),

            // Favorites
            Navigator(
              key: _favoritesKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (_) => FavoritesPage(
                        scrollController: _favoritesScrollController,
                      ),
                    );
                  default:
                    return null;
                }
              },
            ),

            CreateAdPage(),

            // Chats
            Navigator(
              key: _chatsKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (_) => ChatsPage(navigatorKey: _chatsKey),
                    );
                  case '/chat_detail':
                    final chat = settings.arguments as Chat;
                    return MaterialPageRoute(
                      builder: (_) => ChatDetailPage(
                        chat: chat,
                        navigatorKey: _chatsKey,
                        service: productService,
                      ),
                    );
                  case '/product':
                    final product = settings.arguments as Product;
                    return MaterialPageRoute(
                      builder: (_) => ProductPage(
                        product: product,
                        heroTag: 'product-image-${product.id}',
                        navigatorKey: _chatsKey,
                      ),
                    );
                  default:
                    return null;
                }
              },
            ),

            // Profile
            Navigator(
              key: _profileKey,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (_) => ProfilePage(navigatorKey: _profileKey),
                    );
                  case '/my_ads':
                    return MaterialPageRoute(
                      builder: (_) => MyAdsPage(
                        navigatorKey: _profileKey,
                        service: productService,
                      ),
                    );
                  default:
                    return null;
                }
              },
            ),
          ],
        ),
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
