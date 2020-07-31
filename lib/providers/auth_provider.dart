import 'package:blood/utils/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<AuthProvider> authProvider = StateNotifierProvider((_) => AuthProvider());

final FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState.isInitial);

  Future<void> appStarted() async {
    await LocatorB.init();
    final FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser != null) {
      state = AuthState.isAuthenticated;
    } else {
      state = AuthState.isUnAuthenticated;
    }
  }

  Future<void> loginOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return _auth.signOut();
  }
}

enum AuthState{
  isInitial, isAuthenticated, isUnAuthenticated
}