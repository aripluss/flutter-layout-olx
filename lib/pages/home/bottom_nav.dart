import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: textColor,
      unselectedItemColor: textColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, size: 20),
          label: 'Головна',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 20),
          label: 'Вибране',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline, size: 20),
          label: 'Створити',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline, size: 20),
          label: 'Чат',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded, size: 20),
          label: 'Профіль',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
