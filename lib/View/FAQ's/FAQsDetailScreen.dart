import 'package:attendencesystem/View/FAQ\'s/FaqsAnsScreen.dart';
import 'package:attendencesystem/View/FeedbackScreen/FeedbackScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';

import '../../Controller/FaqsController.dart';
import 'FAQssubdetailScreen.dart';

class FAQsDetailScreen extends StatelessWidget {
  var index, title;
  var check;

  FaqsController faqsController = Get.put(FaqsController());
  FAQsDetailScreen({this.index, this.title, this.check});
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                    left: 25.0,
                  ),
                  child: ListView.builder(
                      itemCount: index.length,
                      itemBuilder: (context, indexs) {
                        return GestureDetector(
                          onTap: index[indexs].furtherSubQuestion != null
                              ? () {
                                  // Get.bottomSheet(
                                  //   Bottom(index: index[indexs].subsubcat),
                                  // );
                                  Get.to(
                                      () => FAQssubdetailScreen(
                                            index: index[indexs]
                                                .furtherSubQuestion,
                                            title: title.toString(),
                                            subtittle: index[indexs].label,
                                            check: check,
                                          ),
                                      transition: Transition.rightToLeft,
                                      curve: Curves.easeInQuart);
                                }
                              : () {
                                  // print(index[indexs].form);
                                  // print(index[indexs].answer);
                                  index[indexs].form == 'false'
                                      ? index[indexs].answer != ''
                                          ? Get.to(
                                              () => FaqsAnsScreen(
                                                    index: index[indexs],
                                                    title: title.toString(),
                                                    subtittle:
                                                        index[indexs].label,
                                                    form: index[indexs].form,
                                                    answer:
                                                        index[indexs].answer,
                                                  ),
                                              transition:
                                                  Transition.rightToLeft,
                                              curve: Curves.easeInQuart)
                                          : Get.toNamed('/mypoints')
                                      : Get.to(
                                          FeedbackScreen(
                                            check: true,
                                            form: true,
                                            label: index[indexs].label,
                                          ),
                                          transition: Transition.rightToLeft,
                                          curve: Curves.easeInQuart);
                                },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 1.23,
                              // height: height / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // SizedBox(
                                      //   width: width / 120,
                                      // ),
                                      Expanded(
                                        child: Text(
                                          index[indexs].label,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: width / 27),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 20,
                                      ),
                                      Icon(Icons.arrow_forward_ios_sharp,
                                          size: 20,
                                          color: DynamicColor().primarycolor),
                                      SizedBox(
                                        width: width / 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 40,
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
