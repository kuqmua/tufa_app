import 'package:flutter/material.dart';
//import 'dart:ui';

import 'package:Tufa/search_page/search_page_bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:Tufa/colors.dart';

class SearchPage extends StatefulWidget {
  final ScrollController scrollController;
  SearchPage({Key key, this.scrollController}) : super(key: key);
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  static const double btnSize = 20.0;
  static const double standartMargin = 5.0;

  build(context) => SingleChildScrollView(
        controller: widget.scrollController,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              btnSize, standartMargin - 1, btnSize, standartMargin * 2),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 100,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      );
}
/*
        Positioned(
            bottom: 0,
            child: ),
            */
