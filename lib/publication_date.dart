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
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Text(
        '1h',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: grey,
          fontSize: 17,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
