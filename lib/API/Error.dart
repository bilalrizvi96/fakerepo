import 'package:get/get.dart';

onError(dynamic error) {
  print(error.response.data);
  print('error.runtimeType');
  if (error.response.statusCode != 200) {
    print(error.response.data['data']['error']);
    print('error.response.data[data]');
    Get.snackbar('Error', error.response.data['data']['error']);
    if (!error.response.data['data'].values.toString().contains(",")) {
      var errors = error.response.data['data'].values.toString().substring(
          2, error.response.data['data'].values.toString().length - 2);
      return errors.toString();
    } else {
      var printerror = "";
      var errors = error.response.data['data'].values.toString().split(",");
      for (int i = 0; i < errors.length; i++) {
        printerror += (i + 1).toString() +
            ". " +
            errors[i].toString().substring(2, errors[i].toString().length - 2) +
            "\n";
      }
      return printerror.toString();
    }
  } else {
    print(error.toString());
  }
}
