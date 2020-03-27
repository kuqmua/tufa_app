import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:ui';

import 'package:Tufa/button_container.dart';
import 'package:Tufa/top_post_part/tpp.dart';
import 'package:Tufa/vertical_line.dart';
import 'package:Tufa/post_text.dart';
import 'package:Tufa/modal_bottom_sheet/mbsh.dart';
//import 'package:Tufa/colors.dart';

class FullPost extends StatefulWidget {
  createState() => FullPostState();
}

class FullPostState extends State<FullPost>
    with SingleTickerProviderStateMixin {
  String someText =
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.';

  //MaterialCommunityIcons.dots_horizontal,
  List<IconData> list = [
    MaterialIcons.expand_more,
    Feather.share_2,
    AntDesign.staro,
    MaterialCommunityIcons.comment_outline
  ];
//Radius.circular(15)
//Theme.of(context).primaryColor
  void onButtonPressed() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return Mbsh();
        });
  }

  static const double btnSize = 40.0;
  static const double standartMargin = 5.0;
  static const double fontSize = 16.0;
  static const double iconSize = 20.0;
  final bool large = false;
  final bool hasImage = true;

  build(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                            height: btnSize,
                            width: btnSize,
                            image: AssetImage('assets/cat200x200x30.jpg'))),
                    Text(
                      ",kf блаа sd",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Tpp(
                  standartMargin: standartMargin,
                ),
                PostText(
                  text: someText,
                  textOverflow: TextOverflow.clip,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  ButtonContainer(
                      icon: Feather.share_2,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      backgroundSize: 40,
                      iconSize: 20,
                      borderWidth: 1),
                  ButtonContainer(
                      icon: Feather.share_2,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      backgroundSize: 40,
                      iconSize: 20,
                      borderWidth: 1),
                  ButtonContainer(
                      icon: Feather.share_2,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      backgroundSize: 40,
                      iconSize: 20,
                      borderWidth: 1),
                ],
              ),
            ),
          ],
        ),
      );
}
