import 'package:flutter/material.dart';

class AppColors {
  final bool isDarkTheme;

  AppColors._(
    this.isDarkTheme,
  ); // приватний конструктор, щоб не створювати екземпляр класу

  static const Color whiteBody = Color(0xFFFFFFFF);
  static const Color body = Color(0xFFF2F4F5);

  static const Color accent = Color(0xFF23e5db);

  static const Color text = Color(0xFF02282C);
  static const Color secondaryText = Color(0xFF7F9799);
  static const Color border = Color(0xFFD8DFE0);
  static const Color placeholder = Color(0xFF406367);
}
