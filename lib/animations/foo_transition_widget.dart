import 'package:flutter/material.dart';

class FooTransitionWidgetScreen extends StatefulWidget {
  const FooTransitionWidgetScreen({super.key});

  @override
  State<FooTransitionWidgetScreen> createState() =>
      FooTransitionWidgetScreenState();
}

class FooTransitionWidgetScreenState extends State<FooTransitionWidgetScreen>
    with TickerProviderStateMixin {
  late Animation<AlignmentGeometry> greenAnimation;
  late Animation<AlignmentGeometry> yellowAnimation;
  late AnimationController animationControllerGreen;
  late AnimationController animationControllerYellow;

  @override
  void initState() {
    super.initState();
    animationControllerGreen = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      reverseDuration: const Duration(seconds: 3),
    );
    animationControllerYellow = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    greenAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(animationControllerGreen);

    yellowAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(
      CurvedAnimation(
        parent: animationControllerYellow,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    )..addListener(() {
        if (animationControllerYellow.value >= 0.5) {
          animationControllerGreen.forward();
        }
      });
    // ..addStatusListener((status) {
    //     // if (status == AnimationStatus.completed) {
    //     //   animationControllerGreen.forward();
    //     // } else if (status == AnimationStatus.dismissed) {
    //     //   animationControllerGreen.reverse();
    //     // }
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  AlignTransition(
                    alignment: greenAnimation,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  AlignTransition(
                    alignment: yellowAnimation,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    animationControllerYellow.forward();
                    // animationControllerGreen.forward();
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationControllerYellow.stop();
                    animationControllerGreen.stop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationControllerYellow.repeat(reverse: true);
                    // animationControllerGreen.repeat(reverse: true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Reverse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
