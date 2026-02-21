import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  ThemeNotifier() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isDarkTheme = prefs.getBool('darkTheme') ?? false;
      notifyListeners();
    } catch (error) {
      print('Помилка завантаження теми: $error');
      _isDarkTheme = false;
      notifyListeners();
    }
  }

  Future<void> setDarkTheme(bool value) async {
    if (_isDarkTheme == value) return;
    _isDarkTheme = value;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('darkTheme', _isDarkTheme);
    } catch (error) {
      print('Помилка збереження теми: $error');
    }
  }

  // через then
  // set darkTheme(bool value) {
  //   _isDarkTheme = value;

  //   SharedPreferences.getInstance()
  //       .then((prefs) {
  //         prefs.setBool('darkTheme', _isDarkTheme);
  //       })
  //       .then((_) {
  //         notifyListeners();
  //       })
  //       .catchError((error) {
  //         print('Помилка збереження теми: $error');
  //         return null;
  //       });
  // }
}
