import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FaceVerificationController extends GetxController {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // List<CameraDescription> cameras = await availableCameras();
  CameraController? camera;
  var check = false.obs;
  var _isRecordingInProgress = false.obs;
  var isDetecting = false.obs;
  var btnvissiblity = false.obs;
  CameraLensDirection _direction = CameraLensDirection.front;

  @override
  void onInit() {
    _initializeCamera();
    super.onInit();
  }

  @override
  void dispose() {
    camera!.dispose();
    super.dispose();
  }

  Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  void buttonpress() async {
    btnvissiblity.value = true;
    if (btnvissiblity == true) {
      await startVideoRecording();
    }
    update();
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = camera;
    if (camera!.value.isRecordingVideo) {
      print('sa');
      // A recording has already started, do nothing.
      return;
    }
    try {
      await cameraController!.startVideoRecording();

      _isRecordingInProgress.value = true;
      print(_isRecordingInProgress);
      update();
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  void _initializeCamera() async {
    camera = CameraController(
      await _getCamera(_direction),
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.veryHigh
          : ResolutionPreset.ultraHigh,
    );
    await camera!.initialize();
    camera!.startImageStream((CameraImage image) {
      if (isDetecting.value) return;
      isDetecting.value = true;
      try {
        // await doOpenCVDectionHere(image);
      } catch (e) {
        // await handleExepction(e)
      } finally {
        isDetecting.value = false;
      }
    });
    check.value = true;
    update();
  }

  @override
  void onClose() {
    camera!.dispose();
    super.onClose();
  }
}
