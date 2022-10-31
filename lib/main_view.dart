import 'dart:async';

import 'package:calendar/calendar/calendar_view.dart';
import 'package:calendar/pictures/pictures_view.dart';
import 'package:calendar/plan/plan_model.dart';
import 'package:calendar/settings/settings_view.dart';
import 'package:calendar/calendar/calendar_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:google_fonts/google_fonts.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isLoading = true;
  final _firestore = FirebaseFirestore.instance;
  List<CalendarBuilder> calendarPage = [];
  @override
  void initState() {
    super.initState();
    // DB取得
    final completer = Completer();
    var future = completer.future;
    Future(() async {
      List<PlanModel> _allPlanList = [];
      QuerySnapshot allPlanListSnap =
          await _firestore.collection('plan-list').get();
      for (var doc in allPlanListSnap.docs) {
        _allPlanList.add(PlanModel(
          doc.get('start-date').toDate(),
          doc.get('end-date').toDate(),
          doc.get('plan-title'),
          doc.get('plan-comment'),
          doc.get('is-all-day'),
          doc.id,
        ));
      }
      setState(() {
        allPlanList = _allPlanList;
        isLoading = false;
        int cnt = 0;
        for (int i = 1900; i <= 2100; i++) {
          for (int j = 1; j <= 12; j++) {
            if (DateTime.now().year == i && DateTime.now().month == j) {
              calendarController = PageController(initialPage: cnt);
            }
            calendarPage.add(
              CalendarBuilder(
                year: i,
                month: j,
                planList: _allPlanList,
              ),
            );
            cnt++;
          }
        }
        _pages = [
          CalendarView(page: calendarPage),
          const PicturesView(),
          const SettingsView(),
        ];
      });
    });
  }

  var _selectMainIndex = 0;
  List<Widget> _pages = [];
  void _onTapNavigationBarItem(int index) {
    setState(() {
      _selectMainIndex = index; //インデックスの更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: GoogleFonts.qwitcherGrypen(
            textStyle: TextStyle(
              color: myBlack,
              fontSize: 40,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: myPurple,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  allPlanList;
                });
              },
              icon: Icon(
                Icons.refresh,
                color: myBlack,
                size: 30,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.logout,
                color: myBlack,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: _pages.isEmpty
          ? Container(
              alignment: Alignment.center,
              color: myBlack,
              child: CircularProgressIndicator(
                color: myPink,
              ),
            )
          : _pages[_selectMainIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections,
            ),
            label: 'Pictures',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
        backgroundColor: myPurple,
        selectedItemColor: myPink,
        selectedLabelStyle: GoogleFonts.anton(),
        unselectedItemColor: myBlack,
        unselectedLabelStyle: GoogleFonts.anton(),
        currentIndex: _selectMainIndex,
        onTap: _onTapNavigationBarItem,
      ),
    );
  }
}
