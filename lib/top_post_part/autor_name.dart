import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class AutorName extends StatefulWidget {
  final Color textColor;
  final double fontSize;
  final String autorText;
  AutorName({Key key, this.textColor, this.fontSize, @required this.autorText})
      : super(key: key);

  @override
  _AutorNameState createState() => _AutorNameState();
}

class _AutorNameState extends State<AutorName> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.autorText,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.w300,
          fontSize: widget.fontSize,
          color: widget.textColor,
        ));
  }
}
