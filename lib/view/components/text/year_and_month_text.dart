import 'package:calendar/model/date_time_model.dart';
import 'package:calendar/view/components/value/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class YearAndMonthText extends StatelessWidget {
  const YearAndMonthText({Key? key, required this.dateTime}) : super(key: key);
  final DateTimeModel dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Text(
        DateFormat('yyyy/MM').format(dateTime),
        style: GoogleFonts.anton(
          textStyle: TextStyle(
            fontSize: 30,
            color: myColors.myPink,
          ),
        ),
      ),
    );
  }
}
