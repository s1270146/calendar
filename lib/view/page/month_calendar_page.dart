import 'package:calendar/view/components/button/back_today_button.dart';
import 'package:calendar/view/components/widget/date_item.dart';
import 'package:calendar/view/components/button/create_plan_button.dart';
import 'package:calendar/model/plan_model.dart';
import 'package:calendar/view/components/text/year_and_month_text.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';

class MonthCalendarPage extends StatelessWidget {
  const MonthCalendarPage({
    Key? key,
    required this.year,
    required this.month,
    required this.planList,
  }) : super(key: key);
  final int year;
  final int month;
  final List<PlanModel> planList;

  List<List<DateTime>> createDateOfMonth(int year, int month) {
    List<List<DateTime>> date = [];
    DateTime lastDay =
        DateTime(year, month + 1, 1).add(const Duration(days: -1));
    int weekdayFirstDay = DateTime(year, month, 1).weekday % 7;
    List<DateTime> dateTmp = [];
    DateTime preLastDay =
        DateTime(year, month, 1).add(const Duration(days: -1));
    for (int i = 1 - weekdayFirstDay;
        i <= lastDay.day + (6 - lastDay.weekday % 7);
        i++) {
      if (lastDay.day < i) {
        dateTmp.add(lastDay.add(Duration(days: i - lastDay.day)));
      } else if (i < 1) {
        dateTmp.add(preLastDay.add(Duration(days: i)));
      } else {
        dateTmp.add(DateTime(year, month, i));
      }
    }
    int dateLength = dateTmp.length;
    for (int i = 0; i < dateLength / 7; i++) {
      date.add(dateTmp.sublist(7 * i, 7 * (i + 1)));
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    var dates = createDateOfMonth(year, month);
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
              YearAndMonthText(year: year, month: month),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: year != DateTime.now().year ||
                          month != DateTime.now().month,
                      child: const BackTodayButton(),
                    ),
                    const CreatePlanButton(),
                  ],
                ),
              ),
            ],
          ),
          for (var week in dates)
            Row(
              children: [
                for (var aDate in week)
                  if (aDate.year == year && aDate.month == month)
                    if (isToday(aDate.year, aDate.month, aDate.day)) ...{
                      DateItem(
                        viewYear: year,
                        viewMonth: month,
                        selectedYear: aDate.year,
                        selectedMonth: aDate.month,
                        selectedDay: aDate.day,
                        backgroundColor: myPink,
                        borderColor: myPurple,
                        textColor: myBlack,
                        isAddMonth: aDate.day == 1,
                        planList: planList,
                      ),
                    } else ...[
                      DateItem(
                        viewYear: year,
                        viewMonth: month,
                        selectedYear: aDate.year,
                        selectedMonth: aDate.month,
                        selectedDay: aDate.day,
                        backgroundColor: myBlack,
                        borderColor: myPurple,
                        textColor: myPink,
                        isAddMonth: aDate.day == 1,
                        planList: planList,
                      )
                    ]
                  else ...[
                    DateItem(
                      viewYear: year,
                      viewMonth: month,
                      selectedYear: aDate.year,
                      selectedMonth: aDate.month,
                      selectedDay: aDate.day,
                      backgroundColor: myPurple,
                      borderColor: myPink,
                      textColor: myBlack,
                      isAddMonth: aDate.day == 1 || aDate.weekday == 7,
                      planList: planList,
                    ),
                  ]
              ],
            ),
        ],
      ),
    );
  }
}
