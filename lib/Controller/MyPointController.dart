import 'package:attendencesystem/Model/MyPointModel.dart';
import 'package:get/get.dart';

import '../API/API.dart';

class MyPointController extends GetxController {
  var Loading = false.obs;
  var mypointlist = [].obs;
  myPoint() async {
    Loading.value = true;
    mypointlist.value.clear();
    var response = await API().MyPoint();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await MyPointModel.fromJson(response.data);
      mypointlist.value = response.data;
      print(mypointlist.value[0].points);
    } else {
      Loading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    myPoint();
  }
}
