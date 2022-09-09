import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/TrackUserController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Component/ErrorLoading.dart';
import '../../Controller/CheckPointController.dart';

class TrackUserScreen extends StatelessWidget {
  TrackUserScreen({Key? key}) : super(key: key);
  TrackUserController trackUserController = Get.put(TrackUserController());
  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: GetBuilder(
            // initState: trackUserController.init(),
            init: trackUserController,
            builder: (_) {
              return trackUserController.Loading.value == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 30,
                              ),
                              // GestureDetector(
                              //     onTap: () {
                              //       Get.back();
                              //     },
                              //     child: Icon(Icons.arrow_back_ios,
                              //         color: Colors.grey[600])),

                              Text(
                                'Track Staff',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 16),
                              ),
                              // Spacer(),
                              // GestureDetector(
                              //     onTap: () {
                              //       trackUserController.init();
                              //     },
                              //     child: Icon(Icons.refresh)),
                              SizedBox(
                                width: width / 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width / 50,
                              ),
                              Container(
                                width: width / 1.3,
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
                              Spacer(),
                              if (trackUserController.dropdownValue.value !=
                                  'Show All Staff')
                                FloatingActionButton(
                                    child: const Icon(Icons.print),
                                    heroTag: 'btn3',
                                    onPressed: () {
                                      _checkPointController.checkpointPdf(
                                        BaseUrl.storage.read('specificemp'),
                                        BaseUrl.storage.read('specificempname'),
                                      );
                                    }),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Expanded(
                            child: GoogleMap(
                                zoomControlsEnabled: false,
                                compassEnabled: true,
                                myLocationButtonEnabled: false,
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
                      ),
                    )
                  : ErrorLoading(height: 200.0, width: 200.0);
            }),
      ),
    );
  }
}
