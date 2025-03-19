import 'dart:async';

import 'package:blood/models/user_model.dart';
import 'package:blood/utils/constants.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseWrapper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId: '', // Add if needed for web
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Main authentication flow
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return await _handleUserResult(userCredential);
    } on FirebaseAuthException catch (e) {
      _logError('Google Sign-In Failed', e);
      return false;
    } catch (e, stack) {
      _logError('Unexpected Error', e, stack);
      return false;
    }
  }

  Future<bool> _handleUserResult(UserCredential credential) async {
    final user = credential.user;
    if (user == null) return false;

    preference.set(PreferenceKey.userId, user.uid);

    if (credential.additionalUserInfo?.isNewUser ?? false) {
      await _createUserDocument(user);
    }

    return true;
  }

  Future<void> _createUserDocument(User user) async {
    final userDoc = _firestore.collection(Constants.userCollection).doc(user.uid);

    final userData = UserModel(
      uid: user.uid,
      email: user.email!,
      name: user.displayName ?? 'Anonymous',
      profilePhoto: user.photoURL,
      username: Utils.getUsername(user.email!),
      notificationToken: preference.get(PreferenceKey.notificationToken) ?? '',
      createdAt: null,
      lastLogin: null,
    );

    await userDoc.set(userData.toUpdateMap());
  }

  // Database operations
  Future<void> insertDocument({
    required String collection,
    required String? docId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    try {
      final ref = docId != null ? _firestore.collection(collection).doc(docId) : _firestore.collection(collection).doc();

      await ref.set(data, SetOptions(merge: merge));
    } on FirebaseException catch (e) {
      throw Failure('Database Error: ${e.code}');
    }
  }

  // Stream operations
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(DocumentSnapshot<Map<String, dynamic>> doc) builder,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? queryBuilder,
    int Function(T, T)? sort,
  }) {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(path);
      if (queryBuilder != null) query = queryBuilder(query);

      return query.snapshots().handleError((e) {
        throw Failure('Stream Error: ${e.code}');
      }).map((snapshot) {
        final docs = snapshot.docs.map(builder).toList();
        if (sort != null) docs.sort(sort);
        return docs;
      });
    } on FirebaseException catch (e) {
      throw Failure('Stream Setup Failed: ${e.code}');
    }
  }

  // User management
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Failure('Password Reset Failed: ${e.code}');
    }
  }

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    try {
      await _auth.currentUser?.updateDisplayName(displayName);
      await _auth.currentUser?.updatePhotoURL(photoURL);
      await _auth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw Failure('Profile Update Failed: ${e.code}');
    }
  }

  // Phone authentication
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(Failure) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onError(Failure('Verification Failed: ${e.code}'));
      },
      codeSent: (String verificationId, int? resendToken) {
        preference.set(PreferenceKey.verificationId, verificationId);
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 120),
    );
  }

  // Session management
  User? get currentUser => _auth.currentUser;

  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await preference.clearAll();
    } on FirebaseAuthException catch (e) {
      throw Failure('Logout Failed: ${e.code}');
    }
  }

  // Error handling
  void _logError(String context, dynamic error, [StackTrace? stack]) {
    logThis('$context: ${error.toString()}');
    if (stack != null) logThis('Stack Trace: $stack');
  }

  // Utility
  String generateDocumentId(String collectionPath) => _firestore.collection(collectionPath).doc().id;
}

// // Before
// fbWrapper.signIn();
// fbWrapper.getStreamListFrmDb(...);
// fbWrapper.insertToDb(...);
// fbWrapper.checkCurrentUser();
// fbWrapper.loginOut();
//
// // After
// fbWrapper.signInWithGoogle();
// fbWrapper.collectionStream(...);
// fbWrapper.insertDocument(...);
// fbWrapper.currentUser;  // Property access
// fbWrapper.logout();
