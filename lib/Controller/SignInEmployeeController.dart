import 'package:attendencesystem/API/API.dart';
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
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

  sigin() async {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      var response = await API().SigIn(
        employee_Id: empcodeController.text.toString(),
      );
      if (response == 200) {
        print(response);
        Get.snackbar("Login ", "Login Successfully");
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Login ", response);
      }
    }
  }

  faceverification() async {
    if (faceImage != null) {
      var response = await API().Face_Verification(verification: faceImage);
      if (response.statusCode == 200) {
        print(response);
        Get.snackbar("Face Verification ", "Verified Successfully");
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Registration ", response.toString());
      }
    }
  }
}
