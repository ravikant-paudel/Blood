import 'package:blood/models/user.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';

part 'login_presenter.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.loading() = _LoginLoading;

  factory LoginState.loaded() = _LoginLoaded;

  factory LoginState.failed(Failure failure) = _LoginFailed;
}

class LoginPresenter extends StateNotifier<LoginState> with LocatorMixin {
  LoginPresenter() : super(_LoginLoading());

  void fetchGoogleLogin() {
    try {
      signIn().then((FirebaseUser user) {
        if (user != null) {
          authenticateUser(user).then((isNewUser) {
            if (isNewUser) {
              addDataToDb(user).then((value) {
                state = _LoginLoaded();
              });
            }else{
              state = _LoginLoaded();
            }
          });
        } else {
          print('There is an error.');
        }
      });
    } on Failure catch (e) {
      state = _LoginFailed(e);
    }
  }
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