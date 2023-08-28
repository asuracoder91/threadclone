import 'package:flutter/material.dart';
import 'package:thread/main/widgets/article_block.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const ArticleBlock(),
    );
  }
}
