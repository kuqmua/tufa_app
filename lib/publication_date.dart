import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class PublicationDate extends StatefulWidget {
  PublicationDate({Key key}) : super(key: key);

  @override
  _PublicationDateState createState() => _PublicationDateState();
}

class _PublicationDateState extends State<PublicationDate> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '1h',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: grey,
        fontSize: 18,
        fontFamily: 'Lora',
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
