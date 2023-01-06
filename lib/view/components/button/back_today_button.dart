import 'package:flutter/material.dart';
import 'package:calendar/main.dart';

class BackTodayButton extends StatelessWidget {
  const BackTodayButton({
    Key? key,
    required this.calendarPageController,
  }) : super(key: key);
  final PageController calendarPageController;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        calendarPageController.animateToPage(
          calendarPageController.initialPage,
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeIn,
        );
      },
      icon: const Icon(
        Icons.undo,
        color: myPurple,
        size: iconSize,
      ),
    );
  }
}
