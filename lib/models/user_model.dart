import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String? email;
  final String? username;
  final String? notificationToken;
  final String? profilePhoto;
  final Timestamp? createdAt;
  final Timestamp? lastLogin;

  UserModel({
    required this.uid,
    required this.name,
    this.email,
    this.username,
    this.notificationToken,
    this.profilePhoto,
    this.createdAt,
    this.lastLogin,
  });

  // For writing to Firestore (excludes timestamps)
  Map<String, dynamic> toCreationMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'username': username,
      'notification_token': notificationToken,
      'profile_photo': profilePhoto,
      // Omit timestamps as they'll be set server-side
    };
  }

  // For updates that might include timestamps
  Map<String, dynamic> toUpdateMap() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'notification_token': notificationToken,
      'profile_photo': profilePhoto,
      'last_login': FieldValue.serverTimestamp(),
    };
  }

  // For reading from Firestore
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'] as String,
      name: data['name'] as String,
      email: data['email'] as String?,
      username: data['username'] as String?,
      notificationToken: data['notification_token'] as String?,
      profilePhoto: data['profile_photo'] as String?,
      createdAt: data['created_at'] as Timestamp?,
      lastLogin: data['last_login'] as Timestamp?,
    );
  }

  // Add this for empty/default state
  static UserModel empty() => UserModel(
        uid: '',
        name: '',
      );
}
