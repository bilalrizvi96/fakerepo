import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/SignInEmployeeController.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'AttendenceController.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  // var userdata;
  @override
  void onInit() {
    super.onInit();
    current.value =
        months[selectedmonth.value - 1] + "-" + selectedyear.value.toString();

    // userdata = BaseUrl.storage.read("users");
  }
}
