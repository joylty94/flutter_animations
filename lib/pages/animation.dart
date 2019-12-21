import 'package:flutter/material.dart';
import "dart:math" as math;

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  AnimationController animController;
  Animation<double> animation;

  @override
  void initState(){
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
    );

    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut
    );

    animation = Tween<double>(begin: 0, end: 2 * math.pi ).animate(curvedAnimation)
    ..addListener((){
      setState(() {
        
      });
    })
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
        animController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: <Widget>[
           Container(
             margin: EdgeInsets.only(top: 30),
             child: TuTransition(
              angle: animation,
              child: TuAnimation(),
            ),
           )
         ],
       ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}

class TuTransition extends StatelessWidget {
  TuTransition({
    @required this.angle,
    @required this.child,
  });

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}

class TuAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      alignment: Alignment.center,
      child: FlutterLogo()
    );
  }
}