import 'package:flutter/material.dart';

import '../common/rounded_corners.dart';
import 'navigation_map_control_theme.dart';

class BaseNavigationMapControl extends StatefulWidget {
  const BaseNavigationMapControl({
    required this.theme,
    required this.child,
    required this.isEnabled,
    this.roundedCorners = const RoundedCorners.all(),
    super.key,
    this.onTap,
    this.onPress,
    this.onRelease,
  });

  final bool isEnabled;
  final RoundedCorners roundedCorners;
  final NavigationMapControlTheme theme;
  final Widget child;

  final VoidCallback? onTap;
  final VoidCallback? onPress;
  final VoidCallback? onRelease;

  @override
  State<BaseNavigationMapControl> createState() =>
      _BaseNavigationMapControlState();
}

class _BaseNavigationMapControlState extends State<BaseNavigationMapControl> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        if (widget.isEnabled) {
          setState(() {
            isPressed = true;
            widget.onPress?.call();
          });
        }
      },
      onTapUp: (details) {
        setState(() {
          widget.onRelease?.call();
          isPressed = false;
        });
      },
      onLongPressUp: () {
        setState(() {
          widget.onRelease?.call();
          isPressed = false;
        });
      },
      onLongPressCancel: () {
        setState(() {
          widget.onRelease?.call();
          isPressed = false;
        });
      },
      child: Container(
        width: widget.theme.size,
        height: widget.theme.size,
        decoration: BoxDecoration(
          color: isPressed
              ? widget.theme.surfacePressedColor
              : widget.theme.surfaceColor,
          boxShadow: widget.theme.shadows,
          borderRadius: BorderRadius.only(
            topLeft: widget.roundedCorners.topLeft
                ? Radius.circular(widget.theme.borderRadius)
                : Radius.zero,
            topRight: widget.roundedCorners.topRight
                ? Radius.circular(widget.theme.borderRadius)
                : Radius.zero,
            bottomLeft: widget.roundedCorners.bottomLeft
                ? Radius.circular(widget.theme.borderRadius)
                : Radius.zero,
            bottomRight: widget.roundedCorners.bottomRight
                ? Radius.circular(widget.theme.borderRadius)
                : Radius.zero,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
