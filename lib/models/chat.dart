class Chat {
  final String productId;
  final String sellerId;
  final List<String> messages;

  Chat({
    required this.productId,
    required this.sellerId,
    List<String>? messages,
  }) : messages = messages ?? [];

  void addMessage(String message) {
    messages.add(message);
  }
}
