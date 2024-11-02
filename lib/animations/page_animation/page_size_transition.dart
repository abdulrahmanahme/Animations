import 'package:flutter/material.dart';

class PageSizeTransition extends PageRouteBuilder {
  final dynamic newPage;
  PageSizeTransition({this.newPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => newPage,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              alignment: Alignment.centerLeft,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );
}
