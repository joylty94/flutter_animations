import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class AnimatorTest extends StatefulWidget {
  AnimatorTest({Key key}) : super(key: key);

  @override
  _AnimatorTestState createState() => _AnimatorTestState();
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

class _AnimatorTestState extends State<AnimatorTest> {
  List<String> test = ['1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: mapIndexed(test, (index, value) => 
            Animator(
              tweenMap: {
                "scaleAnim": Tween<double>(begin: 0, end: 300),
                "translateAnim": Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 4)),
              },
              cycles: 1,
              duration: Duration(seconds: 5 - index),
              builderMap: (anim) => FractionalTranslation(
                translation: anim["translateAnim"].value,
                child: Container(
                  width: 200,
                  height: 100,
                  margin: EdgeInsets.only(left: 0.0 + 20 * index ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.blue
                  ),
                  child: Text('data'),
                )
              )
            )
          ).toList()
        ),
      ),
    );
  }
}