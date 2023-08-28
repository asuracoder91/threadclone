import 'package:flutter/material.dart';

class ArticleBlock extends StatelessWidget {
  const ArticleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage("assets/elon.webp"),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text("2"),
          ],
        ),
        const Row(
          children: [
            Text("3"),
            Text("4"),
          ],
        )
      ],
    );
  }
}
