import 'package:get_storage/get_storage.dart';

class BaseUrl {
  static final storage = GetStorage();
  static final storage1 = GetStorage();
  static var token, code, bear;
  static var empcode;
  static var clockin = '';
  static var clockout = '';
  static var baseurl =
      "https://fn8tsd4pbh.execute-api.us-east-2.amazonaws.com/dev/";
  static var baseurl_Face =
      "http://flask-env.eba-iaxsivgi.us-east-2.elasticbeanstalk.com/";
  static var version = '1.0.0';
}
