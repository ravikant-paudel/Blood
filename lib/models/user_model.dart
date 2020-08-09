class UserModel {
  String uid;
  String name;
  String email;
  String username;
  String notificationToken;
  String profilePhoto;

  UserModel({
    this.uid,
    this.name,
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

  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'] as String;
    name = mapData['name'] as String;
    email = mapData['email'] as String;
    username = mapData['username'] as String;
    notificationToken = mapData['notificationToken'] as String;
    profilePhoto = mapData['profile_photo'] as String;
  }
}
