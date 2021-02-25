import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWeb extends StatefulWidget {
  var data;
  NewsWeb(this.data);

  @override
  _NewsWebState createState() => _NewsWebState();
}

class _NewsWebState extends State<NewsWeb> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: WebView(
            initialUrl: widget.data['url'],
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) async {
              setState(() {
                isLoading = false;
              });
            },
        ),
          ),
          isLoading ? Center(child: CircularProgressIndicator(),) : Stack(),
        ],
      ),
    );
  }
}
