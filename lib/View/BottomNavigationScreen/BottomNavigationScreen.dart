import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/BottomNavigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../API/BaseURl.dart';
import '../../Component/SideMenu.dart';
import '../FeedbackScreen/FeedbackScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../MyProfileScreen/MyProfileScreen.dart';
import '../SummaryScreen/SummaryScreen.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: bottomNavigationController,
        builder: (_) {
          return WillPopScope(
              onWillPop: () async {
                bool willLeave = false;
                // show the confirm dialog
                await showDialog(
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
                                  willLeave = true;
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes')),
                            TextButton(
                                style: TextButton.styleFrom(
                                    primary: DynamicColor().primarycolor,
                                    textStyle: TextStyle(
                                        color: DynamicColor().primarycolor)),
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('No'))
                          ],
                        ));
                return willLeave;
              },
              child: Scaffold(
                drawer: SideMenu(),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: DynamicColor().primarycolor,
                  onTap: bottomNavigationController.ItemIndex,
                  unselectedItemColor: Colors.grey[500],
                  currentIndex: bottomNavigationController.selectedIndex.value,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.summarize_outlined),
                      label: 'Summary',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.support_agent),
                      label: 'Support',
                    ),
                  ],
                ),
                body: IndexedStack(
                  index: bottomNavigationController.selectedIndex.value,
                  children: [
                    HomeScreen(),
                    SummaryScreen(),
                    FeedbackScreen(
                      check: true,
                    ),
                    MyProfileScreen(),
                  ],
                ),
              ));
        });
  }
}
