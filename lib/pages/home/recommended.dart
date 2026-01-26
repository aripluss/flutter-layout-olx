import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/design/colors.dart';
import 'package:flutter_layout_olx/design/dimensions.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        right: padding16,
        bottom: padding16,
        left: padding16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Рекомендоване вам',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          const RecommendedGrid(),
        ],
      ),
    );
  }
}

class RecommendedGrid extends StatelessWidget {
  const RecommendedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.64,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return RecommendedCard(index: index);
      },
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final int index;
  const RecommendedCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteBodyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: AspectRatio(aspectRatio: 168 / 126),
          ),

          // info
          Padding(
            padding: const EdgeInsets.all(padding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Expanded(
                        child: Text(
                          'Заголовок об\'яви номер ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: fontSize14,
                            height: 1.2,
                            color: textColor,
                          ),
                        ),
                      ),

                      SizedBox(width: 16),

                      // favorite button
                      // IconButton(
                      //   onPressed: () {},
                      //   iconSize: 18,
                      //   icon: const Icon(
                      //     Icons.favorite_border,
                      //     color: textColor,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: textColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // price
                Text(
                  '${(index + 1) * Random().nextInt(300)} грн.',
                  style: const TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize16,
                  ),
                ),

                const SizedBox(height: 12),

                // location
                Text(
                  'Місто',
                  style: const TextStyle(
                    color: textColor,
                    fontSize: fontSize14,
                    height: 1.2,
                  ),
                ),
                // time
                Text(
                  'Сьогодні о 12:00',
                  style: const TextStyle(
                    color: textColor,
                    fontSize: fontSize14,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
