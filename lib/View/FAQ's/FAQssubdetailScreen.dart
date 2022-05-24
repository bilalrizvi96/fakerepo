import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';
import '../../Controller/FaqsController.dart';
import '../FeedbackScreen/FeedbackScreen.dart';
import 'FaqsAnsScreen.dart';

class FAQssubdetailScreen extends StatelessWidget {
  var index, title, subtittle, check;

  FAQssubdetailScreen({this.index, this.title, this.subtittle, this.check});
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
                    border: Border.all(color: DynamicColor().primarycolor),
                    borderRadius: BorderRadius.circular(9.0),
                    color: Color(0xFFECF7FF)),
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
                          onTap: () {
                            print(index[indexs].form);
                            index[indexs].form == 'false'
                                ? Get.to(
                                    () => FaqsAnsScreen(
                                          index: index[indexs],
                                          title: title.toString(),
                                          subtittle: index[indexs].label,
                                          form: index[indexs].form,
                                          answer: index[indexs].answer,
                                        ),
                                    transition: Transition.rightToLeft,
                                    curve: Curves.easeInQuart)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeedbackScreen(
                                              check: true,
                                              form: true,
                                            )),
                                  );
                            // Get.to(() => FAQsDetailScreen(
                            //       index: faqsController
                            //           .faqlist.value[index].subcat,
                            //     ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 1.23,
                              height: height / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width / 120,
                                        ),
                                        Expanded(
                                          child: Text(
                                            index[indexs].label,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: width / 27),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            size: 20,
                                            color: DynamicColor().primarycolor),
                                        SizedBox(
                                          width: width / 20,
                                        ),
                                      ],
                                    ),
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
