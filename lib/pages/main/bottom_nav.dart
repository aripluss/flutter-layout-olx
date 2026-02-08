import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteBody,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.text,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 20),
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
    );
  }
}
