import 'dart:convert';

import 'package:attendencesystem/API/Error.dart';
import 'package:dio/dio.dart';

class API {
  var baseurl = "http://asharib90.pythonanywhere.com/";
  var baseurl_backend = "https://attendancesystem12.herokuapp.com/";
  Future Verification({var verification}) async {
    try {
      var file = await MultipartFile.fromFile(verification);
      var formData = FormData.fromMap({'video': file, "id": 'arsalan'});
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        baseurl + '/register',
        data: formData,
      );
      if (response.statusCode == 200) {
        var status = response.data.toString();
        return status;
      }
    } catch (e) {
      onError(e);
    }
  }

  Future ProfileCreation({
    var firstname,
    var lastname,
    var mobile,
    var designation,
    var date_of_joining,
    var address,
    var email_address,
    var shift_timming,
  }) async {
    try {
      Map data = {
        'first_name': firstname,
        'last_name': lastname,
        'phone_number': mobile,
        'address': address,
        'date_of_joining': date_of_joining,
        'designation': designation,
        'email': email_address,
        'shift_timing': shift_timming,
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        baseurl_backend + 'add_user',
        data: data,
      );
      if (response.statusCode == 200) {
        var status = response.data.toString();
        return status;
      } else {
        return "error";
      }
    } catch (e) {
      onError(e);
    }
  }

  Future SiteCreation({
    var sitename,
    var city,
    var type,
    var address,
  }) async {
    try {
      Map data = {
        'SitesName': sitename,
        'Address': city,
        'City': type,
        'Type': address,
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        baseurl_backend + 'add_sites',
        data: data,
      );
      if (response.statusCode == 200) {
        var status = response.data;
        return status;
      } else {
        return "error";
      }
    } catch (e) {
      onError(e);
    }
  }
}
