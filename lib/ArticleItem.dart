import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dart/WebViewExample.dart';
import 'package:study_dart/page_webview.dart';

class ArticleItem extends StatelessWidget {
  final itemData;
  const ArticleItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    Row author = Row(
      children: [
        Expanded(child: Text.rich(TextSpan(children: [
          TextSpan(
            text: "作者"
          ),
          TextSpan(
            text: itemData['author'],
            style: new TextStyle(color: Theme.of(context).primaryColor))
        ])))
      ],
    );
    Text title = Text(itemData['title'],style: new TextStyle(fontSize: 16.0, color: Colors.black),
      textAlign: TextAlign.left,);
    Text chapterName = Text(itemData['chapterName'],
        style: new TextStyle(color: Theme.of(context).primaryColor));
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: author,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: chapterName,
        ),
      ],
    );
    return InkWell(onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        print(itemData['link']);
        return WebViewPage(itemData);
      }));
    },child: Card(elevation: 4.0,child: column,),);
  }
}
