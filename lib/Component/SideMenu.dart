import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/HomeController.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Controller/ScheduleController.dart';
import '../Model/CalendarModel.dart';
import '../Routes/Routes.dart';
import '../View/FeedbackScreen/FeedbackScreen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 20,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: DynamicColor().primarycolor,
                ),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            // if (BaseUrl.storage.read("role") != '')
            //   DrawerListTile(
            //     title: "Check Point",
            //     icon: Icon(Icons.location_on_outlined,
            //         color: DynamicColor().primarycolor),
            //     press: () async {
            //       Get.back();
            //       Get.toNamed('/checkpoint');
            //     },
            //   ),

            if (BaseUrl.storage.read("checkpointaccess") == true)
              DrawerListTile(
                title: "My Profile",
                icon: Icon(Icons.person_outline_sharp,
                    color: DynamicColor().primarycolor),
                press: () async {
                  Get.back();
                  Get.to(
                      () => MyProfileScreen(
                            check: false,
                          ),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInQuart);
                },
              ),
            DrawerListTile(
              title: "My Points",
              icon: Icon(Icons.star_border_outlined,
                  color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed(Routes.mypoints);
              },
            ),
            DrawerListTile(
              title: "My Job Schedule",
              icon: Icon(Icons.schedule_rounded,
                  color: DynamicColor().primarycolor),
              press: () {
                Get.back();
                Get.toNamed(Routes.schedule);
              },
            ),
            if (BaseUrl.storage.read("trackuseraccess") != false)
              DrawerListTile(
                title: "Support",
                press: () {
                  Get.back();
                  Get.to(
                      () => FeedbackScreen(
                            check: false,
                            form: true,
                          ),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInQuart);
                },
                icon: Icon(Icons.support_agent,
                    color: DynamicColor().primarycolor),
              ),
            DrawerListTile(
              title: "Notification",
              icon: Icon(Icons.notification_important_outlined,
                  color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed(Routes.notification);
              },
            ),
            DrawerListTile(
              title: "Help center",
              icon: Icon(Icons.help_outline_sharp,
                  color: DynamicColor().primarycolor),
              press: () {
                BaseUrl.helptype = 'home';
                Get.back();
                Get.toNamed(Routes.faqs);
              },
            ),

            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("V " + BaseUrl.version.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
          ],
        ),
      ),
    );
  }

  // _AppointmentDataSource _getCalendarDataSource() {
  //   List<Appointment> appointments = <Appointment>[];
  //   appointments.add(Appointment(
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now().add(Duration(hours: 1)),
  //     subject: 'Meeting',
  //     color: Colors.blue,
  //   ));
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(Duration(hours: 2)),
  //     endTime: DateTime.now().add(Duration(hours: 3)),
  //     subject: 'Planning',
  //     color: Colors.green,
  //   ));
  //
  //   return _AppointmentDataSource(appointments);
  // }
}

// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
