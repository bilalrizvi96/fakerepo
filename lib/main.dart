import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/IntroScreen/IntroScreen.dart';
import 'package:attendencesystem/View/OTPScreen/OTPScreen.dart';
import 'package:attendencesystem/View/RegistrationScreen/RegistrationScreen.dart';
import 'package:attendencesystem/View/SigninScreen/SigninScreenHr.dart';
import 'package:attendencesystem/View/SplashScreen/SplashScreen.dart';
import 'package:attendencesystem/View/facetest.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/FaceIDRuleScreen/FaceIDRuleScreen.dart';
import 'View/FaceVerificationScreen/FaceVerificationScreen.dart';
import 'View/SigninScreen/SigninEmployeeScreen.dart';
import 'View/SigninScreen/SigninScreen.dart';
import 'View/SummaryScreen/SummaryScreen.dart';
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
      defaultTransition: Transition.native,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/', page: () => SplashScreen(), transition: Transition.zoom),
        GetPage(
            name: '/home',
            page: () => HomeScreen(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/intro',
            page: () => IntroScreen(),
            transition: Transition.leftToRight,
            curve: Curves.easeInQuart),
        GetPage(
            name: '/signin',
            page: () => SigninScreen(),
            transition: Transition.leftToRight,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/signinhr",
            page: () => SigninScreenHr(),
            transition: Transition.leftToRight,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/signinemp",
            page: () => SiginEmployeeScreen(),
            transition: Transition.leftToRight,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/registration",
            page: () => RegistrationScreen(),
            transition: Transition.leftToRight,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/OTP",
            page: () => OTPScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/facerule",
            page: () => FaceIDRuleScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/faceverfication",
            page: () => FaceVerficationScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/summary",
            page: () => SummaryScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
      ],
    );
  }
}
