import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../View/FeedbackScreen/FeedbackScreen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
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
                  Get.toNamed('/profile');
                },
              ),
            DrawerListTile(
              title: "My Points",
              icon: Icon(Icons.star_border_outlined,
                  color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed('/mypoints');
              },
            ),
            if (BaseUrl.storage.read("role") != '')
              DrawerListTile(
                title: "Support",
                press: () {
                  Get.back();
                  Get.to(
                      () => FeedbackScreen(
                            check: true,
                            form: false,
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
                Get.toNamed('/notification');
              },
            ),
            DrawerListTile(
              title: "Help center",
              icon: Icon(Icons.help_outline_sharp,
                  color: DynamicColor().primarycolor),
              press: () {
                BaseUrl.helptype = 'home';
                Get.back();
                Get.toNamed('/faqs');
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
              height: MediaQuery.of(context).size.width / 30,
            ),
          ],
        ),
      ),
    );
  }
}

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
