import 'package:calendar/main.dart';
import 'package:calendar/view/modal/plan_list_modal.dart';
import 'package:calendar/model/plan_model.dart';
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
    required this.planList,
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
  final List<PlanModel> planList;

  @override
  State<DateItem> createState() => _DateItem();
}

class _DateItem extends State<DateItem> {
  @override
  Widget build(BuildContext context) {
    int planListLength = widget.planList.length;
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
            return PlanListModal(
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
                            widget.planList[i].title,
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
