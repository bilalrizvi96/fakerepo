import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> children = [HomeScreen(), SummaryScreen(), MyProfileScreen()];
  void ItemIndex(index) {
    selectedIndex.value = index;
    update();
  }
}
