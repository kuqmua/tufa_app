import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:Tufa/post_wrapper.dart';

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
        body: widget.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : buildBody());
  }
}
