import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_back_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_search_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_filter_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_bookmark_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_share_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_menu_button.dart';

class FullPostBottomBarStack extends StatefulWidget {
  FullPostBottomBarStack({Key key}) : super(key: key);

  @override
  _FullPostBottomBarStackState createState() => _FullPostBottomBarStackState();
}

class _FullPostBottomBarStackState extends State<FullPostBottomBarStack> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                //                    <--- top side
                color: softerwhite,
                width: 0.2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
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
