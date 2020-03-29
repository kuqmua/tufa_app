import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final double backgroundSize;
  final double iconSize;
  final double borderWidth;
  final VoidCallback onTap;
  final bool bookmarked;

  const ButtonContainer(
      {Key key,
      @required this.icon,
      this.margin,
      @required this.backgroundSize,
      @required this.iconSize,
      @required this.borderWidth,
      this.onTap,
      this.bookmarked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backgroundSize,
      height: backgroundSize,
      margin: margin ?? null,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: IconButton(
        onPressed: onTap,
        splashColor: Theme.of(context).splashColor,
        icon: Icon(
          bookmarked == null
              ? icon
              : bookmarked == false ? icon : AntDesign.star,
          size: iconSize,
          color: grey,
        ),
      ),
    );
  }
}

/*
Container(
      width: backgroundSize,
      height: backgroundSize,
      margin: margin,
      decoration: BoxDecoration(
        //color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      )

*/
