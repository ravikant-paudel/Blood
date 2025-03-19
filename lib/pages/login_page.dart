import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/go_router.dart';
import 'package:blood/providers/login_provider.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final loginState = ref.watch(loginProvider);
          final loginProv = ref.watch(loginProvider.notifier);
          if (loginState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final failed = loginState.isFailed;
          if (failed != null) {}
          return ColoredBox(
            color: context.color.primary,
            child: BloodListView(
              padding: const EdgeInsets.all(d_margin4),
              children: [
                const VerticalGap(d_margin10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome \n to Blood',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/logo.svg',
                      height: 80,
                      width: 80,
                      color: Colors.white,
                    ),
                    const HorizontalGap(d_margin1),
                  ],
                ),
                const VerticalGap(d_margin9),
                BloodButton.white(
                  onPressed: () async {
                    if (await loginProv.fetchGoogleLogin()) {
                      goRouter.go('/home/dashboard');
                    }
                    goRouter.go('/login');
                  },
                  buttonText: 'Google Login',
                ),
                const VerticalGap(d_margin2),
                BloodButton.white(
                  onPressed: () async {},
                  buttonText: 'Facebook Login',
                ),
                const VerticalGap(d_margin6),
                BloodButton.white(
                  onPressed: () async {},
                  buttonText: 'Register With',
                ),
                const VerticalGap(d_margin1),
                Center(
                  child: BloodButton.text(
                    onPressed: () {},
                    buttonText: 'Already login',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
