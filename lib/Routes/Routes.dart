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

import '../View/CheckPointScreen/CheckPointScreen.dart';
import '../View/FAQ\'s/FAQsDetailScreen.dart';
import '../View/FAQ\'s/FAQsScreen.dart';

import '../View/MaintainceScreen/MaintainceScreen.dart';
import '../View/MyPointScreen/MyPointScreen.dart';
import '../View/NotificationScreen/NotificationScreen.dart';
import '../View/SupportRequestScreen/SupportRequestScreen.dart';
import '../View/TrackUserScreen/TrackUserScreen.dart';

class Routes {
  final routes = [
    GetPage(name: '/', page: () => SplashScreen(), transition: Transition.zoom),
    GetPage(
        name: '/home',
        page: () => BottomNavigationScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/intro',
        page: () => IntroScreen(),
        transition: Transition.leftToRight,
        curve: Curves.easeInQuart),
    // GetPage(
    //     name: '/askpermission',
    //     page: () => AskForPermission(),
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
    GetPage(
        name: "/maintaince",
        page: () => MaintainceScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/checkpoint",
        page: () => CheckPointScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/trackuser",
        page: () => TrackUserScreen(),
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
    GetPage(
        name: "/faqs",
        page: () => FAQsScreen(check: true),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/mypoints",
        page: () => MyPointScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/notification",
        page: () => NotificationScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
    GetPage(
        name: "/supportrequest",
        page: () => SupportRequestScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.easeInQuart),
  ];
}
