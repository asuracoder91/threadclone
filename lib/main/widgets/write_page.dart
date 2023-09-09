import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/main/view/shoot_photo_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key, this.photo});

  final XFile? photo;

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  XFile? _photo;

  final TextEditingController _textEditingController = TextEditingController();
  bool _isTyped = false;

  @override
  void initState() {
    super.initState();
    _photo = widget.photo;

    _textEditingController.addListener(() {
      setState(() {
        _isTyped = _textEditingController.text.isNotEmpty;
      });
    });
  }

  _closeWritePage() {
    Navigator.of(context).pop();
  }

  void _onClipPressed() {
    Navigator.of(context)
        .push<XFile>(
            MaterialPageRoute(builder: (context) => const ShootPhotoScreen()))
        .then((result) {
      if (result != null) {
        setState(() {
          _photo = result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          width: size.width,
          height: size.height * 0.9,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _closeWritePage,
                      child: const Text("Cancel"),
                    ),
                    const Text(
                      "New Thread",
                      style: TextStyle(
                          fontSize: Sizes.size16, fontWeight: FontWeight.w700),
                    ),
                    const Text("        "),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 0.2,
                color: Colors.grey,
              ),
              // 글쓰기 공간 분리
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                    child: CircleAvatar(
                                      radius: 21,
                                      foregroundImage: AssetImage(
                                          "assets/avatars/brucelee.jpeg"),
                                    ),
                                  ),
                                ),
                              ),
                              Gaps.v6,
                              Container(
                                height: 60,
                                width: 2.5,
                                color: Colors.grey.shade300,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Opacity(
                                  opacity: 0.4,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    child: const Center(
                                      child: CircleAvatar(
                                        radius: 10,
                                        foregroundImage: AssetImage(
                                            "assets/avatars/brucelee.jpeg"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bruce_Lee",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: TextField(
                                        controller: _textEditingController,
                                        decoration: const InputDecoration(
                                          hintText: "Start a thread...",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Gaps.v10,
                                    GestureDetector(
                                      onTap: _onClipPressed,
                                      child: const FaIcon(
                                        FontAwesomeIcons.paperclip,
                                        color: Colors.grey,
                                        size: 24.0,
                                      ),
                                    ),
                                    if (_photo != null)
                                      Image.file(
                                        File(_photo!.path),
                                        width: 200,
                                      ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bottom Button
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anyone can reply",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: _isTyped ? Colors.blue : Colors.blue.shade100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
