import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          background,
          border,
          background,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
    )
        /*
    Container(
      height:1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment
              .centerRight, 
          colors: [
            Color.fromRGBO(22, 32, 42, 1.0),
            Color.fromRGBO(32, 48, 62, 1.0),
            Color.fromRGBO(22, 32, 42, 1.0),
          ], // whitish to gray
          tileMode: TileMode.repeated, 
        ),
      ),
      child: Divider(
          //height: 1.0,
          //color: Theme.of(context).dividerColor,
          ),
    )
    */
        ;
  }
}
