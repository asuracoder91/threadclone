import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: const Border.symmetric(
          horizontal: BorderSide(
            color: Colors.transparent,
            width: Sizes.size1,
          ),
        ),
      ),
      child: TabBar(
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        labelColor: Theme.of(context).tabBarTheme.indicatorColor,
        labelPadding: const EdgeInsets.only(
          top: Sizes.size10,
          bottom: Sizes.size10,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
