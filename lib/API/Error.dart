import 'package:attendencesystem/API/API.dart';
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
    return Get.snackbar("Error ", "Lead Say Contact Kray",
        colorText: Colors.white, backgroundColor: Colors.red);
    ;
  }
}
