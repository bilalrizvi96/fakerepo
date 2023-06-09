import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/NoInternet.dart';
import 'package:attendencesystem/Controller/SignInEmployeeController.dart';
import 'package:attendencesystem/View/FeedbackScreen/FeedbackScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/ErrorLoading.dart';
import '../../Routes/Routes.dart';

class SiginEmployeeScreen extends StatelessWidget {
  SignInEmployeeController signinController =
      Get.put(SignInEmployeeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    signinController.check();
    DataConnectionChecker().onStatusChange.listen((status) async {
      signinController.check();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder(
          init: signinController,
          builder: (_) {
            return DelayedDisplay(
                delay: Duration(milliseconds: 400),
                fadeIn: true,
                slidingCurve: Curves.decelerate,
                child: Container(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Image.asset(
                            'assets/sigin.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 160),
                          child: Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50.0),
                                    topLeft: Radius.circular(50.0)),
                                color: Color(0xFFEBEFFF)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 10),
                          child: Form(
                            key: signinController.loginFormKey,
                            child: signinController.Loading.value == false
                                ? Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: height / 4.5,
                                          ),
                                          // SizedBox(
                                          //   height: height / 80,
                                          // ),
                                          DelayedDisplay(
                                            delay: Duration(milliseconds: 1500),
                                            slidingCurve: Curves.bounceInOut,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width / 80,
                                                  height: height / 15,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                ),
                                                Container(
                                                  width: width / 1.22,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    controller: signinController
                                                        .empcodeController,
                                                    validator: signinController
                                                        .validators,
                                                    onTap: () {
                                                      if (signinController
                                                              .connection
                                                              .value ==
                                                          false) {
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                        if (Get.isBottomSheetOpen ==
                                                            false)
                                                          WidgetsBinding
                                                              .instance!
                                                              .addPostFrameCallback(
                                                                  (duration) async {
                                                            return Get
                                                                .bottomSheet(
                                                              Container(
                                                                height: 700,
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20.0)),
                                                                  // image: DecorationImage(
                                                                  //   image: NetworkImage(image),
                                                                  //   fit: BoxFit.cover,
                                                                  // )
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: NoInternet(
                                                                    height:
                                                                        height,
                                                                    width:
                                                                        width),
                                                              ),
                                                            );
                                                          });
                                                      }
                                                    },
                                                    readOnly: signinController
                                                        .read.value,
                                                    cursorColor: DynamicColor()
                                                        .primarycolor,
                                                    style: GoogleFonts.poppins(
                                                        color: DynamicColor()
                                                            .primarycolor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    decoration:
                                                        new InputDecoration(
                                                            hintText: signinController
                                                                        .read
                                                                        .value !=
                                                                    false
                                                                ? BaseUrl.storage
                                                                    .read(
                                                                        "empCode")
                                                                    .toString()
                                                                : 'Employee Code',
                                                            focusColor:
                                                                DynamicColor()
                                                                    .primarycolor,
                                                            hoverColor:
                                                                DynamicColor()
                                                                    .primarycolor,
                                                            suffixIcon:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      signinController
                                                                          .empcodeUpdate();
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .clear)),
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border: InputBorder
                                                                .none),
                                                    // keyboardType: TextInputType.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // signinController.check();
                                              // if (signinController
                                              //         .connection ==
                                              //     true) {
                                              //   signinController.checkOption();
                                              // } else {
                                              //   WidgetsBinding.instance!
                                              //       .addPostFrameCallback(
                                              //           (duration) async {
                                              //     return Get.bottomSheet(
                                              //       Container(
                                              //         height: 700,
                                              //         alignment: Alignment
                                              //             .bottomCenter,
                                              //         decoration: BoxDecoration(
                                              //           color: Colors.white,
                                              //           borderRadius:
                                              //               BorderRadius.only(
                                              //                   topLeft: Radius
                                              //                       .circular(
                                              //                           20.0),
                                              //                   topRight: Radius
                                              //                       .circular(
                                              //                           20.0)),
                                              //           // image: DecorationImage(
                                              //           //   image: NetworkImage(image),
                                              //           //   fit: BoxFit.cover,
                                              //           // )
                                              //         ),
                                              //         padding:
                                              //             const EdgeInsets.all(
                                              //                 8.0),
                                              //         child: Column(
                                              //           crossAxisAlignment:
                                              //               CrossAxisAlignment
                                              //                   .center,
                                              //           mainAxisAlignment:
                                              //               MainAxisAlignment
                                              //                   .end,
                                              //           children: [
                                              //             Text(
                                              //               "",
                                              //               style: GoogleFonts.poppins(
                                              //                   color: Color(
                                              //                       0xFFEE696A),
                                              //                   fontWeight:
                                              //                       FontWeight
                                              //                           .bold,
                                              //                   fontSize: 25),
                                              //             ),
                                              //             SizedBox(
                                              //               height: 20,
                                              //             ),
                                              //             Padding(
                                              //               padding:
                                              //                   const EdgeInsets
                                              //                       .all(8.0),
                                              //               child: Text(
                                              //                 '',
                                              //                 textAlign:
                                              //                     TextAlign
                                              //                         .center,
                                              //                 style: GoogleFonts.poppins(
                                              //                     fontWeight:
                                              //                         FontWeight
                                              //                             .w500,
                                              //                     fontSize: 12),
                                              //               ),
                                              //             ),
                                              //             SizedBox(
                                              //               height: 50,
                                              //             ),
                                              //           ],
                                              //         ),
                                              //       ),
                                              //     );
                                              //   });
                                              // }
                                            },
                                            child: Container(
                                                width: width / 3.1,
                                                height: height / 5.3,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                padding: EdgeInsets.all(25.0),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/face.png',
                                                  fit: BoxFit.scaleDown,
                                                  height: height / 2,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Icon(Icons
                                                          .image_not_supported_outlined),
                                                )
                                                // Image.network(
                                                //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/face.png',
                                                //   fit: BoxFit.scaleDown,
                                                //   height: height / 2,
                                                // ),
                                                ),
                                          ),

                                          SizedBox(
                                            height: height / 13,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (!Get.isSnackbarOpen) {
                                                signinController.siginbtn();
                                              }
                                            },
                                            child: Container(
                                              width: width / 1.2,
                                              height: height / 15,
                                              decoration: BoxDecoration(
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                'Submit'.toUpperCase(),
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        DynamicColor().white),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 50,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              signinController.check();
                                              if (signinController
                                                      .connection.value ==
                                                  true) {
                                                Get.toNamed(
                                                    Routes.registration);
                                              } else {
                                                WidgetsBinding.instance!
                                                    .addPostFrameCallback(
                                                        (duration) async {
                                                  if (Get.isBottomSheetOpen ==
                                                      false)
                                                    return Get.bottomSheet(
                                                      Container(
                                                        height: 700,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0)),
                                                          // image: DecorationImage(
                                                          //   image: NetworkImage(image),
                                                          //   fit: BoxFit.cover,
                                                          // )
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: NoInternet(
                                                            height: height,
                                                            width: width),
                                                      ),
                                                    );
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: width / 1.2,
                                              height: height / 15,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          DynamicColor().black),
                                                  // color: DynamicColor().primarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                'Register'.toUpperCase(),
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        DynamicColor().black),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 8,
                                          ),

                                          Row(
                                            children: [
                                              SizedBox(
                                                width: width / 15,
                                              ),
                                              // Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      FeedbackScreen(
                                                        check: false,
                                                        form: false,
                                                      ),
                                                      transition: Transition
                                                          .rightToLeft,
                                                      curve:
                                                          Curves.easeInQuart);
                                                },
                                                child: Image.asset(
                                                  'assets/feedbackicon.png',
                                                  height: height / 35,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                  "V " +
                                                      BaseUrl.version
                                                          .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                      color: DynamicColor()
                                                          .primarycolor)),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  BaseUrl.helptype = 'login';
                                                  Get.toNamed(
                                                    Routes.faqs,
                                                  );
                                                },
                                                child: Image.asset(
                                                  'assets/faqsicon.png',
                                                  height: height / 35,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 15,
                                              ),
                                              // Spacer(),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height / 80,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 90.0),
                                          child: FloatingActionButton(
                                              heroTag: 'btn1',
                                              backgroundColor:
                                                  DynamicColor().primarycolor,
                                              elevation: 5.0,
                                              hoverElevation: 20,
                                              onPressed: () {
                                                signinController.check();
                                                if (signinController
                                                        .connection.value ==
                                                    true) {
                                                  signinController
                                                      .checkOption();
                                                } else {
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                          (duration) async {
                                                    Get.back();
                                                    if (Get.isBottomSheetOpen ==
                                                        false)
                                                      return Get.bottomSheet(
                                                        Container(
                                                          height: 700,
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0)),
                                                            // image: DecorationImage(
                                                            //   image: NetworkImage(image),
                                                            //   fit: BoxFit.cover,
                                                            // )
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: NoInternet(
                                                              height: height,
                                                              width: width),
                                                        ),
                                                      );
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                  Icons.arrow_forward_ios)),
                                        ),
                                      ),
                                    ],
                                  )
                                : ErrorLoading(height: 300.0, width: 300.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
