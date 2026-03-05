import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/pages/profile/ad_statistic_page.dart';
import 'package:flutter_layout_olx/services/api_service.dart';

class MyAdsPage extends StatefulWidget {
  final ProductService service;
  final GlobalKey<NavigatorState> navigatorKey;

  const MyAdsPage({
    super.key,
    required this.service,
    required this.navigatorKey,
  });

  @override
  State<MyAdsPage> createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final p1 = await widget.service.fetchProductById('1');
      final p2 = await widget.service.fetchProductById('2');
      final p3 = await widget.service.fetchProductById('3');

      if (!mounted) return;

      setState(() {
        products = [p1, p2, p3];
      });
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не вдалося завантажити товари')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мої оголошення')),
      body: products.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).highlightColor,
              ),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Column(
                  children: [
                    ListTile(
                      leading: Hero(
                        tag: 'product-image-${product.id}',
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text('${product.price} ₴'),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 8),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => AdStatisticPage(),
                              ),
                            );
                          },
                          child: const Text('Статистика'),
                        ),
                      ),
                    ),

                    const Divider(),
                  ],
                );
              },
            ),
    );
  }
}
