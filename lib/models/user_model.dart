class UserModel {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  Map<String, dynamic> toMap(UserModel user) {
    final data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['profile_photo'] = user.profilePhoto;
    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'] as String;
    name = mapData['name'] as String;
    email = mapData['email'] as String;
    username = mapData['username'] as String;
    profilePhoto = mapData['profile_photo'] as String;
  }
}