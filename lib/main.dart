import 'package:calendar/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calendar',
      home: LoginScreen(),
    );
  }
}

// late PageController calendarController;
late int thisMonthIndex;
// late List<PlanModel> allPlanList;
const Color myBlack = Colors.black;
const Color myPurple = Color.fromRGBO(88, 0, 255, 1);
const Color myPink = Color.fromRGBO(233, 0, 255, 1);
const Color myPinkCanNotPress = Color.fromARGB(167, 234, 0, 255);
const Color myYellow = Color.fromRGBO(255, 198, 0, 1);
const double iconSize = 40;
bool isToday(int year, int month, int day) {
  final now = DateTime.now();
  if (year == now.year && month == now.month && day == now.day) {
    return true;
  }
  return false;
}
