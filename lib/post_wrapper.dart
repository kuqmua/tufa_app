import 'package:flutter/material.dart';
import 'package:Tufa/post/post.dart';
import 'package:Tufa/my_divider.dart';

class PostWrapper extends StatefulWidget {
  @override
  _PostWrapperState createState() => _PostWrapperState();
}

class _PostWrapperState extends State<PostWrapper> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Post(),
      MyDivider(),
    ]);
  }
}
/*
ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                    height: btnSize,
                                    width: btnSize,
                                    image: AssetImage('assets/64cat.webp')))

//padding: const EdgeInsets.fromLTRB(7, 0, 3, 0),

IconButton(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          onPressed: () {},
          icon: Icon(
            MaterialIcons.expand_more,
            size: 27,
          ),
        ),
*/
