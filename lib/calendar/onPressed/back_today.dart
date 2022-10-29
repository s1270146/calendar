import 'package:flutter/material.dart';
import 'package:calendar/main.dart';

class BackToday extends StatelessWidget {
  const BackToday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        calendarController.animateToPage(
          thisMonthIndex,
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeIn,
        );
      },
      icon: Icon(
        Icons.undo,
        color: myPurple,
        size: iconSize,
      ),
    );
  }
}
