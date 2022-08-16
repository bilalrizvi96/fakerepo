import 'package:attendencesystem/Model/NotificationModel.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class NotificationController extends GetxController {
  var Loading = false.obs;
  var notificationlist = [].obs;
  notification() async {
    Loading.value = true;
    notificationlist.value.clear();
    var response = await API().Notification();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await NotificationModel.fromJson(response.data);
      notificationlist.value = response.data;
    } else {
      Loading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    notification();
  }
}
