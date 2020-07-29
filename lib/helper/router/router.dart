import 'package:auto_route/auto_route_annotations.dart';
import 'package:blood/pages/dashboard_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/request_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage),
  MaterialRoute(page: RequestPage),
//  MaterialRoute(page: DashboardPage),
])
class $Router {}
