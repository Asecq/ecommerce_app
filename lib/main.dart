import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/auth/login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',

      theme: ThemeData(
        fontFamily: "Secoo",
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
          duration: 500,
        splashIconSize: 130,
        splash:  CircleAvatar(
          radius: 120.0,
          backgroundColor: Color(0xFF21BFBD),
          child:  Image.asset('assets/images/logo.png'),
        ),
        nextScreen: Login(),
        splashTransition: SplashTransition.rotationTransition,

      ),
    );


  }
}

