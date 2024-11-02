import 'package:flutter/material.dart';

class PageRotationTransition extends PageRouteBuilder {
  final dynamic newPage;
  PageRotationTransition({this.newPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => newPage,
          transitionDuration: const Duration(seconds: 1),
          
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
             var _animation =
                Tween<double>(begin: 0, end: 2).animate(animation);
            return RotationTransition(
              turns: _animation,
              child: child,
            );
          },
        );
}
