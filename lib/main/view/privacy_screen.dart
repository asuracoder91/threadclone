import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../repos/dark_mode_provider.dart';

class PrivacyScreen extends ConsumerStatefulWidget {
  const PrivacyScreen({super.key});

  static const routeURL = "privacy";
  static const routeName = "privacy";

  @override
  ConsumerState<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool privateProfile = true;

  _togglePrivateProfile() {
    setState(() {
      privateProfile = !privateProfile;
    });
  }

  _backToProfile() {
    Navigator.of(context).pop();
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
        title: Text('Privacy',
            style: TextStyle(
              color: ref.watch(darkModeProvider) ? Colors.white : Colors.black,
            )),
      ),
      body: ListView(children: [
        const Divider(
          thickness: 0.5,
        ),
        SwitchListTile(
          title: const Text("Private profile"),
          value: privateProfile,
          onChanged: (value) {
            _togglePrivateProfile();
          },
          secondary: const FaIcon(FontAwesomeIcons.lock),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.at),
          title: Text("Mentions"),
          trailing: SizedBox(
            width: 88,
            child: Row(
              children: [
                Text("Everyone ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    )),
                FaIcon(FontAwesomeIcons.angleRight, color: Colors.grey),
              ],
            ),
          ),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.bellSlash),
          title: Text("Muted"),
          trailing: FaIcon(FontAwesomeIcons.angleRight, color: Colors.grey),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.eyeSlash),
          title: Text("Hidden Words"),
          trailing: FaIcon(FontAwesomeIcons.angleRight, color: Colors.grey),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.userGroup),
          title: Text("Profiles you follow"),
        ),
        const Divider(
          thickness: 0.5,
        ),
        ListTile(
          title: const Text(
            "Other privacy settings",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          trailing: const FaIcon(
            FontAwesomeIcons.arrowUpRightFromSquare,
            color: Colors.grey,
            size: 18,
          ),
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
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.circleXmark),
          title: Text("Blocked profiles"),
          trailing: FaIcon(
            FontAwesomeIcons.arrowUpRightFromSquare,
            color: Colors.grey,
            size: 18,
          ),
        ),
        const ListTile(
          leading: FaIcon(FontAwesomeIcons.heartCrack),
          title: Text("Hide likes"),
          trailing: FaIcon(
            FontAwesomeIcons.arrowUpRightFromSquare,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ]),
    );
  }
}
