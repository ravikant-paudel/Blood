import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<AuthProvider> authProvider = StateNotifierProvider((_) => AuthProvider());

final FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());

  Future<void> appStarted() async {
    print('appStarted  appStarted ');
    final FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser != null) {
      print('not null ${currentUser.email}');
      state = state.copyWith(authenticated: Authenticated());
    } else {
      print('not null nukkk');
      state = state.copyWith(unAuthenticated: UnAuthenticated());
    }
  }

  Future<void> loginOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return _auth.signOut();
  }
}

class AuthState {
  final AuthInitial authInitial;
  final Authenticated authenticated;
  final UnAuthenticated unAuthenticated;

  AuthState({
    this.authInitial,
    this.authenticated,
    this.unAuthenticated,
  });

  AuthState copyWith({AuthInitial authInitial, Authenticated authenticated, UnAuthenticated unAuthenticated}) => AuthState(
        authInitial: authInitial ?? this.authInitial,
        authenticated: authenticated ?? this.authenticated,
        unAuthenticated: unAuthenticated ?? this.unAuthenticated,
      );

  @override
  String toString() => 'AuthState(authInitial: $authInitial,authenticated: $authenticated,unAuthenticated: $unAuthenticated)';
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}
