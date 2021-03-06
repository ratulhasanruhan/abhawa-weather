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
  WeatherModel weatherModel = WeatherModel();
  String textValue;
  double result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async{
    var url = 'http://api.openweathermap.org/data/2.5/weather?q=London&appid=e396b7f9fdb249b7b257e9c102c7e280&units=metric';
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      String data = await response.body;
      setState(() {
        result = jsonDecode(data)['main']['temp'];
      });
    }
    else{
      print(response.statusCode);
    }

  }

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
                Text('Search a city',
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
                    autofocus: true,
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
                      child: cityCard(
                        cityname:'Dhaka',
                        wicon: '🌤',
                        temparature: '35',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(
                        cityname:'London',
                        wicon: '🌞',
                        temparature: result.toStringAsFixed(1),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(
                        cityname:'New York',
                        wicon: '🌩',
                        temparature: '12',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cityCard(
                        cityname:'Shariatpur',
                        wicon: '☔',
                        temparature: '30',
                      ),
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
  String cityname;
  String wicon;
  String temparature;

  cityCard({this.cityname,this.wicon,this.temparature});

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
              child: Text('$temparature°C',
                style: TextStyle(
                  color: kblue,
                  fontSize: 30
                ),),
            ),
            Text(wicon,
              style: TextStyle(
                fontSize: 30,
              ),),
          ],
        ),
      ),
    );
  }
}
