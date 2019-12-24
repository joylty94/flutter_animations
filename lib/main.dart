import 'package:flutter/material.dart';
import './pages/animationOffset.dart';
import './pages/animationStack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AnimationStack(),
    );
  }
}

