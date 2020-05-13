import 'package:flutter/material.dart';
import 'package:Tufa/data_wrappers/autor_name.dart';
import 'package:Tufa/data_wrappers/publication_date.dart';
import 'package:Tufa/data_wrappers/provider_icon.dart';
import 'package:Tufa/data_wrappers/provider_name.dart';
import 'package:Tufa/colors.dart';

class Tpp extends StatefulWidget {
  final double standartMargin;
  Tpp({Key key, @required this.standartMargin}) : super(key: key);

  @override
  _TppState createState() => _TppState();
}

class _TppState extends State<Tpp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        /*
        Container(
          margin: EdgeInsets.only(right: widget.standartMargin),
          child: ProviderIcon(),
        ),
        */
        Flexible(
            fit: FlexFit.loose,
            child: Container(
                margin: EdgeInsets.only(right: widget.standartMargin),
                child: AutorName(
                  autorText: 'Random autor',
                  fontSize: 18,
                  textColor: white,
                ))),
        Flexible(
          child: Container(
              margin: EdgeInsets.only(right: widget.standartMargin),
              child: ProviderName(
                providerText: 'r/pytorch',
                textColor: grey,
              )),
        ),
        Container(
            margin: EdgeInsets.only(right: widget.standartMargin),
            child: PublicationDate(
              dateText: '1h',
              textColor: grey,
            )),
      ],
    );
  }
}
