import 'package:blood/helper/router/go_router.dart';
import 'package:blood/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 30, left: 16, right: 16),
        child: Consumer(builder: (context, ref, child) {
          final loginState = ref.watch(loginProvider);
          final loginProv = ref.watch(loginProvider.notifier);
          if (loginState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final failed = loginState.isFailed;
          if (failed != null) {}
          return SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Blood',
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (await loginProv.fetchGoogleLogin()) {
                        goRouter.go('/home/dashboard');
                      }
                    },
                    child: const Text('Google Login'),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
