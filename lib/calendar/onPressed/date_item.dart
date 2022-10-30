import 'package:calendar/main.dart';
import 'package:calendar/plan/date_plan_list.dart';
import 'package:calendar/plan/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 日付1日に対して一つのコンテナ

class DateItem extends StatefulWidget {
  const DateItem({
    Key? key,
    required this.viewYear,
    required this.viewMonth,
    required this.selectedYear,
    required this.selectedMonth,
    required this.selectedDay,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.isAddMonth,
  }) : super(key: key);
  final int viewYear;
  final int viewMonth;
  final int selectedYear;
  final int selectedMonth;
  final int selectedDay;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool isAddMonth;

  @override
  State<DateItem> createState() => _DateItem();
}

class _DateItem extends State<DateItem> {
  List<PlanModel> planList = [];

  @override
  void initState() {
    super.initState();
    for (var plan in allPranList) {
      DateTime selectedDate = DateTime(
          widget.selectedYear, widget.selectedMonth, widget.selectedDay);
      if (selectedDate.isAtSameMomentAs(plan.startDate)) {
        planList.add(plan);
      } else if (selectedDate.isAtSameMomentAs(plan.endDate)) {
        planList.add(plan);
      } else if (selectedDate.isAfter(plan.startDate) &&
          selectedDate.isBefore(plan.endDate)) {
        planList.add(plan);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int planListLength = planList.length;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: myPurple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (BuildContext context) {
            return DatePlanList(
              selectedYear: widget.selectedYear,
              selectedMonth: widget.selectedMonth,
              selectedDay: widget.selectedDay,
            );
          },
        );
      },
      child: Container(
        height: (MediaQuery.of(context).size.height - 300) / 6,
        width: (MediaQuery.of(context).size.width - 30) / 7,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
          ),
          color: widget.backgroundColor,
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                widget.isAddMonth
                    ? "${widget.selectedMonth.toString()}/${widget.selectedDay.toString()}"
                    : widget.selectedDay.toString(),
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    color: widget.textColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: (MediaQuery.of(context).size.height - 300) / 6 - 20,
                width: (MediaQuery.of(context).size.width - 30) / 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < planListLength; i++)
                      Container(
                        height:
                            ((MediaQuery.of(context).size.height - 300) / 6 -
                                        20) /
                                    5 -
                                2,
                        width: (MediaQuery.of(context).size.width - 30) / 7 - 5,
                        decoration: BoxDecoration(
                          color: myYellow,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 0.5,
                            color: myPink,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            planList[i].title,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
