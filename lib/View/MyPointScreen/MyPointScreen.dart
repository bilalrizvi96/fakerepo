import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/MyPointController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SummaryScreen/SummaryScreen.dart';

class MyPointScreen extends StatelessWidget {
  const MyPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPointController myPointController = Get.put(MyPointController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/faqsbg.png'), fit: BoxFit.cover)),
        child: GetBuilder(
            init: myPointController,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(

                  children: [
                    Column(
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
                              'My Points',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 16),
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: width,
                          height: height / 1.35,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 6,
                              ),
                              myPointController.Loading.value == false
                                  ? Expanded(
                                      child: Container(
                                        width: width,
                                        height: height,
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 5, right: 20),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.60)),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: myPointController
                                                .mypointlist.value.isNotEmpty
                                            ? ListView.builder(
                                                itemCount: myPointController
                                                    .mypointlist.value.length,
                                                itemBuilder: (_, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 20,
                                                      ),
                                                      Text(
                                                        myPointController
                                                                .mypointlist
                                                                .value
                                                                .isNotEmpty
                                                            ? '${myPointController.mypointlist.value[index].date}'
                                                            : '',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                                fontSize:
                                                                    width / 35),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              myPointController
                                                                      .mypointlist
                                                                      .value
                                                                      .isNotEmpty
                                                                  ? '${myPointController.mypointlist.value[index].walletTitle}'
                                                                  : '',
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      width /
                                                                          26),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            myPointController
                                                                    .mypointlist
                                                                    .value
                                                                    .isNotEmpty
                                                                ? '${myPointController.mypointlist.value[index].points}'
                                                                : '',
                                                            style: GoogleFonts.poppins(
                                                                color: Color(int.parse(
                                                                    myPointController
                                                                        .mypointlist
                                                                        .value[
                                                                            index]
                                                                        .color)),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    width / 22),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                    ],
                                                  );
                                                })
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: height / 15,
                                                  ),
                                                  Image.asset(
                                                      'assets/nodatafound.png'),
                                                  // Spacer(),
                                                  Text(
                                                    "No Data Found",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black
                                                            .withOpacity(0.50),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width / 22),
                                                  ),
                                                  // Spacer(),
                                                ],
                                              ),
                                      ),
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
                        )
                      ],
                    ),
                    Positioned(
                        top: height / 2.8,
                        right: width / 3.5,
                        left: width / 3.5,
                        child: Container(
                          width: 100,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              gradient: new LinearGradient(
                                  colors: [
                                    Color(0xFFEC4A22),
                                    Color(0xFFF2892C),
                                  ],
                                  stops: [
                                    0.6,
                                    2.2
                                  ],
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.topLeft,
                                  tileMode: TileMode.mirror),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            'Point History',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: width / 24),
                          ),
                        )),
                    Positioned(
                      top: height / 7,
                      right: width / 10,
                      left: width / 10,
                      child: Container(
                        width: width / 1.3,
                        height: height / 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage('assets/mypointbg.png'),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 35,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${BaseUrl.storage.read('name').toString().split(' ')[0] + ' ' + BaseUrl.storage.read('name').toString().split(' ')[1]}',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: width / 21),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.white30,
                                          size: width / 26,
                                        ),
                                        SizedBox(
                                          width: width / 40,
                                        ),
                                        Text(
                                          '${BaseUrl.storage.read('empCode')}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white30,
                                              fontSize: width / 28),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Points',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: width / 30),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${BaseUrl.storage.read('points')}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: width / 16),
                                        ),
                                        SizedBox(
                                          width: width / 40,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellowAccent,
                                          size: width / 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: width / 35,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 35,
                                ),
                                Container(
                                  width: width / 4.5,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(
                                        Icons.stars_sharp,
                                        size: width / 25,
                                        color: Colors.purple,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Basic',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.purple,
                                            fontSize: width / 28),
                                      ),
                                      Spacer(),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                        InformationBottom(
                                            height: height, width: width),
                                        elevation: 20.0,
                                        enableDrag: false,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        )));
                                  },
                                  child: Icon(
                                    Icons.help_outline,
                                    size: width / 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width / 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
