import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:adaptive_components/adaptive_components.dart';

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
            onPressed: () {},
          ),
          title: const Text("Writing"),
          actions: [
            IconButton(
              icon: const Icon(Icons.tune),
              tooltip: 'Show Settings',
              onPressed: () {},
            )
          ],
        ),
        body: AdaptiveColumn(
          children: [
            AdaptiveContainer(
                columnSpan: 12,
                child: Text(
                  "Practice this character",
                  style: context.headlineSmall,
                )),
            AdaptiveContainer(
              columnSpan: 12,
              child: AppBar(
                title: Row(children: const [
                  Expanded(child: Center(child: Text("ა"))),
                  Expanded(child: Center(child: Text("a"))),
                ]),
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
            ),
            AdaptiveContainer(
                columnSpan: 12,
                child: NavigationBar(
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
                )),
          ],
        ),
      );
    });
  }
}
