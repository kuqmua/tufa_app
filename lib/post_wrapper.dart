import 'package:flutter/material.dart';
import 'package:Tufa/post.dart';
import 'package:Tufa/my_divider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostWrapper extends StatefulWidget {
  @override
  _PostWrapperState createState() => _PostWrapperState();
}

class _PostWrapperState extends State<PostWrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(children: <Widget>[
        Post(),
        MyDivider(),
      ]),
      Positioned(
        right: 40,
        top: -5,
        child: IconButton(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          onPressed: () {},
          icon: Icon(
            MaterialIcons.expand_more,
            size: 27,
          ),
        ),
      )
    ]);
  }
}
