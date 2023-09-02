import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class ShowReport extends StatelessWidget {
  const ShowReport({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.8,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size20),
        ),
        child: Column(
          children: [
            Gaps.v4,
            //small handle
            Container(
              height: Sizes.size4,
              width: Sizes.size36,
              margin: const EdgeInsets.symmetric(vertical: Sizes.size8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(Sizes.size4),
              ),
            ),
            Gaps.v6,
            //report
            const Text(
              "Report",
              style: TextStyle(
                  fontSize: Sizes.size16, fontWeight: FontWeight.w700),
            ),
            Gaps.v12,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Why are you reporting this thread?",
                                style: TextStyle(
                                    fontSize: Sizes.size14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Gaps.v6,
                              Text(
                                "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                                style: TextStyle(
                                    fontSize: Sizes.size12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gaps.v6,
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "I just don't like it",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "It's unlawful content under NetzDG",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "It's spam",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "Hate speech or symbols",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "Nudiity or sexual activity",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        "False information or impersonation",
                        style: TextStyle(fontSize: Sizes.size14),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: Sizes.size14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
