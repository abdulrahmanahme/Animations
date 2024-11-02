import 'package:animations/animations/foo_transiotion_animtion/animated_builder_screen.dart';
import 'package:animations/animations/foo_transiotion_animtion/animated_cross_fade.dart';
import 'package:animations/animated_list_screen.dart';
import 'package:animations/animations/fade_transition_screen.dart';
import 'package:animations/animations/page_animation/page_fade_transition.dart';
import 'package:animations/animations/page_animation/page_rotation_transition.dart';
import 'package:animations/animations/page_animation/page_size_transition.dart';
import 'package:animations/animations/page_animation/page_slide_transition.dart';
import 'package:animations/animations/foo_transiotion_animtion/rotation_animation_screen.dart';
import 'package:animations/animations/tween_animated_builder.dart';
import 'package:flutter/material.dart';

import 'animations/foo_transiotion_animtion/foo_transition_widget.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
   
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
            CustomAnimation(
              title: 'RotationAnimationScreen ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RotationAnimationScreen(),
                  ),
                );
              },
            ),
            CustomAnimation(
              title: 'FadeTransitionScreen ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeTransitionScreen(),
                  ),
                );
              },
            ),
            ///// Page Transition
              CustomAnimation(
              title: 'PageFadeTransition ',
              onTap: () {
                Navigator.push(
                  context,
                 PageFadeTransition(newPage:const FadeTransitionScreen())
                );
              },
            ),
            CustomAnimation(
              title: 'PageRotationTransition ',
              onTap: () {
                Navigator.push(
                  context,
                 PageRotationTransition(newPage:const FadeTransitionScreen())
                );
              },
            ),
             CustomAnimation(
              title: 'PageSlideTransition ',
              onTap: () {
                Navigator.push(
                  context,
                 PageSlideTransition(newPage:const FadeTransitionScreen())
                );
              },
            ),
            CustomAnimation(
              title: 'PageSizeTransition ',
              onTap: () {
                Navigator.push(
                  context,
                 PageSizeTransition(newPage:const FadeTransitionScreen())
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
