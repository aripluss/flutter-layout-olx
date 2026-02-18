import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  set darkTheme(bool value) {
    _isDarkTheme = value;

    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('darkTheme', _isDarkTheme);
    });

    notifyListeners();
  }
}
