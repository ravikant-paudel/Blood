class User {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  User({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  Map<String, dynamic> toMap(User user) {
    final data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['status'] = user.status;
    data['state'] = user.state;
    data['profile_photo'] = user.profilePhoto;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'] as String;
    name = mapData['name'] as String;
    email = mapData['email'] as String;
    username = mapData['username'] as String;
    status = mapData['status'] as String;
    state = mapData['state'] as int;
    profilePhoto = mapData['profile_photo'] as String;
  }
}
