import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class WebViewExample  extends StatefulWidget {
  final url;
  const WebViewExample (this.url,{Key? key}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState(url);
}

class _WebViewExampleState extends State<WebViewExample> {
  final url;
  _WebViewExampleState(this.url);
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
