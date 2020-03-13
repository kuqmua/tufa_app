import 'dart:ui';
import 'package:Tufa/colors.dart';
import 'package:flutter/material.dart';

class BackgroundOverlay extends AnimatedWidget {
  final Color color;
  final double opacity;

  BackgroundOverlay({
    Key key,
    Animation<double> animation,
    this.color = Colors.black,
    this.opacity = 0.5,
  }) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    return Container(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: backgroundColor.withOpacity(0.5))),
    ));
  }
}

/*
return Container(
      color: color.withOpacity(animation.value * opacity),
    );
*/
