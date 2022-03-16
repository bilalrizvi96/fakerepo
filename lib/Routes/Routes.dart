import 'package:attendencesystem/View/AttendenceScreen/AttendanceScreen.dart';
import 'package:attendencesystem/View/BottomNavigationScreen/BottomNavigationScreen.dart';
import 'package:attendencesystem/View/FaceIDRuleScreen/FaceIDRuleScreen.dart';
import 'package:attendencesystem/View/IntroScreen/IntroScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/OTPScreen/OTPScreen.dart';
import 'package:attendencesystem/View/RegistrationScreen/RegistrationScreen.dart';
import 'package:attendencesystem/View/SigninScreen/SigninEmployeeScreen.dart';
import 'package:attendencesystem/View/SplashScreen/SplashScreen.dart';
import 'package:attendencesystem/View/UpdateScreen/UpdateScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../View/FeedbackScreen/FeedbackScreen.dart';

class Routes {
  final routes = [
    GetPage(
        name: '/splash',
        page: () => SplashScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/home',
        page: () => BottomNavigationScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/intro',
        page: () => IntroScreen(),
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
        name: "/attendance",
        page: () => AttendanceScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/profile",
        page: () => MyProfileScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/updatescreen",
        page: () => UpdateScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
  ];
}
