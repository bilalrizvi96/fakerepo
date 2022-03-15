import 'package:get/get.dart';

import '../API/BaseURl.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  var name;
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  @override
  void onInit() {
    super.onInit();
    current.value =
        months[selectedmonth.value - 1] + "-" + selectedyear.value.toString();
    var nam = BaseUrl.storage.read('name').toString().split(' ');
    name = nam[0].toString();
  }
}
