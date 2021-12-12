// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: BloodText(
          'Blood',
        ),
      ),
    );
  }
}
