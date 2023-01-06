import 'package:calendar/view/components/value/my_colors.dart';
import 'package:calendar/view/components/value/size.dart';
import 'package:calendar/view/modal/create_plan_modal.dart';
import 'package:flutter/material.dart';

class CreatePlanButton extends StatelessWidget {
  const CreatePlanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: myColors.black(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (BuildContext context) {
            return CreatePlanModal(
              selectedYear: DateTime.now().year,
              selectedMonth: DateTime.now().month,
              selectedDay: DateTime.now().day,
            );
          },
        );
      },
      icon: Icon(
        Icons.add,
        color: myColors.purple(),
        size: mySize.iconSize,
      ),
    );
  }
}
