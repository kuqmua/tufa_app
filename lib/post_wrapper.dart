import 'package:Tufa/colors.dart';
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
    return Stack(children: [
      Column(children: <Widget>[
        Post(),
        MyDivider(),
      ]),
      Positioned(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 8, 0, 8),
          child: LayoutBuilder(
              builder: (context, cns) => Stack(
                    children: <Widget>[
                      Positioned.fill(
                        right: 40 / 2 - 0.9,
                        left: 40 / 2 - 0.9,
                        top: 0,
                        bottom: 3,
                        child: Container(
                          color: border,
                          width: 1,
                          height: 1,
                        ),
                      ),
                      Column(children: <Widget>[
                        Column(children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                  height: 40,
                                  width: 40,
                                  image: AssetImage('assets/64cat.webp')))
                        ]),
                      ]),
                    ],
                  )),
        ),
        left: 0,
        top: 0,
        bottom: 0,
      ),
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
