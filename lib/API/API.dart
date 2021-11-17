import 'package:attendencesystem/API/Error.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class API {
  var storage = GetStorage();
  var token, code;
  var baseurl = "https://attendancesystem12.herokuapp.com/";
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
        baseurl + 'register',
        data: data,
      );
      if (response.statusCode == 200) {
        var status = response;
        token = "BEARER" + " " + response.data['token'];
        code = response.data['code'];
        storage.write("token", token);
        storage.write("code", code);
        print(storage.read("token"));
        print(storage.read("code".toString()));
        return status;
      } else {
        return "error";
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Verification({var verification}) async {
    try {
      var file = await MultipartFile.fromFile(verification);
      var formData = FormData.fromMap({'video': file, "id": 'arsalan'});
      var dio = Dio();
      dio.options.headers['Authorization'] = API().storage.read('token');
      final response = await dio.post(
        baseurl + 'verify',
        // data: formData,
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
      dio.options.headers['Authorization'] = API().storage.read('token');
      final response = await dio.post(
        baseurl + 'start',
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
      dio.options.headers['Authorization'] = API().storage.read('token');
      final response = await dio.post(
        baseurl + 'end',
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
        baseurl + 'add_user',
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
