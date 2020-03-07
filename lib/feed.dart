import 'package:flutter/material.dart';
import 'package:Tufa/my_list_view.dart';
import 'package:Tufa/pseudo_floating_action_button.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 13, 0),
        child: Stack(
          children: <Widget>[
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : MyListView(),
            PseudoFloatingActionButton()
          ],
        ),
      );
    }));
  }
}
