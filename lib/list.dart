import 'package:flutter/material.dart';

class _ListElement {
  final List<String> characters;
  final IconData icon;
  const _ListElement(this.characters, this.icon);
}

final List<_ListElement> _elements = [
  const _ListElement(['ა', 'ი', 'ლ', 'მ'], Icons.filter_1),
  const _ListElement(['ე', 'ო', 'ნ', 'ს'], Icons.filter_2),
  const _ListElement(['უ', 'ვ', 'რ'], Icons.filter_3),
  const _ListElement(['თ', 'ქ', 'ფ'], Icons.filter_4),
  const _ListElement(['ტ', 'კ', 'პ'], Icons.filter_5),
  const _ListElement(['ბ', 'გ', 'დ', 'ზ'], Icons.filter_6),
  const _ListElement(['შ', 'ც', 'ჩ'], Icons.filter_7),
  const _ListElement(['ხ', 'ჯ', 'ჟ'], Icons.filter_8),
  const _ListElement(['ღ', 'ძ', 'ჰ'], Icons.filter_9),
  const _ListElement(['წ', 'ჭ', 'ყ'], Icons.filter_9_plus),
];

final List<Card> _listElement = _elements
    .asMap()
    .entries
    .map((entry) => Card(
          child: ListTile(
            leading: Icon(
              entry.value.icon,
              size: 57.0,
            ),
            title: Text("Lection ${entry.key + 1}"),
            subtitle: Text(entry.value.characters.join(', ')),
            trailing: entry.key == 0 ? const Icon(Icons.done_all) : null,
          ),
        ))
    .toList();

class ListViewElement extends StatelessWidget {
  const ListViewElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _listElement,
    );
  }
}
