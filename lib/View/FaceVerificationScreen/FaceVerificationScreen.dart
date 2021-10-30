import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/FaceVerificationController.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                                  2.18,
                              child: CameraPreview(
                                faceVerificationController.camera!,
                              ),
                            ),
                            Image.asset(
                              'assets/overlay.png',
                              fit: BoxFit.contain,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: faceVerificationController
                                          .btnvissiblity.value ==
                                      false
                                  ? GestureDetector(
                                      onTap: () {
                                        faceVerificationController
                                            .buttonpress();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                          width: width / 1.2,
                                          height: height / 15,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            'Ready'.toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: DynamicColor().black),
                                          )),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container();
              })),
    );
  }
}
// CameraPreview(_camera!)
