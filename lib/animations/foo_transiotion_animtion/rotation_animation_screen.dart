import 'package:flutter/material.dart';

class RotationAnimationScreen extends StatefulWidget {
  const RotationAnimationScreen({super.key});

  @override
  State<RotationAnimationScreen> createState() =>
      _RotationAnimationScreenState();
}

class _RotationAnimationScreenState extends State<RotationAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    
        ///value of animation is between 0 and 1

    _animation = Tween<double>(begin: 0, end: .25).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void onPressOnTextRotation() {
    // if (_animationController.status == AnimationStatus.completed) {
    //   _animationController.repeat();
    // } else {
    //   _animationController.forward();
    // }
      _animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: InkWell(
            onTap: onPressOnTextRotation,
            child: const Text(
              'Hello',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
