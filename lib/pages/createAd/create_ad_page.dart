import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';

class CreateAdPage extends StatelessWidget {
  const CreateAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bodyColor,
      child: const SafeArea(
        child: Center(
          child: Text(
            'Тут ви зможете\nстворити нове оголошення',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
