class DateTimeModel extends DateTime {
  DateTimeModel({
    required int year,
    int? month,
    int? day,
    int? hour,
    int? minute,
  }) : super(
          year,
          month ?? 1,
          day ?? 1,
          hour ?? 0,
          minute ?? 0,
        );

  factory DateTimeModel.fromDateTime(DateTime date) => DateTimeModel(
      year: date.year,
      month: date.month,
      day: date.day,
      hour: date.hour,
      minute: date.minute);

  bool isCurrentMonth() =>
      DateTime.now().year == year && DateTime.now().month == month;

  bool isSameMonth(DateTimeModel date) =>
      date.year == year && date.month == month;

  bool isToday() {
    final now = DateTime.now();
    if (year == now.year && month == now.month && day == now.day) {
      return true;
    }
    return false;
  }

  List<List<DateTimeModel>> createDateOfMonth() {
    List<List<DateTimeModel>> datesOfMonth = [];
    DateTimeModel lastDay = DateTimeModel.fromDateTime(
        DateTime(year, month + 1, 1).add(const Duration(days: -1)));
    int weekdayOfFirstDay = DateTime(year, month, 1).weekday % 7;
    List<DateTimeModel> datesOfWeek = [];
    DateTimeModel preLastDay = DateTimeModel.fromDateTime(
        DateTime(year, month, 1).add(const Duration(days: -1)));
    for (int i = 1 - weekdayOfFirstDay;
        i <= lastDay.day + (6 - lastDay.weekday % 7);
        i++) {
      if (lastDay.day < i) {
        datesOfWeek.add(DateTimeModel.fromDateTime(
            lastDay.add(Duration(days: i - lastDay.day))));
      } else if (i < 1) {
        datesOfWeek
            .add(DateTimeModel.fromDateTime(preLastDay.add(Duration(days: i))));
      } else {
        datesOfWeek.add(DateTimeModel.fromDateTime(DateTime(year, month, i)));
      }
    }
    int dateLength = datesOfWeek.length;
    for (int i = 0; i < dateLength / 7; i++) {
      datesOfMonth.add(datesOfWeek.sublist(7 * i, 7 * (i + 1)));
    }
    return datesOfMonth;
  }
}
