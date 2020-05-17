import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostButtonContainer extends StatelessWidget {
  final IconData icon;

  final double iconSize;
  final double borderWidth;
  final VoidCallback onTap;
  final bool bookmarked;

  const PostButtonContainer(
      {Key key,
      @required this.icon,
      @required this.iconSize,
      this.borderWidth,
      this.onTap,
      this.bookmarked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: IconButton(
          onPressed: onTap,
          splashColor: Theme.of(context).splashColor,
          icon: Icon(
            bookmarked == null
                ? icon
                : bookmarked == false ? icon : AntDesign.star,
            size: iconSize,
            color: grey,
          )),
    );
  }
}
