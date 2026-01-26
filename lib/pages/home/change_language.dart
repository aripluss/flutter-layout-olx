import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';

class ChangeLanguageSection extends StatelessWidget {
  const ChangeLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding16, vertical: 0),
        child: Row(
          children: [
            Text(
              "Змінити мову:",
              style: TextStyle(color: secondaryTextColor, fontSize: fontSize14),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: textColor,
                fixedSize: const Size.fromHeight(54),
              ),
              child: const Text("Укр"),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: textColor,
                fixedSize: const Size.fromHeight(54),
              ),
              child: const Text("Англ"),
            ),
          ],
        ),
      ),
    );
  }
}
