import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:Tufa/search_page/search_page_bottom_bar.dart';
import 'package:flutter/rendering.dart';

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
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  btnSize, standartMargin - 1, btnSize, standartMargin * 2),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
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
        ]),
      );
}
