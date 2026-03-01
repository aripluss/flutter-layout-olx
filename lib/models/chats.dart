import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/models/chat.dart';

class Chats extends ChangeNotifier {
  final List<Chat> _chats = [];

  List<Chat> get chats => List.unmodifiable(_chats);

  Chat getOrCreateChat(String productId, String sellerId) {
    final existing = _chats.firstWhere(
      (c) => c.productId == productId && c.sellerId == sellerId,
      orElse: () => Chat(productId: productId, sellerId: sellerId),
    );

    if (!_chats.contains(existing)) {
      _chats.add(existing);
      notifyListeners();
    }

    return existing;
  }

  void addMessage(String productId, String sellerId, String message) {
    final chat = getOrCreateChat(productId, sellerId);
    chat.addMessage(message);
    notifyListeners();
  }
}
