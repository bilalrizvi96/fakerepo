import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var connection = true.obs;
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

  List<Widget> children = [HomeScreen(), SummaryScreen(), MyProfileScreen()];
  void ItemIndex(index) {
    selectedIndex.value = index;
    update();
  }
}
