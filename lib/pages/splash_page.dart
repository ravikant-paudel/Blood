// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blood/utils/shortcuts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.color.primary,
        child: Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 80,
            width: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
