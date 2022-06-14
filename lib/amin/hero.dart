import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dart/amin/StackFit.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text("1111111111")),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return StackFitWidget();
            }));
          },
          child: Text("123"),
        ),
        InkWell(
          child: Container(
            width: 120.0,
            height: 120.0,
            child: Hero(
              tag: "first",
              child: Image.network(
                  "https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png"),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return NewPage();
            }));
          },
        ),
        InkWell(
          child: Container(
            width: 120.0,
            height: 120.0,
            child: Hero(
              tag: "second",
              child: Image.network(
                  "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png"),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return NewPage();
            }));
          },
        ),
      ],
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.yellow,
        ),
        Hero(
            tag: "first",
            child: Image.network(
              "https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png",
              width: 80,
              height: 80,
            )),
        Positioned(
          width: 80.0,
          height: 80.0,
          bottom: 10.0,
          right: 10.0,
          child: Container(
              color: Colors.red,
              child: Hero(
                  tag: "second",
                  child: Image.network(
                    "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
                  ))),
        )
      ],
    );
  }
}
