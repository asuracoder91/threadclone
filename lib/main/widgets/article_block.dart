import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/main/widgets/bottom_menu.dart';

import '../../constants/gaps.dart';
import '../../repos/dark_mode_provider.dart';

class ArticleBlock extends ConsumerStatefulWidget {
  const ArticleBlock(
      {super.key,
      required this.avatar,
      required this.name,
      required this.blueCheck,
      required this.time,
      required this.text,
      required this.images,
      required this.replies,
      required this.replyAvatars,
      required this.likes});

  final String avatar;
  final String name;
  final bool blueCheck;
  final String time;
  final String? text;
  final List<String> images;
  final int replies;
  final List<String> replyAvatars;
  final int likes;

  @override
  ConsumerState<ArticleBlock> createState() => _ArticleBlockState();
}

class _ArticleBlockState extends ConsumerState<ArticleBlock> {
  _showBottomMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const BottomMenu(),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      viewportFraction: 0.97, // 97% of the viewport width
    );
    double pageViewOffset = (MediaQuery.of(context).size.width * 0.78) *
        (1 - pageController.viewportFraction) /
        2;

    return Container(
      decoration: BoxDecoration(
        color: ref.watch(darkModeProvider) ? Colors.black : Colors.white,
      ),
      child: Padding(
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
                            child: widget.avatar == ""
                                ? const CircleAvatar(
                                    radius: 17,
                                    child: Text(
                                      "Anon",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 17,
                                    foregroundImage: AssetImage(widget.avatar),
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
                    Gaps.v12,
                    if (widget.replies > 0)
                      Container(
                        height: widget.images.isNotEmpty ? 230 : 40,
                        width: 3.0,
                        color: Colors.grey.shade300,
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
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ref.read(darkModeProvider)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gaps.h6,
                              widget.blueCheck
                                  ? SvgPicture.asset(
                                      "assets/icons/verified.svg",
                                      width: 14,
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            children: [
                              Text(widget.time,
                                  style: const TextStyle(color: Colors.grey)),
                              Gaps.h6,
                              GestureDetector(
                                  onTap: _showBottomMenu,
                                  child: const FaIcon(FontAwesomeIcons.ellipsis,
                                      size: 16)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Gaps.v2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: Text(widget.text ?? "",
                          style: TextStyle(
                            color: ref.read(darkModeProvider)
                                ? Colors.white
                                : Colors.black,
                          )),
                    ),
                    if (widget.images.isNotEmpty) Gaps.v10,
                    if (widget.images.isNotEmpty)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: 200,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            return Transform.translate(
                              offset: Offset(-pageViewOffset, 0),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    Gaps.v14,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: 20,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gaps.h16,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: 20,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gaps.h16,
                        FaIcon(
                          FontAwesomeIcons.rotate,
                          size: 20,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : Colors.black,
                        ),
                        Gaps.h16,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: 20,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Gaps.v14,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 52,
                  height: widget.replies >= 3 ? 40 : 24,
                  child: widget.replies >= 3
                      ? Stack(children: [
                          Positioned(
                            left: 3,
                            bottom: 10,
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ref.watch(darkModeProvider)
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 9,
                                  foregroundImage:
                                      AssetImage(widget.replyAvatars[0]),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ref.watch(darkModeProvider)
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 7,
                                  foregroundImage:
                                      AssetImage(widget.replyAvatars[1]),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            bottom: 14,
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ref.watch(darkModeProvider)
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 12,
                                  foregroundImage:
                                      AssetImage(widget.replyAvatars[2]),
                                ),
                              ),
                            ),
                          ),
                        ])
                      : widget.replies >= 1
                          ? Stack(children: [
                              Positioned(
                                left: 3,
                                bottom: 0,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ref.watch(darkModeProvider)
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 9,
                                      foregroundImage:
                                          AssetImage(widget.replyAvatars[0]),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 0,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ref.watch(darkModeProvider)
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                  ),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 9,
                                      foregroundImage:
                                          AssetImage(widget.replyAvatars[1]),
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          : Container(),
                ),
                Row(children: [
                  if (widget.replies > 0)
                    Row(
                      children: [
                        widget.replies >= 3 ? Gaps.h10 : Gaps.h1,
                        Text(
                          widget.replies.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          " replies",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Gaps.h6,
                        const Text("·"),
                        Gaps.h6,
                      ],
                    ),
                  Text(
                    widget.likes.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    " likes",
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
