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
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: new Text(
          'Casey Muratori',
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            fontSize: 17.0,
            fontFamily: 'Lora',
            color: white,
          ),
        ),
      ),
    );
  }
}
