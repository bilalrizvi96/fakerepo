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

import 'Component/TabViewProfile.dart';
import 'Component/ViewSitesHeader.dart';
import 'View/AttendenceScreen/AttendanceScreen.dart';
import 'View/FaceIDRuleScreen/FaceIDRuleScreen.dart';
import 'View/FaceVerificationScreen/FaceVerificationScreen.dart';
import 'View/GenrateQrScreen/GenrateQrScreen.dart';
import 'View/ManageSitesScreen/ManageSitesScreen.dart';
import 'View/ReportsScreen/ReportScreen.dart';
import 'View/SettingScreen/SettingScreen.dart';
import 'View/SigninScreen/SigninEmployeeScreen.dart';
import 'View/SigninScreen/SigninScreen.dart';
import 'View/SummaryScreen/SummaryScreen.dart';

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
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
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
        GetPage(
            name: "/attendance",
            page: () => AttendanceScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/profiletab",
            page: () => ProfileTabViewScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/managesites",
            page: () => ManageSitesScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/reports",
            page: () => ReportScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/viewsites",
            page: () => ViewSitesHeader(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/setting",
            page: () => SettingScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
        GetPage(
            name: "/genrateqr",
            page: () => GenrateQrScreen(),
            transition: Transition.rightToLeft,
            curve: Curves.easeInQuart),
      ],
    );
  }
}
