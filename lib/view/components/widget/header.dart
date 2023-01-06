import 'package:calendar/view/components/value/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Calendar",
        style: GoogleFonts.qwitcherGrypen(
          textStyle: TextStyle(
            color: myColors.black(),
            fontSize: 40,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: myColors.purple(),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              color: myColors.black(),
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
              color: myColors.black(),
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
