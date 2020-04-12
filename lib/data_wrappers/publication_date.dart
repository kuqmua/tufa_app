import 'package:flutter/material.dart';

class PublicationDate extends StatefulWidget {
  final Color textColor;
  final double fontSize;
  final String dateText;

  PublicationDate(
      {Key key, this.textColor, this.fontSize, @required this.dateText})
      : super(key: key);

  @override
  _PublicationDateState createState() => _PublicationDateState();
}

class _PublicationDateState extends State<PublicationDate> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.dateText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w300,
        fontSize: widget.fontSize,
        color: widget.textColor,
      ),
    );
  }
}
