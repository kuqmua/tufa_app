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
  print('responseBody $responseBody');
  print('................................................end of responseBody');
  final parsedJson = json.decode(responseBody)['data']['children'];
  print('parsedJson $parsedJson /n');

  print(
      '................................................end of dataparsedJson');

  final parsedCastedJson = parsedJson.cast<Map<String, dynamic>>();
  print('parsedCastedJson $parsedCastedJson');

  print(
      '................................................end of parsedCastedJson');
  final parsedCastedMappedJson =
      parsedCastedJson.map<Posts>((json) => Posts.fromJson(json['data']));
  print('parsedCastedMappedJson ');
  print('$parsedCastedMappedJson');
  print('......................................end of parsedCastedMappedJson');
  final parsedCastedMappedListedJson = parsedCastedMappedJson.toList();
  print('parsedCastedMappedListedJson ');
  print('$parsedCastedMappedListedJson');
  print(
      '........................................end of parsedCastedMappedListedJson');
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
