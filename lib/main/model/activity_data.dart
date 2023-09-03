import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityData {
  final String avatar;
  final String account;
  final String time;
  final String category;
  final String avatarCategory;
  final String? text;
  final bool following;

  ActivityData({
    required this.avatar,
    required this.account,
    required this.time,
    this.text,
    required this.category,
    required this.avatarCategory,
    required this.following,
  });
}
