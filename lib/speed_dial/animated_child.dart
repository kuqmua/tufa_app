import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class AnimatedChild extends AnimatedWidget {
  final int index;
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback toggleChildren;
  final ShapeBorder shape;
  final String heroTag;

  AnimatedChild({
    Key key,
    Animation<double> animation,
    this.index,
    this.child,
    this.onTap,
    this.toggleChildren,
    this.shape,
    this.heroTag,
  }) : super(key: key, listenable: animation);

  void _performAction() {
    if (onTap != null) onTap();
    toggleChildren();
  }

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    final Widget buttonChild = animation.value > 43.0
        ? Container(
            width: animation.value,
            height: animation.value,
            child: child ?? Container(),
          )
        : Container(
            width: 0.0,
            height: 0.0,
          );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 44.0,
            height: animation.value,
            margin: EdgeInsets.only(bottom: 5.0),
            child: Container(
              height: 44.0,
              width: animation.value,
              child: FloatingActionButton(
                onPressed: _performAction,
                backgroundColor: blue,
                foregroundColor: white,
                child: buttonChild,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
