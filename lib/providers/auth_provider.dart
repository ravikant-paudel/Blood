import 'package:blood/providers/theme_provider.dart';
import 'package:blood/utils/locator.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<AuthProvider, AuthState> authProvider = StateNotifierProvider((ref) => AuthProvider(ref));

// final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthProvider extends StateNotifier<AuthState> {
  final ProviderReference ref;

  AuthProvider(this.ref) : super(AuthState.isInitial);

  Future<void> appStarted() async {
    await LocatorB.init();
    ref.read(themeProvider.notifier).init();
    final User? currentUser = fbWrapper.checkCurrentUser();
    if (currentUser != null) {
      state = AuthState.isAuthenticated;
      logThis('NOT ==============  here isr= equal');
    } else {
      logThis('ELSE here isr= equal');
      state = AuthState.isUnAuthenticated;
    }
  }

  void loggedIn() {
    state = AuthState.isAuthenticated;
  }
}

enum AuthState { isInitial, isAuthenticated, isUnAuthenticated }
