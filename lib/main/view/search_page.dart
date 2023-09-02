import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/constants/sizes.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  static const routeURL = "/search";
  static const routeName = "searchPage";

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v10,
              CupertinoSearchTextField(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
