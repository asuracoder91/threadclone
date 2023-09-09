import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thread/main/view/photo_preview_screen.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class ShootPhotoScreen extends StatefulWidget {
  static const String routeName = "postVideo";
  static const String routeURL = "/upload";
  const ShootPhotoScreen({super.key});

  @override
  State<ShootPhotoScreen> createState() => _ShootPhotoScreenState();
}

class _ShootPhotoScreenState extends State<ShootPhotoScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final bool _noCamera = kDebugMode && Platform.isIOS;

  late CameraController _cameraController;
  late FlashMode _flashMode;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10), // 총 10초동안
    lowerBound: 0.0, // 0에서
    upperBound: 1.0, // 1로 갈때 까지
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.2).animate(_buttonAnimationController);

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.max,
    );

    await _cameraController.initialize();
    await _cameraController
        .prepareForVideoRecording(); // iOS에서 음성/비디오 sync를 위해 필요한 함수
    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermission() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (!_noCamera) {
      initPermission();
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
    WidgetsBinding.instance.addObserver(this);
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _progressAnimationController.reset();
      }
    });
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!_noCamera) return;
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (_cameraController.value.isInitialized) {
      await initCamera();
      setState(() {});
    }
  }

  void toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  // Take a picture Function
  Future<void> _shootCamera() async {
    final photo = await _cameraController.takePicture();

    if (!mounted) return;
    Navigator.of(context).pop(photo);
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _progressAnimationController.dispose();
    if (!_noCamera) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  Future<void> _onPickVideoPressed() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) return;
    if (!mounted) return;

    Navigator.of(context).pop(photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  if (!_noCamera && _cameraController.value.isInitialized)
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.size36),
                            child: CameraPreview(_cameraController),
                          ),
                        ),
                        Gaps.v28,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Camera",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h56,
                            GestureDetector(
                              onTap: _onPickVideoPressed,
                              child: const Text(
                                "Library",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                            ),
                            Gaps.h48,
                          ],
                        ),
                      ],
                    ),
                  const Positioned(
                      top: Sizes.size32,
                      left: Sizes.size20,
                      child: CloseButton(
                        color: Colors.white,
                      )),
                  if (!_noCamera)
                    Positioned(
                      bottom: 120,
                      child: Row(
                        children: [
                          IconButton(
                            color: Colors.white,
                            icon: Icon(
                              _flashMode == FlashMode.off
                                  ? Icons.flash_off_rounded
                                  : _flashMode == FlashMode.always
                                      ? Icons.flash_on_rounded
                                      : Icons.flash_auto_rounded,
                            ),
                            onPressed: () {
                              if (_flashMode == FlashMode.off) {
                                _setFlashMode(FlashMode.always);
                              } else if (_flashMode == FlashMode.always) {
                                _setFlashMode(FlashMode.auto);
                              } else if (_flashMode == FlashMode.auto) {
                                _setFlashMode(FlashMode.off);
                              }
                            },
                          ),
                          Gaps.h48,
                          GestureDetector(
                            onTap: _shootCamera,
                            child: Container(
                              width: Sizes.size72,
                              height: Sizes.size72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: Sizes.size56,
                                  height: Sizes.size56,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gaps.h48,
                          IconButton(
                            color: Colors.white,
                            icon: const FaIcon(
                              FontAwesomeIcons.repeat,
                              size: 18,
                            ),
                            onPressed: toggleSelfieMode,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
