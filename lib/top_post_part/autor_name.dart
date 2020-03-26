import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class AutorName extends StatefulWidget {
  AutorName({
    Key key,
  }) : super(key: key);

  @override
  _AutorNameState createState() => _AutorNameState();
}

class _AutorNameState extends State<AutorName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Random autor',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 17.0,
        fontFamily: 'Lora',
        color: white,
      ),
    );
  }
}
