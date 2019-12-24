import 'package:flutter/material.dart';
class AnimationStack extends StatefulWidget {
  AnimationStack({Key key}) : super(key: key);

  @override
  _AnimationStackState createState() => _AnimationStackState();
}

class _AnimationStackState extends State<AnimationStack> {
  bool showMe = false;

  @override
  void initState() {
    super.initState();
    dutaion();
  }

  dutaion(){
    new Future.delayed(const Duration(seconds: 1), () {
      setState(() { 
        showMe = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("positionAnimation"),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 10,
              left: 10,
              child: Text("hi"),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: showMe ?  300 : 10,
              left: 10,
              child: Container(
                color: Colors.lightBlue,
                width: 300,
                height: 200,
              ),
            )
          ],
        )
      ),
    );
  }
}