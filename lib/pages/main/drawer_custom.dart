import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bodyColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: textColor),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 48, color: Colors.grey.shade400),
            ),
            accountName: Text("Iryna Klosheva"),
            accountEmail: Text("aripluss@i.ua"),
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text('Мій профіль'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('Мої оголошення'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Налаштування'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
