import 'package:calendar/view/components/value/my_colors.dart';
import 'package:calendar/view/components/value/my_size.dart';
import 'package:flutter/material.dart';

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
      icon: Icon(
        Icons.undo,
        color: myColors.purple(),
        size: mySize.iconSize,
      ),
    );
  }
}
