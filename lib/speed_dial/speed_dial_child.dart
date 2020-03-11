import 'package:flutter/material.dart';

/// Provides data for a speed dial child
class SpeedDialChild {
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;
  final ShapeBorder shape;

  SpeedDialChild(
      {this.child,
      this.backgroundColor,
      this.foregroundColor,
      this.onTap,
      this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      )});
}
