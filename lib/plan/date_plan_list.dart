import 'package:calendar/plan/add_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePlanList extends StatelessWidget {
  const DatePlanList({
    Key? key,
    required this.selectedYear,
    required this.selectedMonth,
    required this.selectedDay,
  }) : super(key: key);
  final int selectedYear;
  final int selectedMonth;
  final int selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10 * 9,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.expand_more,
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '$selectedMonth / $selectedDay',
                  style: GoogleFonts.anton(
                    textStyle: TextStyle(
                      color: myBlack,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: myBlack,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      builder: (BuildContext context) {
                        return AddPlanView(
                          selectedYear: selectedYear,
                          selectedMonth: selectedMonth,
                          selectedDay: selectedDay,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
