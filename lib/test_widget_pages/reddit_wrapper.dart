import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:Tufa/post/post.dart';
import 'package:http/http.dart' as http;

String url = 'https://www.reddit.com';

Future<List<RedditPost>> fetchPosts(topic) async {
  final response = await http.get("$url/r/$topic/hot.json");
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
                      var imageLink = snapshot.data[position].thumbnail;

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

                      //print(snapshot.data[position].preview.listWithOneChildAsImage);

                      //var sourceUrl = snapshot.data[position].preview.listWithOneChildAsImage[0].source.url; //parse this
                      var preview = snapshot.data[position].preview;
                      String sourceUrl;
                      String endUrl;
                      print(preview);
                      if (preview == null) {
                        imageLink = null;
                        print('null in if');
                      } else {
                        print('sourceUr else');
                        sourceUrl = snapshot.data[position].preview
                            .listWithOneChildAsImage[0].source.url;
                        print(sourceUrl + 'in else');
                        if (sourceUrl.startsWith('https://preview.redd.it/')) {
                          print('sourceUrl After todo ' + sourceUrl);
                          int dsdvsdv = sourceUrl.indexOf('?', 0);
                          print('dsdvsdv ' + dsdvsdv.toString());
                          String cropstrt = sourceUrl.substring(24, dsdvsdv);
                          endUrl = 'https://i.redd.it/' + cropstrt;
                          print(cropstrt);
                        } else if (sourceUrl
                            .startsWith('https://external-preview.redd.it/')) {
                          sourceUrl = null;
                        }
                      }

                      //String externalStartLink = 'https://external-preview';
                      //TODO: FIND OUT WHAT HAPPENS IN CHROMIUM THEN YOU USE COPY IMAGE ADRESS IN REDDIT

                      /*
                      parse images.source and images.resolutions
                      if images.url begin with https://external-preview then use
                      var url = snapshot.data[position].url;
                      else if images.url begin with https://preview then 
                      check each images.source and images.resolution and find something near 780 х 440
                      choose one in images.source then use 
                      images.source.width or
                      images.resolution.width 
                      and put it in 
                      https://preview.redd.it/c968f3gdq3051.jpg?width=640&crop=smart&auto=webp&s=480538a72a28db4db6188f7301e6b3de06a37719
                      as
                      https://preview.redd.it/c968f3gdq3051.jpg?width=!!!!!!!!!HERE!!!!!!&crop=smart&auto=webp&s=480538a72a28db4db6188f7301e6b3de06a37719
                      from
                      https://preview.redd.it/c968f3gdq3051.jpg?auto=webp&amp;s=37f3f5ec9d1f6f2a4db64a8f250563c4dd129705
                      so
                      https://preview.redd.it/c968f3gdq3051.jpg? + width= + images.source.width + &crop=smart& + 
                      auto=webp& + s=480538a72a28db4db6188f7301e6b3de06a37719
                      which mean
                      find .jpg? or .png? or maybe .webp?
                      put after
                      width=
                      put after
                      images.source.width
                      put after
                      &crop=smart&
                      find and remove
                      ;
                      
                      */
                      return InkWell(
                        child: Post(
                          postText: title,
                          postAutor: author,
                          subreddit: subreddit,
                          imageLink: endUrl,
                          /*
                          imageLink:
                              'https://external-preview.redd.it/5Y1vwneat7sH5v3UcUTY7E2tpi4lYgJYSLgCO9eQJFo.jpg?width=640&crop=smart&auto=webp&s=9b3f662a2040125348f9faf032a5598b64986227',
                              */
                          autorIcon: 'assets/reddit_full_icon.jpg',
                        ),
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
  RedditPost(
      {this.title,
      this.author,
      this.subreddit,
      this.thumbnail,
      this.preview,
      this.url});

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    return RedditPost(
      title: json['title'],
      author: json['author'],
      subreddit: json['subreddit'],
      thumbnail: json['thumbnail'],
      url: json['url'] == null ? null : json['url'],
      preview:
          json["preview"] == null ? null : Preview.fromJson(json["preview"]),
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
