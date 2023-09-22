import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/constants/sizes.dart';
import 'package:thread/main/widgets/search_block.dart';

import '../../repos/dark_mode_provider.dart';
import '../model/fake_data.dart';
import '../widgets/article_block.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  static const routeURL = "/search";
  static const routeName = "searchPage";

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final searchArticles = fakeDataSearch;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      print(_searchController.text);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w700,
                      color: ref.read(darkModeProvider)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                Gaps.v10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CupertinoSearchTextField(
                    controller: _searchController,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
                Gaps.v10,
                Container(
                  decoration: BoxDecoration(
                    color: ref.watch(darkModeProvider)
                        ? Colors.black
                        : Colors.white,
                  ),
                  child: StreamBuilder(
                    stream: (_searchController.text.isEmpty)
                        ? FirebaseFirestore.instance
                            .collection('images')
                            .orderBy('createdAt', descending: true)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('images')
                            .where('text',
                                arrayContains: _searchController.text)
                            .orderBy('createdAt', descending: true)
                            .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                    images: List<String>.from(
                                        docs[index]['images']),
                                    replies: docs[index]['replies'],
                                    replyAvatars: List<String>.from(
                                        docs[index]['replyAvatars']),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
