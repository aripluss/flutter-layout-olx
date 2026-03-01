import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  final void Function(int index) onTabSelected;

  const DrawerCustom({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Icon(Icons.person, size: 48, color: Colors.grey.shade400),
            ),
            accountName: Text(
              "Iryna Klosheva",
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
            accountEmail: Text(
              "aripluss@i.ua",
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: Text(
              'Мій профіль',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              Navigator.pop(context);
              onTabSelected(4);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: Text(
              'Мої оголошення',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(
              'Налаштування',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
