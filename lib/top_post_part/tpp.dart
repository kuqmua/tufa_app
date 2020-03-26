import 'package:flutter/material.dart';
import 'package:Tufa/top_post_part/autor_name.dart';
import 'package:Tufa/top_post_part/publication_date.dart';
import 'package:Tufa/top_post_part/provider_icon.dart';
import 'package:Tufa/top_post_part/provider_name.dart';

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
        Container(
          margin: EdgeInsets.only(right: widget.standartMargin),
          child: ProviderIcon(),
        ),
        Flexible(
            fit: FlexFit.loose,
            child: Container(
                margin: EdgeInsets.only(right: widget.standartMargin),
                child: AutorName())),
        Flexible(
          child: Container(
              margin: EdgeInsets.only(right: widget.standartMargin),
              child: ProviderName()),
        ),
        PublicationDate(standartMargin: widget.standartMargin),
        /*
        Container(
          width: 30,
          height: 14,
          decoration: BoxDecoration(
            //color: border,
            border: Border.all(
              color: blue,
              width: 1.3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        */
      ],
    );
  }
}
/*
 Icon(
              Icons.hearing,
              size: 18,
              color: blue,
            ),


Container(
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: border,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                '#hashtag',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blue,
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
              ),
            )



Text(
              '#open',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blue,
                fontSize: 18,
                fontFamily: 'Lora',
                fontWeight: FontWeight.w300,
              ),
            ),
            
*/
