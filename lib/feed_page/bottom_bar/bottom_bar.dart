import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/feed_page/bottom_bar/bb_home_button.dart';
import 'package:Tufa/feed_page/bottom_bar/bb_find_button.dart';
import 'package:Tufa/feed_page/bottom_bar/bb_filter_button.dart';
import 'package:Tufa/feed_page/bottom_bar/bb_bookmark_button.dart';
import 'package:Tufa/feed_page/bottom_bar/bb_menu_button.dart';
import 'package:flutter/rendering.dart';

class BottomBar extends StatefulWidget {
  BottomBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
          ),
        ),
        child: BottomAppBar(
            color: backgroundColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BbHomeButton(),
                BbFindButton(),
                BbFilterButton(),
                BbBookmarkButton(),
                BbMenuButton(),
              ],
            )));
  }
}
