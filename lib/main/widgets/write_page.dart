import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isTyped = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _isTyped = _textEditingController.text.isNotEmpty;
      });
    });
  }

  _closeWritePage() {
    Navigator.of(context).pop();
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
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
                                    const FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.grey,
                                      size: 24.0,
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
