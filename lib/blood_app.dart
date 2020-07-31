import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/main_page.dart';
import 'package:blood/pages/splash_page.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onReady((_) {
      authProvider.read(context).appStarted();
    });
    return Consumer((context, read) {
      final theme = read(themeProvider);
      return MaterialApp(
        title: 'Blood',
        theme: theme.setDarkTheme(),
        home: Consumer((context, read) {
          final authState = read(authProvider.state);
          switch (authState) {
            case AuthState.isInitial:
              return SplashPage();
            case AuthState.isAuthenticated:
              return MainPage();
            case AuthState.isUnAuthenticated:
              return LoginPage();
          }
          return SplashPage();
        }),
      );
    }
    );
  }
}

void onReady(void Function(Duration) callback) {
  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
    SchedulerBinding.instance.addPostFrameCallback(callback);
  }
}
