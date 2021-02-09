import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'loading_screen.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String textValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,
          color: kblue,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_none),
          color: kblue,
            onPressed: () { null; },),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Search a City',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7DC1FF),
                fontFamily: 'Spartan MB',
              )),

              Text('Search a city or country\n to see the weather',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7DC1FF),
                  )),

              Container(
                padding: EdgeInsets.all(25.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value){
                    textValue = value;
                  },

                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Enter city Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.pop(context, textValue);
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
  }
}
