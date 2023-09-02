import 'package:flutter/material.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/main/widgets/show_report.dart';

import '../../constants/sizes.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  bool _isUnfollowClicked = false;
  bool _isMuteClicked = false;
  bool _isHideClicked = false;
  bool _isReportClicked = false;

  _pressButton(String buttonName) {
    switch (buttonName) {
      case "Unfollow":
        setState(() {
          _isUnfollowClicked = true;
          _isMuteClicked = false;
          _isHideClicked = false;
          _isReportClicked = false;
        });
        break;
      case "Mute":
        setState(() {
          _isUnfollowClicked = false;
          _isMuteClicked = true;
          _isHideClicked = false;
          _isReportClicked = false;
        });
        break;
      case "Hide":
        setState(() {
          _isUnfollowClicked = false;
          _isMuteClicked = false;
          _isHideClicked = true;
          _isReportClicked = false;
        });
        break;
      case "Report":
        setState(() {
          _isUnfollowClicked = false;
          _isMuteClicked = false;
          _isHideClicked = false;
          _isReportClicked = true;
        });
        _showReportMenu();
        break;
    }
  }

  _showReportMenu() {
    Navigator.of(context).pop(); // 현재 BottomSheet를 닫습니다.

    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        builder: (context) => const ShowReport(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.35,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.v4,
          //small handle
          Container(
            height: Sizes.size4,
            width: Sizes.size36,
            margin: const EdgeInsets.symmetric(vertical: Sizes.size8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Sizes.size4),
            ),
          ),
          Gaps.v6,
          // Unfollow Button
          GestureDetector(
            onTap: () {
              _pressButton("Unfollow");
            },
            child: Container(
              height: Sizes.size48,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Sizes.size18),
                    topRight: Radius.circular(Sizes.size18)),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Unfollow",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _isUnfollowClicked ? Colors.red : Colors.black,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.1,
            width: size.width * 0.9,
            child: Container(
              color: Colors.grey.shade700,
            ),
          ),
          // Mute Button
          GestureDetector(
            onTap: () {
              _pressButton("Mute");
            },
            child: Container(
              height: Sizes.size48,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Sizes.size18),
                    bottomRight: Radius.circular(Sizes.size18)),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Mute",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _isMuteClicked ? Colors.red : Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gaps.v14,
          GestureDetector(
            onTap: () {
              _pressButton("Hide");
            },
            child: Container(
              height: Sizes.size48,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Sizes.size18),
                    topRight: Radius.circular(Sizes.size18)),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Hide",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _isHideClicked ? Colors.red : Colors.black,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.1,
            width: size.width * 0.9,
            child: Container(
              color: Colors.grey.shade700,
            ),
          ),
          GestureDetector(
            onTap: () {
              _pressButton("Report");
            },
            child: Container(
              height: Sizes.size48,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Sizes.size18),
                    bottomRight: Radius.circular(Sizes.size18)),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Report",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _isReportClicked ? Colors.red : Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
