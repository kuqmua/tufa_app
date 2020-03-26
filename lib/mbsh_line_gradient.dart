import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class MbshLineGradient extends StatelessWidget {
  const MbshLineGradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            backgroundColor,
            borderColor,
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
