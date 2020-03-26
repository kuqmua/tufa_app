import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProviderIcon extends StatelessWidget {
  const ProviderIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesome.reddit_square,
      size: 17,
    );
  }
}
/*
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

*/
