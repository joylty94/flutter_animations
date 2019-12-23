import 'package:flutter/material.dart';
// import "dart:math" as math;
import 'dart:core';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{

  List<String> a = ['1','2','3','4','5'];
  
  AnimationController animController1;
  Animation<Offset> animation1;
  AnimationController animController2;
  Animation<Offset> animation2;
  AnimationController animController3;
  Animation<Offset> animation3;
  AnimationController animController4;
  Animation<Offset> animation4;
  AnimationController animController5;
  Animation<Offset> animation5;
  AnimationController animController6;
  Animation<Offset> animation6;
  AnimationController animController7;
  Animation<Offset> animation7;
  AnimationController animController;
  Animation<Offset> animation;

  // var _alignment = Alignment(-1.0, -2.0);

  @override
  void initState(){
    super.initState();
    animController = AnimationController(
      duration: Duration(milliseconds: 1000),
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

    // new Future.delayed(const Duration(microseconds: 100), () {
    //   setState(() {
    //     _alignment = Alignment(-1.0, 0.3);
    //   });
    // });
  }

  // _animationFc(){


  // }

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
                // AnimatedContainer(
                //   duration: Duration(seconds: 2),
                //   alignment: _alignment,
                //     child: Transform.translate(
                //       offset: Offset((30.0 + 20 * index), (0.0 - 15 * index)),
                //       child: Container(
                //         width: 200,
                //         height: 100,
                //         decoration: BoxDecoration(
                //           color: Colors.black,
                //           borderRadius: BorderRadius.circular(10)
                //         ),
                //     )
                //   ),
                // )
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