import 'package:auto_route/auto_route_annotations.dart';
import 'package:blood/pages/add_donor_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/request_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage),
  MaterialRoute(page: RequestPage),
  MaterialRoute(page: AddDonorPage),
//  MaterialRoute(page: DashboardPage),
])
class $Router {}
