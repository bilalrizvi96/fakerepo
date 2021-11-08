import 'dart:collection';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:http_parser/http_parser.dart';
import 'package:attendencesystem/API/Error.dart';
import 'package:dio/dio.dart';

class API {
  var baseurl = "http://asharib90.pythonanywhere.com/";
  Future Verification({var verification}) async {
    //
    try {
      var file = await MultipartFile.fromFile(verification);
      // Map<String, Object> msg = HashMap();
      // msg["video"] = file;
      // msg["id"] = 'arsalan';
      // print(msg);
      var formData = FormData.fromMap({'video': file, "id": 'arsalan'});

      // print(baseurl + '/login');
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';

      final response = await dio.post(
        baseurl + '/register',
        data: formData,
      );
      if (response.statusCode == 200) {
        // print(BaseUrl().storage.read('key'));
        var status = response.data.toString();
        return status;
      }
    } catch (e) {
      onError(e);
    }
  }
}
