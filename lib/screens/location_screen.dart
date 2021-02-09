import 'dart:core';
import 'package:clima/screens/city_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temprature;
  String cityname;
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = '😢';
        cityname = 'Mobile';
        weatherMessage = 'Unable to get weather Data';
      } else {
        cityname = weatherData['name'];
        var condition = weatherData['weather'][0]['id'];
        //
        var temp = weatherData['main']['temp'];
        temprature = temp.toInt();
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temprature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMM h:mm a').format(now);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            var weather = weatherModel.getLocationWeather();
            updateUI(weather);
          },
          icon: Icon(Icons.my_location_sharp),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          cityname,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search_outlined),
            onPressed: () async {
              var navpop = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
              if(navpop != null){
                var weathercity = await weatherModel.getCityWeather(navpop);
                updateUI(weathercity);
              }
            },),
        ],
      ),

      backgroundColor: kbeguni,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kdarkb,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityname,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: Color(0xFFEDBD41),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          weatherIcon,
                          style: TextStyle(
                            fontSize: 55,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 40,),
                    Text(
                      '$temprature°C',
                      style: TextStyle(
                        color: kyellow,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      weatherMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Another Design
/*Container(
            decoration: BoxDecoration(
              color: kbeguni,
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weather = await weatherModel.getLocationWeather();
                          updateUI(weather);
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 50.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          var navpop = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityScreen(),
                            ),
                          );
                          if(navpop != null){
                            var weathercity = await weatherModel.getCityWeather(navpop);
                            updateUI(weathercity);
                          }
                        },
                        child: Icon(
                          Icons.location_city,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$temprature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "$weatherMessage in $cityname!",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),*/
