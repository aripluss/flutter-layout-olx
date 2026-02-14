import 'package:flutter/material.dart';
import 'products_data.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;
  int get count => _favorites.length;

  bool isFavorite(String id) {
    return _favorites.any((p) => p.id == id);
  }

  void add(Product product) {
    if (isFavorite(product.id)) return;
    _favorites.add(product);
    notifyListeners();
  }

  void remove(String productId) {
    _favorites.removeWhere((p) => p.id == productId);
    notifyListeners();
  }

  void toggle(Product product) {
    if (isFavorite(product.id)) {
      remove(product.id);
    } else {
      add(product);
    }
  }
}
