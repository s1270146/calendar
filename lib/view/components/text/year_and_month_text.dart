import 'package:calendar/view/components/value/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearAndMonthText extends StatelessWidget {
  const YearAndMonthText({Key? key, required this.year, required this.month})
      : super(key: key);
  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Text(
        "$year/$month",
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
