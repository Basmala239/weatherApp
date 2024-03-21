import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controller/assets_controller/assets_manager.dart';
import 'package:weather_app/model/weather.dart';
import 'weather_controller.dart';

class ControllProvider extends ChangeNotifier{
  String city='noplace';
  String conditionIcon=AssetsManager.locationImage;
  String conditionText='unknown';
  double tmp=0;
  double humidity=0;
  double precip=0;

  void currentCity(String cCity)async{
    city=cCity;
    WeatherController weatherController = WeatherController();
    WeatherModel wm= await weatherController.getWeather(city) ;
    tmp=wm.temp;
    humidity=wm.humidity;
    precip=wm.precip;
    conditionIcon=wm.conditionIcon;
    conditionText=wm.conditionText;
    notifyListeners();
  }

}