import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/constants/gaps.dart';
import 'package:thread/constants/sizes.dart';
import 'package:thread/main/view/activity_simple_page.dart';
import 'package:thread/main/widgets/activity_block.dart';

import '../../repos/dark_mode_provider.dart';
import '../model/fake_data.dart';
import '../widgets/persistent_tab_bar.dart';
import 'main_page.dart';
import 'settings_screen.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});
  static const routeURL = "/profile";
  static const routeName = "profile";

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  void _onGearPressed() async {
    await context.push(SettingsScreen.routeURL).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    leading: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FaIcon(FontAwesomeIcons.globe),
                    ),
                    actions: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: _onGearPressed,
                            icon: const FaIcon(FontAwesomeIcons.instagram),
                          ),
                          IconButton(
                            onPressed: _onGearPressed,
                            icon: const FaIcon(FontAwesomeIcons.gripLines),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14, left: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "John",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Sizes.size24,
                                      color: ref.read(darkModeProvider)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Gaps.v10,
                                  Row(
                                    children: [
                                      Text(
                                        "john_wick",
                                        style: TextStyle(
                                          fontSize: Sizes.size16,
                                          color: ref.read(darkModeProvider)
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Gaps.h10,
                                      //Rounded Gray button
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size4,
                                          horizontal: Sizes.size8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ref.read(darkModeProvider)
                                              ? Colors.grey.shade800
                                              : Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(
                                            Sizes.size16,
                                          ),
                                        ),
                                        child: const Text(
                                          'threads.net',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: Sizes.size12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gaps.v10,
                                  Text(
                                    "Wa chacha wa",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                      color: ref.read(darkModeProvider)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Gaps.v6,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 52,
                                        height: 24,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 3,
                                              bottom: 0,
                                              child: Container(
                                                width: 21,
                                                height: 21,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      ref.read(darkModeProvider)
                                                          ? Colors.grey.shade800
                                                          : Colors.grey,
                                                ),
                                                child: const Center(
                                                  child: CircleAvatar(
                                                    radius: 9,
                                                    foregroundImage: AssetImage(
                                                        "assets/avatars/fu.jpg"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              bottom: 0,
                                              child: Container(
                                                width: 21,
                                                height: 21,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      ref.read(darkModeProvider)
                                                          ? Colors.grey.shade800
                                                          : Colors.grey,
                                                ),
                                                child: const Center(
                                                  child: CircleAvatar(
                                                    radius: 9,
                                                    foregroundImage: AssetImage(
                                                        "assets/avatars/mnk.jpg"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "2 followers",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 8, 18, 0),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                    child: CircleAvatar(
                                      radius: 28,
                                      foregroundImage: AssetImage(
                                          "assets/avatars/johnwick.jpeg"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gaps.v24,
                        Gaps.v14,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width * 0.45,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(Sizes.size8),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                              child: Text(
                                'Edit profile',
                                style: TextStyle(
                                  color: ref.read(darkModeProvider)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.h10,
                            Container(
                              width: size.width * 0.45,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(Sizes.size8),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                              child: Text(
                                'Share profile',
                                style: TextStyle(
                                  color: ref.read(darkModeProvider)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v20,
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentTabBar(),
                  ),
                ];
              },
              body: const TabBarView(
                children: [
                  MainPage(),
                  Center(
                    child: ActivitySimplePage(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
