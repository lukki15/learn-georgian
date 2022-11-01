import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:learn_georgian/src/shared/classes/image.dart';
import 'package:learn_georgian/src/shared/providers/images.dart';
import 'package:learn_georgian/src/shared/providers/lections.dart';

import '../../../shared/extensions.dart';
import '../../../shared/views/brightness_toggle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _ListElement {
  final String title;
  final CoverImage image;
  final Color color;
  int completion;

  _ListElement(this.title, this.image, this.color, this.completion);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<_ListElement> homeElements = [
      _ListElement("Reading", CustomImageProvider.reading(), Colors.green, 74),
      _ListElement("Listening", CustomImageProvider.headset(), Colors.blue, 59),
      _ListElement("Speaking", CustomImageProvider.megaphone(), Colors.red, 32),
      _ListElement("Grammar", CustomImageProvider.books(), Colors.yellow, 53),
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
            body: AdaptiveColumn(
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello lukki15,',
                            style: context.headlineSmall,
                          ),
                          Text(
                            'continue to learn!',
                            style: context.headlineMedium,
                          ),
                        ],
                      )),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: AppBar(
                    centerTitle: false,
                    title: Text('Your Lessons', style: context.titleLarge),
                    actions: [
                      IconButton(
                        isSelected: true,
                        icon: const Icon(Icons.view_list),
                        tooltip: 'List Mode',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('list')));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.widgets),
                        tooltip: 'Widget Mode',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('widget')));
                        },
                      )
                    ],
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: homeElements.length,
                    itemBuilder: (BuildContext context, int index) {
                      final element = homeElements[index];
                      return ListTile(
                        leading: Image.asset(element.image.image),
                        title: Text(element.title),
                        subtitle: Text('You completed ${element.completion}%'),
                        trailing: Icon(
                          Icons.incomplete_circle,
                          color: element.color,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                )
              ],
            ),
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
