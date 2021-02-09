import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'loading_screen.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart' as http;

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
          child: SingleChildScrollView(
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

                SizedBox(height: 50,),

                Text('Most searched city',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Spartan MB',
                    color: kyellow,
                  ),),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(cityname:'Dhaka',),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(cityname:'London'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(cityname:'New York'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(cityname:'Shariatpur'),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      );
  }
}

class cityCard extends StatelessWidget {
  cityCard({this.cityname});
  String cityname;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: kbeguni, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(cityname,
            style: TextStyle(
              color: kbeguni,
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('30°C',
                style: TextStyle(
                  color: kblue,
                  fontSize: 30
                ),),
            ),
            Text('🌤',
              style: TextStyle(
                fontSize: 30,
              ),),
          ],
        ),
      ),
    );
  }
}
