import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/colors.dart';

class FloatingActionBtn extends StatelessWidget {
  final bool isShown;
  final ScrollController controller;

  const FloatingActionBtn({
    super.key,
    required this.isShown,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      offset: isShown ? Offset.zero : const Offset(0, 3),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.whiteBody,
        foregroundColor: AppColors.text,
        child: const Icon(Icons.arrow_upward),
        onPressed: () {
          controller.animateTo(
            0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
