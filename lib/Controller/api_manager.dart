import 'dart:convert';
import 'package:flutter_open_weather_map_integrated/Controller/endpoint.dart';
import 'package:flutter_open_weather_map_integrated/Model/weather_model.dart';
import 'package:flutter_open_weather_map_integrated/config/snack.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Weather(context, String cityName) async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=Lahore&appid=b189f31bd264510e4848acac84074ab4");
      var response = await http.get(
        url,
      );

      var res = jsonDecode(response.body);
      final WeatherModel weather = WeatherModel.fromJson(res);
     

      showSnack(context, weather.toString());
      return weather;
    } catch (e) {
      showSnack(context, e.toString());
    }
  }
}
