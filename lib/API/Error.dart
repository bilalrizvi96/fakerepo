import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

onError(dynamic error) {
  if (error.response.statusCode == 403) {
    BaseUrl.storage.erase();
    Get.offNamed("/signinemp");
  } else if (error.response.statusCode == 404) {
    return error.response;
    // return error.response.data['error'].toString();
  } else if (error.response.statusCode == 500) {
    return error.response;
    // return "Internal Server Error";
  }
  // else if (error.response.statusCode == 503) {
  //   return Get.snackbar("Error ", "Service Unavailable",
  //       colorText: Colors.white, backgroundColor: Colors.red);
  //   // return "Internal Server Error";
  // } else if (error == "Service Unavailable") {
  //   return Get.snackbar("Error ", "Service Unavailable",
  //       colorText: Colors.white, backgroundColor: Colors.red);
  //   ;
  //   // return "Internal Server Error";
  // }
  else if (error.response.statusCode == 400) {
    return error.response;
  } else {
    return Get.snackbar("Error ", "Bhai shahab",
        colorText: Colors.white, backgroundColor: Colors.red);
    ;
  }
}

//bilal try method next time
