import 'package:flutter/material.dart';
import 'package:Tufa/autor_name.dart';
//import 'package:Tufa/horizontal_line.dart';
import 'package:Tufa/publication_date.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TopPostPart extends StatefulWidget {
  TopPostPart({Key key}) : super(key: key);

  @override
  _TopPostPartState createState() => _TopPostPartState();
}

class _TopPostPartState extends State<TopPostPart> {
  List<IconData> list = [
    Entypo.vk,
    AntDesign.youtube,
    MaterialCommunityIcons.hackernews,
    AntDesign.github,
    FontAwesome.twitch,
    MaterialCommunityIcons.alpha_h_circle,
    Feather.book,
    Entypo.medium,
    MaterialCommunityIcons.artstation,
    EvilIcons.sc_telegram,
    FontAwesome.reddit_square,
    FontAwesome.twitter_square,
    MaterialCommunityIcons.alpha_n_box
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          FontAwesome.twitch,
        ),
        AutorName(),
        PublicationDate(),
        //HorizontalLine(),
      ],
    );
  }
}
