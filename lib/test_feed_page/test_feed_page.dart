import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;

String url = 'https://www.reddit.com';

Future<List<Posts>> fetchPosts(http.Client client, topic) async {
  final response = await client.get("$url/r/$topic/hot.json");

  return compute(parsePosts, response.body);
}

List<Posts> parsePosts(String responseBody) {
  final parsed = json
      .decode(responseBody)['data']['children']
      .cast<Map<String, dynamic>>();

  return parsed.map<Posts>((json) => Posts.fromJson(json['data'])).toList();
}

class Posts {
  final String title;
  final String permalink;
  final String score;

  Posts({this.title, this.permalink, this.score});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        title: json['title'],
        permalink: json['permalink'],
        score: json['score'].toString());
  }
}

class PostScreen extends StatefulWidget {
  final String title;

  const PostScreen({Key key, this.title}) : super(key: key);
  @override
  PostScreenState createState() => new PostScreenState(this.title);
}

class PostScreenState extends State<PostScreen> {
  final String topic;
  PostScreenState(this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Posts>>(
          future: fetchPosts(http.Client(), topic),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(
                  //snapshot.error
                  'snapshot error');

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
          var score = posts[index].score;
          var link = posts[index].permalink;

          return InkWell(
            child: Post(
              postText: title,
              postAutor: 'sos',
            ),
          );
        });
  }
}
