import 'package:flutter/material.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({super.key});

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController _animatedContainer;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _animatedContainer =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_animatedContainer);
  }

  @override
  void dispose() {
    _animatedContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            _animatedContainer.forward();
          },
          child: AnimatedBuilder(
            animation: _animation,
            // child: , Does not rebuild the ui
            builder: (context, child) {
              return Container(
                height: 100,
                width: 100,
                color: _animation.value,
                // child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
