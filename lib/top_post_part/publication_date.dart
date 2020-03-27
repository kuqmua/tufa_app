import 'package:flutter/material.dart';

class PublicationDate extends StatefulWidget {
  final double standartMargin;
  PublicationDate({Key key, @required this.standartMargin}) : super(key: key);

  @override
  _PublicationDateState createState() => _PublicationDateState();
}

class _PublicationDateState extends State<PublicationDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: widget.standartMargin),
      child: Text(
        '1h',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
