import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackFitWidget extends StatefulWidget {
  const StackFitWidget({Key? key}) : super(key: key);

  @override
  _StackFitWidgetState createState() => _StackFitWidgetState();
}

class _StackFitWidgetState extends State<StackFitWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              child: Container(
                width: 120.0,
                height: 120.0,
                color: Colors.red,
                child: Text("2"),
              ),
            ),

          ],
        )),
        Container(
          width: 120.0,
          height: 120.0,
          color: Colors.yellow,
          child: Text("3"),
        ),
      ],
    );
  }
}
