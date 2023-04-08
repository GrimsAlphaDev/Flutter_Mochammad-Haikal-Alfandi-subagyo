import 'package:flutter/material.dart';

PageRouteBuilder fadeTransitionBuilder({required Widget child}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final _opacity = animation.drive(Tween<double>(begin: 0, end: 1));

        return FadeTransition(opacity: _opacity, child: child);
      });
}