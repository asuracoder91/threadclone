class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final bool hasAvatar;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.hasAvatar,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        hasAvatar = false;

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
    };
  }

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"],
        hasAvatar = json["hasAvatar"];

  UserProfileModel copyWith({
    String? email,
    String? uid,
    String? name,
    String? bio,
    String? link,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
