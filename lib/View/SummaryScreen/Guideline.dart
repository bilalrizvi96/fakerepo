import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';

import '../../Controller/SummaryController.dart';

class InformationBottom extends StatelessWidget {
  InformationBottom({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  SummaryController summaryController = Get.put(SummaryController());
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topRight,
                colors: DynamicColor().gradient),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width / 10,
              ),
              Text(
                'Points Guideline',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: width / 20),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: width / 12,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: width / 12,
                ),
              ),
              SizedBox(
                width: width / 15,
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: summaryController.summaryguidelinelist.value.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: Container(
                      height: height / 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width / 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                summaryController
                                    .summaryguidelinelist.value[index].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width / 26),
                              ),
                              Container(
                                width: width / 2,
                                child: Text(
                                  summaryController.summaryguidelinelist
                                      .value[index].decription,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: width / 31),
                                ),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: width / 8,
                            height: height / 19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(int.parse(summaryController
                                      .summaryguidelinelist
                                      .value[index]
                                      .textcolor))),
                              color: Color(int.parse(summaryController
                                  .summaryguidelinelist.value[index].color)),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              summaryController
                                  .summaryguidelinelist.value[index].point,
                              style: GoogleFonts.poppins(
                                  color: Color(int.parse(summaryController
                                      .summaryguidelinelist
                                      .value[index]
                                      .textcolor)),
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24),
                            ),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
