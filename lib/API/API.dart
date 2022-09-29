import 'dart:convert';
import 'dart:typed_data';
import 'package:attendencesystem/API/Error.dart';
import 'package:attendencesystem/Model/HelpCenterModel.dart';

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
      return onError(e, "checkings/RegistrationConfirmation");
    }
  }

  Future SigIn(
      {var employee_Id,
      var hash,
      var ip,
      var devicename,
      var model,
      var image}) async {
    var file;
    if (image != null) {
      file = await MultipartFile.fromFile(image.path);
    }
    try {
      var data = FormData.fromMap({
        'code': employee_Id,
        "verification": hash,
        "version": BaseUrl.version.toString(),
        "token": BaseUrl.fcm_token.toString(),
        "ip": ip,
        "model": model,
        "name": devicename,
        // "image": file,
        "cache": false
      });

      print(data);
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';

      final response = await dio.post(
        BaseUrl.baseurl + 'auth/loginWithoutBucket',
        data: data,
      );
      if (response.statusCode == 200) {
        print(response);
        return response;
      }
    } catch (e) {
      print(e);
      return onError(e, 'SigIn');
    }
  }

  Future CheckMaintenance() async {
    var response;

    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      response = await dio.get(
        BaseUrl.baseurl + 'maintenance/forMob',
      );
      if (response.statusCode == 200) {
        print(response.data);
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckMaintenance');
    }
  }

  Future ProfileData() async {
    var response;

    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      response = await dio.get(
        BaseUrl.baseurl + 'employee/profile',
      );
      if (response.statusCode == 200) {
        print(response.data);
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckMaintenance');
    }
  }

  Future Holidays() async {
    var response;
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      response = await dio.get(
        BaseUrl.baseurl + 'calender',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Holidays ');
    }
  }

  Future CheckUpdate() async {
    var response;
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      response = await dio.get(
        BaseUrl.baseurl + 'appUpdates',
      );
      if (response.statusCode == 200) {
        print(response.data);
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckUpdate');
    }
  }

  Future OTPVerification({var code, var empCode}) async {
    try {
      Map data = {"otpCode": code, 'empCode': BaseUrl.storage.read("empCode")};

      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'OTPAndSMS/OTPVerification',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'OTPVerification');
    }
  }

  Future ResendOTp() async {
    try {
      Map data = {"empCode": BaseUrl.storage.read("empCode")};
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'OTPAndSMS/OTPSend',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'ResendOTp');
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
        BaseUrl.baseurl + 'reports/analytics',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Summaryanalytic');
    }
  }

  Future SummaryGuideline({
    var month,
    var year,
  }) async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'reports/summaryGuideline',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'SummaryGuideline');
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
        BaseUrl.baseurl + 'reports/getReport',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Summarydetail');
    }
  }

  Future GetEmployees() async {
    try {
      Map data = {"require": "list"};
      print(data);
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints/getCheckPoints',
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'GetEmployees');
    }
  }

  Future Notification() async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'announcements/announcementsForMobile',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Notification');
    }
  }

  Future SupportRequest() async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'feedback/getMobileFeedbacks',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'SupportRequest');
    }
  }

  Future MyPoint() async {
    try {
      var dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'reports/walletForMobile',
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'MyPoint');
    }
  }

  Future Feedback(
      {
      // var time,
      var empId,
      var message,
      var type,
      var image,
      var name,
      var phone}) async {
    var file;
    if (image != null) {
      file = await MultipartFile.fromFile(image.path);
    }
    try {
      var formData = FormData.fromMap({
        "type": type,
        // "time": time.toString(),
        "employeeId": BaseUrl.storage.read("empCode") != null ? empId : '',
        "message": message.toString().trim(),
        'phone': phone,
        'resolved': false,
        'region': BaseUrl.storage.read('region') != null
            ? BaseUrl.storage.read('region')
            : '',
        'name': name,
        "image": file,
      });

      var dio = Dio();

      final response = await dio.post(
        BaseUrl.baseurl + 'feedback/support',
        data: formData,
      );

      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Feedback');
    }
  }

  Future Face_Registration({var files}) async {
    try {
      var file = await MultipartFile.fromFile(files.path);
      var formData =
          FormData.fromMap({'image': file, "empCode": BaseUrl.empcode});
      var dio = Dio();
      final response = await dio.post(
        BaseUrl.baseurl + 'register',
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
      return onError(e, 'Face_Registration');
    }
  }

  // Future Face_Verification({var verification}) async {
  //   try {
  //     var file = await MultipartFile.fromFile(verification.path);
  //     var formData =
  //         FormData.fromMap({'image': file, "empCode": BaseUrl.empcode});
  //     var dio = Dio();
  //
  //     final response = await dio.post(
  //       BaseUrl.baseurl_Face + "verify",
  //       data: formData,
  //       options:
  //           Options(contentType: Headers.formUrlEncodedContentType, headers: {
  //         'Content-Type': "multipart/formdata",
  //         Headers.acceptHeader: "application/json",
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       return response;
  //     }
  //   } catch (e) {
  //     return onError(e);
  //   }
  // }

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
        BaseUrl.baseurl + 'checkings/start',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckIn');
    }
  }

  Future OfflineCheckIn({var list}) async {
    try {
      var data = {'data': list};

      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkings/offlineCheckings',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        print(response);
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckIn');
    }
  }

  Future OfflineCheckPoint({var list}) async {
    try {
      var data = {'data': list};
      print(data);
      print("API data");
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints/writeOfflineCheckpoints',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        print(response);
        return response;
      }
    } catch (e) {
      return onError(e, 'CheckIn');
    }
  }

  Future CheckOut({var latlng, var siteId, var date, var check}) async {
    try {
      Map data = {
        'location': latlng,
        "siteId": siteId,
        "date": date.toString(),
        "forceAction": check,
        "isCheckoutForget": false
      };
      // print(data['checkpointAccess'].runtimeType);
      print("data");
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkings/end',
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
      return onError(e, 'CheckOut');
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
        "missedCheckoutDate":
            BaseUrl.storage.read("lastAttendanceRecordDate").toString(),

        "points": 0
        // BaseUrl.storage.read('points')
      };
      print(data);
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkings/end',
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
      return onError(e, 'Reasoncheckout');
    }
  }

  Future DashboardData() async {
    try {
      Map data = {
        "version": BaseUrl.version.toString(),
      };
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'auth/dashboard',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'AbsentPresent');
    }
  }

  Future CheckPointPDf({var date, var empCode, var name}) async {
    try {
      Map data = {"date": date, "name": name, 'empCode': empCode};
      print(data);
      print("data");
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints/checkPointsPDFGenerate',
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
      return onError(e, 'CheckPointPDf');
    }
  }

  Future SummaryPDf({var year, var month}) async {
    try {
      Map data = {"year": year, "month": month};
      print(data);
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'reports/reportPDFGenerate',
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
      return onError(e, 'SummaryPDf');
    }
  }

  Future Sendlatlng({var latlng}) async {
    try {
      Map data = {"location": latlng};
      print(data);
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.put(
        BaseUrl.baseurl + 'checkPoints/currentLocation',
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
      return onError(e, 'Sendlatlng');
    }
  }

  Future Getsites() async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        BaseUrl.baseurl + 'manageSite/manage_site',
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'Getsites');
    }
  }

  Future GetIp() async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.get(
        'https://api.ipify.org/',
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'GetIp');
    }
  }

  Future HelpCenters() async {
    try {
      var data = {'type': BaseUrl.helptype.toString()};
      var dio = Dio();
      print(data);
      // dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      final response = await dio.post(
        BaseUrl.baseurl + 'helpCenter',
        data: data,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {Headers.acceptHeader: "application/json"}),
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'HelpCenters');
    }
  }

  Future CheckPoints(
      {var latlng, var sitename, var note, var image, var date}) async {
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
        "date": date,
      };
      print(data);
      var dio = Dio();
      print(BaseUrl.storage.read('token'));
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints/write',
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
      return onError(e, 'CheckPoints');
    }
  }

  Future HistoryCheckPoints({var require, var date, var empcode}) async {
    try {
      Map data = {"require": require, "date": date, "employeeCode": empcode};
      print(data);
      var dio = Dio();
      print(BaseUrl.storage.read('token'));
      dio.options.headers['Authorization'] = BaseUrl.storage.read('token');
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.post(
        BaseUrl.baseurl + 'checkPoints/getCheckPoints',
        data: data,
        options: Options(headers: {
          Headers.acceptHeader: "application/json",
        }),
      );

      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return onError(e, 'HistoryCheckPoints');
    }
  }
}
