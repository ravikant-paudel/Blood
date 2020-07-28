import 'package:blood/models/user.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<LoginProvider> loginProvider = StateNotifierProvider((_) => LoginProvider());

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginState(isLoading: false, isLoaded: false));

  Future<void> fetchGoogleLogin() async {
    state = state.copyWith(isLoading: true);
    try {
      signIn().then((FirebaseUser user) {
        if (user != null) {
          authenticateUser(user).then((isNewUser) {
            if (isNewUser) {
              addDataToDb(user).then((value) {
                state = state.copyWith(isLoading: false, isLoaded: true);
              });
            } else {
              state = state.copyWith(isLoading: false, isLoaded: true);
            }
          });
        } else {
          state = state.copyWith(isLoading: false, isLoaded: true, isFailed: Failure('User is null'));
        }
      });
    } on Failure catch (e) {
      state = state.copyWith(isLoading: false, isLoaded: false, isFailed: Failure(e.message));
    }
  }


}

class LoginState {
  final bool isLoading;
  final bool isLoaded;
  final Failure isFailed;

  LoginState({
    this.isLoading,
    this.isLoaded,
    this.isFailed,
  });

  LoginState copyWith({bool isLoading, bool isLoaded, Failure isFailed}) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        isFailed: isFailed ?? this.isFailed,
      );

  @override
  String toString() => 'LoginState(isLoading: $isLoading,isLoaded: $isLoaded,isFailed: $isFailed)';
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final Firestore _firestore = Firestore.instance;

Future<FirebaseUser> signIn() async {
  final GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication _signInAuthentication = await _signInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: _signInAuthentication.accessToken,
    idToken: _signInAuthentication.idToken,
  );

  final AuthResult result = await _auth.signInWithCredential(credential);
  return result.user;
}

Future<bool> authenticateUser(FirebaseUser user) async {
  final QuerySnapshot result = await _firestore.collection("users").where("email", isEqualTo: user.email).getDocuments();
  final List<DocumentSnapshot> docs = result.documents;

  return docs.isEmpty ? true : false;
}

Future<void> addDataToDb(FirebaseUser cUser) async {
  //user class
  User user = User();
  final String userName = Utils.getUsername(cUser.email);
  user = User(
    uid: cUser.uid,
    email: cUser.email,
    name: cUser.displayName,
    profilePhoto: cUser.photoUrl,
    username: userName,
  );
  _firestore.collection("users").document(user.uid).setData(user.toMap(user));
}
