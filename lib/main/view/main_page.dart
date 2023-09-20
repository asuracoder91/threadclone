import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('images')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: ArticleBlock(
                          avatar: docs[index]['avatar'],
                          name: docs[index]['name'],
                          blueCheck: docs[index]['blueCheck'],
                          time: docs[index]['time'],
                          text: docs[index]['text'],
                          images: List<String>.from(docs[index]['images']),
                          replies: docs[index]['replies'],
                          replyAvatars:
                              List<String>.from(docs[index]['replyAvatars']),
                          likes: docs[index]['likes'],
                        ),
                      ),
                      Gaps.v6,
                      const Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                });
          },
        ));
  }
}
