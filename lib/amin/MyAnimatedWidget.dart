import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnimationWidget extends StatefulWidget {
  const MyAnimationWidget({Key? key}) : super(key: key);

  @override
  _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation<double> animate;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animate = Tween(begin: 100.0, end: 300.0).animate(curvedAnimation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return MyAnimatedWidget(animate);
    return AnimatedBuilder(
        animation: animate,
        builder: (context, child) {
          return Container(
            width: animate.value,
            height: animate.value,
            color: Colors.black,
            child: Text(
              "aaaaaaa",
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }
}

class MyAnimatedWidget extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation;
    return Container(
      width: animation.value,
      height: animation.value,
      color: Colors.red,
      child: Text("1111"),
    );
  }

  MyAnimatedWidget(Animation animation) : super(listenable: animation);
}
