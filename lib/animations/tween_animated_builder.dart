import 'package:flutter/material.dart';

class TweenAnimatedBuilderScreen extends StatelessWidget {
  const TweenAnimatedBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: 100),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
