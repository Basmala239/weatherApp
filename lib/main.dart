import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/weather_screen.dart';

import 'controller/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ControllProvider())
      ],
    child: 
    const MaterialApp(
      home: WeatherScreen()
    )
    );
  }
}
