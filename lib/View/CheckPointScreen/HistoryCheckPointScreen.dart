import 'dart:convert';
import 'dart:io';

import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/NoInternet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../Component/ErrorLoading.dart';
import '../../Controller/CheckPointController.dart';

class HistoryCheckPointScreen extends StatelessWidget {
  HistoryCheckPointScreen({Key? key}) : super(key: key);
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: GetBuilder(
          init: _checkPointController,
          builder: (context) {
            return _checkPointController.connection == true
                ? FloatingActionButton(
                    child: const Icon(Icons.print),
                    heroTag: 'btn3',
                    onPressed: () {
                      if (!Get.isSnackbarOpen)
                        _checkPointController.checkpointPdf(
                            -BaseUrl.storage.read('empCode'),
                            BaseUrl.storage.read("name"));
                    },
                  )
                : Container();
          }),
      body: Container(
        height: height,
        width: width,
        color: Color(0xFFEBEFFF),
        child: GetBuilder(
            init: _checkPointController,
            builder: (_) {
              return _checkPointController.connection == true
                  ? Online(
                      width: width,
                      height: height,
                    )
                  : Offline(
                      height: height,
                      width: width,
                    );
              // : NoInternet(height: height, width: width);
            }),
      ),
    );
  }
}

class Online extends StatelessWidget {
  Online({this.height, this.width});
  var height, width;
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height / 50,
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
                      color: DynamicColor().titletextcolor.withOpacity(0.4)),

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
                      prefixIcon:
                          Icon(Icons.search_outlined, color: Colors.grey[400]),
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none),
                  onChanged: (val) {
                    _checkPointController.search(val, context);
                  },
                  // keyboardType: TextInputType.none,
                ),
              ),
              Container(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        minTime: DateTime(
                            int.parse(_checkPointController.year),
                            int.parse(_checkPointController.month),
                            int.parse(_checkPointController.day
                                .toString()
                                .split('T')[0])),
                        maxTime: DateTime.now(),
                        showTitleActions: true, onConfirm: (date) {
                      _checkPointController.toDate(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
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
                _checkPointController.finaldate.value.toString().split('T')[0],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: width / 32,
                    color: DynamicColor().titletextcolor.withOpacity(0.4)),
              ),
            )),
        SizedBox(
          height: height / 40,
        ),
        _checkPointController.Loading.value == false
            ? Expanded(
                child: _checkPointController.historyList.value != null
                    ? _checkPointController.historyList.value.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                _checkPointController.historyList.value.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: height / 3.5,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: width / 1.2,
                                            height: height / 3.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              color:
                                                  DynamicColor().primarycolor,
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
                                                          top: 8.0),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: DynamicColor()
                                                            .white),
                                                    child: Text(
                                                      "${index + 1}",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: width / 32,
                                                          color: DynamicColor()
                                                              .primarycolor),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                SizedBox(
                                                  width: width / 25,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: height / 17,
                                          right: width / 30,
                                          child: Container(
                                            width: width / 1.2,
                                            height: height / 4.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/frontcp.png'),
                                                    fit: BoxFit.contain)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                      Icons.access_time_rounded,
                                                      color: DynamicColor()
                                                          .primarycolor,
                                                    ),
                                                    SizedBox(
                                                      width: width / 50,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(
                                                              _checkPointController
                                                                  .historyList
                                                                  .value[index]
                                                                  .date
                                                                  .toString())),
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: width / 30,
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
                                                      Icons.apartment_outlined,
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
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width / 30,
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
                                                            width: width / 15,
                                                          ),
                                                          Icon(
                                                            Icons.edit_outlined,
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
                                                                          .value[
                                                                              index]
                                                                          .notes !=
                                                                      null
                                                                  ? _checkPointController
                                                                      .historyList
                                                                      .value[
                                                                          index]
                                                                      .notes
                                                                  : '',
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
                                        Positioned(
                                          top: height / 120,
                                          right: width / 12,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Container(
                                                  width: width / 6,
                                                  height: height / 9,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _checkPointController
                                                            .mapdialog(
                                                                index,
                                                                context,
                                                                width,
                                                                height,
                                                                true);
                                                      },
                                                      child: Image.asset(
                                                          'assets/map.jpg',
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 50,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            true,
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
                                                                    CachedNetworkImage(
                                                                      imageUrl: _checkPointController
                                                                          .historyList
                                                                          .value[
                                                                              index]
                                                                          .image,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      placeholder: (context,
                                                                              url) =>
                                                                          Center(
                                                                              child: CircularProgressIndicator()),
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          Icon(Icons
                                                                              .image_not_supported_outlined),
                                                                    ),
                                                                    // Image.network(
                                                                    //     _checkPointController
                                                                    //         .historyList
                                                                    //         .value[index]
                                                                    //         .image,
                                                                    //     fit: BoxFit.cover)
                                                                  ],
                                                                ));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                                        13.0)),
                                                        child: _checkPointController
                                                                    .connection
                                                                    .value ==
                                                                true
                                                            ? CachedNetworkImage(
                                                                imageUrl: _checkPointController
                                                                    .historyList
                                                                    .value[
                                                                        index]
                                                                    .image,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    Center(
                                                                        child:
                                                                            CircularProgressIndicator()),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .image_not_supported_outlined),
                                                              )
                                                            : Image.memory(
                                                                _checkPointController
                                                                    .historyList
                                                                    .value[
                                                                        index]
                                                                    .image)
                                                        // Image.network(
                                                        //     _checkPointController
                                                        //         .historyList
                                                        //         .value[
                                                        //             index]
                                                        //         .image,
                                                        //     fit: BoxFit
                                                        //         .cover)
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 15,
                              ),
                              Image.asset('assets/nodatafound.png',
                                  width: width / 1.3),
                              // Spacer(),
                              Text(
                                "No Data Found",
                                style: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.50),
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22),
                              ),

                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _checkPointController.historycheckpoint();
                                },
                                child: Container(
                                  width: width / 1.2,
                                  height: height / 15,
                                  decoration: BoxDecoration(
                                      color: DynamicColor().primarycolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Refresh'.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: DynamicColor().white),
                                  )),
                                ),
                              ),
                              Spacer(),
                            ],
                          )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 15,
                          ),
                          Image.asset('assets/nodatafound.png',
                              width: width / 1.3),
                          // Spacer(),
                          Text(
                            "No Data Found",
                            style: GoogleFonts.poppins(
                                color: Colors.black.withOpacity(0.50),
                                fontWeight: FontWeight.w600,
                                fontSize: width / 22),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              _checkPointController.historycheckpoint();
                            },
                            child: Container(
                              width: width / 1.2,
                              height: height / 15,
                              decoration: BoxDecoration(
                                  color: DynamicColor().primarycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Refresh'.toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: DynamicColor().white),
                              )),
                            ),
                          ),
                          Spacer(),
                          // Spacer(),
                        ],
                      ),
              )
            : ErrorLoading(height: 200.0, width: 200.0)
        // Expanded(child: )
      ],
    );
  }
}

class Offline extends StatelessWidget {
  Offline({this.height, this.width});
  var height, width;
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height / 40,
        ),

        SizedBox(
          height: height / 40,
        ),
        _checkPointController.Loading.value == false
            ? Expanded(
                child: _checkPointController.historyList.value != null
                    ? _checkPointController.historyList.value.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                _checkPointController.historyList.value.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: height / 3.5,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: width / 1.2,
                                            height: height / 3.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              color:
                                                  DynamicColor().primarycolor,
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
                                                          top: 8.0),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: DynamicColor()
                                                            .white),
                                                    child: Text(
                                                      "${index + 1}",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: width / 32,
                                                          color: DynamicColor()
                                                              .primarycolor),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                SizedBox(
                                                  width: width / 25,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: height / 17,
                                          right: width / 30,
                                          child: Container(
                                            width: width / 1.2,
                                            height: height / 4.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/frontcp.png'),
                                                    fit: BoxFit.contain)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                      Icons.access_time_rounded,
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
                                                                  ['date'] !=
                                                              ''
                                                          ? _checkPointController
                                                                  .historyList
                                                                  .value[index]
                                                                      ['date']
                                                                  .toString()
                                                                  .split(' ')[0]
                                                                  .toString()
                                                                  .split(
                                                                      ':')[0] +
                                                              ':' +
                                                              _checkPointController
                                                                  .historyList
                                                                  .value[index]
                                                                      ['date']
                                                                  .toString()
                                                                  .split(' ')[0]
                                                                  .toString()
                                                                  .split(':')[0]
                                                          : "",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: width / 30,
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
                                                      Icons.apartment_outlined,
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
                                                            ['siteName'],
                                                        maxLines: 1,
                                                        style: GoogleFonts.poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width / 30,
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
                                                            ['notes'] !=
                                                        ''
                                                    ? Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width / 15,
                                                          ),
                                                          Icon(
                                                            Icons.edit_outlined,
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
                                                                          [
                                                                          'notes'] !=
                                                                      null
                                                                  ? _checkPointController
                                                                          .historyList
                                                                          .value[
                                                                      index]['notes']
                                                                  : '',
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
                                        Positioned(
                                          top: height / 120,
                                          right: width / 12,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Container(
                                                  width: width / 6,
                                                  height: height / 9,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _checkPointController
                                                            .mapdialog(
                                                                index,
                                                                context,
                                                                width,
                                                                height,
                                                                false);
                                                      },
                                                      child: Image.asset(
                                                          'assets/map.jpg',
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 50,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            true,
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
                                                                    Image.memory(
                                                                        base64Decode(_checkPointController.historyList.value[index]
                                                                            [
                                                                            'image']),
                                                                        fit: BoxFit
                                                                            .cover)
                                                                    // Image.network(
                                                                    //     _checkPointController
                                                                    //         .historyList
                                                                    //         .value[index]
                                                                    //         .image,
                                                                    //     fit: BoxFit.cover)
                                                                  ],
                                                                ));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                                        13.0)),
                                                        child: Image.memory(
                                                            base64Decode(
                                                                _checkPointController
                                                                        .historyList
                                                                        .value[index]
                                                                    ['image']),
                                                            fit: BoxFit.cover)
                                                        // Image.network(
                                                        //     _checkPointController
                                                        //         .historyList
                                                        //         .value[
                                                        //             index]
                                                        //         .image,
                                                        //     fit: BoxFit
                                                        //         .cover)
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 15,
                              ),
                              Image.asset('assets/nodatafound.png',
                                  width: width / 1.3),
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 15,
                          ),
                          Image.asset('assets/nodatafound.png',
                              width: width / 1.3),
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
                      ),
              )
            : ErrorLoading(height: 200.0, width: 200.0)
        // Expanded(child: )
      ],
    );
  }
}
