import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/FaceVerificationController.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceVerficationScreen extends StatelessWidget {
  FaceVerificationController faceVerificationController =
      Get.put(FaceVerificationController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: GetBuilder(
              init: faceVerificationController,
              builder: (context) {
                return faceVerificationController.check.value == true
                    ? Container(
                        width: width,
                        height: height,
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: faceVerificationController
                                      .camera!.value.aspectRatio /
                                  2.5,
                              child: CameraPreview(
                                faceVerificationController.camera!,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/overlay.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   width: width / 1.3,
                            //   height: height / 1323,
                            //   decoration: BoxDecoration(
                            //     color: DynamicColor().primarycolor,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    : Container();
              })),
    );
  }
}
// CameraPreview(_camera!)
