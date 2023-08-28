import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';

class ArticleBlock extends StatelessWidget {
  const ArticleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const CircleAvatar(
                            radius: 17,
                            foregroundImage: AssetImage("assets/elon.webp"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.white,
                                width: 2.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: -1.2,
                        right: 3.4,
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 1.0,
                    color: Colors.black,
                  ),
                ],
              ),
              Gaps.v2,
              Gaps.h10,
              // 본문 시작
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 첫줄 아이디, 시간, 메뉴
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Elon Musk",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.h6,
                            SvgPicture.asset(
                              "assets/icons/verified.svg",
                              width: 14,
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("2m", style: TextStyle(color: Colors.grey)),
                            Gaps.h6,
                            FaIcon(FontAwesomeIcons.ellipsis, size: 16),
                          ],
                        )
                      ],
                    ),
                  ),
                  Gaps.v2,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: const Text(
                        "Let's fight with Jujitsu, Mark. Are you scared?"),
                  ),
                  Gaps.v10,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/letsfight.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gaps.v14,
                  const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.heart, size: 20),
                      Gaps.h16,
                      FaIcon(FontAwesomeIcons.comment, size: 20),
                      Gaps.h16,
                      FaIcon(FontAwesomeIcons.rotate, size: 20),
                      Gaps.h16,
                      FaIcon(FontAwesomeIcons.paperPlane, size: 20),
                    ],
                  )
                ],
              ),
            ],
          ),
          Gaps.v14,
          Row(
            children: [
              SizedBox(
                width: 52,
                height: 24,
                child: Stack(children: [
                  Positioned(
                    left: 3,
                    bottom: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 9,
                          foregroundImage: AssetImage("assets/kimj.jpeg"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 9,
                          foregroundImage: AssetImage("assets/johnwick.jpeg"),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const Row(children: [
                Text(
                  "2 replies",
                  style: TextStyle(color: Colors.grey),
                ),
                Gaps.h6,
                Text("·"),
                Gaps.h6,
                Text(
                  "631 likes",
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
