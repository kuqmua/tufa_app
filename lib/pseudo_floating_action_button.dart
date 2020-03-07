import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class PseudoFloatingActionButton extends StatefulWidget {
  PseudoFloatingActionButton({Key key}) : super(key: key);

  @override
  _PseudoFloatingActionButtonState createState() =>
      _PseudoFloatingActionButtonState();
}

class _PseudoFloatingActionButtonState
    extends State<PseudoFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)), color: blue),
          child: Icon(
            Ionicons.ios_settings,
            size: 25.0,
            color: white,
          ),
        ),
        bottom: 16,
        left: 0,
      ),
    );
  }
}
