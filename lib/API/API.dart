import 'dart:convert';
import 'dart:typed_data';
import 'package:attendencesystem/API/Error.dart';
import 'package:dio/dio.dart';
import 'BaseURl.dart';

class API {
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

  Future SigIn({var employee_Id, var isFace, var hash}) async {
    try {
      Map data = {
        'code': employee_Id,
        "isFace": isFace,
        "verification": hash,
        "version": BaseUrl.version.toString(),
      };
      print(data);
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

  // Future CheckUpdate() async {
  //   try {
  //     Map data = {"version": BaseUrl.version.toString()};
  //     var dio = Dio();
  //     dio.options.headers['Accept'] = 'application/json';
  //     final response = await dio.post(
  //       BaseUrl.baseurl + 'checkUpdate',
  //       data: data,
  //     );
  //     if (response.statusCode == 200) {
  //       return response;
  //     }
  //   } catch (e) {
  //     return onError(e);
  //   }
  // }

  Future OTPVerification({var code, var empCode}) async {
    try {
      Map data = {"otpCode": code, 'empCode': BaseUrl.storage.read("empCode")};

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
        "message": message.toString().trim()
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

  Future Summaryanalytic({
    var month,
    var year,
  }) async {
    try {
      Map data = {"month": month, "year": year};
      print(data);
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'analytics',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  // Future SummaryGuideline({
  //   var month,
  //   var year,
  // }) async {
  //   try {
  //     var dio = Dio();
  //     dio.options.headers['Accept'] = 'application/json';
  //     dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
  //     final response = await dio.get(
  //       BaseUrl.baseurl + 'summaryGuideline',
  //     );
  //     if (response.statusCode == 200) {
  //       return response;
  //     }
  //   } catch (e) {
  //     return onError(e);
  //   }
  // }

  Future Notification() async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'generalNotification',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future MyPoint() async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'walletForMobile',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future Feedback(
      {var time,
      var empId,
      var message,
      var type,
      var image,
      var phone}) async {
    var file;
    if (image != null) {
      Uint8List imagebytes = await image.readAsBytes();
      String base64string = base64.encode(imagebytes);
      file = base64string.toString();
      file.replaceAll('/', '');
    }
    try {
      var data = {
        "type": type,
        "time": time.toString(),
        "employeeId": empId.toString(),
        "message": message.toString().trim(),
        'phone': phone != '' ? phone : '',
        "image": file != '' ? file : ''
      };

      var dio = Dio();

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

  Future Summarydetail({var start, var end}) async {
    try {
      Map data = {
        "start": start,
        "end": end,
        'empCode': BaseUrl.storage.read("empCode")
      };
      print(data);
      print('123');
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'getReport',
        data: data,
      );
      if (response.statusCode == 200) {
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
        }),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e);
    }
  }

  Future CheckIn({var latlng, var siteId, var date, var check}) async {
    try {
      Map data = {
        'location': latlng,
        "siteId": siteId,
        "date": date.toString(),
        "forceAction": check
      };

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

  Future CheckOut({var latlng, var siteId, var date, var check}) async {
    try {
      Map data = {
        'location': latlng,
        "siteId": siteId,
        "date": date.toString(),
        "forceAction": check
        // "isCheckoutForget": false
      };
      print(data['checkpointAccess'].runtimeType);
      print("data");
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
      print(e);
      return onError(e);
    }
  }

  Future Reasoncheckout({var latlng, var siteId, var date, var reason}) async {
    try {
      Map data = {
        "location": latlng,
        "siteId": siteId,
        "date": BaseUrl.storage.read('dateForMissingCheckout'),
        "isCheckoutForget": true,
        "reason": reason,
        "missedCheckoutDate": BaseUrl.storage
                .read("lastAttendanceRecordDate")
                .toString()
                .replaceAll('/', '-')
                .split('-')[2] +
            "-" +
            BaseUrl.storage
                .read("lastAttendanceRecordDate")
                .toString()
                .replaceAll('/', '-')
                .split('-')[1] +
            "-" +
            BaseUrl.storage
                .read("lastAttendanceRecordDate")
                .toString()
                .replaceAll('/', '-')
                .split('-')[0],
        "points": BaseUrl.storage.read('points')
      };
      print(data);
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

  Future CheckPointPDf({var date}) async {
    try {
      Map data = {"date": date, "name": BaseUrl.storage.read("name")};
      print(data);
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPointsPDFGenerate',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      print(e);
      return onError(e);
    }
  }

  Future SummaryPDf({var year, var month}) async {
    try {
      Map data = {"year": year, "month": month};
      print(data);
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'reportPDFGenerate',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      print(e);
      return onError(e);
    }
  }

  // Future Getsites() async {
  //   try {
  //     var dio = Dio();
  //     dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
  //     final response = await dio.get(
  //       BaseUrl.baseurl + 'manage_site',
  //       options: Options(
  //           contentType: Headers.formUrlEncodedContentType,
  //           headers: {Headers.acceptHeader: "application/json"}),
  //     );
  //     if (response.statusCode == 200) {
  //       return response;
  //     }
  //   } catch (e) {
  //     return onError(e);
  //   }
  // }

  Future CheckPoints({var latlng, var sitename, var note, var image}) async {
    var file;
    if (image != null) {
      Uint8List imagebytes = await image.readAsBytes();
      String base64string = base64.encode(imagebytes);
      file = base64string.toString();
      file.replaceAll('/', '');
    }
    try {
      Map data = {
        'location': latlng,
        "siteName": sitename,
        "notes": note.toString().trim(),
        'image': file != '' ? file : '',
      };
      print(data);
      var dio = Dio();
      print(BaseUrl.storage.read('token'));
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints',
        data: data,
        options: Options(headers: {
          Headers.acceptHeader: "application/json",
          Headers.contentLengthHeader: '<calculated when request is sent>'
        }),
      );
      print(response);
      if (response.statusCode == 201) {
        return response;
      }
    } catch (e) {
      print(e);
      return onError(e);
    }
  }

  Future HistoryCheckPoints({var require, var date}) async {
    try {
      Map data = {"require": require, "date": date};
      print(data);
      var dio = Dio();
      print(BaseUrl.storage.read('token'));
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'getCheckPoints',
        data: data,
        options: Options(headers: {
          Headers.acceptHeader: "application/json",
        }),
      );
      print(response);
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      print(e);
      return onError(e);
    }
  }
}
