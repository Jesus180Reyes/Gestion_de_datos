import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorProvider extends ChangeNotifier {
  Color color = const Color.fromRGBO(12, 23, 23, 1);

  ColorProvider() {
    changeColor();
  }
  void changeColor() {
    color = Color.fromRGBO(
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      1,
    );
    notifyListeners();
  }
}
