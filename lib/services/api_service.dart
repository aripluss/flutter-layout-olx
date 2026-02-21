import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ProductService {
  Future<List<Product>> fetchProducts();
}

class DummyJsonService implements ProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['products'];

        return data.map((item) => Product.fromDummyJson(item)).toList();
      } else {
        throw Exception('Помилка сервера: ${response.statusCode}');
      }
    } catch (error) {
      print('Помилка fetchProducts(): $error');
      return [];
    }
  }
}

class FakeStoreService implements ProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // await Future.delayed(const Duration(seconds: 5)); // імітація затримки мережі

        return data.map((item) => Product.fromFakeStore(item)).toList();
      } else {
        throw Exception('Помилка сервера: ${response.statusCode}');
      }
    } catch (error) {
      print('Помилка fetchProducts(): $error');
      return [];
    }
  }
}
