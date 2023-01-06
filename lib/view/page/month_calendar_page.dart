import 'package:calendar/model/date_time_model.dart';
import 'package:calendar/view/components/button/back_today_button.dart';
import 'package:calendar/view/components/value/my_colors.dart';
import 'package:calendar/view/components/widget/date_item.dart';
import 'package:calendar/view/components/button/create_plan_button.dart';
import 'package:calendar/view/components/text/year_and_month_text.dart';
import 'package:flutter/material.dart';

class MonthCalendarPage extends StatelessWidget {
  const MonthCalendarPage({
    Key? key,
    required this.dateTime,
    required this.backTodayButton,
  }) : super(key: key);
  final DateTimeModel dateTime;
  final BackTodayButton backTodayButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: myColors.pink()),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              YearAndMonthText(
                dateTime: dateTime,
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: !dateTime.isCurrentMonth(),
                      child: backTodayButton,
                    ),
                    const CreatePlanButton(),
                  ],
                ),
              ),
            ],
          ),
          for (var week in dateTime.createDateOfMonth())
            Row(
              children: [
                for (var aDate in week)
                  aDate.isSameMonth(dateTime)
                      ? aDate.isToday()
                          ? DateItem(
                              selectedDate: aDate,
                              backgroundColor: myColors.pink(),
                              borderColor: myColors.purple(),
                              textColor: myColors.black(),
                              isShowMonth: aDate.day == 1,
                            )
                          : DateItem(
                              selectedDate: aDate,
                              backgroundColor: myColors.black(),
                              borderColor: myColors.purple(),
                              textColor: myColors.pink(),
                              isShowMonth: aDate.day == 1,
                            )
                      : DateItem(
                          selectedDate: aDate,
                          backgroundColor: myColors.purple(),
                          borderColor: myColors.pink(),
                          textColor: myColors.black(),
                          isShowMonth: aDate.day == 1 || aDate.weekday == 7,
                        ),
              ],
            ),
        ],
      ),
    );
  }
}
