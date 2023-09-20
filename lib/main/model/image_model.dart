class ImageModel {
  final String avatar;
  final String name;
  final bool blueCheck;
  final String time;
  final String? text;
  final List<String> images;
  final int replies;
  final List<String> replyAvatars;
  final int likes;
  final int createdAt;

  ImageModel({
    required this.avatar,
    required this.name,
    required this.blueCheck,
    required this.time,
    required this.text,
    required this.images,
    required this.replies,
    required this.replyAvatars,
    required this.likes,
    required this.createdAt,
  });

  ImageModel.fromJson(
      {required Map<String, dynamic> json, required String imageId})
      : avatar = json["avatar"],
        name = json["name"],
        blueCheck = json["blueCheck"],
        time = json["time"],
        text = json["text"],
        images = List<String>.from(json["images"]),
        replies = json["replies"],
        replyAvatars = List<String>.from(json["replyAvatars"]),
        likes = json["likes"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      "avatar": avatar,
      "name": name,
      "blueCheck": blueCheck,
      "time": time,
      "text": text,
      "images": images,
      "replies": replies,
      "replyAvatars": replyAvatars,
      "likes": likes,
      "createdAt": createdAt,
    };
  }
}
