import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/constants/sizes.dart';
import 'package:thread/main/widgets/search_block.dart';

import '../model/fake_data.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  static const routeURL = "/search";
  static const routeName = "searchPage";

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchArticles = fakeDataSearch;

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Gaps.v10,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CupertinoSearchTextField(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
                Gaps.v10,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchArticles.length,
                    itemBuilder: (context, index) {
                      return SearchBlock(
                        avatar: searchArticles[index].avatar,
                        name: searchArticles[index].name,
                        blueCheck: searchArticles[index].blueCheck,
                        account: searchArticles[index].account,
                        followers: searchArticles[index].followers,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
