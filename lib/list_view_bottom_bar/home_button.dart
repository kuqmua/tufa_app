import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          Icons.home,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
