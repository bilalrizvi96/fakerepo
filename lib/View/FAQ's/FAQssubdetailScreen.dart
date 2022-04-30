import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';
import '../../Controller/FaqsController.dart';

class FAQssubdetailScreen extends StatelessWidget {
  var index, title;
  FaqsController faqsController = Get.put(FaqsController());
  FAQssubdetailScreen({this.index, this.title});
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
                            Get.bottomSheet(
                              Bottom(index: index[indexs], height: height),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      index[indexs].title,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 27),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_sharp,
                                      size: 30,
                                      color: DynamicColor().primarycolor),
                                  SizedBox(
                                    width: width / 20,
                                  ),
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

  Container Bottom({var index, var height}) {
    return Container(
      height: 700,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height / 12,
          ),
          Text(
            "${index.title}",
            style: GoogleFonts.poppins(
                color: Color(0xFFEE696A),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${index.subString}',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
