import 'package:flutter/material.dart';
import 'package:Tufa/post.dart';
import 'package:Tufa/my_divider.dart';

class PostWrapper extends StatefulWidget {
  @override
  _PostWrapperState createState() => _PostWrapperState();
}

class _PostWrapperState extends State<PostWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Post(),
        MyDivider(),
      ]),
    );
  }
}
