import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

onError(dynamic error) {
  if (error.response.statusCode == 403) {
    BaseUrl.storage.write("token", "out");
    Get.offNamed("/signinemp");
  } else if (error.response.statusCode == 404) {
    return error.response;
  } else if (error.response.statusCode == 500) {
    return error.response;
  } else if (error.response.statusCode == 400) {
    return error.response;
  } else if (error.response.statusCode == 422) {
    return error.response;
  } else {
    BaseUrl.storage.write("token", "out");
    Get.offNamed("/signinemp");
    return Get.snackbar("Error ", "Please Contact to IT Team",
        colorText: Colors.white, backgroundColor: Colors.red);
  }
}
