import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/models/chats.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';
import 'package:provider/provider.dart';

class ChatsPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const ChatsPage({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<Chats>(
      builder: (context, chatsProvider, child) {
        final chats = chatsProvider.chats;

        return Container(
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.padding16,
              ),
              child: chats.isEmpty
                  ? Center(
                      child: Text(
                        'У вас ще немає чатів.\n'
                        'Напишіть продавцю або\nзачекайте на питання по вашим товарам',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Чати',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: chats.length,
                            itemBuilder: (context, index) {
                              final chat = chats[index];
                              final lastMessage = chat.messages.isNotEmpty
                                  ? chat.messages.last
                                  : '';

                              return Material(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainer,
                                child: ListTile(
                                  title: Text('Продукт id: ${chat.productId}'),
                                  subtitle: Text(
                                    'Продавець: ${chat.sellerId}\nОстаннє повідомлення: $lastMessage',
                                  ),
                                  onTap: () {
                                    navigatorKey.currentState!.pushNamed(
                                      '/chat_detail',
                                      arguments: chat,
                                    );
                                  },
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 4),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
