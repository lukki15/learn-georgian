import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'dart:math';

import 'package:learn_georgian/src/shared/extensions.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Show Settings',
              onPressed: () => GoRouter.of(context).go('/')),
          title: LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            value: 0.25,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.flag),
              tooltip: 'Report',
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Text(
              "Practice this character",
              style: context.headlineSmall,
            ),
            AppBar(
              title: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    "ა",
                    style: context.headlineMedium,
                  ))),
                  const Expanded(child: Center(child: Text("a"))),
                ]),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  tooltip: 'Show Settings',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.speed),
                  tooltip: 'Show Settings',
                  onPressed: () {},
                )
              ],
            ),
            NavigationBar(
              // backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.play_arrow), label: 'Animation'),
                NavigationDestination(
                    icon: Icon(Icons.timeline), label: 'Show Arrow'),
                NavigationDestination(
                    icon: Icon(Icons.history_edu), label: 'Writing'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                      child: SizedBox(
                          width: 46.174487,
                          height: 56.783624,
                          child: _Animated())),
                  // child: const Center(child: Text('TEST')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "NEXT",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.east),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      );
    });
  }
}

class _Animated extends StatelessWidget {
  const _Animated({
    Key? key,
  }) : super(key: key);

  static final Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..strokeJoin = StrokeJoin.round;

  @override
  Widget build(BuildContext context) {
    const List<Point> points = [
      Point(1.514, 7.374),
      Point(1.294, 8.283),
      Point(1.210, 9.438),
      Point(2.105, 12.314),
      Point(3.824, 13.599),
      Point(6.109, 14.020),
      Point(8.569, 13.488),
      Point(10.085, 12.190),
      Point(10.965, 9.301),
      Point(10.457, 7.003),
      Point(9.232, 5.284),
      Point(7.911, 3.880),
      Point(6.618, 2.173),
      Point(6.081, 0.000),
    ];

    final path = Path();
    path.moveTo(points[0].x.toDouble(), points[0].y.toDouble());
    points.skip(1).forEach((element) {
      path.lineTo(element.x.toDouble(), element.y.toDouble());
    });

    return AnimatedDrawing.paths(
      [path],
      paints: [_paint],
      run: true,
      duration: const Duration(seconds: 10),
      onFinish: () => {},
    );
  }
}
