import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimTweenWidget extends StatefulWidget {
  const AnimTweenWidget({Key? key}) : super(key: key);

  @override
  _AnimTweenWidgetState createState() => _AnimTweenWidgetState();
}

class _AnimTweenWidgetState extends State<AnimTweenWidget>
    with SingleTickerProviderStateMixin {
  bool forword = true;
  late AnimationController controller;
  late Tween<Color?> tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 2000,
      ),
    );
    tween = ColorTween(begin: Colors.blue, end: Colors.yellow);
    tween.animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: tween.evaluate(controller),
        ),
        RaisedButton(
          onPressed: () {
            if (forword) {
              controller.forward();
            } else {
              controller.reverse();
            }
            forword = !forword;
          },
          child: Text("播放"),
        ),
        RaisedButton(
          onPressed: () {
            controller.stop();
          },
          child: Text("停止"),
        ),
      ],
    );
  }
}
