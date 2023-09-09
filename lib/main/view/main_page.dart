import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/main/model/fake_data.dart';
import 'package:thread/main/widgets/article_block.dart';

import '../../repos/dark_mode_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = fakeData;

    return Container(
      decoration: BoxDecoration(
        color: ref.watch(darkModeProvider) ? Colors.black : Colors.white,
      ),
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: ArticleBlock(
                    avatar: articles[index].avatar,
                    name: articles[index].name,
                    blueCheck: articles[index].blueCheck,
                    time: articles[index].time,
                    text: articles[index].text,
                    images: articles[index].images,
                    replies: articles[index].replies,
                    replyAvatars: articles[index].replyAvatars,
                    likes: articles[index].likes,
                  ),
                ),
                Gaps.v6,
                const Divider(
                  thickness: 0.5,
                ),
              ],
            );
          }),
    );
  }
}
