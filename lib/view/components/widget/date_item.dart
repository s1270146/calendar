import 'package:calendar/model/date_time_model.dart';
import 'package:calendar/view/components/value/my_colors.dart';
import 'package:calendar/view/modal/plan_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 日付1日に対して一つのコンテナ

class DateItem extends StatelessWidget {
  const DateItem({
    Key? key,
    required this.selectedDate,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.isShowMonth,
  }) : super(key: key);
  final DateTimeModel selectedDate;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool isShowMonth;

  @override
  Widget build(BuildContext context) {
    int planListLength = 0;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: myColors.purple(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (BuildContext context) {
            return PlanListModal(
              selectedDate: selectedDate,
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
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                isShowMonth
                    ? "${selectedDate.month.toString()}/${selectedDate.day.toString()}"
                    : selectedDate.day.toString(),
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
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
                          color: myColors.yellow(),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 0.5,
                            color: myColors.pink(),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            style: const TextStyle(
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
