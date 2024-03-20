import '../model/network.dart';
import '../model/weather.dart';

class WeatherController{
  Future<WeatherModel> getWeather(String city)async{
    String url = "https://api.weatherapi.com/v1/current.json?q=$city&key=fd25ebb8814a4d49acc122359241903";
    Networking networking = Networking();
    final response = await networking.fetchData(url);
    WeatherModel weatherModel = WeatherModel(temp: response['current']['temp_c'], conditionText: response['current']['condition']['text']);
    print(weatherModel.conditionText);
    return weatherModel;
  }

}