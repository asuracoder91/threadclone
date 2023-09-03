import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/gaps.dart';

class SearchBlock extends StatefulWidget {
  const SearchBlock({
    super.key,
    required this.avatar,
    required this.name,
    required this.blueCheck,
    required this.account,
    required this.followers,
  });

  final String avatar;
  final String name;
  final String account;
  final bool blueCheck;
  final String followers;

  @override
  State<SearchBlock> createState() => _ArticleBlockState();
}

class _ArticleBlockState extends State<SearchBlock> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 4, 0),
          child: Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Center(
              child: CircleAvatar(
                radius: 19,
                foregroundImage: AssetImage(widget.avatar),
              ),
            ),
          ),
        ),
        Gaps.h10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v6,
            SizedBox(
              width: size.width - 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v6,
                      Row(
                        children: [
                          Text(
                            widget.account,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gaps.h4,
                          widget.blueCheck
                              ? SvgPicture.asset(
                                  "assets/icons/verified.svg",
                                  width: 15,
                                )
                              : Container(),
                        ],
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  // Follow button
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Container(
                      width: 110,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v4,
            Text(
              "${widget.followers} Followers",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gaps.v4,
            // Single line
            SizedBox(
              width: size.width - 72,
              child: const Divider(
                thickness: 0.5,
              ),
            ),
          ],
        )
      ],
    );
  }
}
