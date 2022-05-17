import 'package:attendencesystem/Model/HelpCenterModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../Model/FaqsModel.dart';

class FaqsController extends GetxController {
  var faqlist = [].obs;
  var Loading = false.obs;

  getHelpCenter() async {
    var response = await API().HelpCenters();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await HelpCenterModel.fromJson(response.data);
      faqlist.value = response.response;
      faqlist.value.removeWhere((element) => element.show=='false');
      print(faqlist.value);
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (faqlist.value.isEmpty) {
      getHelpCenter();
    }
  }
}
