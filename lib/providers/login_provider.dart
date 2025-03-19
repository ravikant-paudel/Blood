import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/failure.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<LoginProvider, LoginState> loginProvider = StateNotifierProvider((ref) => LoginProvider(ref));

class LoginProvider extends StateNotifier<LoginState> {
  Ref pRef;

  LoginProvider(this.pRef) : super(LoginState(isLoading: false));

  Future<bool> fetchGoogleLogin() async {
    state = state.copyWith(isLoading: true);
    final isFinish = await fbWrapper.signInWithGoogle();
    if (isFinish) {
      pRef.read(authProvider.notifier).loggedIn();
      state = state.copyWith(isLoading: false);
      return true;
    } else {
      state = state.copyWith(isLoading: false, isFailed: Failure('User is null'));
      return false;
    }
  }
}

class LoginState {
  final bool isLoading;
  final Failure? isFailed;

  LoginState({
    this.isLoading = false,
    this.isFailed,
  });

  LoginState copyWith({bool? isLoading, Failure? isFailed}) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
      );

  @override
  String toString() => 'LoginState(isLoading: $isLoading,isFailed: $isFailed)';
}
