import 'package:attendencesystem/Trash/TabViewProfile.dart';
import 'package:attendencesystem/View/AttendenceScreen/AttendanceScreen.dart';
import 'package:attendencesystem/View/FaceIDRuleScreen/FaceIDRuleScreen.dart';
import 'package:attendencesystem/View/FaceRegistrationScreen/FaceRegistrationScreen.dart';

import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/IntroScreen/IntroScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/OTPScreen/OTPScreen.dart';

import 'package:attendencesystem/View/RegistrationScreen/RegistrationScreen.dart';
import 'package:attendencesystem/View/SigninScreen/SigninEmployeeScreen.dart';
import 'package:attendencesystem/View/SplashScreen/SplashScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  final routes = [
    GetPage(
        name: '/splash',
        page: () => SplashScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/home', page: () => HomeScreen(), transition: Transition.fadeIn),
    GetPage(
        name: '/intro',
        page: () => IntroScreen(),
        transition: Transition.leftToRight,
        curve: Curves.easeInQuart),
    // GetPage(
    //     name: '/signin',
    //     page: () => SigninScreen(),
    //     transition: Transition.leftToRight,
    //     curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/signinhr",
    //     page: () => SigninScreenHr(),
    //     transition: Transition.leftToRight,
    //     curve: Curves.easeInQuart),
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
    // GetPage(
    //     name: "/faceregistration",
    //     page: () => FaceRegistrationScreen(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
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
        page: () => MyProfileScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/managesites",
    //     page: () => ManageSitesScreen(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/reports",
    //     page: () => ReportScreen(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/viewsites",
    //     page: () => ViewSitesHeader(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/setting",
    //     page: () => SettingScreen(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
    // GetPage(
    //     name: "/genrateqr",
    //     page: () => GenrateQrScreen(),
    //     transition: Transition.rightToLeft,
    //     curve: Curves.easeInQuart),
  ];
}
