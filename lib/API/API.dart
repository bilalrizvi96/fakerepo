import 'package:attendencesystem/API/Error.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:attendencesystem/Model/SummaryModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'BaseURl.dart';
import 'BaseURl.dart';

class API {
  Future Registration({var email_address, var employee_Id, var check}) async {
    try {
      Map data = {
        'code': employee_Id,
        'email': email_address,
        "isFace": check,
        "registered": true,
      };
      print(data);
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'register',
        data: data,
      );

      if (response.statusCode == 200) {
        BaseUrl.token = "BEARER" + " " + response.data['token'];
        BaseUrl.code = response.data['code'];
        // BaseUrl.storage.write("token", BaseUrl.token);
        // BaseUrl.storage.write("code", BaseUrl.code);
        print(BaseUrl.storage.read("token").toString());
        print(BaseUrl.storage.read("code".toString()));
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future RegistrationConfirmation({var email_address, var employee_Id}) async {
    try {
      Map data = {
        'empCode': employee_Id,
        'email': email_address,
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'registationValidator',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckUpdate() async {
    try {
      Map data = {"version": BaseUrl.version.toString()};
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'checkUpdate',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future OTPVerification({var code, var empCode}) async {
    try {
      Map data = {"otpCode": code, 'empCode': BaseUrl.storage.read("empCode")};
      print(data);
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'OTPVerification',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future ResendOTp() async {
    try {
      Map data = {"empCode": BaseUrl.storage.read("empCode")};
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'OTPSend',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future NotificationSend({var time, var empId, var message}) async {
    try {
      Map data = {
        "type": "faceDuplication",
        "time": time.toString(),
        "employeeId": empId.toString(),
        "message": message
      };
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'notifications',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Feedback(
      {var time, var empId, var message, var type, var image}) async {
    print(image);
    var file;
    if (image != null) {
      file = await MultipartFile.fromFile(image.path);
    }
    try {
      var data = FormData.fromMap({
        "type": type,
        "time": time.toString(),
        "employeeId": empId.toString(),
        "message": message,
        "image": file != null ? file : ''
      });
      print(data.fields);
      print("data");
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'feedback',
        data: data,
      );
      if (response.statusCode == 201) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future SigIn({var employee_Id, var isFace, var hash}) async {
    try {
      Map data = {'code': employee_Id, "isFace": isFace, "verification": hash};
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'login',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Summary({var start, var end}) async {
    try {
      Map data = {
        "start": start,
        "end": end,
        'empCode': BaseUrl.storage.read("empCode")
      };
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'getSummary',
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

  Future Face_Registration({var files}) async {
    try {
      var file = await MultipartFile.fromFile(files.path);
      var formData =
          FormData.fromMap({'image': file, "empCode": BaseUrl.empcode});
      var dio = Dio();
      final response = await dio.post(
        BaseUrl.baseurl_Face + 'register',
        data: formData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              'Content-Type': "multipart/formdata",
              Headers.acceptHeader: "application/json"
            }),
      );
      if (response.statusCode == 200) {
        print(response);
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Face_Verification({var verification}) async {
    try {
      var file = await MultipartFile.fromFile(verification.path);
      var formData =
          FormData.fromMap({'image': file, "empCode": BaseUrl.empcode});
      var dio = Dio();

      final response = await dio.post(
        BaseUrl.baseurl_Face + "verify",
        data: formData,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Content-Type': "multipart/formdata",
          Headers.acceptHeader: "application/json",
          Headers.acceptHeader: "application/json"
        }),
      );
      if (response.statusCode == 200) {
        var status = response;
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckIn({var latlng, var siteId, var date}) async {
    try {
      Map data = {
        'location': latlng,
        "siteId": siteId,
        "date": date.toString()
      };
      print(data);
      print(BaseUrl.baseurl + 'start');
      print(BaseUrl.storage.read('token'));
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'start',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckOut({var latlng, var siteId, var date}) async {
    try {
      Map data = {
        'location': latlng,
        "siteId": siteId,
        "date": date.toString()
      };
      print(data);
      print(BaseUrl.baseurl + 'end');
      print(BaseUrl.storage.read('token'));
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'end',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        var status = response;
        return status;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future AbsentPresent() async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'absentPresent',
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }
}
