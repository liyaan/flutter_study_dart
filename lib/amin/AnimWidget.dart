import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimWidget extends StatefulWidget {
  const AnimWidget({Key? key}) : super(key: key);

  @override
  _AnimWidgetState createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool forward = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      lowerBound: 10.0,
      upperBound: 100.0,
      vsync: this,
    );
    controller..addStatusListener((status) {
      debugPrint("状态：$status");
    })..addListener(() {
      setState(() {

      });
    });
    debugPrint("controller.value:${controller.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: controller.value,
          height: controller.value,
          color: Colors.blue,
        ),
        RaisedButton(onPressed: (){
          if(forward){
            controller.forward();
          }else{
            controller.reverse();
          }
          forward = !forward;
        },child: Text("播放"),),
        RaisedButton(onPressed: (){
          controller.stop();
        },child: Text("暂停"),)
      ],
    );
  }
}
