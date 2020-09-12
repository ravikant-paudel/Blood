import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/main_page.dart';
import 'package:blood/pages/splash_page.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    onReady((_) {
      context.read(authProvider).appStarted();
    });
    // return Consumer(builder: (context, watch, child) {
      final theme = watch(themeProvider.state);
      return MaterialApp(
        title: 'Blood',
        theme: theme,
        home: Consumer(builder: (context, watch, child) {
          final authState = watch(authProvider.state);
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
    // });
  }
}

void onReady(void Function(Duration) callback) {
//  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
  SchedulerBinding.instance.addPostFrameCallback(callback);
//  }
}
