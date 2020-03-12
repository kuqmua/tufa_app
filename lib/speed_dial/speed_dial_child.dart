import 'package:flutter/material.dart';

/// Provides data for a speed dial child
class SpeedDialChild {
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;

  SpeedDialChild({
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
  });
}
