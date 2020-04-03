import 'package:Tufa/colors.dart';
import 'package:Tufa/list_view_bottom_bar/list_view_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Tufa/list_view_bottom_bar/list_view_bottom_bar.dart';
import 'package:Tufa/post_wrapper.dart';
import 'package:Tufa/full_post/full_post.dart';
//import 'package:Tufa/speed_dial/speed_dial.dart';
//import 'package:Tufa/speed_dial/speed_dial_child.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:Tufa/colors.dart';

class MyListView extends StatefulWidget {
  final bool isLoading;
  MyListView({
    Key key,
    @required this.isLoading,
  }) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  ScrollController scrollController;
  Widget buildBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: 5,
      itemBuilder: (ctx, i) => PostWrapper(),
    );
  }

  bool _isVisible = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: ListViewBottomBar(),
      bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: _isVisible ? 60 : 0.0,
          child: ListViewBottomBar()),
      body: widget.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildBody(),
    );
  }
}
