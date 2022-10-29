import 'package:calendar/login/login.dart';
import 'package:calendar/plan/plan_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calendar',
      home: Login(),
    );
  }
}

late PageController calendarController;
late int thisMonthIndex;
late List<PlanModel> allPranList;
Color myBlack = Colors.black;
Color myPurple = const Color.fromRGBO(88, 0, 255, 1);
Color myPink = const Color.fromRGBO(233, 0, 255, 1);
Color myPinkCanNotPress = const Color.fromARGB(167, 234, 0, 255);
Color myYellow = const Color.fromRGBO(255, 198, 0, 1);
double iconSize = 40;
bool isToday(int year, int month, int day) {
  final now = DateTime.now();
  if (year == now.year && month == now.month && day == now.day) {
    return true;
  }
  return false;
}
