class WeatherModel{
   double temp;
   double humidity;
   double precip;
   String conditionText;
   String conditionIcon;

  WeatherModel( {required this.temp, required this.conditionIcon,required this.conditionText, required this.humidity, required this.precip });
}