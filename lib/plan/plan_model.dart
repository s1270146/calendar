class PlanModel {
  DateTime startDate;
  DateTime endDate;
  String title;
  String comment;
  bool isAllDay;
  PlanModel(
    this.startDate,
    this.endDate,
    this.title,
    this.comment,
    this.isAllDay,
  );
}
