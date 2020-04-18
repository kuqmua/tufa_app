import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:Tufa/post_wrapper.dart';
import 'package:Tufa/my_list_view/list_view_bottom_bar/list_view_bottom_bar.dart';

class MyListView extends StatefulWidget {
  final bool isLoading;
  final ScrollController scrollController;
  MyListView(
      {Key key, @required this.isLoading, @required this.scrollController})
      : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  Widget buildBody() {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: 5,
      itemBuilder: (ctx, i) => PostWrapper(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : buildBody();
  }
}
