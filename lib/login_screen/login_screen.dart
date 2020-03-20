import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/login_screen/text_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                SvgPicture.asset('assets/svg/tufa.svg',
                    height: 200,
                    color: Colors.white,
                    semanticsLabel: 'Acme Logo'),
                TextForm(),
                TextForm(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          //side: BorderSide(color: Colors.red)
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: border,
                            fontSize: 16,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            FlatButton(
              color: border,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
                //side: BorderSide(color: Colors.red)
              ),
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: softerwhite,
                  fontSize: 16,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
