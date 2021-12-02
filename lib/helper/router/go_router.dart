import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/login_page.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  redirect: (state) {
    final currentUser = fbWrapper.checkCurrentUser();
    if (state.location != '/login' && currentUser == null) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: HomePage(),
      ),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LoginPage(),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: const Scaffold(
      body: Center(child: Text('Error Page.')),
    ),
  ),
);
