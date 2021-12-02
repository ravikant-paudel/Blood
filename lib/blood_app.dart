import 'package:blood/helper/router/go_router.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/login_page.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BloodApp extends StatelessWidget {
  const BloodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeProvider);

      return MaterialApp.router(
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
        title: 'Blood',
        theme: theme,
      );
    });
  }
}

// class BloodApp extends StatelessWidget {
//   final _rootRouter = RootRouter(
//       // authGuard: AuthGuard(),
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     // onReady((_) {
//     //   ref.read(authProvider.notifier).appStarted();
//     // });
//     return Consumer(
//       builder: (context, ref, child) {
//         final theme = ref.watch(themeProvider);
//         return MaterialApp.router(
//           title: 'Blood',
//           theme: theme,
//           routerDelegate: _rootRouter.delegate(),
//           routeInformationProvider: _rootRouter.routeInfoProvider(),
//           routeInformationParser: _rootRouter.defaultRouteParser(),
//           builder: (context, child) {
//             return child!;
//           },
//           // home: Consumer(builder: (context, watch, child) {
//           //   final authState = ref.watch(authProvider);
//           //   switch (authState) {
//           //     case AuthState.isInitial:
//           //       return SplashPage();s
//           //     case AuthState.isAuthenticated:
//           //       return MainPage();
//           //     case AuthState.isUnAuthenticated:
//           //       return const LoginPage();
//           //   }
//           // }),
//         );
//       },
//     );
//   }
// }
//
// void onReady(void Function(Duration) callback) {
// //  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
//   SchedulerBinding.instance!.addPostFrameCallback(callback);
// //  }
// }
