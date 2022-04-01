import 'dart:convert';
import 'dart:io';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/CheckPointController.dart';

class HistoryCheckPointScreen extends StatelessWidget {
  HistoryCheckPointScreen({Key? key}) : super(key: key);
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: _checkPointController.printScreen,
      ),
      body: Container(
        height: height,
        width: width,
        color: Color(0xFFEBEFFF),
        child: GetBuilder(
            init: _checkPointController,
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    width: width,
                    height: height / 15,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width / 1.5,
                          height: height / 15,
                          child: TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            autofocus: false,

                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: width / 30,
                                color: DynamicColor()
                                    .titletextcolor
                                    .withOpacity(0.4)),

                            decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.6),
                                    width: 1.0,
                                  ),
                                ),
                                hintText: 'Search for Project',
                                focusColor: DynamicColor().primarycolor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hoverColor: DynamicColor().primarycolor,
                                prefixIcon: Icon(Icons.search_outlined,
                                    color: Colors.grey[400]),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none

                                //fillColor: Colors.green
                                ),
                            onChanged: (val) {
                              FocusScope.of(context).nextFocus();
                              _checkPointController.search(val);
                            },
                            // keyboardType: TextInputType.none,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true, onConfirm: (date) {
                                _checkPointController.toDate(date);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(
                                'assets/filter.png',
                                // width: width / 12,
                                // height: height / 14,
                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Text(
                          _checkPointController.finaldate.value.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 32,
                              color: DynamicColor()
                                  .titletextcolor
                                  .withOpacity(0.4)),
                        ),
                      )),
                  SizedBox(
                    height: height / 40,
                  ),
                  _checkPointController.Loading.value == false
                      ? RepaintBoundary(
                          key: _checkPointController.printKey,
                          child: Expanded(
                            child: _checkPointController
                                    .historyList.value.isNotEmpty
                                ? ListView.builder(
                                    itemCount: _checkPointController
                                        .historyList.value.length,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: width / 1.2,
                                                height: height / 3.8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: width / 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20.0),
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            color:
                                                                DynamicColor()
                                                                    .white),
                                                        child: Text(
                                                          "${index + 1}",
                                                          style: GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  width / 32,
                                                              color: DynamicColor()
                                                                  .primarycolor),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Container(
                                                        width: width / 6,
                                                        height: height / 9,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _checkPointController
                                                                  .mapdialog(
                                                                      index,
                                                                      context,
                                                                      width,
                                                                      height);
                                                            },
                                                            child: Image.asset(
                                                                'assets/map.jpg',
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width / 50,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: GestureDetector(
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
                                                                      Image.memory(
                                                                          base64Decode(_checkPointController
                                                                              .historyList
                                                                              .value[index]
                                                                              .image),
                                                                          fit: BoxFit.cover)
                                                                    ],
                                                                  ));
                                                        },
                                                        child: Container(
                                                            width: width / 6,
                                                            height: height / 9,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    DynamicColor()
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0)),
                                                            child: Image.memory(
                                                                base64Decode(
                                                                    _checkPointController
                                                                        .historyList
                                                                        .value[
                                                                            index]
                                                                        .image),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width / 25,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: height / 15,
                                                right: width / 30,
                                                child: Container(
                                                  width: width / 1.2,
                                                  height: height / 4.5,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/frontcp.png'),
                                                          fit: BoxFit.contain)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 25,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width / 15,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .access_time_rounded,
                                                            color: DynamicColor()
                                                                .primarycolor,
                                                          ),
                                                          SizedBox(
                                                            width: width / 50,
                                                          ),
                                                          Text(
                                                            _checkPointController
                                                                .historyList
                                                                .value[index]
                                                                .time,
                                                            style: GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    width / 30,
                                                                color: DynamicColor()
                                                                    .titletextcolor),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: height / 100,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width / 15,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .apartment_outlined,
                                                            color: DynamicColor()
                                                                .primarycolor,
                                                          ),
                                                          SizedBox(
                                                            width: width / 50,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              _checkPointController
                                                                  .historyList
                                                                  .value[index]
                                                                  .siteName,
                                                              maxLines: 1,
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width /
                                                                          30,
                                                                  color: DynamicColor()
                                                                      .titletextcolor),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: height / 100,
                                                      ),
                                                      _checkPointController
                                                                  .historyList
                                                                  .value[index]
                                                                  .notes !=
                                                              ''
                                                          ? Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: width /
                                                                      15,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: DynamicColor()
                                                                      .primarycolor,
                                                                ),
                                                                SizedBox(
                                                                  width: width /
                                                                      50,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    _checkPointController
                                                                        .historyList
                                                                        .value[
                                                                            index]
                                                                        .notes,
                                                                    maxLines: 3,
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            width /
                                                                                30,
                                                                        color: DynamicColor()
                                                                            .titletextcolor),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          : Column(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Text(
                                    'No data founded',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 25,
                                        color: DynamicColor().titletextcolor),
                                  ),
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            "assets/1.gif",
                            height: 200,
                            width: 200,
                          ),
                        )
                  // Expanded(child: )
                ],
              );
            }),
      ),
    );
  }
}