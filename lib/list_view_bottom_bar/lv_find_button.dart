import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class LvFindButton extends StatelessWidget {
  const LvFindButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          AntDesign.search1,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
