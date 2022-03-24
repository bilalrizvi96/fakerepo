import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/BottomNavigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
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
            child: bottomNavigationController.connection == true
                ? Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: DynamicColor().primarycolor,
                      onTap: bottomNavigationController.ItemIndex,
                      unselectedItemColor: Colors.grey[500],
                      currentIndex:
                          bottomNavigationController.selectedIndex.value,
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
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person_outline),
                          label: 'Profile',
                        ),
                        // BottomNavigationBarItem(
                        //   icon: Icon(Icons.location_on_outlined),
                        //   label: 'CheckPoint',
                        // ),
                      ],
                    ),
                    body: bottomNavigationController.children.elementAt(
                        bottomNavigationController.selectedIndex.value),
                  )
                : Scaffold(
                    body: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/oops.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          Text(
                            "OOPS",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.59),
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 12),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 22,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "No Internet Connection found.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.59),
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 22,
                          ),
                          GestureDetector(
                            onTap: () {
                              bottomNavigationController.check();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  color: DynamicColor().primarycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Try Again'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
