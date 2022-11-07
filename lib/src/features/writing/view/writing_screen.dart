import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_drawing/path_drawing.dart';

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
                          child: Animation())),
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

class Animation extends StatefulWidget {
  const Animation({
    Key? key,
  }) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(seconds: 5);
    _controller.value = 0.0;
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) {
        return CustomPaint(
          painter: MyCustomPainter(progress: _controller.value),
          child: Container(),
        );
      },
    );
  }
}

class MyCustomPainter extends CustomPainter {
  double progress;

  MyCustomPainter({required this.progress});

  final Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..strokeJoin = StrokeJoin.round;

  static const _aSvg =
      "m 23.088,56.783999 q -6.448,0 -11.752,-2.392 -5.1999998,-2.392 -8.3199998,-7.072 -3.01600000926514,-4.68 -3.01600000926514,-11.648 0,-2.288 0.41599999926514,-4.368 0.52,-2.184 0.93600001,-3.432 H 10.088 q -0.4159998,1.352 -0.7279998,3.432 -0.208,1.976 -0.208,4.368 0,6.656 3.7439998,10.088 3.848,3.432 10.192,3.432 6.344,0 9.984,-3.536 3.64,-3.536 3.64,-10.504 0,-5.408 -2.288,-8.736 -2.288,-3.432 -5.304,-6.344 -2.496,-2.496 -4.992,-5.2 -2.392,-2.808 -4.056,-6.3439995 -1.664,-3.64 -1.664,-8.52800001879883 H 27.56 Q 27.56,4.4719995 29.952,7.9039995 q 2.496,3.3279995 5.72,6.5519995 2.6,2.496 4.992,5.408 2.392,2.912 3.952,6.656 1.56,3.64 1.56,8.632 0,6.448 -3.016,11.336 -3.016,4.888 -8.216,7.592 -5.2,2.704 -11.856,2.704 z";
  final _pathMetricsForA = parseSvgPathData(_aSvg).computeMetrics();

  @override
  void paint(Canvas canvas, Size size) {
    for (final pathMetric in _pathMetricsForA) {
      Path extractPath =
          pathMetric.extractPath(0.0, pathMetric.length * progress);
      canvas.drawPath(extractPath, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
