import 'package:flutter/material.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/main/model/fake_data.dart';
import 'package:thread/main/widgets/article_block.dart';

import '../widgets/activity_block.dart';

class ActivitySimplePage extends StatelessWidget {
  const ActivitySimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final activityArticles = fakeDataActivity;

    return ListView.builder(
      itemCount: fakeDataActivity.length,
      itemBuilder: (context, index) {
        return ActivityBlock(
          avatar: fakeDataActivity[index].avatar,
          account: fakeDataActivity[index].account,
          time: fakeDataActivity[index].time,
          category: fakeDataActivity[index].category,
          avatarCategory: fakeDataActivity[index].avatarCategory,
          text: fakeDataActivity[index].text,
          following: fakeDataActivity[index].following,
        );
      },
    );
  }
}
