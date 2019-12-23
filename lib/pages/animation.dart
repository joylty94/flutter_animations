import 'package:flutter/material.dart';
// import "dart:math" as math;
import 'dart:core';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  AnimationController animController;
  Animation<Offset> animation;

  @override
  void initState(){
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );

    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeOut
    );

    animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 300.0) )
    .animate(curvedAnimation)
    ..addListener((){
      setState(() {
        
      });
    })
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
        // animController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });

    animController.forward();
  }

  List a = ['1','2','3','4'];
  List<int> widgetIds = [0, 1, 2];
  bool t = false;

  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {
    var index = 0;

    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Stack(
          children: mapIndexed( a, (index, item) =>
                Container(
                  child: Transform.translate(
                    offset: Offset((30.0 + 20 * index), (0.0 - 15 * index)),
                    child: TuTransition(
                      angle: animation,
                      child: TuAnimation2(),
                    ),
                  )
                ),
              )
              .toList(),
          // children: <Widget>[
          //   Container(
          //     child: Transform.translate(
          //       offset: Offset(20.0, -20.0),
          //       child: TuTransition(
          //         angle: animation,
          //         child: TuAnimation( ironManAlignment:_ironManAlignment),
          //       ),
          //     )
          //   ),
          //   Container(
          //     child: Transform.translate(
          //       offset: Offset(0.0, 0.0),
          //       child: TuTransition(
          //         angle: animation,
          //         child: TuAnimation2( ironManAlignment:_ironManAlignment),
          //       ),
          //     )
          //   ),
            // ListView.builder(
            //   itemCount: a.length,
            //   itemBuilder: (context, index) { 
            //     return Align(
            //         alignment: Alignment.center,
            //         child: TuTransition(
            //           angle: animation,
            //           child: TuAnimation( ironManAlignment:_ironManAlignment),
            //         ),
            //       );
            //     }
            // ),
            // Positioned(
            //   top:10,
            //   left:0,
            //   child: TuTransition(
            //     angle: animation,
            //     child: TuAnimation( ironManAlignment:_ironManAlignment),
            //   ),
            // ),
            // Positioned(
            //   top:0,
            //   left: 10,
            //   child: TuTransition(
            //     angle: animation,
            //     child: TuAnimation2( ironManAlignment:_ironManAlignment),
            //   ),
            // ),
            // ListView.builder(
            //   itemCount: a.length,
            //   itemBuilder: (context, i){
            //     return AnimatedPositioned(
            //       duration: Duration(seconds: 2),
            //       top: t ? 100 : 0,
            //       left: 5.0 * i,
            //       child: TuTransition(
            //         angle: animation,
            //         child: TuAnimation2( ironManAlignment:_ironManAlignment),
            //       )
            //     );
            //   },
            // )
          // ],
        ),
       )
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
  final Animation<Offset> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.translate(
          offset: angle.value,
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
      width: 200,
      height: 100,
      color: Colors.lightBlue,
      alignment: Alignment.center,
      child: FlutterLogo()
    );
  }
}

class TuAnimation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),
      alignment: Alignment.center,
      child: FlutterLogo()
    );
  }
}

class StackItem extends StatelessWidget {
  final int id;
  final bool isTop;
  final Animation<Offset> angle;
  StackItem({this.id, this.isTop, @required this.angle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: id * (MediaQuery.of(context).size.width / 3),
      top: id * (MediaQuery.of(context).size.height / 2),
        child: TuTransition(
          angle: angle,
          child: TuAnimation(),
        ),
      // Container(
      //   height: 300,
      //   width: 300,
      //   decoration: BoxDecoration(
      //       color: Color.fromARGB(255, id * 40, id * (id * 10), 150 + (id * 3)),
      //       // boxShadow: [
      //       //   if(isTop)
      //       //     BoxShadow(color: Color.fromARGB(125, 0, 0, 0), blurRadius: 16)
      //       // ]
      //       ),
      // ),
    );
  }
}