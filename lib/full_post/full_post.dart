import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:ui';

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
//import 'package:Tufa/colors.dart';

class FullPost extends StatefulWidget {
  createState() => FullPostState();
}

class FullPostState extends State<FullPost>
    with SingleTickerProviderStateMixin {
  String someText =
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.'
      'Over the years, Ive learned the lesson of input vs output on the interwebs. You spend days on something and it flies under the radar. You spend a few minutes making shitty  drawings on screenshots and everyone loves it xD Remember, always do art for yourself. Not others <3'
      'Managed to tie the caustics and dispersion effects into the roughness and normal inputs of my glass shader properly so imperfection maps effect it correctly. Its a subtle difference compared to the Blender original but I like it a lot I think.'
      'Got permission to post some screenshots of our company internal immediate mode UI game engine editor. So far only good experiences for both programmers and artists. Some advantages were instant onboarding of team into UI programming and 1/3 in code size compared to old Qt code.';

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

  build(context) => Center(
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            //color: Colors.red,
                            decoration: BoxDecoration(
                              //color: Theme.of(context).primaryColor,
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7.0),
                                      child: Image(
                                          height: btnSize,
                                          width: btnSize,
                                          image: AssetImage(
                                              'assets/cat200x200x30.jpg'))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: ProviderIcon(
                                    iconSize: 48,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: AutorName(
                                              autorText: 'Random autor',
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: PublicationDate(
                                            dateText: '10:38 PM 20 Mar 2020',
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: ProviderName(
                                          providerText: 'r/pytorch',
                                          textColor: borderColor,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        PostText(
                          text: someText,
                          textOverflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                              //height: 165,
                              //width: 295,
                              image: AssetImage('assets/k800x50.jpg'))),
                    ),
                    Container(
                      //width: 300,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        //color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: borderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                          //right: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            splashColor: Theme.of(context).splashColor,
                            icon: Icon(
                              AntDesign.arrowleft,
                              size: iconSize,
                              color: grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            splashColor: Theme.of(context).splashColor,
                            icon: Icon(
                              MaterialIcons.expand_more,
                              size: iconSize,
                              color: grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            splashColor: Theme.of(context).splashColor,
                            icon: Icon(
                              Feather.share_2,
                              size: iconSize,
                              color: grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            splashColor: Theme.of(context).splashColor,
                            icon: Icon(
                              AntDesign.staro,
                              size: iconSize,
                              color: grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            splashColor: Theme.of(context).splashColor,
                            icon: Icon(
                              MaterialCommunityIcons.comment_outline,
                              size: iconSize,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /*
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonContainer(
                              icon: MaterialIcons.expand_more,
                              backgroundSize: 40,
                              iconSize: 20,
                              borderWidth: 1),
                          ButtonContainer(
                              icon: Feather.share_2,
                              backgroundSize: 40,
                              iconSize: 20,
                              borderWidth: 1),
                          ButtonContainer(
                              icon: AntDesign.staro,
                              backgroundSize: 40,
                              iconSize: 20,
                              borderWidth: 1),
                          ButtonContainer(
                              icon: MaterialCommunityIcons.comment_outline,
                              backgroundSize: 40,
                              iconSize: 20,
                              borderWidth: 1),
                          ButtonContainer(
                              icon: MaterialCommunityIcons.comment_outline,
                              backgroundSize: 40,
                              iconSize: 20,
                              borderWidth: 1),
                        ],
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 13.6,
            left: 378,
            top: 0,
            bottom: 0,
            child: Container(
              color: borderColor,
              //color: Colors.red,
              width: 1,
              height: 1,
            ),
          ),
          Positioned.fill(
            right: 378,
            left: 13.5,
            top: 0,
            bottom: 0,
            child: Container(
              color: borderColor,
              //color: Colors.red,
              width: 1,
              height: 1,
            ),
          ),

          /*
          Positioned(
            child: Container(
              width: 370,
              //margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //color: Colors.red,
              decoration: BoxDecoration(
                color: backgroundColor,
                //color: Theme.of(context).primaryColor,
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                            height: btnSize,
                            width: btnSize,
                            image: AssetImage('assets/cat200x200x30.jpg'))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: ProviderIcon(
                      iconSize: 48,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 5),
                              child: AutorName()),
                          PublicationDate(standartMargin: 5)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: ProviderName()),
                    ],
                  ),
                ],
              ),
            ),
            left: 10,
            top: 5,
          ),
          */
        ]),
      );
}
