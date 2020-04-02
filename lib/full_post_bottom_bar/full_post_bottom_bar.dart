import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/list_view_bottom_bar/home_button.dart';
import 'package:Tufa/full_post_bottom_bar/back_button.dart';

class FullPostBottomBar extends StatefulWidget {
  FullPostBottomBar({Key key}) : super(key: key);

  @override
  _FullPostBottomBarState createState() => _FullPostBottomBarState();
}

class _FullPostBottomBarState extends State<FullPostBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BackButton(),
            IconButton(
                icon: new Icon(
                  AntDesign.search1,
                  color: grey,
                ),
                disabledColor: Colors.green,
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  AntDesign.filter,
                  color: grey,
                ),
                disabledColor: Colors.green,
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Feather.bookmark,
                  color: grey,
                ),
                disabledColor: Colors.green,
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Entypo.menu,
                  color: grey,
                ),
                disabledColor: Colors.green,
                onPressed: () {}),
          ],
        ));
  }
}
