import 'package:flutter/material.dart';
import 'package:learn_georgian/src/shared/classes/image.dart';

class ListElement {
  final String title;
  final CoverImage image;
  final Color color;
  int completion;

  ListElement(this.title, this.image, this.color, this.completion);
}
