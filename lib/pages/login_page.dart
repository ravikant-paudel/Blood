import 'package:blood/pages/main_page.dart';
import 'package:blood/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 30, left: 16, right: 16),
        child: Consumer((context, read) {
          final loginState = read(loginProvider.state);
          if (loginState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (loginState.isLoaded== true) {
            return MainPage();
//            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//              return MainPage();
//            }));
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
                      loginProvider.read(context).fetchGoogleLogin();
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
