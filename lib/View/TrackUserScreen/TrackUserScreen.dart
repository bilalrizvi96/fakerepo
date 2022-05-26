import 'package:attendencesystem/Controller/TrackUserController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackUserScreen extends StatelessWidget {
  TrackUserScreen({Key? key}) : super(key: key);
  TrackUserController trackUserController = Get.put(TrackUserController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: GetX<TrackUserController>(
              // initState: trackUserController.init(),
              init: trackUserController,
              builder: (_) {
                return trackUserController.Loading.value == false
                    ? Column(
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
                              // GestureDetector(
                              //     onTap: () {
                              //       Get.back();
                              //     },
                              //     child: Icon(Icons.arrow_back_ios,
                              //         color: Colors.grey[600])),
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                'Track Staff',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 16),
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    trackUserController.init();
                                  },
                                  child: Icon(Icons.refresh)),
                              SizedBox(
                                width: width / 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Container(
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            padding: EdgeInsets.only(right: 10.0, left: 10),
                            child: DropdownSearch<String>(
                                showSelectedItems: false,
                                showSearchBox: true,
                                selectedItem:
                                    trackUserController.dropdownValue.value,
                                onChanged: (newValue) {
                                  trackUserController.valueupdate(newValue);
                                  // FocusScope.of(context).nextFocus();
                                },
                                items: trackUserController.staafflist),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Expanded(
                            child: GoogleMap(
                                zoomControlsEnabled: false,
                                compassEnabled: true,
                                markers: trackUserController.markers.toSet(),
                                mapType: MapType.normal,
                                initialCameraPosition: trackUserController
                                    .initialCameraPosition.value,
                                onTap: (LatLng loc) {},
                                onMapCreated: (GoogleMapController controller) {
                                  trackUserController.controller = controller;
                                }),
                          ),
                        ],
                      )
                    : Center(
                        child: Image.asset(
                          "assets/1.gif",
                          height: 200,
                          width: 200,
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
