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
          //resizeToAvoidBottomPadding: true,
          //resizeToAvoidBottomInset: true,
          body: Stack(children: <Widget>[
        SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(
                btnSize, standartMargin - 1, btnSize, standartMargin * 2),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    height: 1000,
                    width: 400,
                    color: Colors.red)
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
      ]));
}
