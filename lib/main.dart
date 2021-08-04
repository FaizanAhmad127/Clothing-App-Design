import 'package:anton/UI/FirstScreen.dart';
import 'package:anton/UI/ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'UI/SecondScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "SecondScreen",
        routes: {
          "FirstScreen": (context) => FirstScreen(),
          "SecondScreen": (context) => SecondScreen(),
          "ThirdScreen": (context) => ThirdScreen(),
        });
  }
}
