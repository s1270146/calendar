import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:calendar/view/page/month_calendar_page.dart';

class AllCalendarPage extends StatelessWidget {
  const AllCalendarPage({
    Key? key,
    required this.page,
  }) : super(key: key);
  final List<MonthCalendarPage> page;
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
