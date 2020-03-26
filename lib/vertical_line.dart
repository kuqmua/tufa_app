import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class VerticalLine extends StatelessWidget {
  final double btnSize;
  const VerticalLine({Key key, @required this.btnSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      right: btnSize / 2 - 0.25,
      left: btnSize / 2 - 0.25,
      top: 0,
      bottom: 0,
      child: Container(
        color: borderColor,
        width: 1,
        height: 1,
      ),
    );
  }
}
