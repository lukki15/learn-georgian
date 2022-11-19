import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'dart:math';

import 'package:learn_georgian/src/shared/extensions.dart';
import 'package:learn_georgian/src/shared/providers/characters.dart';

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
                    CharactersProvider.characters[0].character,
                    style: context.headlineMedium,
                  ))),
                  Expanded(
                      child: Center(
                          child: Text(CharactersProvider
                              .characters[0].representation))),
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
            const Expanded(child: _WritingMenuArea()),
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

class _WritingMenuArea extends StatefulWidget {
  const _WritingMenuArea({
    Key? key,
  }) : super(key: key);

  @override
  State<_WritingMenuArea> createState() => _WritingMenuAreaState();
}

class _WritingMenuAreaState extends State<_WritingMenuArea> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
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
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(child: _writingArea()),
            ),
          ),
        ),
      ],
    );
  }

  final Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..strokeJoin = StrokeJoin.round;

  Widget _writingArea() {
    const width = 46.174487;
    const height = 56.783624;

    if (currentPageIndex > 1) {
      return Container();
    }

    final duration = currentPageIndex == 0 ? 3 : 0;
    return SizedBox(
        width: width,
        height: height,
        child: AnimatedDrawing.paths(
          [CharactersProvider.characters[0].path],
          paints: [_paint],
          run: true,
          duration: Duration(seconds: duration),
          onFinish: () => {
            if (currentPageIndex == 0)
              {
                setState(() {
                  currentPageIndex = 1;
                })
              }
          },
        ));
  }
}
