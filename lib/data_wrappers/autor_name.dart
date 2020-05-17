import 'package:flutter/material.dart';

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
    return Text(
        widget.autorText[0].toUpperCase() + widget.autorText.substring(1),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
          fontSize: widget.fontSize,
          color: widget.textColor,
        ));
  }
}
