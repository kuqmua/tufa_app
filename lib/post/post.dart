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
  Post({Key key, @required this.postText, @required this.postAutor})
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
      padding: EdgeInsets.fromLTRB(
          0,
          MediaQuery.of(context).size.height * 0.005,
          0,
          MediaQuery.of(context).size.height * 0.005),
      child: Stack(children: <Widget>[
        Container(
          //width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.01,
              0,
              MediaQuery.of(context).size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.006, 0, 0),
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.02,
                    0,
                    MediaQuery.of(context).size.width * 0.02,
                    0),
                width: MediaQuery.of(context).size.width * 0.1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child:
                        Image(image: AssetImage('assets/cat200x200x30.jpg'))),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.14,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Tpp(
                        standartMargin: 5,
                        postAutor: widget.postAutor,
                      ),
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
                      /*
                      Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.015,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child:
                                //Image(image: AssetImage('assets/k800x50.jpg')),
                                Image.network(
                              'https://elets-adm.ru/assets/images/resources/11788/e180ba3aafa90790dc2f03fdca690a6a188aef86.jpg',
                            ),
                          )),
                          */
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
            width: MediaQuery.of(context).size.width * 0.14,
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
                          backgroundSize:
                              MediaQuery.of(context).size.width * 0.14,
                          iconSize: MediaQuery.of(context).size.width * 0.05,
                          //borderWidth: 0.75,
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
