/*
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
*/
import 'package:flutter/material.dart';
//import 'dart:ui';

import 'package:Tufa/search_page/search_page_bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:Tufa/colors.dart';

class SearchPage extends StatefulWidget {
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  static const double btnSize = 20.0;
  static const double standartMargin = 5.0;
  static const double fontSize = 16.0;
  static const double iconSize = 20.0;

  ScrollController scrollController;

  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    _isVisible = true;
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  build(context) => Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(btnSize, 0, btnSize, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 1200,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      );
}
/*
 Scaffold(
          body: Stack(children: <Widget>[
        SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(btnSize, 0, btnSize, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 1200,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: AnimatedContainer(
              child: SearchPageBottomBar(),
              duration: Duration(milliseconds: 200),
              height: _isVisible ? 55 : 0.0,
            )),
      ]))
*/
