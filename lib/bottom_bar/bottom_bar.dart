import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/full_post_bottom_bar.dart';
import 'package:Tufa/search_page/search_page_bottom_bar.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/list_view_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  final bool isVisible;
  final bool listView;
  final bool fullPost;
  final bool searchPage;
  final bool loginPage;
  BottomBar(
      {Key key,
      this.isVisible,
      this.listView,
      this.fullPost,
      this.searchPage,
      this.loginPage})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: widget.isVisible
            ? 55 // THIS IS THE HEIGTH OF ListViewBottomBar()!
            : 0.0,
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: softerwhite,
                  width: 0.2,
                ),
              ),
            ),
            child: widget.listView
                ? ListViewBottomBar()
                : widget.fullPost
                    ? FullPostBottomBar()
                    : widget.searchPage
                        ? SearchPageBottomBar()
                        : widget.loginPage ? null : null));
  }
}
