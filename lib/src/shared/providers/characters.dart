import 'dart:math';
import 'dart:ui';

import '../classes/character.dart';

class CharactersProvider {
  static final List<Character> characters = [
    Character(character: 'ა', representation: "a", path: _a_path()),
    Character(character: 'ბ', representation: "b", path: Path()),
    Character(character: 'გ', representation: "g", path: Path()),
    Character(character: 'დ', representation: "d", path: Path()),
    Character(character: 'ე', representation: "e", path: Path()),
    Character(character: 'ვ', representation: "v", path: Path()),
    Character(character: 'ზ', representation: "z", path: Path()),
    Character(character: 'თ', representation: "t", path: Path()),
    Character(character: 'ი', representation: "i", path: Path()),
    Character(character: 'კ', representation: "k'", path: Path()),
    Character(character: 'ლ', representation: "l", path: Path()),
    Character(character: 'მ', representation: "m", path: Path()),
    Character(character: 'ნ', representation: "n", path: Path()),
    Character(character: 'ო', representation: "o", path: Path()),
    Character(character: 'პ', representation: "p'", path: Path()),
    Character(character: 'ჟ', representation: "zh", path: Path()),
    Character(character: 'რ', representation: "r", path: Path()),
    Character(character: 'ს', representation: "s", path: Path()),
    Character(character: 'ტ', representation: "t'", path: Path()),
    Character(character: 'უ', representation: "u", path: Path()),
    Character(character: 'ფ', representation: "p", path: Path()),
    Character(character: 'ქ', representation: "k", path: Path()),
    Character(character: 'ღ', representation: "gh", path: Path()),
    Character(character: 'ყ', representation: "q'", path: Path()),
    Character(character: 'შ', representation: "sh", path: Path()),
    Character(character: 'ჩ', representation: "ch", path: Path()),
    Character(character: 'ც', representation: "ts", path: Path()),
    Character(character: 'ძ', representation: "dz", path: Path()),
    Character(character: 'წ', representation: "ts'", path: Path()),
    Character(character: 'ჭ', representation: "ch'", path: Path()),
    Character(character: 'ხ', representation: "kh", path: Path()),
    Character(character: 'ჯ', representation: "j", path: Path()),
    Character(character: 'ჰ', representation: "h", path: Path()),
  ];
}

Path _a_path() {
  const List<Point> points = [
    Point(1.514, 7.374),
    Point(1.294, 8.283),
    Point(1.210, 9.438),
    Point(2.105, 12.314),
    Point(3.824, 13.599),
    Point(6.109, 14.020),
    Point(8.569, 13.488),
    Point(10.085, 12.190),
    Point(10.965, 9.301),
    Point(10.457, 7.003),
    Point(9.232, 5.284),
    Point(7.911, 3.880),
    Point(6.618, 2.173),
    Point(6.081, 0.000),
  ];

  final path = Path();
  path.moveTo(points[0].x.toDouble(), points[0].y.toDouble());
  points.skip(1).forEach((element) {
    path.lineTo(element.x.toDouble(), element.y.toDouble());
  });

  return path;
}
