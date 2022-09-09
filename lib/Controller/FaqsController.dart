import 'package:attendencesystem/Model/HelpCenterModel.dart';
import 'package:attendencesystem/Model/SupportRequestModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class FaqsController extends GetxController {
  var faqlist = [].obs;
  var supportrequestlist = [].obs;
  var Loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    // if (faqlist.value.isEmpty) {
    getHelpCenter();
    getSupportRequest();
    // }
  }

  getHelpCenter() async {
    Loading.value = true;
    update();
    var response = await API().HelpCenters();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await HelpCenterModel.fromJson(response.data);
      faqlist.value = response.data;
      faqlist.value.removeWhere((element) => element.show == 'false');
      getSupportRequest();
      print(faqlist.value);
    } else {
      Loading.value = false;
      Get.snackbar("Help Center ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  getSupportRequest() async {
    Loading.value = true;
    var response = await API().SupportRequest();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SupportRequestModel.fromJson(response.data);
      supportrequestlist.value = response.data;
      print(supportrequestlist.value[0].message);
      update();
    } else {
      Loading.value = false;
      // Get.snackbar("Error ", response.data['message'].toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    this.dispose();
  }
}
