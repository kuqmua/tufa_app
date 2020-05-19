import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;

/*
Future<List<Posts>> fetchPosts() async {
  final response =
      await http.get("https://hacker-news.firebaseio.com/v0/topstories.json");

  return compute(parsePosts, response.body);
}
*/
List<String> hackerNewsStoriesTypes = ['top', 'new', 'best'];

List<HackerNewsStoryWrapper> hackerNewsList;

Future<List<HackerNewsStoryWrapper>> fetchHackerNewsStories() async {
  final response =
      await http.get("https://hacker-news.firebaseio.com/v0/topstories.json");
  if (response.statusCode == 200) {
    final List<int> hackerNewsStoriesIdsIntList =
        parseHackerNewsStoriesIdsFromJson(response.body);
    if (hackerNewsStoriesIdsIntList.isNotEmpty) {
      print('hackerNewsStoriesIdsIntList' +
          hackerNewsStoriesIdsIntList.runtimeType.toString());
      List<int> twfive = hackerNewsStoriesIdsIntList.take(25);
      for (var item in twfive) {
        final response = await http.get(
            "https://hacker-news.firebaseio.com/v0/item/$item.json?print=pretty");
        //final responseDecoded = json.decode(response.body);
        final HackerNewsStoryWrapper hackerNewsStoryWrapper =
            hackerNewsStoryWrapperFromJson(response.body);
      }
    }
  }
}

List<int> parseHackerNewsStoriesIdsFromJson(String hackerNewsStoriesJsonIds) {
  dynamic parsed = json.decode(hackerNewsStoriesJsonIds);
  List<int> listhackerNewsStoriesOfIds = List<int>.from(parsed);
  return listhackerNewsStoriesOfIds;
}

class HackerNewsWrapper extends StatefulWidget {
  const HackerNewsWrapper({Key key}) : super(key: key);
  @override
  HackerNewsWrapperState createState() => HackerNewsWrapperState();
}

class HackerNewsWrapperState extends State<HackerNewsWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<HackerNewsStoryWrapper>>(
          future: fetchHackerNewsStories(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              print(snapshot.error.toString() + ' snapshot error');

            return snapshot.hasData
                ? HackerNewsPostsList(hackerNewsStoryWrapperList: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class HackerNewsPostsList extends StatelessWidget {
  final List<HackerNewsStoryWrapper> hackerNewsStoryWrapperList;

  const HackerNewsPostsList({Key key, this.hackerNewsStoryWrapperList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: hackerNewsStoryWrapperList.length,
        itemBuilder: (context, index) {
          var title = hackerNewsStoryWrapperList[index].title.length > 100
              ? "${hackerNewsStoryWrapperList[index].title.substring(0, 100)}..."
              : hackerNewsStoryWrapperList[index].title;

          var by = hackerNewsStoryWrapperList[index].by;
          //var subreddit = hackerNewsStoryWrapperList[index].subreddit;
          return InkWell(
            child: Post(
              postText: title,
              postAutor: by,
              subreddit: 'subreddit',
            ),
          );
        });
  }
}

// To parse this JSON data, do
//
//     final hackerNewsStoryWrapper = hackerNewsStoryWrapperFromJson(jsonString);

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
