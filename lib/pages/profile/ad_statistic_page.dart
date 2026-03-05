import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_layout_olx/theme/dimensions.dart';

class AdStatisticPage extends StatefulWidget {
  const AdStatisticPage({super.key});

  @override
  State<AdStatisticPage> createState() => _AdStatisticPageState();
}

class _AdStatisticPageState extends State<AdStatisticPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  late List<double> heights;
  late List<Animation<double>> heightAnimations;
  late List<String> last7Days;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final random = Random();
    heights = List.generate(7, (_) => random.nextDouble() * 300);

    heightAnimations = heights
        .map((h) => Tween<double>(begin: 0, end: h).animate(controller))
        .toList();

    colorAnimation = ColorTween(
      begin: Color(0xFF02282C),
      end: Color(0xFF23e5db),
    ).animate(controller);

    final today = DateTime.now();

    last7Days = List.generate(7, (i) {
      final d = today.subtract(Duration(days: 6 - i));
      return "${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}";
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Статистика переглядів оголошення за останні 7 днів',
          softWrap: true,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding16),
        child: Center(
          child: SizedBox(
            height: 350,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('300'), Text('200'), Text('100'), Text('0')],
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 320,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(heights.length, (index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(heights[index].toInt().toString()),

                                AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, child) {
                                    return Container(
                                      width: 30,
                                      height: heightAnimations[index].value,
                                      color: colorAnimation.value,
                                    );
                                  },
                                ),
                              ],
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: last7Days.map((date) => Text(date)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
