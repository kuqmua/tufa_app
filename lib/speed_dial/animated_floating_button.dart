import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class AnimatedFloatingButton extends StatelessWidget {
  final bool visible;
  final VoidCallback callback;
  final VoidCallback onLongPress;
  final Widget child;

  AnimatedFloatingButton({
    this.visible = true,
    this.callback,
    this.child,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      child: AnimatedContainer(
        curve: Curves.linear,
        margin: EdgeInsets.all(visible ? 0.0 : 22.0),
        duration: Duration(milliseconds: 150),
        width: visible ? 44.0 : 0.0,
        height: visible ? 44.0 : 0.0,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: FloatingActionButton(
            child: visible ? child : null,
            backgroundColor: blue,
            foregroundColor: white,
            onPressed: callback,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
