import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/BottomNavigationController.dart';
import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: bottomNavigationController,
        builder: (_) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: DynamicColor().primarycolor,
              onTap: bottomNavigationController.ItemIndex,
              currentIndex: bottomNavigationController.selectedIndex.value,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'DashBoard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.summarize_outlined),
                  label: 'Summary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
            body: bottomNavigationController.children
                .elementAt(bottomNavigationController.selectedIndex.value),
          );
        });
  }
}
