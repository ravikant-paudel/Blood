import 'package:blood/pages/add_donor_page.dart';
import 'package:blood/pages/donor_list_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/request_blood_page.dart';
import 'package:blood/utils/shortcuts.dart';
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
      redirect: (_) => '/dashboard',
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: '/:path',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: HomePage(
            path: state.params['path'],
          ),
        );
      },
    ),
    GoRoute(
      name: 'requestBlood',
      path: '/requestBlood',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const RequestBloodPage(),
      ),
    ),
    GoRoute(
      name: 'donorList',
      path: '/donorList',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: DonorListPage(bloodGroup: state.queryParams['bg']!),
      ),
      routes: [
        GoRoute(
          name: 'addDonor',
          path: 'addDonor',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: AddDonorPage(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: const Scaffold(
      body: Center(child: Text('Error Page.')),
    ),
  ),
);
