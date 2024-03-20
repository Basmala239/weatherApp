import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'weather_controller.dart';

class ControllProvider extends ChangeNotifier{
  String city='cairo';
  double tmp=0;

  void currentCity(String cCity)async{
    city=cCity;
    WeatherController weatherController = WeatherController();
    WeatherModel wm= await weatherController.getWeather(city) ;
    tmp=wm.temp;
    notifyListeners();
  }
  getWeather()async{
    
    WeatherController weatherController = WeatherController();
    return weatherController.getWeather(city) ;
    
  }

}