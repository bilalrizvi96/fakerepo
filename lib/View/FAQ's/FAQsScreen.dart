import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/FaqsController.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FAQsDetailScreen.dart';

class FAQsScreen extends StatelessWidget {
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/faqsbg.png'), fit: BoxFit.cover)),
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
                          'F.A.Q\'s',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 12,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25.0,
                          left: 25.0,
                        ),
                        child: ListView.builder(
                            itemCount: faqsController.faqlist.value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: GestureDetector(
                                  onTap: faqsController.faqlist.value[index]
                                              .subQuestion !=
                                          null
                                      ? () {
                                          Get.to(() => FAQsDetailScreen(
                                                index: faqsController.faqlist
                                                    .value[index].subQuestion,
                                                title: faqsController
                                                    .faqlist.value[index].label,
                                              ));
                                        }
                                      : () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: width / 1.23,
                                      height: height / 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 4,
                                              blurRadius: 6,
                                              offset: Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Icon(Icons.perm_contact_cal_rounded,
                                              color:
                                                  DynamicColor().primarycolor),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            faqsController
                                                .faqlist.value[index].label,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width / 22),
                                          ),
                                          Spacer(),
                                          Icon(Icons.arrow_forward_ios_sharp,
                                              size: 30,
                                              color:
                                                  DynamicColor().primarycolor),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
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
