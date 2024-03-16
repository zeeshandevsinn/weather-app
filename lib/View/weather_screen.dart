import 'package:conversion_units/conversion_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_weather_map_integrated/Constants/MyColors.dart';
import 'package:flutter_open_weather_map_integrated/Controller/api_manager.dart';
import 'package:flutter_open_weather_map_integrated/Controller/provider/Weather_provider.dart';
import 'package:flutter_open_weather_map_integrated/Model/weather_model.dart';
import 'package:flutter_open_weather_map_integrated/config/snack.dart';
import 'package:flutter_open_weather_map_integrated/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // final data = Provider.of<WeatherProvider>;
  late WeatherModel weatherdata;
  // String CityName = "NEW ZELAND";
  Weather() {
    var weather = context.read<WeatherProvider>();
    weather.GetWeather(context, weather.toString());
  }

  loadWeatherData() async {
    try {
      final data = await ApiManager.Weather(context, "${weatherdata.name}");
      setState(() {
        weatherdata = data;
      });
    } catch (e) {
      showSnack(context, e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  var kelvin = 273.15;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
        
        body: Builder(builder: (context) {
      
      return weatherdata != null
          ? Column(children: [
            
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: weatherdata.name == 'Lahore'
                                  ? AssetImage(
                                      "assets/images/weather_sunny.png")
                                  : AssetImage(
                                      "assets/images/weather_wind.png"),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "${weatherdata.name}",
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: MyColors.BlackColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "${weatherdata.main?.temp} °C",
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: MyColors.BlackColor,
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: Container(
                        // gray box
                        child: new Transform(
                          child: new Text(
                            "Hi Sunny",
                            style: TextStyle(
                                color: MyColors.BlackColor, fontSize: 20),
                          ),
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()..rotateZ(180),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])
          : CircularProgressIndicator.adaptive();
    }));
  }
}
