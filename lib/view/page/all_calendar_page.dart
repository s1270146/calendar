import 'package:calendar/model/date_time_model.dart';
import 'package:calendar/view/components/button/back_today_button.dart';
import 'package:calendar/view/components/value/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:calendar/view/page/month_calendar_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCalendarPage extends ConsumerStatefulWidget {
  const AllCalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  AllCalendarPageState createState() => AllCalendarPageState();
}

class AllCalendarPageState extends ConsumerState<AllCalendarPage> {
  bool isLoading = true;
  List<MonthCalendarPage> calendarPage = [];
  late PageController calendarPageController;
  @override
  void initState() {
    super.initState();
    int cnt = 0;
    int initialPageIndex = 0;
    List<DateTimeModel> calendarParameter = [];
    for (int i = 1900; i <= 2100; i++) {
      for (int j = 1; j <= 12; j++) {
        final date = DateTimeModel(
          year: i,
          month: j,
        );
        if (date.isCurrentMonth()) {
          initialPageIndex = cnt;
        }
        calendarParameter.add(date);
        cnt++;
      }
    }
    setState(() {
      isLoading = false;
      calendarPageController = PageController(initialPage: initialPageIndex);
      calendarPage = calendarParameter
          .map(
            (parameter) => MonthCalendarPage(
              dateTime: parameter,
              backTodayButton: BackTodayButton(
                calendarPageController: calendarPageController,
              ),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            color: myColors.black(),
            child: PageView(
              controller: calendarPageController,
              children: calendarPage,
            ),
          );
  }
}
