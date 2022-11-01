import 'package:flutter/material.dart';
import 'package:adaptive_components/adaptive_components.dart';

import 'package:learn_georgian/src/shared/providers/images.dart';
import 'package:learn_georgian/src/shared/extensions.dart';
import 'package:learn_georgian/src/shared/views/brightness_toggle.dart';

import 'mobile_screen.dart';
import '../classes/home_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ListElement> homeElements = [
      ListElement("Reading", CustomImageProvider.reading(), Colors.green, 74),
      ListElement("Listening", CustomImageProvider.headset(), Colors.blue, 59),
      ListElement("Speaking", CustomImageProvider.megaphone(), Colors.red, 32),
      ListElement("Grammar", CustomImageProvider.books(), Colors.yellow, 53),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                value: 'Georgian',
                // Array list of items
                items: ['Georgian'].map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),

                onChanged: ((value) => {}),
              ),
              actions: [
                const BrightnessToggle(),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Account')));
                  },
                )
              ],
            ),
            body: MobileHome(homeElements: homeElements),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: AdaptiveColumn(
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Good morning',
                            style: context.displaySmall,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const BrightnessToggle(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
