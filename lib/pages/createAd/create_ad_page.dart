import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class CreateAdPage extends StatelessWidget {
  const CreateAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.body,
      child: const SafeArea(
        child: Center(
          child: Text(
            'Тут ви зможете\nстворити нове оголошення',
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
