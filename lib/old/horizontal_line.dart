import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class HorizontalLine extends StatefulWidget {
  HorizontalLine({Key key}) : super(key: key);

  @override
  _HorizontalLineState createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
        height: 1.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            background,
            border,
            background,
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
      ),
    );
  }
}
/*
decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment
                .centerRight, // 10% of the width, so there are ten blinds.
            colors: [
              grey,
              background,
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        
*/
