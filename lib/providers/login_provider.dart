import 'package:blood/models/user_model.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<LoginProvider> loginProvider = StateNotifierProvider((ref) => LoginProvider(ref));

class LoginProvider extends StateNotifier<LoginState> {
  ProviderReference pRef;

  LoginProvider(this.pRef) : super(LoginState(isLoading: false));

  Future<void> fetchGoogleLogin() async {
    state = state.copyWith(isLoading: true);
    try {
      signIn().then((FirebaseUser user) {
        if (user != null) {
          authenticateUser(user).then((isNewUser) {
            preference.set(PreferenceKey.USER_ID, user.uid);
            if (isNewUser) {
              addDataToDb(user).then((value) {
                pRef.read(authProvider).loggedIn();
                state = state.copyWith(isLoading: false);
              });
            } else {
              pRef.read(authProvider).loggedIn();
              state = state.copyWith(isLoading: false);
            }
          });
        } else {
          state = state.copyWith(isLoading: false, isFailed: Failure('User is null'));
      }
      });
    } on Failure catch (e) {
      state = state.copyWith(isLoading: false, isFailed: Failure(e.message));
    }
  }


}

class LoginState {
  final bool isLoading;
  final Failure isFailed;

  LoginState({
    this.isLoading,
    this.isFailed,
  });

  LoginState copyWith({bool isLoading, Failure isFailed}) =>
      LoginState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
      );

  @override
  String toString() => 'LoginState(isLoading: $isLoading,isFailed: $isFailed)';
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
  return docs.isEmpty;
}

Future<void> addDataToDb(FirebaseUser cUser) async {
  //user class
  UserModel user = UserModel();
  final String userName = Utils.getUsername(cUser.email);
  user = UserModel(
    uid: cUser.uid,
    email: cUser.email,
    name: cUser.displayName,
    profilePhoto: cUser.photoUrl,
    username: userName,
  );
  _firestore.collection("users").document(user.uid).setData(user.toMap(user));
}
