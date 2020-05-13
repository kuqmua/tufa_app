import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedPage extends StatefulWidget {
  FeedPage({
    Key key,
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List widgets = [];
  Map post = Map();
  Map loadingState = Map();

  ScrollController scrollController;
  bool isVisible;
  @override
  void initState() {
    super.initState();

    loadData();

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

  Widget getRow(BuildContext context, int i) {
    var postId = widgets[i];
    var postData = post[postId];

    String title = postData == null ? "Loading" : postData["title"];
    if (postData == null) {
      loadPost(postId);
    }

    return Post(
      postText: title,
    );
  }

  loadData() async {
    String dataURL =
        "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body).take(25).toList();
    });
  }

  loadPost(int item) async {
    if (loadingState[item] == true) {
      return;
    }
    loadingState[item] = true;
    String dataURL =
        "https://hacker-news.firebaseio.com/v0/item/$item.json?print=pretty";
    http.Response response = await http.get(dataURL);
    setState(() {
      post[item] = json.decode(response.body);
    });
    loadingState[item] = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                title: Text('Tufa'),
              ),
            ),
            body: widgets == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: scrollController,
                    itemCount: widgets.length,
                    itemBuilder: (BuildContext context, int position) =>
                        getRow(context, position),
                  )));
  }
}
