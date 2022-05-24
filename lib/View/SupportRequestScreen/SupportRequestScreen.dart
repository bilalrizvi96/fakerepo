import 'package:attendencesystem/Controller/FaqsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';

class SupportRequestScreen extends StatelessWidget {
  SupportRequestScreen({Key? key}) : super(key: key);
  FaqsController faqsController = Get.put(FaqsController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Color(0xFFEBEFFF),
          child: GetBuilder(
              init: faqsController,
              builder: (_) {
                return Column(
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
                            child: Icon(Icons.arrow_back_ios,
                                color: Colors.grey[600])),
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          'Support Request',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 16),
                        ),
                        SizedBox(
                          width: width / 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    faqsController.Loading.value == false
                        ? faqsController.supportrequestlist.value.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: faqsController
                                        .supportrequestlist.value.length,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        height: height / 7,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            right: 8.0,
                                            top: 8,
                                            left: 25,
                                            bottom: 8),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: width / 5,
                                                height: height / 7.0,
                                                decoration: BoxDecoration(
                                                    color: DynamicColor()
                                                        .primarycolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: height / 7.0,
                                                width: width / 1.2,
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    top: 5.0,
                                                    right: 8.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.fromBorderSide(
                                                        BorderSide(
                                                            color: Color(
                                                                0xFFDFDFDF))),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // SizedBox(
                                                        //   width: width / 60,
                                                        // ),
                                                        Text(
                                                          '${faqsController.supportrequestlist.value[index].name}',
                                                          style: GoogleFonts.poppins(
                                                              color: DynamicColor()
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  width / 25),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '${faqsController.supportrequestlist.value[index].time}',
                                                          style: GoogleFonts.poppins(
                                                              color: DynamicColor()
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize:
                                                                  width / 28),
                                                        ),
                                                        SizedBox(
                                                          width: width / 60,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      '#${faqsController.supportrequestlist.value[index].ticketNo}',
                                                      style: GoogleFonts.poppins(
                                                          color: DynamicColor()
                                                              .primarycolor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: width / 35),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${faqsController.supportrequestlist.value[index].message.toString()}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    DynamicColor()
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    width /
                                                                        30.2),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (faqsController
                                                    .supportrequestlist
                                                    .value[index]
                                                    .image !=
                                                '')
                                              Positioned(
                                                top: height / 14,
                                                right: width / 30,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder:
                                                            (_) => AlertDialog(
                                                                  actions: [
                                                                    Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: GestureDetector(
                                                                            onTap: () {
                                                                              Get.back();
                                                                            },
                                                                            child: Icon(Icons.clear)),
                                                                      ),
                                                                    ),
                                                                    Image.network(
                                                                        faqsController
                                                                            .supportrequestlist
                                                                            .value[
                                                                                index]
                                                                            .image,
                                                                        fit: BoxFit
                                                                            .cover)
                                                                  ],
                                                                ));
                                                  },
                                                  child: Container(
                                                    width: width / 3.3,
                                                    height: height / 20,
                                                    decoration: BoxDecoration(
                                                        color: DynamicColor()
                                                            .primarycolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    18.0)),
                                                    child: Row(
                                                      children: [
                                                        Spacer(),
                                                        Icon(
                                                          Icons
                                                              .attach_file_outlined,
                                                          color: Colors.white,
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          'Attachments',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      width /
                                                                          35),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height / 15,
                                  ),
                                  Image.asset('assets/nodatafound.png'),
                                  // Spacer(),
                                  Text(
                                    "No Data Found",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black.withOpacity(0.50),
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 22),
                                  ),
                                  // Spacer(),
                                ],
                              )
                        : Center(
                            child: Image.asset(
                              "assets/1.gif",
                              height: 200,
                              width: 200,
                            ),
                          ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
