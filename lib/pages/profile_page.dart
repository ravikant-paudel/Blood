import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/go_router.dart';
import 'package:blood/providers/theme_provider.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: Consumer(builder: (context, ref, child) {
          final themeState = ref.watch(themeProvider);
          final themePro = ref.watch(themeProvider.notifier);
          final currentUser = fbWrapper.checkCurrentUser();
          return BloodListView(
            children: [
              const VerticalGap(),
              Text(currentUser?.displayName ?? ''),
              Text(currentUser?.email ?? ''),
              Text(currentUser?.phoneNumber ?? ''),
              Text(currentUser?.photoURL ?? ''),
              const VerticalGap(d_margin6),
              BloodButton(
                buttonText: 'SIGN OUT',
                onPressed: () {
                  fbWrapper.loginOut();
                  goRouter.go('/login');
                },
              ),
              // ListTile(
              //   title: const Text('Dark Theme'),
              //   contentPadding: const EdgeInsets.only(left: 16.0),
              //   trailing: Transform.scale(
              //       scale: 0.4,
              //       child: DayNightSwitch(
              //         value: themeState.brightness == Brightness.dark,
              //         onChanged: themePro.onThemeChange,
              //       )),
              // ),
            ],
          );
        }));
  }
}
