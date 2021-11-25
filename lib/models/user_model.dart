class UserModel {
  final String uid;
  final String name;
  final String? email;
  final String? username;
  final String? notificationToken;
  final String? profilePhoto;

  UserModel({
    required this.uid,
    required this.name,
    this.email,
    this.username,
    this.notificationToken,
    this.profilePhoto,
  });

  Map<String, dynamic> toMap(UserModel user) {
    final data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['notificationToken'] = user.notificationToken;
    data['profile_photo'] = user.profilePhoto;
    return data;
  }

  factory UserModel.fromMap(Map<String, dynamic> mapData) {
    return UserModel(
      uid: mapData['uid'] as String,
      name: mapData['name'] as String,
      email: mapData['email'] as String?,
      username: mapData['username'] as String?,
      notificationToken: mapData['notificationToken'] as String?,
      profilePhoto: mapData['profilePhoto'] as String?,
    );
  }
}
