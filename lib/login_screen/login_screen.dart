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
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.black26,
          //height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.06,
              MediaQuery.of(context).size.height * 0.2,
              MediaQuery.of(context).size.width * 0.06,
              MediaQuery.of(context).size.height * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 50,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.15,
                    ),
                    //color: Colors.red,
                    child: TufaSvg()),
                Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: TextForm()),
                    Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: TextForm()),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.04,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SignInButton(),
                          ),
                        ],
                      ),
                    ),
                    SignUpButton()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
