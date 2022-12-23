import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/DynamicColor.dart';
import '../../Component/ErrorLoading.dart';
import '../../Controller/CheckPointController.dart';
import 'AddCheckPointScreen.dart';
import 'HistoryCheckPointScreen.dart';

class CheckPointScreen extends StatelessWidget {
  CheckPointScreen({Key? key}) : super(key: key);

  CheckPointController _checkPointController = Get.put(CheckPointController());
  @override
  Widget build(BuildContext context) {
    DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        _checkPointController.check();
        _checkPointController.update();
        // _checkPointController.onInit();
        // _checkPointController.update();
      }
    });
    _checkPointController.Loading.value = false;
    _checkPointController.check();
    // _checkPointController.onInit();
    _checkPointController.update();
    //
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: height,
        color: Colors.white,
        child: GetBuilder(
            init: _checkPointController,
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 15,
                        ),
                        Text(
                          'Checkpoint',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 16),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Center(
                      child: Container(
                        height: height / 18,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TabBar(
                          controller: _checkPointController.tabController,
                          indicatorColor: _checkPointController.indicatorColor,
                          labelColor: Colors.black,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                                  fontSize: width / 25,
                                  fontWeight: FontWeight.bold),
                          unselectedLabelColor: DynamicColor().titletextcolor,
                          tabs: [
                            Tab(
                              text: 'Add',
                            ),
                            Tab(
                              text: 'History',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _checkPointController.tabController,
                        children: <Widget>[
                          _checkPointController.Loading.value == false
                              ? AddCheckPointScreen()
                              : ErrorLoading(height: 200.0, width: 200.0),
                          HistoryCheckPointScreen(),
                        ],
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
