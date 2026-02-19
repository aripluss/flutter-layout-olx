import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class ChangeLanguageSection extends StatelessWidget {
  const ChangeLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.padding16,
          vertical: 0,
        ),
        child: Row(
          children: [
            Text(
              "Змінити мову:",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
                fixedSize: const Size.fromHeight(54),
              ),
              child: const Text("Укр"),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
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
