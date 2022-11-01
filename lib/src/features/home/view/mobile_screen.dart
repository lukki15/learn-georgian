import 'package:flutter/material.dart';
import 'package:adaptive_components/adaptive_components.dart';

import '../classes/home_list.dart';

import '../../../shared/extensions.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({
    Key? key,
    required this.homeElements,
  }) : super(key: key);

  final List<ListElement> homeElements;

  @override
  Widget build(BuildContext context) {
    return AdaptiveColumn(
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
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('list')));
                },
              ),
              IconButton(
                icon: const Icon(Icons.widgets),
                tooltip: 'Widget Mode',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('widget')));
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
    );
  }
}
