class CalendarModel {
  DateTime? lastDay;
  int year;
  int month;
  List<List<DateTime>> date = [];
  CalendarModel(this.year, this.month) {
    lastDay = DateTime(year, month + 1, 1).add(const Duration(days: -1));
    int weekdayFirstDay = DateTime(year, month, 1).weekday % 7;
    List<DateTime> dateTmp = [];
    DateTime preLastDay =
        DateTime(year, month, 1).add(const Duration(days: -1));
    for (int i = 1 - weekdayFirstDay;
        i <= lastDay!.day + (6 - lastDay!.weekday % 7);
        i++) {
      if (lastDay!.day < i) {
        dateTmp.add(lastDay!.add(Duration(days: i - lastDay!.day)));
      } else if (i < 1) {
        dateTmp.add(preLastDay.add(Duration(days: i)));
      } else {
        dateTmp.add(DateTime(year, month, i));
      }
    }
    int dateLength = dateTmp.length;
    for (int i = 0; i < dateLength / 7; i++) {
      date.add(dateTmp.sublist(7 * i, 7 * (i + 1)));
    }
  }
}
