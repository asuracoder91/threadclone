import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/constants/sizes.dart';
import 'package:thread/main/widgets/activity_block.dart';

import '../../repos/dark_mode_provider.dart';
import '../model/fake_data.dart';

class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({super.key});
  static const routeURL = "/activity";
  static const routeName = "activityPage";

  @override
  ConsumerState<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage>
    with TickerProviderStateMixin {
  final activityArticles = fakeDataActivity;
  final categories = ["All", "Mentions", "Replies", "Likes", "Following"];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        FastSwitchTabController(length: categories.length, vsync: this);

    // Listen to tab changes and rebuild widget
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                    "Activity",
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: ref.read(darkModeProvider)
                          ? Colors.grey.shade600
                          : Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: ref.read(darkModeProvider)
                        ? Colors.grey.shade700
                        : Colors.black,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                    tabs: categories.map((category) {
                      return Tab(
                        child: Container(
                          color: Colors.transparent,
                          child: Container(
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _tabController.index ==
                                        categories.indexOf(category)
                                    ? Colors.black
                                    : Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text(category)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  height: 800,
                  child: TabBarView(
                    controller:
                        _tabController, // Make sure to use the same controller here
                    children: categories.map((category) {
                      List articlesToShow = category == "All"
                          ? activityArticles
                          : activityArticles
                              .where(
                                (article) => article.avatarCategory == category,
                              )
                              .toList();

                      return ListView.builder(
                        itemCount: articlesToShow.length,
                        itemBuilder: (context, index) {
                          return ActivityBlock(
                            avatar: articlesToShow[index].avatar,
                            account: articlesToShow[index].account,
                            time: articlesToShow[index].time,
                            category: articlesToShow[index].category,
                            avatarCategory:
                                articlesToShow[index].avatarCategory,
                            text: articlesToShow[index].text,
                            following: articlesToShow[index].following,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FastSwitchTabController extends TabController {
  FastSwitchTabController({required int length, required TickerProvider vsync})
      : super(length: length, vsync: vsync);

  @override
  Duration get animationDuration => const Duration(milliseconds: 0);
}
