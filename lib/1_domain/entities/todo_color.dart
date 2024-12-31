import 'package:flutter/material.dart';

class ToDoColor {
  final int colorIndex;

  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.yellow
  ];

  Color get color => predefinedColors[colorIndex];
  ToDoColor({required this.colorIndex});
}
