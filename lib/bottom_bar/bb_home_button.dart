import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class BbHomeButton extends StatelessWidget {
  const BbHomeButton({Key key}) : super(key: key);

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
