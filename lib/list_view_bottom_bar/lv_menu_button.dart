import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class LvMenuButton extends StatelessWidget {
  const LvMenuButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          Entypo.menu,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
