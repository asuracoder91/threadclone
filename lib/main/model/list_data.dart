class ListData {
  final String avatar;
  final String name;
  final bool blueCheck;
  final String time;
  final String? text;
  final List<String> images;
  final int replies;
  final List<String> replyAvatars;
  final int likes;

  ListData({
    required this.avatar,
    required this.name,
    required this.blueCheck,
    required this.time,
    required this.text,
    required this.images,
    required this.replies,
    required this.replyAvatars,
    required this.likes,
  });
}
