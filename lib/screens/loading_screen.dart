import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    await weatherModel.getLocationWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image(image: AssetImage('images/cloud.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Find', style: TextStyle(
                        color: kyellow,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextSpan(text: ' the sun in your City!', style: TextStyle(
                        color: kblue,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),),
                    ]
                  ),
                ),
              ),
            ),
            Text('It\'s a pleasure to keep track of the\n weather with the new app',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: kblue,
            ),),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FlatButton(
                onPressed: () async {
                  var weatherData = await weatherModel.getLocationWeather();

                  Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kyellow,
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Know your Weather',
                    style: TextStyle(
                      color: kblue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
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
