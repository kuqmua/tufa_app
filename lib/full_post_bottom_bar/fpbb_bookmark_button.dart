import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class FpbbBookmarkButton extends StatelessWidget {
  const FpbbBookmarkButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          AntDesign.staro,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
