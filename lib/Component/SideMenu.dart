import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: DynamicColor().primarycolor,
              ),
              child: Image.asset('assets/logo.png'),
            ),
            // DrawerListTile(
            //   title: "Help center",
            //   icon: Icon(Icons.help, color: DynamicColor().primarycolor),
            //   press: () {
            //     Get.back();
            //     Get.toNamed('/faqs');
            //   },
            // ),
            DrawerListTile(
              title: "My Points",
              icon: Icon(Icons.star, color: DynamicColor().primarycolor),
              press: () async {
                Get.back();
                Get.toNamed('/mypoints');
              },
            ),
            // DrawerListTile(
            //   title: "Sites",
            //   imgSrc: "assets/images/managesites.png",
            //   press: () {},
            // ),

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
