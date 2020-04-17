import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_back_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_search_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_filter_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_bookmark_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_share_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_menu_button.dart';

class FullPostBottomBar extends StatefulWidget {
  FullPostBottomBar({Key key}) : super(key: key);

  @override
  _FullPostBottomBarState createState() => _FullPostBottomBarState();
}

class _FullPostBottomBarState extends State<FullPostBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Theme.of(context).primaryColor,
        border: Border(
          top: BorderSide(
            color: softerwhite,
            width: 0.2,
          ),
        ),
      ),
      child: BottomAppBar(
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FpbbBackButton(),
              FpbbSearchButton(),
              FpbbFilterButton(),
              FpbbBookmarkButton(),
              FpbbShareButton(),
              FpbbMenuButton(),
            ],
          )),
    );
  }
}
