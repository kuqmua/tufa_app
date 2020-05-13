import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProviderIcon extends StatelessWidget {
  final double iconSize;
  const ProviderIcon({Key key, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      MaterialCommunityIcons.hackernews,
      size: iconSize ?? 17,
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
