import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/main/view/main_page.dart';

import '../../constants/sizes.dart';

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
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Write'),
    ),
    const Center(
      child: Text('Like'),
    ),
    const Center(
      child: Text('User'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false, // Custom Leading을 위해 자동생성 막기
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 18.0), // 아이콘 상단 패딩
              child: SvgPicture.asset(
                "assets/thread.svg",
                width: 36,
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
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  bottom: 8.0,
                ),
                child: FaIcon(FontAwesomeIcons.house),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: FaIcon(FontAwesomeIcons.magnifyingGlass),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: FaIcon(FontAwesomeIcons.penToSquare),
              ),
              label: 'Write',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: FaIcon(FontAwesomeIcons.heart),
              ),
              label: 'Like',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                child: FaIcon(FontAwesomeIcons.user),
              ),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
