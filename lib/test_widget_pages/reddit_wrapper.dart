import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;

Future<List<RedditPost>> fetchPosts(topic) async {
  final response = await http.get("https://www.reddit.com/r/$topic/hot.json");
  if (response.statusCode == 200) {
    return parsePosts(response.body);
  } else {
    print('response.statusCode == 200 is false');
    return null;
  }
}

List<RedditPost> parsePosts(String responseBody) {
  final parsedJson = json.decode(responseBody)['data']['children'];
  print(parsedJson);
  final parsedCastedJson = parsedJson.cast<Map<String, dynamic>>();

  final parsedCastedMappedJson = parsedCastedJson
      .map<RedditPost>((post) => RedditPost.fromJson(post['data']));

  final parsedCastedMappedListedJson = parsedCastedMappedJson.toList();

  return parsedCastedMappedListedJson;
}

class RedditWrapper extends StatefulWidget {
  final String topic;

  const RedditWrapper({Key key, this.topic}) : super(key: key);
  @override
  RedditWrapperState createState() => new RedditWrapperState(this.topic);
}

class RedditWrapperState extends State<RedditWrapper> {
  final String topic;
  RedditWrapperState(this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Tufa'),
        ),
      ),
      body: FutureBuilder<List<RedditPost>>(
          future: fetchPosts(topic),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              print(snapshot.error.toString() + 'snapshot error');

            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) {
                      var title = snapshot.data[position].title.length > 100
                          ? "${snapshot.data[position].title.substring(0, 100)}..."
                          : snapshot.data[position].title;

                      var author = snapshot.data[position].author;
                      var subreddit = snapshot.data[position].subreddit;
                      double createdUtc = snapshot.data[position].createdUtc;

                      DateTime date = new DateTime.fromMillisecondsSinceEpoch(
                          createdUtc.round() * 1000,
                          isUtc: false);

                      //var imageLink = snapshot.data[position].thumbnail;

                      /*
                      var resolutions = imageinnerwrapper.resolutions;
                      var sourceWidth = source.width; //one of width
                      const int uiImageResolutionWidth =
                          790; //TODO: THAT WAS CONST
                      List<int> resolutionswidth = List<int>();
                      resolutions.forEach((source) {
                        resolutionswidth.add(source.width);
                      });
                      int lowerWidth = 0;
                      int highierWidth = 0;
                      resolutions.forEach((resolution) {
                        if (resolution.width > 0) {
                          if (resolution.width > lowerWidth) {
                            if (resolution.width < uiImageResolutionWidth) {
                              lowerWidth = resolution.width;
                            } else if (resolution.width ==
                                uiImageResolutionWidth) {
                              lowerWidth = resolution.width;
                            } else if (resolution.width < highierWidth) {
                              highierWidth = resolution.width;
                            }
                          }
                        }
                      });
                      //TODO: write some resolution logic - which lower or higher to choose

                      int endWidth = lowerWidth > 0 ? lowerWidth : highierWidth;

                      int endEndWidth = sourceWidth > endWidth
                          ? sourceWidth > uiImageResolutionWidth
                              ? endWidth
                              : sourceWidth
                          : endWidth;
                          */

                      String nonWorkingJsonPostImageUrl;
                      String workingJsonPostImageUrl;

                      if (snapshot.data[position].preview == null) {
                        print('preview == null');
                      } else {
                        print('nonWorkingJsonPostImageUrl else');
                        nonWorkingJsonPostImageUrl = snapshot.data[position]
                            .preview.listWithOneChildAsImage[0].source.url;
                        print(nonWorkingJsonPostImageUrl + ' in else');
                        if (nonWorkingJsonPostImageUrl
                            .startsWith('https://preview.redd.it/')) {
                          print(
                              'nonWorkingJsonPostImageUrl  startsWith(https://preview.redd.it/) ' +
                                  nonWorkingJsonPostImageUrl);

                          workingJsonPostImageUrl = 'https://i.redd.it/' +
                              nonWorkingJsonPostImageUrl.substring(24, 41);
                        } else if (nonWorkingJsonPostImageUrl
                            .startsWith('https://external-preview.redd.it/')) {
                          if (snapshot.data[position].url != null) {
                            if (snapshot.data[position].url.contains('.jpg') ||
                                snapshot.data[position].url.contains('.png') ||
                                snapshot.data[position].url.contains('.webp')) {
                              print('external_link');
                              workingJsonPostImageUrl =
                                  snapshot.data[position].url;

                              print('succes external_link url');
                            }
                          }
                        }
                      }
                      print(workingJsonPostImageUrl);
                      print(date);
                      var some = date.toString().substring(10, 16);
                      print(some);
                      //String externalStartLink = 'https://external-preview';
                      //TODO: FIND OUT WHAT HAPPENS IN CHROMIUM THEN YOU USE COPY IMAGE ADRESS IN REDDIT
                      return InkWell(
                        child: Post(
                            postText: title,
                            postAutor: author,
                            subreddit: subreddit,
                            imageLink: workingJsonPostImageUrl,
                            autorIcon: 'assets/reddit_full_icon.jpg',
                            postTime: some ?? 'unknown'),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class RedditPost {
  final String title;
  final String author;
  final String subreddit;
  final String thumbnail;
  final Preview preview;
  final String url;
  final double createdUtc;
  RedditPost(
      {this.title,
      this.author,
      this.subreddit,
      this.thumbnail,
      this.preview,
      this.url,
      this.createdUtc});

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    return RedditPost(
      title: json['title'],
      author: json['author'],
      subreddit: json['subreddit'],
      thumbnail: json['thumbnail'],
      url: json['url'] == null ? null : json['url'],
      preview:
          json["preview"] == null ? null : Preview.fromJson(json["preview"]),
      createdUtc: json['created_utc'],
    );
  }
}

class Preview {
  List<Image> listWithOneChildAsImage;

  Preview({
    this.listWithOneChildAsImage,
  });

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        listWithOneChildAsImage:
            List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images":
            List<dynamic>.from(listWithOneChildAsImage.map((x) => x.toJson())),
      };
}

class Image {
  Source source;
  List<Source> resolutions;

  Image({
    this.source,
    this.resolutions,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        source: Source.fromJson(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
      };
}

class Source {
  String url;
  int width;
  int height;

  Source({
    this.url,
    this.width,
    this.height,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
