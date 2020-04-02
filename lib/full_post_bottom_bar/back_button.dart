import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class BackBackButton extends StatelessWidget {
  const BackBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          AntDesign.arrowleft,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
