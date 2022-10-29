import 'package:calendar/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar/main.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userAddressController = TextEditingController();
  final _userPassController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    color: myBlack,
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
                  cursorColor: myBlack,
                  style: TextStyle(
                    color: myBlack,
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
                      borderSide: BorderSide(color: myBlack),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myBlack),
                    ),
                    labelText: 'メールアドレス',
                    labelStyle: TextStyle(color: myBlack, fontSize: 15),
                    iconColor: myBlack,
                    focusColor: myBlack,
                    fillColor: myBlack,
                    hoverColor: myBlack,
                    prefixIconColor: myBlack,
                    suffixIconColor: myBlack,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _userPassController,
                  cursorColor: myBlack,
                  style: TextStyle(
                    color: myBlack,
                    fontSize: 15,
                  ),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myBlack),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: myBlack),
                    ),
                    labelText: 'パスワード',
                    labelStyle: TextStyle(color: myBlack, fontSize: 15),
                    iconColor: myBlack,
                    focusColor: myBlack,
                    fillColor: myBlack,
                    hoverColor: myBlack,
                    prefixIconColor: myBlack,
                    suffixIconColor: myBlack,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: myBlack,
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
                  primary: myBlack,
                  onPrimary: myPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const MainView(),
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
