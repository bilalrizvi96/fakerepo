import 'dart:io';

import 'package:attendencesystem/Model/MyPointModel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class MyPointController extends GetxController {
  var Loading = false.obs;
  var mypointlist = [].obs;
  var connection = true.obs;
  @override
  void onInit() {
    super.onInit();
    check();
    myPoint();
  }

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });
        // Loading.value = false;

      }
    } on SocketException catch (_) {
      connection.value = false;
      Loading.value = true;
      Future.delayed(new Duration(milliseconds: 2000), () {
        Loading.value = false;

        update();
      });
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });

        update();
      } else {
        connection.value = false;
        Loading.value = true;
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;

          update();
        });
        update();
      }
    });
    update();
  }

  myPoint() async {
    Loading.value = true;
    mypointlist.value.clear();
    var response = await API().MyPoint();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await MyPointModel.fromJson(response.data);
      mypointlist.value = response.data;
      mypointlist.value.sort((a, b) {
        return b.date.toString().compareTo(a.date.toString());
      });
      print(mypointlist.value[0].points);
    } else {
      Loading.value = false;
    }
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // this.dispose();
  }
}
