import 'dart:io';

import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/NotificationModel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class NotificationController extends GetxController {
  var Loading = false.obs;
  var notificationlist = [].obs;
  var connection = true.obs;
  @override
  void onInit() {
    super.onInit();
    Loading.value = true;
    update();
    check();
    notification();
    // if (connection == true) {
    //
    // }
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

  notification() async {
    notificationlist.value.clear();
    var response = await API().Notification();
    if (response.statusCode == 200) {
      Loading.value = false;
      update();

      response = await NotificationModel.fromJson(response.data);
      notificationlist.value = response.data;
      // BaseUrl.storage.write('notificationdata', notificationlist.value);
    } else {
      Loading.value = false;
      update();
    }

    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
