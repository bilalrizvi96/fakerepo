import 'package:attendencesystem/API/API.dart';
import 'package:get/get.dart';

onError(dynamic error) {
  if (error.response.statuscode == 403) {
    API().storage.erase();
    Get.offNamed("/signinemp");
  } else {
    return error.response.data['error'];
  }
}
