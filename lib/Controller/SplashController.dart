import 'dart:async';
import 'dart:io';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/HomeController.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../Routes/Routes.dart';
import 'BottomNavigationController.dart';
import 'MaintenanceController.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;

  FirebaseMessaging? _firebaseMessaging;
  LocationPermission? permission;
  // MaintenanceController _maintenanceController =
  //     Get.put(MaintenanceController());
  var connection = true.obs;

  ///recent
  // var clockin = '00:00';
  // var clockout = '00:00';
  check() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;

        update();
      } else {
        connection.value = false;
        update();
      }
    });
  }

  @override
  void onInit() {
    // HomeWidget.widgetClicked.listen((Uri? uri) => homeController.scan());
    super.onInit();

    // clockin = BaseUrl.storage.read('clockin');
    // clockout = BaseUrl.storage.read('clockout');

    // updateAppWidget();
    // updateAppWidget2();
    // bottomNavigationController.dashboardData();
    this._registerOnFirebase();
    this.getMessage();
    check();
    if (Platform.isAndroid) {
      permissions();
    }
    checks();
    update();
  }

  _registerOnFirebase() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging!.subscribeToTopic('all');
    await _firebaseMessaging!
        .getToken()
        .then((var token) => BaseUrl.fcm_token = token.toString());
    print(BaseUrl.fcm_token.toString());
  }

  void getMessage() async {
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
    print(settings);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        if (notification.title.toString().trim() == 'Maintenance') {
          // _maintenanceController.checkMaintenance();
          BaseUrl.storage.write('token', 'out');
          Get.offAllNamed(Routes.maintaince);
        } else if (notification.title.toString().trim() == 'Update') {
          checkUpdate();
        } else if (notification.title.toString().trim() == 'Expire') {
          BaseUrl.storage.write('token', 'out');
          Get.offAllNamed(Routes.signinemp);
          // BaseUrl.storage.erase();
        }
        Get.snackbar(" ${notification.title.toString()}",
            "${notification.body.toString()}");
      }

      print('Message clicked!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Message clicked!');
      if (notification != null) {
        if (notification.title.toString().trim() == 'Maintenance') {
          // _maintenanceController.checkMaintenance();
          BaseUrl.storage.write('token', 'out');
          Get.offAllNamed(Routes.maintaince);
        } else if (notification.title.toString().trim() == 'Update') {
          checkUpdate();
        } else if (notification.title.toString().trim() == 'Expire') {
          BaseUrl.storage.write('token', 'out');
          Get.offAllNamed(Routes.signinemp);
          // BaseUrl.storage.erase();
        }
        Get.snackbar(
          "${notification.title.toString().trim()}",
          "${notification.body.toString().trim()}",
        );
      }
    });
  }

  permissions() async {
    if (await Permission.location.request().isGranted) {
      update();
    } else {
      permissions();
    }
    if (await Permission.camera.request().isGranted) {
      update();
    } else {
      permissions();
    }
    if (await Permission.storage.request().isGranted) {
      update();
    } else {
      permissions();
    }
  }

  // void updateAppWidget() async {
  //   await HomeWidget.saveWidgetData<String>(
  //       'clockin', BaseUrl.storage.read('clockin'));
  //   await HomeWidget.saveWidgetData<String>(
  //       'clockout', BaseUrl.storage.read('clockout'));
  //   await HomeWidget.saveWidgetData<String>('clockin', clockin);
  //   await HomeWidget.saveWidgetData<String>('clockout', clockout);
  //   await HomeWidget.updateWidget(
  //       name: 'AppWidgetProvider',
  //       iOSName: 'AppWidgetProvider',
  //       androidName: 'AppWidgetProvider');
  // }

  // void updateAppWidget2() async {
  //   await HomeWidget.updateWidget(
  //       name: 'AppWidgetProvider2',
  //       iOSName: 'AppWidgetProvider2',
  //       androidName: 'AppWidgetProvider2');
  // }

  checkUpdate() async {
    var response = await API().CheckUpdate();
    if (response.statusCode == 200) {
      // if (updates.value == true) {
      Get.offAllNamed(Routes.updatescreen, arguments: [
        response.data['response']['message'],
        response.data['response']['currentRelease'],
        response.data['response']['availableRelease'],
        response.data['response']['link'],
      ]);

      // print(updateController.url);
      // }

    } else {
      Get.snackbar("Check Update ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  checks() {
    // HomeWidget.widgetClicked.listen((Uri? uri) => homeController.scan());

    var tokenval = BaseUrl.storage.read("token");
    BaseUrl.storage1.read('seen') ?? false;
    print(tokenval);
    Future.delayed(new Duration(milliseconds: 2000), () {
      if (tokenval != "out") {
        if (tokenval != null) {
          Get.offAllNamed(Routes.home);
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed(Routes.signinemp);
        } else {
          BaseUrl.storage1.write('seen', true);
          if (connection.value == true) {
            Get.offAllNamed(Routes.intro);
          } else {
            Get.offAllNamed(Routes.signinemp);
          }
        }
      } else if (BaseUrl.storage1.read('seen') == true) {
        Get.offAllNamed(Routes.signinemp);
      } else {
        BaseUrl.storage1.write('seen', true);
        if (connection.value == true) {
          Get.offAllNamed(Routes.intro);
        } else {
          Get.offAllNamed(Routes.signinemp);
        }
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // this.dispose();
  }
}
