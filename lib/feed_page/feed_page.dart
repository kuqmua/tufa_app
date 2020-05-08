//import 'package:Tufa/bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Tufa/post/post.dart';

class FeedPage extends StatefulWidget {
  FeedPage({
    Key key,
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isLoading = false;

  ScrollController scrollController;
  bool isVisible;
  @override
  void initState() {
    super.initState();
    isVisible = true;
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isVisible = false;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          //bottomNavigationBar: BottomBar(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              title: Text('Random title'),
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.015,
                    0,
                    MediaQuery.of(context).size.width * 0.015,
                    0,
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 5,
                    itemBuilder: (ctx, i) => Post(),
                  ))),
    );
  }
}
