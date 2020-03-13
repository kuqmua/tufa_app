import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:Tufa/button_container.dart';
import 'package:Tufa/top_post_part.dart';
import 'package:Tufa/vertical_line.dart';
import 'package:Tufa/post_text.dart';

class Post extends StatefulWidget {
  createState() => PostState();
}

class PostState extends State<Post> with SingleTickerProviderStateMixin {
  String someText =
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.';

  void onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container();
        });
  }

  //MaterialCommunityIcons.dots_horizontal,
  List<IconData> list = [
    MaterialIcons.expand_more,
    Feather.share_2,
    AntDesign.staro,
    MaterialCommunityIcons.comment_outline
  ];
  static const btnSize = 40.0;
  static const bottomButtonMargin = 5.0;
  static const fontSize = 16.0;
  static const iconSize = 20.0;
  final bool large = false;
  final bool hasImage = true;
  //final bool expandedNeeded;

  build(context) => Container(
        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Stack(children: [
          Positioned(
            child: LayoutBuilder(
                builder: (context, cns) => Stack(
                      children: <Widget>[
                        VerticalLine(
                          btnSize: btnSize,
                        ),
                        Column(children: <Widget>[
                          Column(
                            children: List.generate(
                                cns.maxHeight <
                                        ((btnSize + bottomButtonMargin) * 4 + 1)
                                    ? (cns.maxHeight -
                                            (btnSize + bottomButtonMargin)) ~/
                                        (btnSize + bottomButtonMargin)
                                    : 4,
                                (i) => ButtonContainer(
                                      icon: list[i],
                                      margin: EdgeInsets.fromLTRB(
                                          0, 0, 0, bottomButtonMargin),
                                      backgroundSize: btnSize,
                                      iconSize: iconSize,
                                      borderWidth: 1.5,
                                      onTap: i == 0 ? onButtonPressed : null,
                                    )),
                          ),
                        ]),
                      ],
                    )),
            right: 0,
            top: 0,
            bottom: 0,
          ),
          Padding(
            padding: EdgeInsets.only(right: btnSize + 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TopPostPart(),
                    PostText(
                      text: someText,
                      maxLines: hasImage ? 5 : 10,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage('assets/3cat.webp'))),
                ),
              ],
            ),
          )
        ]),
      );
}
