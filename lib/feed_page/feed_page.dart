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

  @override
  void initState() {
    super.initState();
    loadData() async {
      String dataURL =
          "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
      http.Response response = await http.get(dataURL);
      setState(() {
        widgets = json.decode(response.body).take(25).toList();
      });
    }

    loadData();
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
                    itemCount: widgets.length,
                    itemBuilder: (BuildContext context, int position) {
                      var postId = widgets[position];
                      var postData = post[postId];

                      String title =
                          postData == null ? "Loading" : postData["title"];
                      if (postData == null) {
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

                        loadPost(postId);
                      }

                      return Post(
                        postText: title,
                        postAutor: 'postAutor',
                        subreddit: 'feed_page',
                      );
                    })));
  }
}

HackerNewsStoryWrapper hackerNewsStoryWrapperFromJson(String str) =>
    HackerNewsStoryWrapper.fromJson(json.decode(str));

String hackerNewsStoryWrapperToJson(HackerNewsStoryWrapper data) =>
    json.encode(data.toJson());

class HackerNewsStoryWrapper {
  String by;
  int descendants;
  int id;
  List<int> kids;
  int score;
  int time;
  String title;
  String type;
  String url;

  HackerNewsStoryWrapper({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory HackerNewsStoryWrapper.fromJson(Map<String, dynamic> json) =>
      HackerNewsStoryWrapper(
        by: json["by"],
        descendants: json["descendants"],
        id: json["id"],
        kids: List<int>.from(json["kids"].map((x) => x)),
        score: json["score"],
        time: json["time"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "descendants": descendants,
        "id": id,
        "kids": List<dynamic>.from(kids.map((x) => x)),
        "score": score,
        "time": time,
        "title": title,
        "type": type,
        "url": url,
      };
}
