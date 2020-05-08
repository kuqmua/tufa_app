import 'package:flutter/material.dart';
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

  bool _isVisible;
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

  build(context) => SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              title: Text('search page'),
            ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.fromLTRB(btnSize, 0, btnSize, 0),
              child: Column(
                children: <Widget>[
                  Switch(
                    onChanged: null,
                    value: false,
                  ),
                  Container(
                    height: 1200,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
