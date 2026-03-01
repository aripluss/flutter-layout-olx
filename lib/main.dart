import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/models/chats.dart';
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
        ChangeNotifierProvider(create: (_) => Chats()),
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
      title: 'Flutter OLX',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.currentTheme,
      initialRoute: '/',
      routes: {'/': (context) => const MainPage()},
    );
  }
}
