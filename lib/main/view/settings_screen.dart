import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/main/view/privacy_screen.dart';

import '../../authentications/repos/authentication_repo.dart';
import '../../repos/dark_mode_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  static const routeURL = "/settings";
  static const routeName = "settings";

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _onGoPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PrivacyScreen()));
  }

  void _toggleDarkMode() {
    ref.read(darkModeProvider.notifier).toggle(); // 현재 상태 반전
  }

  _backToProfile() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: _backToProfile,
            child: const Text("< Back",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 16,
            color: ref.watch(darkModeProvider) ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: ListView(children: [
        const Divider(
          thickness: 0.5,
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.userPlus),
          title: Text("Follow and invite friends"),
        ),
        SwitchListTile(
          title: const Text("Dark mode"),
          value: ref.watch(darkModeProvider),
          onChanged: (value) {
            _toggleDarkMode();
          },
          secondary: const FaIcon(FontAwesomeIcons.lock),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.solidBell),
          title: Text("Notifications"),
        ),
        ListTile(
          leading: const FaIcon(FontAwesomeIcons.lock),
          title: const Text("Privacy"),
          onTap: _onGoPressed,
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.solidCircleUser),
          title: Text("Account"),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.solidLifeRing),
          title: Text("Help"),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.circleInfo),
          title: Text("About"),
        ),
        const Divider(
          thickness: 0.5,
        ),
        ListTile(
          title: const Text("Log out"),
          textColor: Colors.blue,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Please think again"),
                  actions: [
                    IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: const FaIcon(FontAwesomeIcons.x),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(authRepo).signOut();
                        context.go("/login");
                      },
                      icon: const FaIcon(FontAwesomeIcons.o),
                    ),
                  ]),
            );
          },
        ),
      ]),
    );
  }
}
