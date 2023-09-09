import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/main/view/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _onGoPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PrivacyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text("< Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
        ),
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: ListView(children: [
        const Divider(
          thickness: 0.5,
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.userPlus),
          title: Text("Follow and invite friends"),
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
                      onPressed: () {},
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
