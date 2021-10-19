import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tumble/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        canvasColor: Color(0xff161616),
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/LargeLogo.png"),
            scale: 80.0,
            fit: BoxFit.contain,
          )),
        ),
        nextScreen: LoginScreen(),
      ),
    );
  }
}
