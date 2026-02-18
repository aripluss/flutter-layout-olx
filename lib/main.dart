import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/theme-data.dart';
import 'package:flutter_layout_olx/theme/theme-notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout_olx/data/favorites_data.dart';
import 'package:flutter_layout_olx/pages/main/main_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => FavoritesModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.currentTheme,
      home: const MainPage(),
    );
  }
}
