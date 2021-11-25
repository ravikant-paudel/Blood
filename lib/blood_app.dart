import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/main_page.dart';
import 'package:blood/pages/splash_page.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onReady((_) {
      (context as WidgetRef).read(authProvider.notifier).appStarted();
    });
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        title: 'Blood',
        theme: theme,
        home: Consumer(builder: (context, watch, child) {
          final authState = ref.watch(authProvider);
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
    });
  }
}

void onReady(void Function(Duration) callback) {
//  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
  SchedulerBinding.instance!.addPostFrameCallback(callback);
//  }
}
