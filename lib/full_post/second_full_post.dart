import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart' as shareOne;
import 'dart:ui';
import 'package:permission/permission.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as esysFlutterShare;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:Tufa/button_container.dart';
import 'package:Tufa/top_post_part/tpp.dart';
import 'package:Tufa/vertical_line.dart';
import 'package:Tufa/post_text.dart';
import 'package:Tufa/modal_bottom_sheet/mbsh.dart';
//import 'package:Tufa/colors.dart';

class Post extends StatefulWidget {
  createState() => PostState();
}

class PostState extends State<Post> with SingleTickerProviderStateMixin {
  String someText =
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.';
  bool bookmarked = false;
  void modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return Mbsh();
        });
  }

  void share() {
    final RenderBox box = context.findRenderObject();
    shareOne.Share.share(someText,
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
    MaterialCommunityIcons.comment_outline,
  ];

  static const double btnSize = 40.0;
  static const double standartMargin = 5.0;
  static const double fontSize = 16.0;
  static const double iconSize = 20.0;
  final bool large = false;
  final bool hasImage = true;

  build(context) => Container(
        padding: EdgeInsets.fromLTRB(standartMargin, 0, standartMargin, 0),
        child: Stack(children: [
          Positioned(
            child: LayoutBuilder(
                builder: (context, cns) => Stack(
                      children: <Widget>[
                        VerticalLine(
                          btnSize: btnSize,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                              0, standartMargin, 0, standartMargin),
                          child: Column(children: <Widget>[
                            Column(
                              children:
                                  /*<Widget>[

                              ButtonContainer(
                                icon: list[1],
                                margin: EdgeInsets.fromLTRB(
                                    0, 0, 0, standartMargin),
                                backgroundSize: btnSize,
                                iconSize: iconSize,
                                borderWidth: 0.75,
                                onTap: share,
                              ),
                              ButtonContainer(
                                icon: list[0],
                                margin: EdgeInsets.fromLTRB(
                                    0, 0, 0, standartMargin),
                                backgroundSize: btnSize,
                                iconSize: iconSize,
                                borderWidth: 0.75,
                                onTap: modalBottomSheet,
                              ),
                            ]
                                */
                                  List.generate(
                                (cns.maxHeight - 20) <
                                        ((btnSize + standartMargin) * 3 +
                                            btnSize)
                                    ? (cns.maxHeight - 20) <
                                            ((btnSize + standartMargin) * 2 +
                                                btnSize)
                                        ? (cns.maxHeight - 20) <
                                                ((btnSize + standartMargin) +
                                                    btnSize)
                                            ? 1
                                            : 2
                                        : 3
                                    : 4,
                                (i) => ButtonContainer(
                                  icon: list[i],
                                  margin: EdgeInsets.fromLTRB(
                                      0, 0, 0, standartMargin),
                                  backgroundSize: btnSize,
                                  iconSize: iconSize,
                                  borderWidth: 0.75,
                                  bookmarked: i == 2 ? bookmarked : null,
                                  onTap: i == 0
                                      ? modalBottomSheet
                                      : i == 1
                                          ? share
                                          : i == 2
                                              ? addOrRemoveFromBookmarks
                                              : null,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    )),
            right: 0,
            top: 0,
            bottom: 0,
          ),
          Positioned(
            child: LayoutBuilder(
                builder: (context, cns) => Stack(
                      children: <Widget>[
                        VerticalLine(
                          btnSize: btnSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: standartMargin),
                          child: Column(children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                    height: btnSize,
                                    width: btnSize,
                                    image:
                                        AssetImage('assets/cat200x200x30.jpg')))
                          ]),
                        ),
                      ],
                    )),
            left: 0,
            top: 0,
            bottom: 0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                btnSize + standartMargin,
                standartMargin - 1,
                btnSize + standartMargin,
                standartMargin * 2),
            //margin: EdgeInsets.fromLTRB(0, , 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Tpp(
                      standartMargin: standartMargin,
                    ),
                    PostText(
                      fontSize: 16,
                      text: someText,
                      maxLines: hasImage ? 5 : 10,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, standartMargin, 0, 0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                          //height: 165,
                          //width: 295,
                          image: AssetImage('assets/k800x50.jpg'))),
                ),
              ],
            ),
          )
        ]),
      );
}
