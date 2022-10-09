import 'package:flutter/material.dart';

class _ListElement {
  final List<String> characters;
  final IconData icon;
  const _ListElement(this.characters, this.icon);
}

final List<_ListElement> _writingElements = [
  const _ListElement(['ა', 'ბ', 'გ', 'დ'], Icons.history_edu),
  const _ListElement(['ე', 'ვ', 'ზ', 'თ'], Icons.history_edu),
  const _ListElement(['ი', 'კ', 'ლ', 'მ'], Icons.history_edu),
  const _ListElement(['ნ', 'ო', 'პ', 'ჟ'], Icons.history_edu),
  const _ListElement(['რ', 'ს', 'ტ', 'უ'], Icons.history_edu),
  const _ListElement(['ფ', 'ქ', 'ღ', 'ყ'], Icons.history_edu),
  const _ListElement(['შ', 'ჩ', 'ც'], Icons.history_edu),
  const _ListElement(['ძ', 'წ', 'ჭ'], Icons.history_edu),
  const _ListElement(['ხ', 'ჯ', 'ჰ'], Icons.history_edu),
];

final List<_ListElement> _vocabularyElements = [
  const _ListElement(['ა', 'ი', 'ლ', 'მ'], Icons.chat_outlined),
  const _ListElement(['ე', 'ო', 'ნ', 'ს'], Icons.chat_outlined),
  const _ListElement(['უ', 'ვ', 'რ'], Icons.chat_outlined),
  const _ListElement(['თ', 'ქ', 'ფ'], Icons.chat_outlined),
  const _ListElement(['ტ', 'კ', 'პ'], Icons.chat_outlined),
  const _ListElement(['ბ', 'გ', 'დ', 'ზ'], Icons.chat_outlined),
  const _ListElement(['შ', 'ც', 'ჩ'], Icons.chat_outlined),
  const _ListElement(['ხ', 'ჯ', 'ჟ'], Icons.chat_outlined),
  const _ListElement(['ღ', 'ძ', 'ჰ'], Icons.chat_outlined),
  const _ListElement(['წ', 'ჭ', 'ყ'], Icons.chat_outlined),
];

List<Card> _getListElement(List<_ListElement> elements) {
  return elements
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
              trailing: entry.key < 4 ? const Icon(Icons.done_all) : null,
            ),
          ))
      .toList();
}

class WritingListView extends StatelessWidget {
  const WritingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getListElement(_writingElements),
    );
  }
}

class VocabularyListView extends StatelessWidget {
  const VocabularyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getListElement(_vocabularyElements),
    );
  }
}
