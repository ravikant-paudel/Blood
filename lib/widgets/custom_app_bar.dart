/*
 * Copyright (c) 2020 The Catch Square Authors. All rights reserved.
 * Created by Ravikant Paudel
 * Last modified on April 26, 2020 by ravikant
 */

import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          leading: leading,
          actions: actions,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
                ),
          ),
          iconTheme: IconThemeData(
            color: preference.get(PreferenceKey.THEME_MODE) != null ? Colors.white : Colors.black,
          ),
        ),
        SvgPicture.asset(
          'assets/appbar.svg',
          fit: BoxFit.fill ,
          // width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 120);
}
