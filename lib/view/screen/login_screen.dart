import 'package:calendar/view/components/value/my_colors.dart';
import 'package:calendar/view/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userAddressController = TextEditingController();
  final _userPassController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myColors.purple(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    color: myColors.black(),
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _userAddressController,
                  cursorColor: myColors.black(),
                  style: TextStyle(
                    color: myColors.black(),
                    fontSize: 15,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'メールアドレスが入力されていません!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myColors.black()),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myColors.black()),
                    ),
                    labelText: 'メールアドレス',
                    labelStyle:
                        TextStyle(color: myColors.black(), fontSize: 15),
                    iconColor: myColors.black(),
                    focusColor: myColors.black(),
                    fillColor: myColors.black(),
                    hoverColor: myColors.black(),
                    prefixIconColor: myColors.black(),
                    suffixIconColor: myColors.black(),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _userPassController,
                  cursorColor: myColors.black(),
                  style: TextStyle(
                    color: myColors.black(),
                    fontSize: 15,
                  ),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myColors.black()),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myColors.black()),
                    ),
                    labelText: 'パスワード',
                    labelStyle:
                        TextStyle(color: myColors.black(), fontSize: 15),
                    iconColor: myColors.black(),
                    focusColor: myColors.black(),
                    fillColor: myColors.black(),
                    hoverColor: myColors.black(),
                    prefixIconColor: myColors.black(),
                    suffixIconColor: myColors.black(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: myColors.black(),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColors.black(),
                  foregroundColor: myColors.black(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: myColors.pink(),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const MainScreen(),
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
