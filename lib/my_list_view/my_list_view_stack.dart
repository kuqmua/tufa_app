import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:Tufa/post_wrapper.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/list_view_bottom_bar.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/list_view_bottom_bar_stack.dart';

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
        /*
        bottomNavigationBar: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _isVisible
                ? 55 // THIS IS THE HEIGTH OF ListViewBottomBar()!
                : 0.0,
            child: ListViewBottomBar()
            //child: SearchBottomBar()
            ),
            */
        body: Stack(children: [
      widget.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : buildBody(),
      Positioned(
          bottom: 0,
          child: AnimatedContainer(
            child: ListViewBottomBarStack(),
            duration: Duration(milliseconds: 200),
            height: _isVisible ? 55 : 0.0,
          )),
    ]));
  }
}
