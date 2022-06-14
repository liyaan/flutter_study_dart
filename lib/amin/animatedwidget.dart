import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({Key? key}) : super(key: key);

  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late MyValueTween tween;
  late Animation<MyValue> valueAnimation;

  @override
  Widget build(BuildContext context) {
    MyValue value = valueAnimation.value;
    return Container(
      width: value.value,
      height: value.value,
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
          animationController.reverse();
        ///在反向结束了之后 是 dismissed
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    tween = MyValueTween(begin: MyValue(10), end: MyValue(10));
    valueAnimation = tween.animate(animationController);
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
