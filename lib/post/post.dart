import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart' as shareOne;
//import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';

import 'package:Tufa/post/post_button_container.dart';
import 'package:Tufa/post/tpp.dart';
import 'package:Tufa/data_wrappers/post_text.dart';
import 'package:Tufa/post/action_button_mbsh/action_button_mbsh.dart';

class Post extends StatefulWidget {
  final String postText;
  final String postAutor;
  final String postTime;
  final String subreddit;
  final String imageLink;
  final String autorIcon;
  final bool hasImage;
  Post(
      {Key key,
      @required this.postText,
      @required this.postAutor,
      @required this.postTime,
      this.subreddit,
      this.imageLink,
      this.autorIcon,
      this.hasImage})
      : super(key: key);

  createState() => PostState();
}

class PostState extends State<Post> with SingleTickerProviderStateMixin {
  bool bookmarked = false;
  void modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return ActionButtonMbsh();
        });
  }

  void share() {
    final RenderBox box = context.findRenderObject();
    shareOne.Share.share(widget.postText,
        subject: 'youtube.com',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  void addOrRemoveFromBookmarks() {
    setState(() {
      bookmarked = !bookmarked;
    });
  }

  List<IconData> bookmarkIcons = [
    AntDesign.staro,
    AntDesign.star,
  ];
  //MaterialCommunityIcons.dots_horizontal,
  List<IconData> list = [
    MaterialIcons.expand_more,
    Feather.share_2,
    AntDesign.staro,
    AntDesign.filter,
    MaterialCommunityIcons.comment_outline,
  ];

  static const double btnSize = 40.0;
  static const double standartMargin = 5.0;

  final bool hasImage = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.00,
          0, MediaQuery.of(context).size.height * 0.005),
      child: Stack(children: <Widget>[
        Container(
          //width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.015,
              0,
              MediaQuery.of(context).size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.000, 0, 0),
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.02,
                    0,
                    MediaQuery.of(context).size.width * 0.02,
                    0),
                width: MediaQuery.of(context).size.width * 0.12,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                        image: AssetImage(
                            widget.autorIcon ?? 'assets/cat200x200x30.jpg'))),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.115,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Tpp(
                          width: MediaQuery.of(context).size.width * 0.725,
                          standartMargin: 5,
                          postAutor: widget.postAutor,
                          subreddit: widget.subreddit,
                          postTime: widget.postTime),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.006,
                        ),
                        child: PostText(
                          fontSize: 17.7,
                          text: widget.postText,
                          maxLines: hasImage ? 5 : 10,
                        ),
                      ),
                      Text(
                        'has image = ' + widget.hasImage.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lora',
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: widget.hasImage ? Colors.green : Colors.red,
                        ),
                      ),
                      if (widget.imageLink != null)
                        Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.015,
                            ),
                            width: MediaQuery.of(context).size.width * 0.725,
                            //height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                widget.imageLink,
                              ),
                              //TODO: fitted box must have height or maybe it would be a server logic
                              /*
                              child: FittedBox(
                                child: Image.network(
                                  widget.imageLink,
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                              */
                            ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.115,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Center(
              child: LayoutBuilder(
                builder: (context, cns) => Stack(
                  children: <Widget>[
                    Column(
                      children: List.generate(
                        (cns.maxHeight - 20) <
                                ((btnSize + standartMargin) * 4 + btnSize)
                            ? (cns.maxHeight - 20) <
                                    ((btnSize + standartMargin) * 3 + btnSize)
                                ? (cns.maxHeight - 20) <
                                        ((btnSize + standartMargin) * 2 +
                                            btnSize)
                                    ? (cns.maxHeight - 20) <
                                            ((btnSize + standartMargin) +
                                                btnSize)
                                        ? 1
                                        : 2
                                    : 3
                                : 4
                            : 5,
                        (i) => PostButtonContainer(
                          icon: list[i],
                          iconSize: MediaQuery.of(context).size.width * 0.05,
                          borderWidth:
                              MediaQuery.of(context).size.width * 0.115,
                          bookmarked: i == 2 ? bookmarked : null,
                          onTap: i == 0
                              ? modalBottomSheet
                              : i == 1
                                  ? share
                                  : i == 2 ? addOrRemoveFromBookmarks : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
