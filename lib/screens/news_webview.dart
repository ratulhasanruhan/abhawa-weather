import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWeb extends StatelessWidget {
  var data;
  NewsWeb(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: WebView(
          initialUrl: 'https://google.com',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
