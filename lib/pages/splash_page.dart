// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.color.primary,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                height: 80,
                width: 80,
                color: Colors.white,
              ),
              const VerticalGap(d_margin1),
              Text(
                'Blood',
                style: context.theme.textTheme.headline5!.copyWith(
                  color: context.color.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
