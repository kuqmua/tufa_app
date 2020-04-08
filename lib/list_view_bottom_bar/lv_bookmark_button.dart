import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class LvBookmarkButton extends StatelessWidget {
  const LvBookmarkButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          Feather.bookmark,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
