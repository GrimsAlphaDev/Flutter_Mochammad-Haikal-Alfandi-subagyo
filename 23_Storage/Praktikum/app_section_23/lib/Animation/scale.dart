import 'package:flutter/material.dart';

PageRouteBuilder scaleTransitionBuilder({required Widget child}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final scale = animation.drive(Tween<double>(begin: 0, end: 1));

        return ScaleTransition(scale: scale, child: child);
      });
}
