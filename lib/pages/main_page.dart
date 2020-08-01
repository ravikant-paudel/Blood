// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:auto_route/auto_route.dart';
import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/providers/login_provider.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNavigator(
        initialRoute: Routes.homePage,
        router: Router(),
        name: 'mainRouter',
      ),
    );
  }
}
