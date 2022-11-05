import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:adaptive_components/adaptive_components.dart';
import 'package:go_router/go_router.dart';

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
                  child: Center(
                      child: Text(
                    'ა',
                    style: context.displayLarge,
                  )),
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
