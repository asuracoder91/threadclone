import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/main/view/main_page.dart';
import 'package:thread/main/view/search_page.dart';

import '../../constants/sizes.dart';
import '../widgets/write_page.dart';
import 'activity_page.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});
  static const routeURL = "/";
  static const routeName = "listPage";

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  int _selectedIndex = 0;

  final screens = [
    const MainPage(),
    const SearchPage(),
    const Center(
      child: Text('Write'),
    ),
    const ActivityPage(),
    const Center(
      child: Text('User'),
    ),
  ];

  void _onTap(int index) {
    switch (index) {
      case 2:
        showModalBottomSheet(
          context: context,
          builder: (context) => const WritePage(),
          backgroundColor: Colors.white,
          isScrollControlled: true,
        );
      default:
        setState(() {
          _selectedIndex = index;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 키보드 감추기
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        //appBar, 크기 조정
        appBar: _selectedIndex == 1 ||
                _selectedIndex == 3 // Search, Activity Page에서는 AppBar를 숨김
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBar(
                  automaticallyImplyLeading:
                      false, // Custom Leading을 위해 자동생성 막기
                  centerTitle: true,

                  scrolledUnderElevation: 0.0,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0), // 아이콘 상단 패딩
                    child: SvgPicture.asset(
                      "assets/thread.svg",
                      width: 32,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onTap,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 2.0,
          selectedIconTheme: const IconThemeData(size: 26), // 선택된 아이콘의 크기 지정
          unselectedIconTheme: const IconThemeData(size: 26),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 8.0,
                ),
                child: _selectedIndex == 0
                    ? SvgPicture.asset("assets/icons/feed.svg", width: 26)
                    : SvgPicture.asset("assets/icons/feed_unselect.svg",
                        width: 26),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: _selectedIndex == 1
                    ? SvgPicture.asset("assets/icons/magnify.svg", width: 26)
                    : SvgPicture.asset("assets/icons/magnify_unselect.svg",
                        width: 26),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: _selectedIndex == 2
                    ? SvgPicture.asset("assets/icons/write.svg", width: 26)
                    : SvgPicture.asset("assets/icons/write_unselect.svg",
                        width: 26),
              ),
              label: 'Write',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: _selectedIndex == 3
                    ? SvgPicture.asset("assets/icons/heart.svg", width: 26)
                    : SvgPicture.asset("assets/icons/heart_unselect.svg",
                        width: 26),
              ),
              label: 'Like',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                child: _selectedIndex == 4
                    ? SvgPicture.asset("assets/icons/user.svg", width: 26)
                    : SvgPicture.asset("assets/icons/user_unselect.svg",
                        width: 26),
              ),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
