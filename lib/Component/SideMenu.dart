import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            DrawerListTile(
              title: "Help center",
              icon: Icon(Icons.help, color: DynamicColor().primarycolor),
              press: () {
                Get.back();
                Get.toNamed('/faqs');
              },
            ),
            DrawerListTile(
              title: "My Points",
              icon: Icon(Icons.star, color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed('/mypoints');
              },
            ),
            if (BaseUrl.storage.read("role") != '')
              DrawerListTile(
                title: "Track",
                icon: Icon(Icons.location_searching,
                    color: DynamicColor().primarycolor),
                press: () async {
                  Get.back();
                  Get.toNamed('/trackuser');
                },
              ),
            if (BaseUrl.storage.read("checkpointaccess") != false)
              DrawerListTile(
                title: "Check Point",
                press: () {
                  Get.back();
                  Get.toNamed('/checkpoint');
                },
                icon:
                    Icon(Icons.location_on, color: DynamicColor().primarycolor),
              ),
            DrawerListTile(
              title: "Profile",
              icon: Icon(Icons.person, color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed('/profile');
              },
            ),
            DrawerListTile(
              title: "Notification",
              icon: Icon(Icons.notification_important,
                  color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed('/notification');
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
                        color: DynamicColor().black)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
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
