import 'package:flutter/material.dart';
import 'colors.dart';

final lightTheme = ThemeData(
  // scaffoldBackgroundColor: Color(0xFFF2F4F5),  

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF2F4F5),
    foregroundColor: AppColors.text,
    elevation: 0,
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Color(0xFFF2F4F5)),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.whiteBody,
    foregroundColor: AppColors.text,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.whiteBody,
    selectedItemColor: AppColors.accent,
    unselectedItemColor: AppColors.text,
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.text,
      fontSize: 20,
    ), // заголовки секцій, ціна на сторінці товару
    headlineMedium: TextStyle(
      color: AppColors.text,
      fontSize: 14,
    ), // заголовки (змінити мову)
    titleLarge: TextStyle(
      color: AppColors.text,
      fontSize: 18,
    ), // назва товару, назва категорії
    bodyLarge: TextStyle(
      color: AppColors.text,
      fontSize: 16,
    ), // опис товару, назва продавця, назва міста
    bodyMedium: TextStyle(
      color: AppColors.text,
      fontSize: 14,
    ), // дата публікації, кількість переглядів, кількість чатів
    bodySmall: TextStyle(
      color: AppColors.text,
      fontSize: 12,
    ), // city & time, назви категорій
  ),

  dividerColor: Color(0xFFD8DFE0), // border

  highlightColor: Color(0xFF23e5db),

  hintColor: Color(0xFF406367), // placeholder

  colorScheme: ColorScheme.light(
    // textColor
    primary: Color(0xFF02282C),
    secondary: Color(0xFF7F9799),
    // backgroundColor
    surface: Color(0xFFF2F4F5),
    surfaceContainer: Color(0xFFFFFFFF),
    onSurface: AppColors.text,
  ),
);

final darkTheme = ThemeData(
  // scaffoldBackgroundColor: const Color(0xFF02282C),
  // primaryColor: Color(0xFF23e5db),
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: Color(0xFF1E1E1E),
  //   foregroundColor: Colors.white,
  //   elevation: 0,
  // ),
  // textTheme: const TextTheme(
  //   bodyLarge: TextStyle(color: Colors.white),
  //   bodyMedium: TextStyle(color: Color(0xFF7F9799)),
  // ),
  // dividerColor: const Color(0xFF3A3A3A),
  // hintColor: const Color(0xFFAAAAAA),
  // colorScheme: const ColorScheme.dark(
  //   // primary: Color(0xFF23e5db),
  //   // secondary: Color(0xFF7F9799),
  //   surface: const Color(0xFF02282C),
  //   onSurface: Colors.white,
  // ),
);
