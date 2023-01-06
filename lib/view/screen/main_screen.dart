import 'package:calendar/provider/main_screen_index_provider.dart';
import 'package:calendar/view/components/widget/footer.dart';
import 'package:calendar/view/components/widget/header.dart';
import 'package:calendar/view/page/all_calendar_page.dart';
import 'package:calendar/view/page/picture_page.dart';
import 'package:calendar/view/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);
  final List<Widget> _pages = const [
    AllCalendarPage(),
    PicturePage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMainIndex = ref.watch(mainScreenIndexProvider);
    return Scaffold(
      appBar: const Header(),
      body: _pages[selectMainIndex],
      bottomNavigationBar: const Footer(),
    );
  }
}
