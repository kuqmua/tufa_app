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
  List hackerNewsStoryWrappers = [];
  Map post = Map();
  Map loadingState = Map();

  @override
  void initState() {
    super.initState();
    loadData() async {
      String dataURL =
          "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
      http.Response response = await http.get(dataURL);
      setState(() {
        hackerNewsStoryWrappers = json.decode(response.body).take(25).toList();
      });
    }

    loadData();
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
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                title: Text('Tufa'),
              ),
            ),
            body: hackerNewsStoryWrappers == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: hackerNewsStoryWrappers.length,
                    itemBuilder: (BuildContext context, int position) {
                      var postId = hackerNewsStoryWrappers[position];
                      var postData = post[postId];

                      String title =
                          postData == null ? "Loading" : postData["title"];
                      if (postData == null) {
                        loadPost(postId);
                      }

                      return Post(
                        postText: title,
                        postAutor: 'postAutor',
                        subreddit: 'feed_page',
                        autorIcon: 'assets/hackernews_icon.jpg',
                      );
                    })));
  }
}
