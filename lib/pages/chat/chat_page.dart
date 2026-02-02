import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bodyColor,
      child: const SafeArea(
        child: Center(
          child: Text(
            'У вас ще немає чатів.\n'
            'Напишіть продавцю або\nзачекайте на питання по вашим товарам',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
