import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostButtonContainer extends StatelessWidget {
  final IconData icon;

  final double backgroundSize;
  final double iconSize;
  final double borderWidth;
  final VoidCallback onTap;
  final bool bookmarked;

  const PostButtonContainer(
      {Key key,
      @required this.icon,
      @required this.backgroundSize,
      @required this.iconSize,
      this.borderWidth,
      this.onTap,
      this.bookmarked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Container(
        //margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        //height: backgroundSize,
        //width: backgroundSize,
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
      ),
    );
  }
}
