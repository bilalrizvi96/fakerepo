import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/IntroScreen/IntroScreen.dart';
import 'package:attendencesystem/View/OTPScreen/OTPScreen.dart';
import 'package:attendencesystem/View/RegistrationScreen/RegistrationScreen.dart';
import 'package:attendencesystem/View/SigninScreen/SigninScreenHr.dart';
import 'package:attendencesystem/View/SplashScreen/SplashScreen.dart';
import 'package:attendencesystem/View/facetest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/SigninScreen/SigninEmployeeScreen.dart';
import 'View/SigninScreen/SigninScreen.dart';
import 'View/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      routes: {
        // '/history':(context)=>History(),
        '/home': (context) => HomeScreen(),
        '/intro': (context) => IntroScreen(),
        '/signin': (context) => SigninScreen(),
        '/signinhr': (context) => SigninScreenHr(),
        '/signinemp': (context) => SiginEmployeeScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/OTP': (context) => OTPScreen(),
      },
    );
  }
}
