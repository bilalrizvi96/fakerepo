import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
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
  } else if (error.response.statusCode == 400) {
    return error.response;
  }
}

//bilal try method next time
