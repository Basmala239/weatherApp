import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../controller/weather_controller.dart';
import '../model/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _State();
}

class _State extends State<WeatherScreen> {

  Future<WeatherModel>? _getWeather;
  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather(){
    WeatherController weatherController = WeatherController();
    _getWeather = weatherController.getWeather('alex') ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getWeather,
          builder: (context,asyncSnapshot){
            if (asyncSnapshot.connectionState == ConnectionState.done){
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.grey
                    //image: DecorationImage(image: AssetImage('assets/background.jpg'))
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => {},//Provider.of<ControllProvider>(context,listen: false).currentCity(value),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 134, 8, 8),
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => Provider.of<ControllProvider>(context,listen: false).currentCity(value),
                        decoration: InputDecoration(
                          suffix:const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle:const TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                //ImageIcon(AssetImage(asyncSnapshot.data!.conditionIcon),),
                                //Text(asyncSnapshot.data!.conditionText)
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.water_drop),
                                //Text(" ${asyncSnapshot.data!.humidity}%"),
                                const Icon(Icons.umbrella),
                                //Text(" ${asyncSnapshot.data!.precip}%"),
                              ],
                            )
                          ],
                        ),
                      Text(" ${Provider.of<ControllProvider>(context).tmp}%"),                     
                      const Text("F"),  
                      ],                    

                    ),
                  ],
                ),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}