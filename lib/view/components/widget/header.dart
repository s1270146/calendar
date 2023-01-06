import 'package:flutter/material.dart';
import 'package:calendar/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Calendar",
        style: GoogleFonts.qwitcherGrypen(
          textStyle: const TextStyle(
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
            onPressed: () {},
            icon: const Icon(
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
            icon: const Icon(
              Icons.logout,
              color: myBlack,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
