import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bodyColor,
      child: const SafeArea(
        child: Center(
          child: Text(
            'Тут будуть товари,\nякі вам сподобались',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
