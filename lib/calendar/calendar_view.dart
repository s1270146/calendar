import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:calendar/calendar/calendar_builder.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({
    Key? key,
    required this.page,
  }) : super(key: key);
  final List<CalendarBuilder> page;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myBlack,
      child: PageView(
        controller: calendarController,
        children: page,
      ),
    );
  }
}
