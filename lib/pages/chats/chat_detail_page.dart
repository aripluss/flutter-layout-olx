import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/data/products_data.dart';
import 'package:flutter_layout_olx/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout_olx/models/chat.dart';
import 'package:flutter_layout_olx/models/chats.dart';

class ChatDetailPage extends StatefulWidget {
  final ProductService service;
  final GlobalKey<NavigatorState> navigatorKey;
  final Chat chat;

  const ChatDetailPage({
    super.key,
    required this.chat,
    required this.navigatorKey,
    required this.service,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();

  Product? _product;

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  Future<void> _fetchProduct() async {
    try {
      final product = await widget.service.fetchProductById(
        widget.chat.productId,
      );

      if (!mounted) return;
      setState(() {
        _product = product;
      });
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не вдалося завантажити товар')),
      );
    }
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    context.read<Chats>().addMessage(
      widget.chat.productId,
      widget.chat.sellerId,
      text,
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final chat = context.watch<Chats>().getOrCreateChat(
      widget.chat.productId,
      widget.chat.sellerId,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 100,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          elevation: 1,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Продавець: ${widget.chat.sellerId}',
                style: const TextStyle(fontSize: 16),
              ),

              SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  if (_product != null) {
                    widget.navigatorKey.currentState!.pushNamed(
                      '/product',
                      arguments: _product,
                    );
                  }
                },
                child: _product == null
                    ? Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: const Icon(
                              Icons.image,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            'Завантаження...',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Hero(
                            tag: 'product-image-${_product!.id}',
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                _product!.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _product!.title,
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(width: 8),

                                Text('${_product!.price} ₴'),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chat.messages.length,
              itemBuilder: (context, index) {
                final message = chat.messages[index];
                return Align(
                  alignment: Alignment.centerRight, // повідомлення юзера
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Напишіть повідомлення...',
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
