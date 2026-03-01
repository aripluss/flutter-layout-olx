import 'package:flutter/material.dart';

class ChatBottomSheet extends StatefulWidget {
  final String productId;
  final String sellerId;

  const ChatBottomSheet({
    super.key,
    required this.productId,
    required this.sellerId,
  });

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    Navigator.pop(context, text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Напишіть повідомлення продавцю...',
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
          ],
        ),
      ),
    );
  }
}
