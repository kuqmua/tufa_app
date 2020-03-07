import 'package:flutter/material.dart';
import 'package:Tufa/post_wrapper.dart';

class MyListView extends StatefulWidget {
  MyListView({Key key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
        PostWrapper(),
      ],
    );
  }
}
