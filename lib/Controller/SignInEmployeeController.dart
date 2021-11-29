import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';

class SignInEmployeeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController empcodeController = new TextEditingController();
  XFile? faceImage;
  static final _auth = LocalAuthentication();
  var token = "".obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticateWithBiometrics(
        localizedReason: 'Scan Fingerprint to Authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }

  imgFromCameras() async {
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      faceImage = image;
      await faceverification();
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

  checkOption(var check) async {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      BaseUrl.empcode = empcodeController.text;
      if (check == 1) {
        await sigin();
      } else if (check == 0) {
        await imgFromCameras();
      }
    }
  }

  sigin() async {
    var response = await API().SigIn(
      employee_Id: empcodeController.text.toString(),
    );
    if (response != null) {
      // profiledata.clear();
      if (response.user.length != 0) {
        token.value = "BEARER" + " " + response.token;
        BaseUrl.storage.write("token", token.value);
        print(BaseUrl.storage.read("token"));
        BaseUrl.storage.write("name", response.user[0].name);
        BaseUrl.storage.write("total", response.user[0].total.toString());
        BaseUrl.storage.write("phoneNo", response.user[0].phoneNo);
        BaseUrl.storage.write("eMail", response.user[0].eMail);
        BaseUrl.storage
            .write("firstName", response.user[0].profile[0].firstName);
        BaseUrl.storage.write("lastName", response.user[0].profile[0].lastName);
        BaseUrl.storage.write("address", response.user[0].profile[0].address);
        BaseUrl.storage
            .write("dateOfJoining", response.user[0].profile[0].dateOfJoining);
        BaseUrl.storage
            .write("designation", response.user[0].profile[0].designation);
        BaseUrl.storage
            .write("shiftTiming", response.user[0].profile[0].shiftTiming);
        BaseUrl.storage
            .write("employeeId", response.user[0].profile[0].employeeId);

        Get.snackbar("Login ", "Login Successfully");
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Login ", response.toString());
      }
    } else {
      Get.snackbar("Login ", response.toString());
    }
  }

  faceverification() async {
    if (faceImage != null) {
      var response = await API().Face_Verification(
        verification: faceImage,
      );
      if (response.statusCode == 200) {
        print(response);

        if (response.data['respose'] == true) {
          Get.snackbar("Log In ", "Verified Successfully");
          await sigin();
        } else {
          Get.snackbar("Log In ", "Not Verified");
        }
      } else {
        Get.snackbar("Log In", response.toString());
      }
    } else {
      Get.snackbar("Log In", "Kindly enter the valid data");
    }
  }
}
