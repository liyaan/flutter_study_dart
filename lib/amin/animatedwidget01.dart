import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation01 extends StatefulWidget {
  const Animation01({Key? key}) : super(key: key);

  @override
  _Animation01State createState() => _Animation01State();
}

class _Animation01State extends State<Animation01>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<double> valueAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: valueAnimation.value,
      height: valueAnimation.value,
      color: Colors.red,
      child: Text("1111111"),
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    animationController.addListener(() {
      setState(() {
        
      });
    });
    animationController.addStatusListener((status) {
      print(status);
      /// 在正向动画完成之后是 completed
      if(status == AnimationStatus.completed){
          // animationController.reverse();
        ///在反向结束了之后 是 dismissed
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    valueAnimation = Tween(begin: 100.0,end: 300.0).animate(curvedAnimation);

    //启动动画
    animationController.forward();
  }
}

class MyValue {
  double value;

  MyValue(this.value);
}

class MyValueTween extends Tween<MyValue> {
  MyValueTween({required MyValue begin, required MyValue end})
      : super(begin: begin, end: end);

  @override
  MyValue lerp(double t) {
    return MyValue(begin!.value +t*100);
  }
}
