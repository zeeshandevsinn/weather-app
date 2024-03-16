import 'package:flutter/widgets.dart';
import 'package:flutter_open_weather_map_integrated/Controller/api_manager.dart';
import 'package:flutter_open_weather_map_integrated/Model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  late List weatherList = [];
  WeatherModel? weather;
  bool loading = false;
  GetWeather(context, String cityName) async {
    loading = true;
    // notifyListeners();
    final WeatherModel data = await ApiManager.Weather(context, cityName);
    // data.main?.temp =  (data.main?.temp + 273.15)!;
    weather = data;
    notifyListeners();
    loading = false;
    notifyListeners();
  }
}
