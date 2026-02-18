import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Center(
          child: Text(
            'У вас ще немає чатів.\n'
            'Напишіть продавцю або\nзачекайте на питання по вашим товарам',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimensions.font18,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ),
      ),
    );
  }
}
