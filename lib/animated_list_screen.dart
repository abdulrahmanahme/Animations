import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  var globalKey = GlobalKey<AnimatedListState>();
  List<String> list = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedListScreen'),
      ),
      body: AnimatedList(
          // key: globalKey,
          initialItemCount: list.length,
          itemBuilder: (context, int index, animation) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  ' index $index',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: IconButton(
          onPressed: () {
            setState(() {
              list.insert(0, 'Hello 1');
              // globalKey.currentState?.insertItem(0);
            });
          },
          icon: const Icon(
            Icons.add,
            size: 50,
            color: Colors.black,
          )),
    );
  }
}
