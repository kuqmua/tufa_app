import 'package:flutter/material.dart';
import 'animated_child.dart';
import 'animated_floating_button.dart';
import 'speed_dial_child.dart';
import 'package:Tufa/colors.dart';

/// Builds the Speed Dial
class SpeedDial extends StatefulWidget {
  /// Children buttons, from the lowest to the highest.
  final List<SpeedDialChild> children;

  /// Used to get the button hidden on scroll. See examples for more info.
  final bool visible;

  /// The curve used to animate the button on scrolling.
  final Curve curve;
  final double marginRight;
  final double marginBottom;

  /// The animated icon to show as the main button child. If this is provided the [child] is ignored.
  final AnimatedIconData animatedIcon;

  /// The child of the main button, ignored if [animatedIcon] is non [null].
  final Widget child;

  /// Executed when the dial is opened.
  final VoidCallback onOpen;

  /// Executed when the dial is closed.
  final VoidCallback onClose;

  /// Executed when the dial is pressed. If given, the dial only opens on long press!
  final VoidCallback onPress;

  /// The speed of the animation
  final int animationSpeed;

  SpeedDial(
      {this.children = const [],
      this.visible = true,
      this.animatedIcon,
      this.child,
      @required this.marginBottom,
      @required this.marginRight,
      this.onOpen,
      this.onClose,
      this.curve = Curves.linear,
      this.onPress,
      this.animationSpeed = 100});

  @override
  _SpeedDialState createState() => _SpeedDialState();
}

class _SpeedDialState extends State<SpeedDial>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  bool _open = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _calculateMainControllerDuration(),
      vsync: this,
    );
  }

  Duration _calculateMainControllerDuration() => Duration(
      milliseconds: widget.animationSpeed +
          widget.children.length * (widget.animationSpeed / 5).round());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _performAnimation() {
    if (!mounted) return;
    if (_open) {
      _controller.forward();
      print("open = true");
    } else {
      _controller.reverse();
      print("open = false");
    }
  }

  @override
  void didUpdateWidget(SpeedDial oldWidget) {
    if (oldWidget.children.length != widget.children.length) {
      _controller.duration = _calculateMainControllerDuration();
    }

    super.didUpdateWidget(oldWidget);
  }

  void _toggleChildren() {
    var newValue = !_open;
    setState(() {
      _open = newValue;
    });
    if (newValue && widget.onOpen != null) widget.onOpen();
    _performAnimation();
    if (!newValue && widget.onClose != null) widget.onClose();
  }

  List<Widget> _getChildrenList() {
    final singleChildrenTween = 1.0 / widget.children.length;

    return widget.children
        .map((SpeedDialChild child) {
          int index = widget.children.indexOf(child);

          var childAnimation = Tween(begin: 0.0, end: 44.0).animate(
            CurvedAnimation(
              parent: this._controller,
              curve: Interval(0, singleChildrenTween * (index + 1)),
            ),
          );

          return AnimatedChild(
            animation: childAnimation,
            index: index,
            child: child.child,
            onTap: child.onTap,
            toggleChildren: () {
              _toggleChildren();
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          );
        })
        .toList()
        .reversed
        .toList();
  }

  Widget _renderButton() {
    var child = widget.animatedIcon != null
        ? AnimatedIcon(
            icon: widget.animatedIcon,
            progress: _controller,
            color: white,
            size: 20,
          )
        : widget.child;

    var fabChildren = _getChildrenList();

    var animatedFloatingButton = AnimatedFloatingButton(
      visible: widget.visible,
      onLongPress: _toggleChildren,
      callback:
          (_open || widget.onPress == null) ? _toggleChildren : widget.onPress,
      child: child,
      curve: widget.curve,
    );

    return Positioned(
      bottom: widget.marginBottom,
      right: widget.marginRight,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.from(fabChildren)
            ..add(
              Container(
                child: animatedFloatingButton,
              ),
            ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      _renderButton(),
    ];

    return Stack(
      alignment: Alignment.bottomRight,
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: children,
    );
  }
}
