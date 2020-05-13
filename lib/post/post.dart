import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart' as shareOne;
import 'dart:ui';

import 'package:Tufa/post/post_button_container.dart';
import 'package:Tufa/post/tpp.dart';
import 'package:Tufa/data_wrappers/post_text.dart';
import 'package:Tufa/post/action_button_mbsh/action_button_mbsh.dart';

class Post extends StatefulWidget {
  final String postText;
  Post({Key key, @required this.postText}) : super(key: key);

  createState() => PostState();
}

class PostState extends State<Post> with SingleTickerProviderStateMixin {
  /*
  String someText =
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.'
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.';
      */
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
  static const double fontSize = 16.0;
  static const double iconSize = 20.0;

  final bool large = false;
  final bool hasImage = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.97,
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.01,
              MediaQuery.of(context).size.width * 0.1,
              MediaQuery.of(context).size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.003),
                width: MediaQuery.of(context).size.width * 0.1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child:
                        Image(image: AssetImage('assets/cat200x200x30.jpg'))),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.015,
                    0,
                    MediaQuery.of(context).size.width * 0.015,
                    0),
                width: MediaQuery.of(context).size.width * 0.77,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Tpp(
                      standartMargin: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.005,
                      ),
                      child: PostText(
                        fontSize: 17,
                        text: widget.postText,
                        maxLines: hasImage ? 5 : 10,
                      ),
                    ),
                    /*
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child:
                              Image(image: AssetImage('assets/k800x50.jpg'))),
                    ),
                    */
                  ],
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
            width: MediaQuery.of(context).size.width * 0.1,
            child: LayoutBuilder(
              builder: (context, cns) => Stack(
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
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
                                MediaQuery.of(context).size.width * 0.1,
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
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
