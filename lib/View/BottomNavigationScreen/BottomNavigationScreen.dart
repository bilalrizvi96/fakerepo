import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/BottomNavigationController.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../API/BaseURl.dart';
import '../../Component/SideMenu.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        bottomNavigationController.check();
        // bottomNavigationController.dashboardData();
      }
    });
    bottomNavigationController.check();
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
                key: bottomNavigationController.scaffoldKey,
                drawer: bottomNavigationController.connection == true
                    ? SideMenu()
                    : Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: width / 15,
                                )),
                            SizedBox(
                              height: height / 40,
                            ),
                            Image.asset('assets/nointernet.gif'),
                          ],
                        ),
                      ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: DynamicColor().primarycolor,
                  onTap: bottomNavigationController.ItemIndex,
                  unselectedItemColor: Colors.grey[500],
                  currentIndex: bottomNavigationController.selectedIndex.value,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.summarize_outlined),
                      label: 'Summary',
                    ),
                    BaseUrl.storage.read("trackuseraccess") == true
                        ? BottomNavigationBarItem(
                            icon: Icon(Icons.remove_red_eye_rounded),
                            label: 'Track Staff',
                            // icon: Icon(Icons.support_agent),
                            // label: 'Support',
                          )
                        : BaseUrl.storage.read("checkpointaccess") == true
                            ? BottomNavigationBarItem(
                                icon: Icon(Icons.location_on_outlined),
                                label: 'CheckPoint',
                              )
                            : BottomNavigationBarItem(
                                icon: Icon(Icons.support_agent),
                                label: 'Support',
                              ),
                    BaseUrl.storage.read("checkpointaccess") == true &&
                            BaseUrl.storage.read("trackuseraccess") == false
                        ? BottomNavigationBarItem(
                            icon: Icon(Icons.support_agent),
                            label: 'Support',
                          )
                        : BaseUrl.storage.read("checkpointaccess") == true
                            ? BottomNavigationBarItem(
                                icon: Icon(Icons.location_on_outlined),
                                label: 'CheckPoint',
                              )
                            : BottomNavigationBarItem(
                                icon: Icon(Icons.person_outline_sharp),
                                label: 'My Profile',
                              )
                  ],
                ),
                body: bottomNavigationController.widgetChildren[
                    bottomNavigationController.selectedIndex.value],
              ));
        });
  }
}
