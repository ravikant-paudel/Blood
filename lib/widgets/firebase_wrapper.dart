import 'dart:async';

import 'package:blood/models/user_model.dart';
import 'package:blood/utils/constants.dart';
import 'package:blood/utils/empty_util.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseWrapper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication _signInAuthentication = await _signInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken,
      );
      final result = await _auth.signInWithCredential(credential);

      final signInUser = result.user;
      if (signInUser != null) {
        authenticateUser(signInUser).then((isNewUser) {
          preference.set(PreferenceKey.USER_ID, signInUser.uid);
          if (isNewUser) {
            addDataToDb(signInUser).then((_) {
              return true;
            });
          } else {
            return true;
          }
        });
      } else {
        return false;
      }
    } on Failure catch (e) {
      return false;
    }
  }

  Future<bool> authenticateUser(User signInUser) async {
    final QuerySnapshot result = await _firestore
        .collection(Constants.user_collection)
        .where(
          Constants.userEmail,
          isEqualTo: signInUser.email,
        )
        .get();
    final List<DocumentSnapshot> docs = result.docs;
    return docs.isEmpty;
  }

  Future<void> addDataToDb(User cUser) async {
    //user class
    UserModel user = UserModel();
    final String userName = Utils.getUsername(cUser.email);
    final String notiToken = preference.get(PreferenceKey.NOTIFICATION_TOKEN);
    user = UserModel(
      uid: cUser.uid,
      email: cUser.email,
      name: cUser.displayName,
      profilePhoto: cUser.photoURL,
      username: userName,
      notificationToken: notiToken,
    );
    fbWrapper.insertToDb(Constants.user_collection, user.uid, user.toMap(user));
  }

  Future<void> insertToDb(String tableName, String docId, Map<String, dynamic> map) async {
    if (docId.isNotNullAndNotEmpty) {
      await _firestore.collection(tableName).doc(docId).set(map);
    } else {
      await _firestore.collection(tableName).add(map);
    }
  }

  String getRandomId(String tableName) {
    return _firestore.collection(tableName).doc().id;
  }

  Stream<List<T>> getStreamListFrmDb<T>(String tableName, T Function(DocumentSnapshot) funQuery, {Query Function(Query) query}) {
    if (query != null) {
      return query(_firestore.collection(tableName)).snapshots().map(
            (snapShot) => snapShot.docs.map(funQuery).toList(),
          );
    } else {
      return _firestore.collection(tableName).snapshots().map(
            (snapShot) => snapShot.docs.map(funQuery).toList(),
          );
    }
  }

  Future<User> checkCurrentUser() async {
    final User currentUser = await _auth.currentUser;
    return currentUser;
  }

  Future<void> loginOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return _auth.signOut();
  }
}
