import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<LoginProvider> loginProvider = StateNotifierProvider((ref) => LoginProvider(ref));

class LoginProvider extends StateNotifier<LoginState> {
  ProviderReference pRef;

  LoginProvider(this.pRef) : super(LoginState(isLoading: false));

  Future<void> fetchGoogleLogin() async {
    state = state.copyWith(isLoading: true);
    fbWrapper.signIn().then((isFinish) {
      if (isFinish == true) {
        pRef.read(authProvider).loggedIn();
        state = state.copyWith(isLoading: false);
      } else {
        state = state.copyWith(isLoading: false, isFailed: Failure('User is null'));
      }
    });
  }
}

class LoginState {
  final bool isLoading;
  final Failure isFailed;

  LoginState({
    this.isLoading,
    this.isFailed,
  });

  LoginState copyWith({bool isLoading, Failure isFailed}) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
      );

  @override
  String toString() => 'LoginState(isLoading: $isLoading,isFailed: $isFailed)';
}
