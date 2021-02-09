import 'package:flutter/material.dart';

const apiKey = 'e396b7f9fdb249b7b257e9c102c7e280';
const openWeatherurl = 'http://api.openweathermap.org/data/2.5/weather';

const kyellow = Color(0xFFFFBA00);
const kblue = Color(0xFF353778);
const kbeguni = Color(0xFF666BD0);
const kdarkb = Color(0xFF494CA1);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputFieldStyle = InputDecoration(

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
    color: kblue,
  ),
);
