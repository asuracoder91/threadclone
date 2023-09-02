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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Search",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v10,
              TextField(
                style: const TextStyle(
                  height: 0.6,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(12, 10, 5, 8),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    // default border
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none, // makes it invisible
                  ),
                  enabledBorder: OutlineInputBorder(
                    // border when enabled
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none, // makes it invisible
                  ),
                  focusedBorder: OutlineInputBorder(
                    // border when focused
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none, // makes it invisible
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
