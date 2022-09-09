import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/NotificationModel.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class NotificationController extends GetxController {
  var Loading = false.obs;
  var notificationlist = [].obs;
  @override
  void onInit() {
    super.onInit();
    notification();
  }

  notification() async {
    Loading.value = true;
    // update();
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
