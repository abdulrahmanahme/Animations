import 'package:animations/animations/animated_builder_screen.dart';
import 'package:animations/animations/animated_cross_fade.dart';
import 'package:animations/animations/animated_list_screen.dart';
import 'package:animations/animations/tween_animated_builder.dart';
import 'package:flutter/material.dart';

import 'animations/foo_transition_widget.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAnimation(
              title: 'TweenAnimatedBuilder ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TweenAnimatedBuilderScreen(),
                  ),
                );
              },
            ),
            CustomAnimation(
              title: 'FooTransitionWidget ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FooTransitionWidgetScreen(),
                  ),
                );
              },
            ),
            CustomAnimation(
              title: 'AnimatedBuilderScreen ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedBuilderScreen(),
                  ),
                );
              },
            ),
            CustomAnimation(
              title: 'AnimatedCrossFadeScreen ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedCrossFadeScreen(),
                  ),
                );
              },
            ),
            CustomAnimation(
              title: 'AnimatedListScreen ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimatedListScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
