import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              color: Theme.of(context).colorScheme.onSurface,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Iryna Klosheva",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: Theme.of(
                            context,
                          ).textTheme.titleLarge!.fontSize!,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "aripluss@i.ua",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: Theme.of(
                            context,
                          ).textTheme.headlineMedium!.fontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Налаштування"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Вийти"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
