import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';

class ProductPage extends StatelessWidget {
  final String heroTag;
  final String title;
  final String price;

  const ProductPage({
    super.key,
    required this.title,
    required this.price,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: fontSize20,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        surfaceTintColor: Colors.transparent,
      ),

      body: Container(
        color: bodyColor,
        padding: const EdgeInsets.all(padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // photo
            Hero(
              tag: heroTag,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // title
            Text(
              title,
              style: const TextStyle(
                fontSize: fontSize20,
                fontWeight: FontWeight.w500,
                color: textColor,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 12),

            // price
            Text(
              price,
              style: const TextStyle(
                fontSize: fontSize20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
