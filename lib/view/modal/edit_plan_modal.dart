import 'package:calendar/model/plan_model/plan_model.dart';
import 'package:calendar/view/components/value/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

// 入力項目 変数
// タイトル _planTitleController
// 終日判定 isAllDay
// 開始日時 _startDate
// 終了日時 _endDate
// コメント _planCommentController
// ID id

class EditPlanModal extends StatefulWidget {
  const EditPlanModal({
    Key? key,
    required this.planModel,
  }) : super(key: key);
  final PlanModel planModel;

  @override
  State<EditPlanModal> createState() => _EditPlanModalState();
}

class _EditPlanModalState extends State<EditPlanModal> {
  late bool isAllDay;
  late DateTime _startDate;
  late DateTime _endDate;
  final double thisFontSize = 20;
  late TextEditingController _planTitleController;
  late TextEditingController _planCommentController;

  String japaneseWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return '月曜日';
      case 2:
        return '火曜日';
      case 3:
        return '水曜日';
      case 4:
        return '木曜日';
      case 5:
        return '金曜日';
      case 6:
        return '土曜日';
    }
    return '日曜日';
  }

  @override
  void initState() {
    super.initState();
    _startDate = widget.planModel.startDate;
    _endDate = widget.planModel.endDate;
    isAllDay = widget.planModel.isAllDay;
    _planTitleController = TextEditingController(
      text: widget.planModel.title,
    );
    _planCommentController = TextEditingController(
      text: widget.planModel.comment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 60,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: myColors.pink(),
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.add_comment,
                    color: _planTitleController.text == ''
                        ? myColors.pinkCanNotPress()
                        : myColors.pink(),
                    size: 25,
                  ),
                  onPressed: _planTitleController.text == ''
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                ),
              ),
            ],
          ),
          // 項目 タイトル
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            margin: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: _planTitleController,
              cursorColor: myColors.pink(),
              style: TextStyle(
                color: myColors.pink(),
                fontSize: 25,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: myColors.pink()),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: myColors.pink()),
                ),
                labelText: 'タイトル',
                labelStyle: TextStyle(color: myColors.pink(), fontSize: 20),
                iconColor: myColors.pink(),
                focusColor: myColors.pink(),
                fillColor: myColors.pink(),
                hoverColor: myColors.pink(),
                prefixIconColor: myColors.pink(),
                suffixIconColor: myColors.pink(),
              ),
            ),
          ),
          // 項目 終日
          Container(
            height: 60,
            margin: const EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    '終日',
                    style: TextStyle(
                      color: myColors.pink(),
                      fontSize: thisFontSize,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Switch(
                    focusColor: myColors.pink(),
                    activeColor: myColors.pink(),
                    value: isAllDay,
                    onChanged: (value) {
                      setState(
                        () {
                          isAllDay = value;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // 項目 開始日
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.start,
                          color: myColors.pink(),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? selected = await showDatePicker(
                            context: context,
                            initialDate: _startDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: ((context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: myColors.purple(),
                                    onPrimary: myColors.black(),
                                    surface: myColors.purple(),
                                    onSurface: myColors.pink(),
                                    brightness: Brightness.dark,
                                  ),
                                ),
                                child: child!,
                              );
                            }),
                          );
                          if (selected != null) {
                            setState(() {
                              _startDate = DateTime(
                                selected.year,
                                selected.month,
                                selected.day,
                                _startDate.hour,
                                _startDate.minute,
                              );
                              if (_startDate.isAfter(_endDate)) {
                                _endDate =
                                    _startDate.add(const Duration(hours: 1));
                              }
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '${_startDate.month}月${_startDate.day}日 ${japaneseWeekday(_startDate.weekday)}',
                            style: TextStyle(
                              color: myColors.pink(),
                              fontSize: thisFontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isAllDay,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 80),
                    child: InkWell(
                      onTap: () {
                        Picker(
                          adapter: DateTimePickerAdapter(
                            type: PickerDateTimeType.kHM,
                            value: _startDate,
                            customColumnType: [3, 4],
                          ),
                          title: const Text('Select Start Time'),
                          onConfirm: (picker, selected) {
                            setState(() {
                              _startDate = DateTime(
                                _startDate.year,
                                _startDate.month,
                                _startDate.day,
                                selected[0],
                                selected[1],
                              );
                              if (_startDate.isAfter(_endDate)) {
                                _endDate =
                                    _startDate.add(const Duration(hours: 1));
                              }
                            });
                          },
                        ).showModal(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 50,
                        width: 60,
                        child: Text(
                          '${_startDate.hour}:${_startDate.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            color: myColors.pink(),
                            fontSize: thisFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 項目 終了日時
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.arrow_back,
                          color: myColors.pink(),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? selected = await showDatePicker(
                            context: context,
                            initialDate: _endDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: ((context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: myColors.purple(),
                                    onPrimary: myColors.black(),
                                    surface: myColors.purple(),
                                    onSurface: myColors.pink(),
                                    brightness: Brightness.dark,
                                  ),
                                ),
                                child: child!,
                              );
                            }),
                          );
                          if (selected != null) {
                            setState(() {
                              _endDate = DateTime(
                                selected.year,
                                selected.month,
                                selected.day,
                                _endDate.hour,
                                _endDate.minute,
                              );
                              if (_startDate.isAfter(_endDate)) {
                                _startDate =
                                    _endDate.add(const Duration(hours: -1));
                              }
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '${_endDate.month}月${_endDate.day}日 ${japaneseWeekday(_endDate.weekday)}',
                            style: TextStyle(
                              color: myColors.pink(),
                              fontSize: thisFontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isAllDay,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 80),
                    child: InkWell(
                      onTap: () {
                        Picker(
                          adapter: DateTimePickerAdapter(
                            type: PickerDateTimeType.kHM,
                            value: _endDate,
                            customColumnType: [3, 4],
                          ),
                          title: const Text('Select End Time'),
                          onConfirm: (picker, selected) {
                            setState(() {
                              _endDate = DateTime(
                                _endDate.year,
                                _endDate.month,
                                _endDate.day,
                                selected[0],
                                selected[1],
                              );
                              if (_startDate.isAfter(_endDate)) {
                                _startDate =
                                    _endDate.add(const Duration(hours: -1));
                              }
                            });
                          },
                        ).showModal(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 50,
                        width: 60,
                        child: Text(
                          '${_endDate.hour}:${_endDate.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            color: myColors.pink(),
                            fontSize: thisFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 項目 コメント
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 300,
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _planCommentController,
                cursorColor: myColors.pink(),
                style: TextStyle(
                  color: myColors.pink(),
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: myColors.pink()),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: myColors.pink()),
                  ),
                  labelText: 'コメント',
                  labelStyle: TextStyle(color: myColors.pink(), fontSize: 20),
                  iconColor: myColors.pink(),
                  focusColor: myColors.pink(),
                  fillColor: myColors.pink(),
                  hoverColor: myColors.pink(),
                  prefixIconColor: myColors.pink(),
                  suffixIconColor: myColors.pink(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
