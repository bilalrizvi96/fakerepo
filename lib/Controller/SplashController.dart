import 'dart:async';
import 'dart:io';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Component/DynamicColor.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;
  var context;
  @override
  void onInit() {
    super.onInit();
    checkUpdate();
  }

  checkUpdate() async {
    var response = await API().CheckUpdate();
    if (response.statusCode == 200) {
      updates.value = response.data['response']['updateAvailability'];
      if (updates.value == true) {
        url.value = response.data['response']['link'];
      }
      checks();
    } else {
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  checks() {
    if (updates.value == false) {
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
                  'Kindly Update Your Application',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 18),
                ),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: DynamicColor().primarycolor),
                      onPressed: () async {
                        url.value.toString();
                        print(url.value);
                        if (await canLaunch(url.value)) {
                          await launch(
                            url.value,
                            forceSafariVC: false,
                            forceWebView: false,
                            headers: <String, String>{
                              'my_header_key': 'my_header_value'
                            },
                          );
                        } else {
                          throw 'Could not launch ${url.value}';
                        }
                      },
                      child: const Text('Update')),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: DynamicColor().primarycolor,
                          textStyle:
                              TextStyle(color: DynamicColor().primarycolor)),
                      onPressed: () => exit(0),
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
