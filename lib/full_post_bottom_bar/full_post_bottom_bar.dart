import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post_bottom_bar/fpbb_back_button.dart';
import 'package:Tufa/full_post_bottom_bar/fpbb_search_button.dart';
import 'package:Tufa/full_post_bottom_bar/fpbb_filter_button.dart';

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
            FpbbBackButton(),
            FpbbSearchButton(),
            FpbbFilterButton(),
            IconButton(
                icon: Icon(
                  AntDesign.staro,
                  color: grey,
                ),
                disabledColor: Colors.green,
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Feather.share_2,
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
