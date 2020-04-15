import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_home_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_find_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_filter_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_bookmark_button.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/lv_menu_button.dart';

class ListViewBottomBarStack extends StatefulWidget {
  ListViewBottomBarStack({Key key}) : super(key: key);

  @override
  _ListViewBottomBarStackState createState() => _ListViewBottomBarStackState();
}

class _ListViewBottomBarStackState extends State<ListViewBottomBarStack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border(
          top: BorderSide(
            color: softerwhite,
            width: 0.2,
          ),
        ),
      ),
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
      ),
    );
  }
}
