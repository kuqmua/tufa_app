import 'package:flutter/material.dart';
import 'package:Tufa/data_wrappers/autor_name.dart';
import 'package:Tufa/data_wrappers/publication_date.dart';
//import 'package:Tufa/data_wrappers/provider_icon.dart';
import 'package:Tufa/data_wrappers/provider_name.dart';
import 'package:Tufa/colors.dart';

class Tpp extends StatefulWidget {
  final double standartMargin;
  final String postAutor;
  final String postTime;
  final String subreddit;
  final double width;
  Tpp(
      {Key key,
      @required this.standartMargin,
      @required this.postAutor,
      @required this.postTime,
      @required this.width,
      this.subreddit})
      : super(key: key);

  @override
  _TppState createState() => _TppState();
}

class _TppState extends State<Tpp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: widget.standartMargin),
                  child: AutorName(
                    autorText: widget.postAutor,
                    fontSize: 18,
                    textColor: white,
                  )),

              //TODO: JUST CONTROL HOW MUCH SYMBOLS IN PARAMETRS + SOME FLEXIBLE LOGIC
              /*
              Container(
                  margin: EdgeInsets.only(right: widget.standartMargin),
                  child: ProviderName(
                    providerText: 'r/' + widget.subreddit ?? 'todo',
                    fontSize: 16,
                    textColor: grey,
                  )),
                  */
            ],
          ),
          Container(
              //margin: EdgeInsets.only(right: widget.standartMargin),
              child: PublicationDate(
            dateText: widget.postTime,
            textColor: grey,
            fontSize: 15,
          )),
        ],
      ),
    );
  }
}
