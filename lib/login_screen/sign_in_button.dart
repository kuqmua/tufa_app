import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
      color: white,
      child: Text(
        "Sign in",
        style: Theme.of(context).textTheme.headline3,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/bottomNavPageWrapper');
      },
    );
  }
}
