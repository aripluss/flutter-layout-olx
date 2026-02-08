import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.body,
      child: const SafeArea(
        child: Center(
          child: Text(
            'Тут будуть товари,\nякі вам сподобались',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimensions.font18,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
