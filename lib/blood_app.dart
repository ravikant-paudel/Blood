import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/main_page.dart';
import 'package:blood/pages/splash_page.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onReady((_) {
      authProvider.read(context).appStarted();
    });
    return MaterialApp(
      title: 'Blood',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      ),
      home: Consumer((context, read) {
        final authState = read(authProvider.state);
        if (authState.authenticated is Authenticated) return MainPage();
        if (authState.unAuthenticated is UnAuthenticated) return LoginPage();
        return SplashPage();
      }),
    );
  }
}

void onReady(void Function(Duration) callback) {
  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
    SchedulerBinding.instance.addPostFrameCallback(callback);
  }
}
