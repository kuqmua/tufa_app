import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;

String url = 'https://www.reddit.com';

Future<List<RedditPost>> fetchPosts(http.Client client, topic) async {
  final response = await client.get("$url/r/$topic/hot.json");
  if (response.statusCode == 200) {
    return parsePosts(response.body);
  } else {
    print('response.statusCode == 200 is false');
    return null;
  }
}

List<RedditPost> parsePosts(String responseBody) {
  final parsedJson = json.decode(responseBody)['data']['children'];

  final parsedCastedJson = parsedJson.cast<Map<String, dynamic>>();

  final parsedCastedMappedJson = parsedCastedJson
      .map<RedditPost>((json) => RedditPost.fromJson(json['data']));

  final parsedCastedMappedListedJson = parsedCastedMappedJson.toList();

  return parsedCastedMappedListedJson;
}

class RedditWrapper extends StatefulWidget {
  final String title;

  const RedditWrapper({Key key, this.title}) : super(key: key);
  @override
  RedditWrapperState createState() => new RedditWrapperState(this.title);
}

class RedditWrapperState extends State<RedditWrapper> {
  final String topic;
  RedditWrapperState(this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<RedditPost>>(
          future: fetchPosts(http.Client(), topic),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              print(snapshot.error.toString() + 'snapshot error');

            return snapshot.hasData
                ? RedditPostsListView(redditPostsList: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class RedditPostsListView extends StatelessWidget {
  final List<RedditPost> redditPostsList;

  const RedditPostsListView({Key key, this.redditPostsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: redditPostsList.length,
        itemBuilder: (context, position) {
          var title = redditPostsList[position].title.length > 100
              ? "${redditPostsList[position].title.substring(0, 100)}..."
              : redditPostsList[position].title;

          var author = redditPostsList[position].author;
          var subreddit = redditPostsList[position].subreddit;
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

class RedditPost {
  final String title;
  final String author;
  final String subreddit;
  RedditPost({this.title, this.author, this.subreddit});

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    print('json[author]');
    final jsonnnn = json['author'];
    print('$jsonnnn');
    print('json[author]');
    return RedditPost(
        title: json['title'],
        author: json['author'],
        subreddit: json['subreddit']);
  }
}
