import 'package:calendar/plan/add_plan_view.dart';
import 'package:calendar/plan/edit_plan_view.dart';
import 'package:calendar/plan/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePlanList extends StatefulWidget {
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
  State<DatePlanList> createState() => _DatePlanList();
}

class _DatePlanList extends State<DatePlanList> {
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
                  '${widget.selectedMonth} / ${widget.selectedDay}',
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
                          selectedYear: widget.selectedYear,
                          selectedMonth: widget.selectedMonth,
                          selectedDay: widget.selectedDay,
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
          Container(
            margin: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width - 30,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < planList.length; i++)
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: myBlack,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                              ),
                              builder: (BuildContext context) {
                                return EditPlanView(
                                  planModel: planList[i],
                                );
                              },
                            );
                          },
                          child: Container(
                            child: Text(
                              planList[i].title,
                              style: TextStyle(
                                fontSize: 30,
                                color: myPink,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width - 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: myBlack,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: myYellow,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
