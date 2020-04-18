import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_home_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_find_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_filter_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_bookmark_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_menu_button.dart';

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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LvHomeButton(),
            LvFindButton(),
            LvFilterButton(),
            LvBookmarkButton(),
            LvMenuButton(),
          ],
        ));
  }
}
