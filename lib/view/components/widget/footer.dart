import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar/provider/main_screen_index_provider.dart';

class Footer extends ConsumerStatefulWidget {
  const Footer({super.key});
  @override
  FooterState createState() => FooterState();
}

class FooterState extends ConsumerState<Footer> {
  @override
  Widget build(BuildContext context) {
    final selectMainIndex = ref.watch(mainScreenIndexProvider);
    return BottomNavigationBar(
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
      currentIndex: selectMainIndex,
      onTap: (index) =>
          ref.read(mainScreenIndexProvider.notifier).update((state) => index),
    );
  }
}
