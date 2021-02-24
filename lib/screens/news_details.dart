import 'package:clima/screens/news_webview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var recive;
  HomePage(this.recive);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(recive['media'][0]['media-metadata'][2]['url'],  //results[0].media[0]['media-metadata'][2].url
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(recive['section'] == null ? 'News' : recive['section'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.nights_stay),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.bookmark_border_rounded),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(recive['published_date']),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(recive['title'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2,
                      )),
                  Expanded(
                    child: Text(recive['abstract']),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsWeb(recive)));
                    },
                    color: Colors.redAccent,
                    child: Text('View Source - ',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
