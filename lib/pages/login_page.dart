import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/go_router.dart';
import 'package:blood/providers/login_provider.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final loginState = ref.watch(loginProvider);
        final loginProv = ref.watch(loginProvider.notifier);
        if (loginState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final failed = loginState.isFailed;
        if (failed != null) {}
        return BloodListView(
          padding: const EdgeInsets.all(d_margin4),
          children: [
            const VerticalGap(d_margin10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Welcome \n to Blood',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 30,
                        ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 60,
                  width: 60,
                  color: Colors.white,
                ),
                const HorizontalGap(d_margin2),
              ],
            ),
            const VerticalGap(d_margin10),
            BloodButton(
              onPressed: () async {
                if (await loginProv.fetchGoogleLogin()) {
                  goRouter.go('/home/dashboard');
                }
              },
              buttonText: 'Google Login',
            ),
            const VerticalGap(d_margin2),
            BloodButton(
              onPressed: () async {},
              buttonText: 'Facebook Login',
            ),
            const VerticalGap(d_margin6),
            BloodButton(
              onPressed: () async {},
              buttonText: 'Register With',
            ),
          ],
        );
      }),
    );
  }
}
