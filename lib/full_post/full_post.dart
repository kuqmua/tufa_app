import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart' as shareOne;
import 'dart:ui';
/*
import 'package:permission/permission.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as esysFlutterShare;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
*/
import 'package:Tufa/button_container.dart';
import 'package:Tufa/top_post_part/tpp.dart';
import 'package:Tufa/vertical_line.dart';
import 'package:Tufa/post_text.dart';
import 'package:Tufa/modal_bottom_sheet/mbsh.dart';

import 'package:Tufa/top_post_part/autor_name.dart';
import 'package:Tufa/top_post_part/publication_date.dart';
import 'package:Tufa/top_post_part/provider_icon.dart';
import 'package:Tufa/top_post_part/provider_name.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post_bottom_bar/full_post_bottom_bar.dart';

class FullPost extends StatefulWidget {
  createState() => FullPostState();
}

class FullPostState extends State<FullPost>
    with SingleTickerProviderStateMixin {
  String someText =
      'Got permission to FullPost some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
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

  static const double btnSize = 20.0;
  static const double standartMargin = 5.0;
  static const double fontSize = 16.0;
  static const double iconSize = 20.0;
  final bool large = false;
  final bool hasImage = true;

  build(context) => Scaffold(
        bottomNavigationBar: FullPostBottomBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                btnSize, standartMargin - 1, btnSize, standartMargin * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        //padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        //color: Colors.red,

                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: Image(
                                      height: 60,
                                      width: 60,
                                      image: AssetImage(
                                          'assets/cat200x200x30.jpg'))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: AutorName(
                                          autorText: 'Random autor',
                                          fontSize: 20,
                                          textColor: white,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: ProviderName(
                                          providerText: 'from Reddit r/pytorch',
                                          fontSize: 15,
                                          textColor: grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: PostText(
                        text: someText,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, standartMargin, 0, 0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/k800x50.jpg'))),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: PublicationDate(
                      dateText: '10:38pm 20.02.2020',
                      fontSize: 13,
                      textColor: grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

/*
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
  */
