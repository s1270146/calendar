import 'package:calendar/calendar/calendar_view.dart';
import 'package:calendar/pictures/pictures_view.dart';
import 'package:calendar/settings/settings_view.dart';
import 'package:calendar/calendar/calendar_builder.dart';
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
  List<CalendarBuilder> calendarPage = [];
  @override
  void initState() {
    super.initState();
    int cnt = 0;
    for (int i = 1900; i <= 2100; i++) {
      for (int j = 1; j <= 12; j++) {
        if (DateTime.now().year == i && DateTime.now().month == j) {
          thisMonthIndex = cnt;
        }
        calendarPage.add(
          CalendarBuilder(
            year: i,
            month: j,
          ),
        );
        cnt++;
      }
    }
    calendarController = PageController(initialPage: thisMonthIndex);
    _pages = [
      CalendarView(page: calendarPage),
      const PicturesView(),
      const SettingsView(),
    ];
  }

  var _selectMainIndex = 0;
  late List<Widget> _pages;
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
      body: _pages[_selectMainIndex],
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
