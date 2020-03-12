import 'package:flutter/material.dart';
import 'package:Tufa/speed_dial/speed_dial.dart';
import 'package:Tufa/speed_dial/speed_dial_child.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/post_wrapper.dart';
import 'package:flutter/rendering.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  bool isLoading = false;

  ScrollController scrollController;
  bool dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  Widget buildBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: 5,
      itemBuilder: (ctx, i) => PostWrapper(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          visible: dialVisible,
          //curve: Curves.bounceIn,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          children: [
            SpeedDialChild(
                child: Icon(
                  AntDesign.setting,
                  size: 20,
                ),
                backgroundColor: blue,
                onTap: () => print('FIRST CHILD')),
            SpeedDialChild(
              child: Icon(
                SimpleLineIcons.logout,
                size: 20,
              ),
              backgroundColor: blue,
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: Icon(
                AntDesign.search1,
                size: 20,
              ),
              backgroundColor: blue,
              onTap: () => print('THIRD CHILD'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 13, 0),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildBody(),
        ));
  }
}
