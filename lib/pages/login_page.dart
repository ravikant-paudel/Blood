import 'package:blood/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 30, left: 16, right: 16),
        child: Consumer(builder: (context, watch, child) {
          final loginState = watch(loginProvider.state);
          final loginProv = watch(loginProvider);
          if (loginState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final failed = loginState.isFailed;
          if (failed != null) {
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Blood',
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      loginProv.fetchGoogleLogin();
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
