// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:flutter/material.dart';

class BloodText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool capitalize;
  final int? maxLines;

  const BloodText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.capitalize = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
//      capitalize ? data?.loc?.toUpperCase() : data?.loc,
      capitalize ? data : data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
