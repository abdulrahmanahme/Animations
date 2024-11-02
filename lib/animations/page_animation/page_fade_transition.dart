import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder {
  final dynamic newPage;
  PageFadeTransition({this.newPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => newPage,
          transitionDuration: const Duration(seconds: 5),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
           
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
