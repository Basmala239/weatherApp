import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/assets_controller/assets_manager.dart';
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
                decoration:const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AssetsManager.backgroungImage),fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        child: TextField(
                          onChanged: (value) => {},
                          style: const TextStyle(
                            color: Colors.white,
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
                      const SizedBox(height: 10,),
                      Text(Provider.of<ControllProvider>(context).city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 32
                      ),),
                      const Spacer(),
                       Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image(image: NetworkImage((Provider.of<ControllProvider>(context).conditionIcon)))),
                                    Text("  ${Provider.of<ControllProvider>(context).conditionText}",style: 
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400
                                    ),)
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.water_drop,color: Colors.white),
                                    Text(" ${Provider.of<ControllProvider>(context).humidity}%   ",style: 
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                    const Icon(Icons.umbrella,color: Colors.white),
                                    Text(" ${Provider.of<ControllProvider>(context).precip}%   ",style: 
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const SizedBox(height: 10,),
                                Text(" ${Provider.of<ControllProvider>(context).tmp}",style: 
                                        const TextStyle(
                                          color: Colors.white,
                                          fontSize: 64,
                                          fontWeight: FontWeight.w600
                                        ),),
                              ],
                            ),

                            const Column(
                              children: [
                                 Text(" C",style: 
                                  TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),),
                                SizedBox(height: 30,)
                              ],
                            ),  
                          ],                    
                        
                        ),
                    ],
                  ),
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