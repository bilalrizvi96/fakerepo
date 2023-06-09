// @dart=2.9
import 'dart:io';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Routes/Routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_widget/home_widget.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message,
    {BuildContext context}) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

// void backgroundCallback(Uri? data) async {
//   if (data!.host == 'updatecounter') {
//     await HomeWidget.saveWidgetData<String>(
//         'clockin', BaseUrl.storage.read('clockin'));
//     await HomeWidget.saveWidgetData<String>(
//         'clockout', BaseUrl.storage.read('clockout'));
//
//     await HomeWidget.updateWidget(
//         name: 'AppWidgetProvider',
//         iOSName: 'AppWidgetProvider',
//         androidName: 'AppWidgetProvider');
//     await HomeWidget.updateWidget(
//         name: 'AppWidgetProvider2',
//         iOSName: 'AppWidgetProvider2',
//         androidName: 'AppWidgetProvider2');
//   }
// }
// options: const FirebaseOptions(
// appId: '1:833414981797:android:4f17b315106ee54a1b054c',
// apiKey: 'AIzaSyDtqrjtfUH4AX3LNZ7fO7PfZVmBDRQ3z0Y',
// messagingSenderId: '833414981797',
// projectId: 'attendancesystem-332409')flutter run --release
Future<void> main() async {
  if (Platform.isAndroid) {
    await GetStorage.init();
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance.resamplingEnabled = true;
    // HomeWidget.registerBackgroundCallback(backgroundCallback);
    await Firebase.initializeApp();
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    await Firebase.initializeApp();
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance?.resamplingEnabled = true;
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await GetStorage.init();
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      title: 'Attendance',
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Routes().routes,
    );
  }
}
