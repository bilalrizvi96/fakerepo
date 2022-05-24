import 'dart:async';
import 'dart:io';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'MaintenanceController.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;
  FirebaseMessaging? _firebaseMessaging;
  LocationPermission? permission;
  MaintenanceController _maintenanceController =
      Get.put(MaintenanceController());
  // var context;
  // var connection = true.obs;

/*
  check() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        checks();
        update();
      } else {
        connection.value = false;
        update();
      }
    });
    update();
  }
*/

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
    // var info, devicename;
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    //   info = await deviceInfo.androidInfo;
    //   print(info.model);
    //   devicename = 'android';
    // } else if (Platform.isIOS) {
    //   info = await deviceInfo.iosInfo;
    //   devicename = 'ios';
    // }
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        if (notification.title == 'Maintenance') {
          _maintenanceController.checkMaintenance();
        }
        Get.snackbar(" ${notification.title.toString()}",
            "${notification.body.toString()}");
        // BaseUrl.storage.write('token', 'out');
        // Get.offAllNamed('/maintaince');
        // } else if (notification.title == 'Login') {
        //   Get.offAllNamed('/signinemp');
        // }

      }

      print('Message clicked!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Message clicked!');
      if (notification != null) {
        if (notification.title == 'Maintenance') {
          _maintenanceController.checkMaintenance();
        }
        Get.snackbar(
          " ${notification.title.toString()}",
          "${notification.body.toString()}",
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    this._registerOnFirebase();
    this.getMessage();

    checks();
  }

  // checkUpdate() async {
  //   var response = await API().CheckUpdate();
  //   if (response.statusCode == 200) {
  //     updates.value = response.data['response']['updateAvailability'];
  //     if (updates.value == true) {
  //       url.value = response.data['response']['link'];
  //       BaseUrl.url = url.value;
  //       // print(updateController.url);
  //     }
  //     checks();
  //   } else {
  //     Get.snackbar("Error ", response.data['error'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  // }

  checks() {
    var tokenval = BaseUrl.storage.read("token");
    BaseUrl.storage1.read('seen') ?? false;
    print(tokenval);
    Future.delayed(new Duration(milliseconds: 700), () {
      // if (BaseUrl.storage.read('maintenance') == true) {
      //   Get.offAllNamed('/maintaince');
      // } else {
      if (tokenval != "out") {
        if (tokenval != null) {
          Get.offAllNamed('/home');
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed('/signinemp');
        } else {
          BaseUrl.storage1.write('seen', true);
          Get.offAllNamed('/intro');
        }
      } else if (BaseUrl.storage1.read('seen') == true) {
        Get.offAllNamed('/signinemp');
      } else {
        BaseUrl.storage1.write('seen', true);
        Get.offAllNamed('/intro');
      }
      // }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
