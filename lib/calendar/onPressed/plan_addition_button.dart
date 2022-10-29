import 'package:calendar/plan/add_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';

class PlanAdditionButton extends StatelessWidget {
  const PlanAdditionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: myBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (BuildContext context) {
            return AddPlanView(
              selectedYear: DateTime.now().year,
              selectedMonth: DateTime.now().month,
              selectedDay: DateTime.now().day,
            );
          },
        );
      },
      icon: Icon(
        Icons.add,
        color: myPurple,
        size: iconSize,
      ),
    );
  }
}
