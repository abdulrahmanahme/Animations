import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  double height = 100;
  double width = 100;
  Color color = Colors.green;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceInOut),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print('Status of animation controller  $status');
      });
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Animated controller  value  ${animationController.value.toStringAsFixed(2)}',
            ),
            Container(
              height: 100,
              width: 100,
              color: animation.value,
            ),

            ///Animated padding
            AnimatedPadding(
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(5),
              duration: Duration(seconds: 2),
              child: Text(
                'Animated value ${animation.value}',
                style: TextStyle(
                  color: animation.value,
                  fontSize: 20,
                ),
              ),
            ),

            ///////////TweenAnimationBuilder 
           

            ///Animated Container
            AnimatedContainer(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 2),
              height: height,
              width: width,
              color: color,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              animationController.forward();
              height = Random().nextDouble() * 200;
              width = Random().nextDouble() * 200;
              color = Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255));
            },
            icon: const Icon(
              Icons.play_arrow,
              size: 50,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () {
              animationController.reverse();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
