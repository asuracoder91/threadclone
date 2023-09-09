import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/main/model/activity_data.dart';

import '../../constants/gaps.dart';
import '../../repos/dark_mode_provider.dart';

class ActivityBlock extends ConsumerStatefulWidget {
  const ActivityBlock({
    super.key,
    required this.avatar,
    required this.account,
    required this.time,
    this.text,
    required this.category,
    required this.avatarCategory,
    required this.following,
  });

  final String avatar;
  final String account;
  final String time;
  final String category;
  final String avatarCategory;
  final String? text;
  final bool following;

  @override
  ConsumerState<ActivityBlock> createState() => _ArticleBlockState();
}

class _ArticleBlockState extends ConsumerState<ActivityBlock> {
  _getAvatarCategoryIcon(String avatarCategory) {
    switch (avatarCategory) {
      case "Mentions":
        return const FaIcon(
          FontAwesomeIcons.at,
          size: 9,
          color: Colors.white,
        );
      case "Replies":
        return const FaIcon(FontAwesomeIcons.reply,
            size: 9, color: Colors.white);
      case "Following":
        return const FaIcon(FontAwesomeIcons.solidUser,
            size: 9, color: Colors.white);
      case "Likes":
        return const FaIcon(FontAwesomeIcons.solidHeart,
            size: 9, color: Colors.white);
      default:
        return const FaIcon(FontAwesomeIcons.circleDot,
            size: 9, color: Colors.white);
    }
  }

  _getAvatarCategoryColor(String avatarCategory) {
    switch (avatarCategory) {
      case "Mentions":
        return Colors.green;
      case "Replies":
        return Colors.blue;
      case "Following":
        return Colors.purple;
      case "Likes":
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.h12,
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 14, 4, 4),
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: CircleAvatar(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getAvatarCategoryColor(widget.avatarCategory),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.white,
                      width: 2.3,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5.5,
              right: 5.5,
              child: _getAvatarCategoryIcon(widget.avatarCategory),
            )
          ],
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
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: ref.read(darkModeProvider)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Gaps.h4,
                          Text(
                            widget.time,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: widget.following
                            ? size.width - 250
                            : size.width - 95,
                        child: Text(
                          widget.category,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Follow button
                  if (widget.following)
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Container(
                        width: 110,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.grey,
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
            SizedBox(
              width: size.width - 80,
              child: Text(
                widget.text ?? "",
                style: TextStyle(
                  fontSize: 14,
                  color:
                      ref.read(darkModeProvider) ? Colors.white : Colors.black,
                ),
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
