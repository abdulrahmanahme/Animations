import 'package:flutter/material.dart';

class PageSlideTransition extends PageRouteBuilder {
  final dynamic newPage;
  PageSlideTransition({this.newPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => newPage,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var positionTransition =
                Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                    .animate(animation);
            return SlideTransition(
              position: positionTransition,
              child: child,
            );
          },
        );
}
