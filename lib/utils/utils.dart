import 'package:flutter/material.dart';

class Utils {
  static final colorsRandom = [Colors.orange, Colors.blue, Colors.green];

  static String getFirstCharacter(String? text) {
    return (text ?? '').isNotEmpty ? text![0] : '';
  }

  static Color getColorForFirstCharater(String? text) {
    if ((text ?? '').isEmpty) return colorsRandom.first;
    return colorsRandom[text!.codeUnitAt(0) % 3];
  }
}
