import 'package:flutter/material.dart';
import 'package:Tufa/login_screen/text_form.dart';
import 'package:Tufa/login_screen/tufa_svg.dart';
import 'package:Tufa/login_screen/sign_in_button.dart';
import 'package:Tufa/login_screen/sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 125, 25, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TufaSvg(),
                TextForm(),
                TextForm(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SignInButton(),
                    ),
                  ],
                ),
              ],
            ),
            SignUpButton()
          ],
        ),
      ),
    );
  }
}
