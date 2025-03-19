// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/go_router.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      goRouter.go('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColoredBox(
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
                    style: context.theme.textTheme.headlineSmall!.copyWith(
                      color: context.color.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const PositionedCircle(containerHeight: 336, containerWidth: 336, positionedLeft: -253, positionedTop: 42),
          const PositionedCircle(containerHeight: 336, containerWidth: 336, positionedLeft: -297, positionedTop: 234),
          const PositionedCircle(containerHeight: 166, containerWidth: 166, positionedLeft: 308, positionedBottom: 162),
          const PositionedCircle(containerHeight: 295, containerWidth: 295, positionedLeft: 175, positionedBottom: -48),
        ],
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  const PositionedCircle({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    this.positionedLeft,
    this.positionedTop,
    this.positionedRight,
    this.positionedBottom,
  });

  final double containerHeight;
  final double containerWidth;
  final double? positionedLeft;
  final double? positionedTop;
  final double? positionedRight;
  final double? positionedBottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positionedLeft,
      top: positionedTop,
      bottom: positionedBottom,
      right: positionedRight,
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.19),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
