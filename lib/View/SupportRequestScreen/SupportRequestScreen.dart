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
      body: Container(
        width: width,
        height: height,
        color: Color(0xFFEBEFFF),
        child: GetBuilder(
            init: faqsController,
            builder: (_) {
              return Padding(
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
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            right: 20,
                                            top: 8,
                                            left: 25,
                                            bottom: 15),
                                        child: Container(
                                          width: width / 1.2,
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              top: 10.0,
                                              bottom: 12,
                                              right: 12.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.fromBorderSide(
                                                  BorderSide(
                                                      color:
                                                          Color(0xFFDFDFDF))),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
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
                                                    '#${faqsController.supportrequestlist.value[index].ticketNo}',
                                                    style: GoogleFonts.poppins(
                                                        color: DynamicColor()
                                                            .primarycolor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width / 25),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        color: faqsController
                                                                    .supportrequestlist
                                                                    .value[
                                                                        index]
                                                                    .resolved ==
                                                                false
                                                            ? Colors.red
                                                            : Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50.0)),
                                                  ),

                                                  //
                                                  SizedBox(
                                                    width: width / 60,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                '${faqsController.supportrequestlist.value[index].message.toString()}',
                                                style: GoogleFonts.poppins(
                                                    color: DynamicColor().black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: width / 30.2),
                                              ),
                                              SizedBox(
                                                height: height / 80,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${faqsController.supportrequestlist.value[index].time}',
                                                      style: GoogleFonts.poppins(
                                                          color: DynamicColor()
                                                              .primarycolor,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: width / 33),
                                                    ),
                                                    SizedBox(
                                                      width: width / 60,
                                                    ),
                                                    Text(
                                                      '${faqsController.supportrequestlist.value[index].date}',
                                                      style: GoogleFonts.poppins(
                                                          color: DynamicColor()
                                                              .primarycolor,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: width / 33),
                                                    ),
                                                    Spacer(),
                                                    if (faqsController
                                                            .supportrequestlist
                                                            .value[index]
                                                            .image !=
                                                        '')
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false,
                                                              builder: (_) =>
                                                                  AlertDialog(
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
                                                                              .value[index]
                                                                              .image,
                                                                          fit: BoxFit.cover)
                                                                    ],
                                                                  ));
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          decoration: BoxDecoration(
                                                              color: DynamicColor()
                                                                  .primarycolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0)),
                                                          child: Icon(
                                                            Icons
                                                                .attach_file_outlined,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
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
                ),
              );
            }),
      ),
    );
  }
}
