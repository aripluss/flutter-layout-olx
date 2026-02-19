import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class HeaderSearchBar extends StatelessWidget {
  const HeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          hoverColor: Theme.of(context).appBarTheme.backgroundColor,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainer,
          hintText: 'Що шукаєте?',
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
          ),
          suffixIcon: SuffixIcon(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.all(AppDimensions.padding16),
        ),
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      child: IconButton(
        icon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        onPressed: () {},
      ),
    );
  }
}
