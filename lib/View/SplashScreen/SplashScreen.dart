import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    splashController.context = context;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
          init: splashController,
          builder: (_) {
            return Container(
              width: width,
              height: height,
              color: DynamicColor().primarycolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/Splash.png',
                    fit: BoxFit.cover,
                    height: height / 4,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
