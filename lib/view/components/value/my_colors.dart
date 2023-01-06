import 'package:flutter/material.dart';

class MyColors {
  final Color myBlack = Colors.black;
  final Color myPurple = const Color.fromRGBO(88, 0, 255, 1);
  final Color myPink = const Color.fromRGBO(233, 0, 255, 1);
  final Color myPinkCanNotPress = const Color.fromARGB(167, 234, 0, 255);
  final Color myYellow = const Color.fromRGBO(255, 198, 0, 1);

  Color black() => myBlack;
  Color purple() => myPurple;
  Color pink() => myPink;
  Color pinkCanNotPress() => myPinkCanNotPress;
  Color yellow() => myYellow;
}

final MyColors myColors = MyColors();
