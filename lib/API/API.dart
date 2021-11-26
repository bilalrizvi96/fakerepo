import 'package:attendencesystem/API/Error.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:attendencesystem/Model/SummaryModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import 'BaseURl.dart';
import 'BaseURl.dart';

class API {
  Future Registration({
    var email_address,
    var employee_Id,
  }) async {
    try {
      Map data = {
        'code': employee_Id,
        'email': email_address,
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl().baseurl + 'register',
        data: data,
      );

      if (response.statusCode == 200) {
        var status = response;
        BaseUrl().token = "BEARER" + " " + response.data['token'];
        BaseUrl().code = response.data['code'];
        BaseUrl().storage.write("token", BaseUrl().token);
        BaseUrl().storage.write("code", BaseUrl().code);
        print(BaseUrl().storage.read("token"));
        print(BaseUrl().storage.read("code".toString()));
        return status;
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future SigIn({
    var employee_Id,
  }) async {
    try {
      Map data = {
        'code': employee_Id,
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl().baseurl + 'login',
        data: data,
      );
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Summary({var start, var end}) async {
    try {
      Map data = {"start": start, "end": end};
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl().storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl().baseurl + 'getSummary',
        data: data,
      );
      if (response.statusCode == 200) {
        // var status = response;
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Face_Registration({var files, var empcode}) async {
    try {
      var file = await MultipartFile.fromFile(files);
      var formData = FormData.fromMap({'video': file, "id": empcode});
      var dio = Dio();
      final response = await dio.post(
        BaseUrl().baseurl_Face + 'register',
        data: formData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              'Content-Type': "multipart/formdata",
              Headers.acceptHeader: "application/json"
            }),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      } else if (response.statusCode == 404) {
        return response.data.toString();
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Face_Verification({var verification, var empcode}) async {
    try {
      var file = await MultipartFile.fromFile(verification);
      var formData = FormData.fromMap({'video': file, "id": 'arsalan'});
      var dio = Dio();

      final response = await dio.post(
        BaseUrl().baseurl_Face + "verify",
        data: formData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              'Content-Type': "multipart/formdata",
              Headers.acceptHeader: "application/json"
            }),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      } else if (response.statusCode == 404) {
        return response.data.toString();
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckIn({var latlng, var siteId}) async {
    try {
      Map data = {'location': latlng, "siteId": siteId, "date": "2021-22-12"};
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl().storage.read('token');
      final response = await dio.post(
        BaseUrl().baseurl + 'start',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      } else if (response.statusCode == 404) {
        return response.data.toString();
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckOut({var latlng, var siteId}) async {
    try {
      Map data = {'location': latlng, "siteId": siteId, "date": "2021-22-12"};
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl().storage.read('token');
      final response = await dio.post(
        BaseUrl().baseurl + 'end',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              'Content-Type': "multipart/formdata",
              Headers.acceptHeader: "application/json"
            }),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      } else if (response.statusCode == 404) {
        return response.data.toString();
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
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
        BaseUrl().baseurl + 'add_user',
        data: data,
      );
      if (response.statusCode == 200) {
        var status = response.data.toString();
        return status;
      } else if (response.statusCode == 404) {
        return response.data['error'];
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  // Future SiteCreation({
  //   var sitename,
  //   var city,
  //   var type,
  //   var address,
  // }) async {
  //   try {
  //     Map data = {
  //       'SitesName': sitename,
  //       'Address': city,
  //       'City': type,
  //       'Type': address,
  //     };
  //     var dio = Dio();
  //     dio.options.headers['Accept'] = 'application/json';
  //     final response = await dio.post(
  //       baseurl_backend + 'add_sites',
  //       data: data,
  //     );
  //     if (response.statusCode == 200) {
  //       var status = response.data;
  //       return status;
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     onError(e);
  //   }
  // }

}
