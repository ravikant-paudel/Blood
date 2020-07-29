/*
 * Copyright (c) 2020 The Catch Square Authors. All rights reserved.
 * Created by Ravikant Paudel
 * Last modified on April 26, 2020 by ravikant
 */

import 'package:blood/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;
  final bool toolbarOnly;
  final double elevation;

  const CustomAppBar({
    Key key,
    this.title = '',
    this.subtitle = '',
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.toolbarOnly,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
//    backgroundColor: context.color.accent,
          backgroundColor: Colors.white,
          elevation: elevation,
          leading: leading,
          actions: actions,
          centerTitle: centerTitle,
          iconTheme: IconThemeData(
            color: Colors.black, //modify arrow color from here..
          ),
          title: Text(
            '$title',
            style: TextStyle(color: UniversalVariables.primaryBlack),
          ),
        ),
        Divider(
          color: UniversalVariables.primaryColor,
          thickness: 3,
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 18);
}
