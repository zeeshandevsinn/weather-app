import 'package:flutter/material.dart';
import 'package:flutter_open_weather_map_integrated/Model/weather_model.dart';

class CustomText extends StatelessWidget {
  var text, fontSize, fontWeight, color;
  CustomText({this.text, this.fontSize, this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
