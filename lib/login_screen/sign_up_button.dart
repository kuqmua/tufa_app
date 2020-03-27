import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: borderColor,
      child: Text(
        "Sign up",
        style: Theme.of(context).textTheme.headline2,
      ),
      onPressed: () {},
    );
  }
}
