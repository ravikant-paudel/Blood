import 'package:blood/features/login/presenter/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = Provider((_) => LoginPresenter());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer((context, read) {
        final vv = read(loginProvider);
        return Container(
          color: Colors.red[400],
          child: Center(
            child: RaisedButton(
              onPressed: () {
                vv.fetchLogin();
              },
              child: const Text('Google Login'),
            ),
          ),
        );
      }),
    );
  }
}

/* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));*/
