import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.body,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              color: AppColors.text,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Iryna Klosheva",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.font18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "aripluss@i.ua",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: AppDimensions.font14,
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
