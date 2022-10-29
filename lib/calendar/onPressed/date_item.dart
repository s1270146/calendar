import 'package:calendar/main.dart';
import 'package:calendar/plan/date_plan_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
              selectedYear: selectedYear,
              selectedMonth: selectedMonth,
              selectedDay: selectedDay,
            );
          },
        );
      },
      child: Container(
        height: (MediaQuery.of(context).size.height - 300) / 6,
        width: (MediaQuery.of(context).size.width - 30) / 7,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        child: Text(
          isAddMonth
              ? "${selectedMonth.toString()}/${selectedDay.toString()}"
              : selectedDay.toString(),
          style: GoogleFonts.anton(
            textStyle: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
