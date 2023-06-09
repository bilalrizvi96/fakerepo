import 'dart:io';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';
import '../../Controller/FaqsController.dart';
import '../../Controller/FeedbackController.dart';

class FaqsAnsScreen extends StatelessWidget {
  var index, title, subtittle, form, answer;
  FaqsAnsScreen(
      {this.index, this.subtittle, this.title, this.form, this.answer});

  @override
  Widget build(BuildContext context) {
    print(form);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/faqsbg.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child:
                          Icon(Icons.arrow_back_ios, color: Colors.grey[600])),
                  SizedBox(
                    width: width / 20,
                  ),
                  Text(
                    title.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: width / 16),
                  ),
                ],
              ),
              SizedBox(
                height: height / 12,
              ),
              Container(
                width: width / 1.2,
                height: height / 9.0,
                padding: const EdgeInsets.only(left: 20, right: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE5D0B4)),
                    borderRadius: BorderRadius.circular(9.0),
                    color: Color(0xFFFFF7EC)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${subtittle}",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: width / 28),
                  ),
                ),
              ),
              SizedBox(
                height: height / 40,
              ),

              Column(
                children: [
                  Container(
                    width: width / 1.2,
                    // height: height / 5.5,
                    padding: EdgeInsets.only(right: 12, left: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: DynamicColor().primarycolor),
                        borderRadius: BorderRadius.circular(9.0),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
                        // Spacer(),
                        Icon(
                          Icons.info_outline_rounded,
                          size: width / 16,
                          color: DynamicColor().primarycolor,
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Text(
                          "${answer}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 28),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ],
              )
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //       right: 25.0,
              //       left: 25.0,
              //     ),
              //     child: ListView.builder(
              //         itemCount: index.length,
              //         itemBuilder: (context, indexs) {
              //           return GestureDetector(
              //             onTap: () {
              //               // Get.to(() => FAQsDetailScreen(
              //               //       index: faqsController
              //               //           .faqlist.value[index].subcat,
              //               //     ));
              //             },
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Container(
              //                 width: width / 1.23,
              //                 height: height / 10,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(13.0),
              //                 ),
              //                 child: Column(
              //                   children: [
              //                     Expanded(
              //                       child: Row(
              //                         children: [
              //                           SizedBox(
              //                             width: width / 120,
              //                           ),
              //                           Expanded(
              //                             child: Text(
              //                               index[indexs].label,
              //                               style: GoogleFonts.poppins(
              //                                   fontWeight: FontWeight.w600,
              //                                   fontSize: width / 27),
              //                             ),
              //                           ),
              //                           Spacer(),
              //                           Icon(Icons.arrow_forward_ios_sharp,
              //                               size: 20,
              //                               color: DynamicColor().primarycolor),
              //                           SizedBox(
              //                             width: width / 20,
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: height / 40,
              //                     ),
              //                     Divider(),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
