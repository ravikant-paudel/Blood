import 'package:blood/pages/add_donor_page.dart';
import 'package:blood/pages/dashboard_detail_page.dart';
import 'package:blood/pages/donor_list_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/request_blood_page.dart';
import 'package:blood/pages/splash_page.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  redirect: (BuildContext context, GoRouterState state) {
    final currentUser = fbWrapper.currentUser;
    if (state.uri.toString() != '/login' && currentUser == null) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/dashboard',
    ),
    GoRoute(
      name: 'splash',
      path: '/splash',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashPage(),
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
    GoRoute(
      path: '/home/:path',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: HomePage(
            path: state.pathParameters['path'],
          ),
        );
      },
      routes: [
        GoRoute(
          name: 'requestBlood',
          path: 'requestBlood',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: RequestBloodPage(),
          ),
        ),
        GoRoute(
          name: 'dashboardDetail',
          path: 'dashboardDetail/:idx',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const DashboardDetailPage(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      name: 'donorList',
      path: '/donorList',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: DonorListPage(bloodGroup: state.uri.queryParameters['bg']!),
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
  errorPageBuilder: (context, state) {
    logThis(state.error, tag: 'ERROR');
    return MaterialPage<void>(
      key: state.pageKey,
      child: const Scaffold(
        body: Center(child: Text('Error Page.')),
      ),
    );
  },
);
