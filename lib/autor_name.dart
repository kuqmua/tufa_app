import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class AutorName extends StatefulWidget {
  AutorName({Key key}) : super(key: key);

  @override
  _AutorNameState createState() => _AutorNameState();
}

class _AutorNameState extends State<AutorName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Text(
          'Someone',
          style: TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
