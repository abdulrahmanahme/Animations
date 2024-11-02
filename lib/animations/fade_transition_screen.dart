import 'package:flutter/material.dart';

class FadeTransitionScreen extends StatefulWidget {
  const FadeTransitionScreen({super.key});

  @override
  State<FadeTransitionScreen> createState() => _RotationAnimationScreenState();
}

class _RotationAnimationScreenState extends State<FadeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animation = Tween<double>(begin: 0, end: .6).animate(_animationController);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressOnTextRotation,
            child: const Text(
              'Fade me Now!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: FadeTransition(
                opacity: _animation,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: const Text(
                    'Fade me Now!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
