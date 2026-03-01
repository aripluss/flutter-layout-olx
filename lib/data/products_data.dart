import 'package:intl/intl.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String city;
  final String time;
  final String description;
  final String image;
  final String category;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.city,
    required this.time,
    required this.description,
    required this.image,
    required this.category,
  });

  factory Product.fromDummyJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: (json['price'] as num).round() * 43,
      // конвертація в гривні (приблизно)
      city: 'Рандомне місто',
      time: json['meta']?['createdAt'] != null
          ? DateFormat(
              'dd.MM.yyyy HH:mm',
            ).format(DateTime.parse(json['meta']['createdAt']))
          : '',
      description: json['description'],
      image: json['images'][0],
      category: json['category'],
    );
  }

  factory Product.fromFakeStore(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: (json['price'] as num).round() * 43,
      city: 'Рандомне місто',
      time: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}
