import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/list_view_bottom_bar/home_button.dart';

class ListViewBottomBar extends StatefulWidget {
  ListViewBottomBar({Key key}) : super(key: key);

  @override
  _ListViewBottomBarState createState() => _ListViewBottomBarState();
}

class _ListViewBottomBarState extends State<ListViewBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HomeButton(),
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
