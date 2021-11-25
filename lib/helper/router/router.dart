import 'package:auto_route/auto_route.dart';
import 'package:blood/pages/add_donor_page.dart';
import 'package:blood/pages/donor_list_page.dart';
import 'package:blood/pages/home_page.dart';
import 'package:blood/pages/request_blood_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: HomePage),
    AutoRoute(page: RequestBloodPage),
    AutoRoute(page: AddDonorPage),
    AutoRoute(page: DonorListPage),
//  MaterialRoute(page: DashboardPage),
  ],
)
class $Router {}
