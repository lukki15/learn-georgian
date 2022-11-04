import 'package:flutter/material.dart';
import 'package:adaptive_components/adaptive_components.dart';
import 'package:go_router/go_router.dart';

import '../classes/list_element.dart';

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
          child: Text('Your Lessons', style: context.titleLarge),
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
                onTap: () =>
                    GoRouter.of(context).go('/writing'), // TODO: push()
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
