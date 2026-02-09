import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String city;
  final String time;
  final String description;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.city,
    required this.time,
    required this.description,
  });
}

List<Product> generateProductsMock() {
  const uuid = Uuid();
  final randomInt = Random();
  final now = DateTime.now();
  final timeFormat = DateFormat('Сьогодні о HH:mm');

  return List.generate(14, (index) {
    final id = uuid.v4();

    return Product(
      id: id,
      title: 'Заголовок об\'яви номер ${index + 1}',
      price: randomInt.nextInt(3000) + 100,
      city: 'Рандомне місто',
      time: timeFormat.format(now),
      description: 'Опис товару з індексом ${index + 1} та id $id',
    );
  });
}
