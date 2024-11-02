import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool isSelected = false;
  void changeSelectedState() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFadeScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                changeSelectedState();
              },
              child: AnimatedCrossFade(
                firstCurve: Curves.easeIn,
                secondCurve: Curves.easeOutBack,
                firstChild: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey,
                  ),
                ),
                secondChild: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey,
                  ),
                ),
                crossFadeState: isSelected
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 1000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
