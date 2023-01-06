import 'package:calendar/view/components/button/back_today_button.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
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
    List<Map<String, int>> calendarParameter = [];
    for (int i = 1900; i <= 2100; i++) {
      for (int j = 1; j <= 12; j++) {
        if (DateTime.now().year == i && DateTime.now().month == j) {
          initialPageIndex = cnt;
        }
        calendarParameter.add({
          'year': i,
          'month': j,
        });
        cnt++;
      }
    }
    setState(() {
      isLoading = false;
      calendarPageController = PageController(initialPage: initialPageIndex);
      calendarPage = calendarParameter
          .map(
            (parameter) => MonthCalendarPage(
              year: parameter['year']!,
              month: parameter['month']!,
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
            color: myBlack,
            child: PageView(
              controller: calendarPageController,
              children: calendarPage,
            ),
          );
  }
}
