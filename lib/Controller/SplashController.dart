import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Component/DynamicColor.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var context;
  @override
  void onInit() {
    super.onInit();
    checkUpdate();

    // TODO: implement onInit
    // await Firebase.initializeApp();
    // FirebaseCrashlytics.instance.crash();
  }

  checkUpdate() async {
    var response = await API().CheckUpdate();
    if (response.statusCode == 200) {
      updates.value = response.data[0]['updateAvailability'];
      print(updates.value);

      checks();
    } else {
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  checks() {
    if (!updates.value) {
      var tokenval = BaseUrl.storage.read("token");
      BaseUrl.storage1.read('seen') ?? false;
      Future.delayed(new Duration(seconds: 3), () {
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
      });
    } else {
      return showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(
                  'Are you sure want to leave?',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 18),
                ),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: DynamicColor().primarycolor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes')),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: DynamicColor().primarycolor,
                          textStyle:
                              TextStyle(color: DynamicColor().primarycolor)),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No'))
                ],
              ));
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
