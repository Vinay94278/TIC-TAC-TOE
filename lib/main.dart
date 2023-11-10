import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/Pages/humanorai.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Color(0xffFFE087),
      splashIconSize: 360,
      // animationDuration: Duration(milliseconds: 5000),
      splash: Image.asset("assets/img/Logo.png"),
      nextScreen: HumanOrAI(),
    ),
  ));
}
