import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final double backgroundSize;
  final double iconSize;
  final double borderWidth;

  const ButtonContainer(
      {Key key,
      @required this.icon,
      @required this.margin,
      @required this.backgroundSize,
      @required this.iconSize,
      @required this.borderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
