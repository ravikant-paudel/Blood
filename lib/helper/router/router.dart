import 'package:auto_route/auto_route.dart';
import 'package:blood/helper/router/auth_guard.dart';
import 'package:blood/pages/add_donor_page.dart';
import 'package:blood/pages/donor_list_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/login_page.dart';
import 'package:blood/pages/request_blood_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      // guards: [AuthGuard],
    ),
    AutoRoute(
      page: RequestBloodPage,
    ),
    AutoRoute(page: AddDonorPage),
    AutoRoute(page: DonorListPage),
    AutoRoute(page: LoginPage, path: '/login'),
//  MaterialRoute(page: DashboardPage),
  ],
)
class $RootRouter {}
