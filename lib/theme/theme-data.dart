import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFF2F4F5),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF2F4F5),
    foregroundColor: Color(0xFF02282C),
    elevation: 0,
    surfaceTintColor: Colors.transparent,
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Color(0xFFF2F4F5)),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF02282C),
    hoverColor: Color(0xFF406367),
    focusColor: Color(0xFF406367),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF23e5db),
    unselectedItemColor: Color(0xFF02282C),
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFF02282C),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ), // заголовки секцій, ціна на сторінці товару
    headlineMedium: TextStyle(
      color: Color(0xFF02282C),
      fontSize: 14,
      height: 1.2,
    ), // заголовки (змінити мову)
    titleLarge: TextStyle(
      color: Color(0xFF02282C),
      fontSize: 18,
    ), // назва товару, назва категорії
    bodyLarge: TextStyle(
      color: Color(0xFF02282C),
      fontSize: 16,
    ), // опис товару, назва продавця, назва міста, категорія на сторінці товару
    bodyMedium: TextStyle(
      color: Color(0xFF02282C),
      fontSize: 14,
    ), // дата публікації, кількість переглядів, кількість чатів
    bodySmall: TextStyle(
      color: Color(0xFF02282C),
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
    tertiary: Color(0xFFFFFFFF),
    // backgroundColor
    surface: Color(0xFFF2F4F5),
    surfaceContainer: Color(0xFFFFFFFF),
    onSurface: Color(0xFF02282C),
  ),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF1B1E1F),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1B1E1F),
    foregroundColor: Color(0xFFECEFF1),
    elevation: 0,
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Color(0xFF1B1E1F)),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF23E5DB),
    foregroundColor: Color(0xFFECEFF1),
    hoverColor: Color(0xFF406367),
    focusColor: Color(0xFF406367),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2C2F31),
    selectedItemColor: Color(0xFF23E5DB),
    unselectedItemColor: Color(0xFFECEFF1),
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFFECEFF1),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      color: Color(0xFFECEFF1),
      fontSize: 14,
      height: 1.2,
    ),
    titleLarge: TextStyle(color: Color(0xFFECEFF1), fontSize: 18),
    bodyLarge: TextStyle(color: Color(0xFFECEFF1), fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFFECEFF1), fontSize: 14),
    bodySmall: TextStyle(color: Color(0xFFECEFF1), fontSize: 12),
  ),

  dividerColor: Color(0xFF3A3D3F),

  highlightColor: Color(0xFF23E5DB),

  hintColor: Color(0xFF7F9799),

  colorScheme: ColorScheme.dark(
    // textColor
    primary: Color(0xFFECEFF1),
    secondary: Color(0xFF7F9799),
    tertiary: Color(0xFF1B1E1F),
    // backgroundColor
    surface: Color(0xFF1B1E1F),
    surfaceContainer: Color(0xFF2C2F31),
    onSurface: Color(0xFFECEFF1),
  ),
);
