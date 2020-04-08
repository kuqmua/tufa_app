import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class FpbbShareButton extends StatelessWidget {
  const FpbbShareButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: new Icon(
          Feather.share_2,
          color: grey,
        ),
        disabledColor: Colors.green,
        onPressed: () {});
  }
}
