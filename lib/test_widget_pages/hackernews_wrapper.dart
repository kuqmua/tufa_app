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

Future<String> fetchHackerNewsStories(String hackerNewsStoriesType) async {
  final response =
      await http.get("https://hacker-news.firebaseio.com/v0/topstories.json");
  if (response.statusCode == 200) {
    final List<int> hackerNewsStoriesIdsIntList =
        parseHackerNewsStoriesIdsFromJson(response.body);
    if (hackerNewsStoriesIdsIntList.isNotEmpty) {
      final String hackerNewsStoryUrl =
          'https://hacker-news.firebaseio.com/v0/item/${hackerNewsStoriesIdsIntList.first.toString()}.json';
      final hackerNewsStoryResponse = await http.get(hackerNewsStoryUrl);
      if (hackerNewsStoryResponse.statusCode == 200) {
        dynamic parsed = json.decode(hackerNewsStoryResponse.body);
      }
    }
  }
}

List<int> parseHackerNewsStoriesIdsFromJson(String hackerNewsStoriesJsonIds) {
  dynamic parsed = json.decode(hackerNewsStoriesJsonIds);
  List<int> listhackerNewsStoriesOfIds = List<int>.from(parsed);
  return listhackerNewsStoriesOfIds;
}

List<Posts> parsePosts(String responseBody) {
  print('responseBody $responseBody');
  print('................................................end of responseBody');
  final parsedJson = json.decode(responseBody);
  print('parsedJson $parsedJson /n');
  print(parsedJson.length);
  print('...........................end of dataparsedJson');
  //final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/${iditem}.json';

  final parsedCastedJson = parsedJson.cast<Map<String, dynamic>>();
  print('parsedCastedJson $parsedCastedJson');
  print('...........................end of parsedCastedJson');
  final parsedCastedMappedJson =
      parsedCastedJson.map<Posts>((json) => Posts.fromJson(json['data']));
  print('parsedCastedMappedJson ');
  print('$parsedCastedMappedJson');
  print('...................end of parsedCastedMappedJson');
  final parsedCastedMappedListedJson = parsedCastedMappedJson.toList();
  print('parsedCastedMappedListedJson ');
  print('$parsedCastedMappedListedJson');
  print('..........end of parsedCastedMappedListedJson');
  return parsedCastedMappedListedJson;
}

class Posts {
  final String title;
  final String author;
  final String subreddit;
  Posts({this.title, this.author, this.subreddit});

  factory Posts.fromJson(Map<String, dynamic> json) {
    print('json[author]');
    final jsonnnn = json['author'];
    print('$jsonnnn');
    print('json[author]');
    return Posts(
        title: json['title'],
        author: json['author'],
        subreddit: json['subreddit']);
  }
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
      body: FutureBuilder<List<Posts>>(
          //future: fetchPosts(),
          builder: (context, snapshot) {
        if (snapshot.hasError)
          print(snapshot.error.toString() + ' snapshot error');

        return snapshot.hasData
            ? PostsList(posts: snapshot.data)
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class PostsList extends StatelessWidget {
  final List<Posts> posts;

  const PostsList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var title = posts[index].title.length > 100
              ? "${posts[index].title.substring(0, 100)}..."
              : posts[index].title;

          var author = posts[index].author;
          var subreddit = posts[index].subreddit;
          return InkWell(
            child: Post(
              postText: title,
              postAutor: author,
              subreddit: subreddit,
            ),
          );
        });
  }
}
