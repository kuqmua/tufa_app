import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
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
      body: ListView(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: SvgPicture.asset('assets/svg/tufa.svg',
                  height: 200,
                  color: Colors.white,
                  semanticsLabel: 'Acme Logo')),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: softerwhite),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: softerwhite),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: "Username",
                hintStyle: TextStyle(
                  color: white,
                  //fontSize: 16,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
                filled: true,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: softerwhite),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: softerwhite),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: white,
                  //fontSize: 16,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
                filled: true,
              ),
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 210),
            child: RaisedButton(
              child: Text("Sign in"),
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: FlatButton(
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
