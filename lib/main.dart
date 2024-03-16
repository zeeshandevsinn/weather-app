import 'package:flutter/material.dart';
import 'package:flutter_open_weather_map_integrated/Controller/provider/Weather_provider.dart';
import 'package:flutter_open_weather_map_integrated/View/weather_screen.dart';
import 'package:provider/provider.dart';
// import 'dart:ui_web';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MaterialApp(
        title: 'Open Weather',
        debugShowCheckedModeBanner: false,
        home: WeatherScreen(),
      ),
    );
  }
}
