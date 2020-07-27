import 'package:blood/features/login/presenter/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<LoginPresenter> loginProvider = Provider((_) => LoginPresenter());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16,top: 30, left: 16, right: 16),
        child: Consumer((context, read) {
          final loginPre = read(loginProvider);
          loginPre.state.when(loading: null, loaded: null, failed: null);
          return SingleChildScrollView(
            child: Column(
              children: [
                const Text('Blood', ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      loginPre.fetchGoogleLogin();
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

                /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));*/
