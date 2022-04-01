import 'dart:io';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/CheckPointController.dart';
import '../../Controller/MapController.dart';

class AddCheckPointScreen extends StatelessWidget {
  AddCheckPointScreen({Key? key}) : super(key: key);
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: height,
        width: width,
        color: Color(0xFFEBEFFF),
        child: GetBuilder(
            init: _checkPointController,
            builder: (_) {
              return Form(
                key: _checkPointController.checkpointFormKey,
                child: _checkPointController.Loading.value == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: width / 3,
                                height: height / 4.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: width / 3,
                                      height: height / 4.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                        child: GoogleMap(
                                            zoomControlsEnabled: false,
                                            compassEnabled: true,
                                            markers: _checkPointController
                                                .markers.value,
                                            mapType: MapType.normal,
                                            initialCameraPosition:
                                                _checkPointController
                                                    .initialCameraPosition
                                                    .value,
                                            onTap: (LatLng loc) {},
                                            onMapCreated: (GoogleMapController
                                                controller) {
                                              _checkPointController.controller =
                                                  controller;
                                            }),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FloatingActionButton(
                                          backgroundColor:
                                              DynamicColor().primarycolor,
                                          elevation: 5.0,
                                          hoverElevation: 20,
                                          onPressed: () {
                                            _checkPointController.mapupdate();
                                          },
                                          child: Icon(Icons.refresh_sharp)),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: width / 3,
                                height: height / 4.0,
                                child: Stack(
                                  children: [
                                    Container(
                                        width: width / 3,
                                        height: height / 4.5,
                                        decoration: BoxDecoration(
                                            color: DynamicColor().white,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: _checkPointController
                                                    .faceImage ==
                                                null
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.camera,
                                                    size: width / 10,
                                                    color: DynamicColor()
                                                        .primarycolor,
                                                  ),
                                                  SizedBox(
                                                    height: height / 80,
                                                  ),
                                                  Text(
                                                    'Capture',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 30,
                                                        color: DynamicColor()
                                                            .primarycolor),
                                                  ),
                                                  SizedBox(
                                                    height: height / 80,
                                                  ),
                                                ],
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Image.file(
                                                    File(_checkPointController
                                                        .faceImage!.path),
                                                    fit: BoxFit.cover),
                                              )),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FloatingActionButton(
                                          backgroundColor:
                                              DynamicColor().primarycolor,
                                          elevation: 5.0,
                                          hoverElevation: 20,
                                          onPressed: () {
                                            _checkPointController
                                                .imgFromCameras();
                                          },
                                          child: Icon(
                                              _checkPointController.faceImage ==
                                                      null
                                                  ? Icons.add
                                                  : Icons.refresh_sharp)),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Site Name',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 30,
                                      color: DynamicColor().black),
                                )),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 80,
                                height: height / 18,
                                color: DynamicColor().primarycolor,
                              ),
                              Container(
                                width: width / 1.22,
                                child: TextFormField(
                                  keyboardType: TextInputType.streetAddress,
                                  controller:
                                      _checkPointController.siteController,
                                  validator: _checkPointController.validators,
                                  cursorColor: DynamicColor().primarycolor,
                                  style: GoogleFonts.poppins(
                                      fontSize: width / 30,
                                      color: DynamicColor().primarycolor,
                                      fontWeight: FontWeight.w300),
                                  decoration: new InputDecoration(
                                      // hintText:
                                      //     _checkPointController.first.value.toString(),
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none),
                                  // keyboardType: TextInputType.none,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Notes',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 30,
                                      color: DynamicColor().black),
                                )),
                          ),
                          SizedBox(
                            height: height / 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Container(
                                  width: width / 80,
                                  height: height / 6.8,
                                  color: DynamicColor().primarycolor,
                                ),
                              ),
                              Container(
                                width: width / 1.22,
                                child: TextFormField(
                                  maxLines: 5,
                                  maxLength: 1000,
                                  keyboardType: TextInputType.streetAddress,
                                  controller:
                                      _checkPointController.noteController,
                                  // validator: registrationController
                                  //     .validators,
                                  cursorColor: DynamicColor().primarycolor,
                                  style: GoogleFonts.poppins(
                                      fontSize: width / 30,
                                      color: DynamicColor().primarycolor,
                                      fontWeight: FontWeight.w300),
                                  decoration: new InputDecoration(
                                      hintText: 'Write the purpose',
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none),
                                  // keyboardType: TextInputType.none,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              _checkPointController.checkpoint();
                            },
                            child: Container(
                              width: width / 1.2,
                              height: height / 15,
                              decoration: BoxDecoration(
                                  color: DynamicColor().primarycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Add'.toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: DynamicColor().white),
                              )),
                            ),
                          ),
                          Spacer(),
                        ],
                      )
                    : Center(
                        child: Image.asset(
                          "assets/1.gif",
                          height: 200,
                          width: 200,
                        ),
                      ),
              );
            }),
      ),
    );
  }
}