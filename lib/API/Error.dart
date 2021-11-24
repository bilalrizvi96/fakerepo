import 'package:attendencesystem/API/API.dart';
import 'package:get/get.dart';

onError(dynamic error) {
  if (error.response.statusCode == 403) {
    // API().storage.erase();
    Get.offNamed("/signinemp");
  } else if (error.response.statusCode == 404) {
    return error.response.data['error'].toString();
  } else if (error.response.statusCode == 500) {
    Get.snackbar("Login ", "Internal Server Error");
    return "Internal Server Error";
  }
}
