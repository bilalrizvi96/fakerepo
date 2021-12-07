import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/RegistrationController.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FaceRegistrationScreen extends StatefulWidget {
  @override
  _FaceRegistrationScreenState createState() {
    return _FaceRegistrationScreenState();
  }
}

// List<CameraDescription> cameras = [];

class _FaceRegistrationScreenState extends State<FaceRegistrationScreen> {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  CameraController? controller;
  var videoPath;
  var check = false;
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  List<CameraDescription>? cameras;
  var selectedCameraIdx;
  var isLoading = true;
  var Loading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future faceRegistration(var videofile) async {
    try {
      videoPath = videofile.path;
      isLoading = true;
      var response = await API().Face_Registration(
        files: videoPath,
        empcode: registrationController.employee_IdController.text,
      );
      print(response);
      if (response.statusCode == 200) {
        print(response);
        await registrationController.submit(response.data["respose"]);
      } else {
        Get.snackbar('Error', response.data['respose'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
        check = false;
        setState(() {});
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> camera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      developer.log(e.code, name: e.description.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    check = false;
    // Get the listonNewCameraSelected of available cameras.
    // Then set the first camera as selected.
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras!.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras![selectedCameraIdx]).then((void v) {});
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
            ),
            check == false
                ? Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _cameraTogglesRowWidget(),
                      _captureControlRowWidget(),
                    ],
                  )
                : Image.asset(
                    "assets/1.gif",
                    height: 200,
                    width: 200,
                  ),
          ],
        ),
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller!.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: check == false
              ? 1.08 / controller!.value.aspectRatio
              : 1.28 / controller!.value.aspectRatio,
          child: CameraPreview(controller!),
        ),
        Image.asset(
          'assets/overlay.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras![selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Align(
      alignment: Alignment.centerLeft,
      child: FlatButton.icon(
          onPressed: () async {
            await _onSwitchCamera();
          },
          icon: Icon(_getCameraLensIcon(lensDirection)),
          label: Text(
              "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
    );
  }

  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
              onTap: controller != null &&
                      controller!.value.isInitialized &&
                      !controller!.value.isRecordingVideo
                  ? _onRecordButtonPressed
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Ready'.toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: DynamicColor().black),
                  )),
                ),
              ))),
    );
  }

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller!.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller!.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onSwitchCamera() async {
    selectedCameraIdx =
        selectedCameraIdx < cameras!.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras![selectedCameraIdx];

    await _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void startTimer() async {
    Future.delayed(
      new Duration(seconds: 5),
      () =>
          controller!.value.isInitialized && controller!.value.isRecordingVideo
              ? _onStopButtonPressed()
              : null,
    );
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((_) {
      // if (filePath != null) {
      check = true;
      setState(() {});
      startTimer();
      // Fluttertoast.showToast(
      //     msg: 'Recording video started',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.grey,
      //     textColor: Colors.white);
      // }
    });
  }

  _onStopButtonPressed() {
    _stopVideoRecording().then((file) {
      if (mounted) setState(() {});
      if (file != null) {
        faceRegistration(file);
      }
      // Fluttertoast.showToast(
      //     msg: 'Video recorded',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.grey,
      //     textColor: Colors.white);
    });
  }

  Future<void> _startVideoRecording() async {
    if (!controller!.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);

      return;
    }

    // Do nothing if a recording is on progress
    if (controller!.value.isRecordingVideo) {
      return;
    }

    // final Directory appDirectory = await getApplicationDocumentsDirectory();
    // final String videoDirectory = '${appDirectory.path}/Videos';
    // await Directory(videoDirectory).create(recursive: true);
    // final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    // final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller!.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }

    return;
  }

  Future<XFile?> _stopVideoRecording() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      check = false;
      setState(() {});
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
