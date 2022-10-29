import 'package:calendar/calendar/onPressed/back_today.dart';
import 'package:calendar/calendar/onPressed/date_item.dart';
import 'package:calendar/calendar/onPressed/plan_addition_button.dart';
import 'package:calendar/text/year_and_month.dart';
import 'package:flutter/material.dart';
import 'package:calendar/calendar/calendar_model.dart';
import 'package:calendar/main.dart';

class CalendarBuilder extends StatelessWidget {
  const CalendarBuilder({Key? key, required this.year, required this.month})
      : super(key: key);
  final int year;
  final int month;
  @override
  Widget build(BuildContext context) {
    var calendar = CalendarModel(year, month);
    return Container(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: myPink),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              YearAndMonth(year: year, month: month),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: year != DateTime.now().year ||
                          month != DateTime.now().month,
                      child: const BackToday(),
                    ),
                    const PlanAdditionButton(),
                  ],
                ),
              ),
            ],
          ),
          for (var week in calendar.date)
            Row(
              children: [
                for (var aDate in week)
                  aDate.year == year && aDate.month == month
                      ? isToday(aDate.year, aDate.month, aDate.day)
                          ? DateItem(
                              viewYear: year,
                              viewMonth: month,
                              selectedYear: aDate.year,
                              selectedMonth: aDate.month,
                              selectedDay: aDate.day,
                              backgroundColor: myPink,
                              borderColor: myPurple,
                              textColor: myBlack,
                              isAddMonth: aDate.day == 1,
                            )
                          : DateItem(
                              viewYear: year,
                              viewMonth: month,
                              selectedYear: aDate.year,
                              selectedMonth: aDate.month,
                              selectedDay: aDate.day,
                              backgroundColor: myBlack,
                              borderColor: myPurple,
                              textColor: myPink,
                              isAddMonth: aDate.day == 1,
                            )
                      : DateItem(
                          viewYear: year,
                          viewMonth: month,
                          selectedYear: aDate.year,
                          selectedMonth: aDate.month,
                          selectedDay: aDate.day,
                          backgroundColor: myPurple,
                          borderColor: myPink,
                          textColor: myBlack,
                          isAddMonth: aDate.day == 1 || aDate.weekday == 7,
                        )
              ],
            ),
        ],
      ),
    );
  }
}
